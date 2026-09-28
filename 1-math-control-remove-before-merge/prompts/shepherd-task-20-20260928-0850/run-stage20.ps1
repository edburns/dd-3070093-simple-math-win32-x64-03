[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

$repo = 'edburns/dd-3070093-simple-math-win32-x64-03'
$parentIssue = 1
$expectedTaskCount = 2
$lessonPropagation = 'off'
$selectedIssueType = ''
$logDirectory = 'C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850'
$bodyDirectory = Join-Path $logDirectory 'issue-bodies'
$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'
$resultPath = Join-Path $logDirectory 'stage-20-result.json'
$preCreationChildrenPath = Join-Path $logDirectory 'pre-creation-children.json'
$finalChildrenPath = Join-Path $logDirectory 'final-children.json'
$draftValidator = 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1'
$issueBodyVerifier = 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1'
$childLinkVerifier = 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-stage20-child-links.ps1'

$tasks = @(
    [pscustomobject]@{
        ImplementationSubsection = '1. Implement Fibonacci with unit and isolated CLI coverage'
        BodyFile = Join-Path $bodyDirectory '01-1-implement-fibonacci-body.md'
        RelativeBodyFile = 'issue-bodies/01-1-implement-fibonacci-body.md'
        Title = '1. Implement Fibonacci with unit and isolated CLI coverage'
    },
    [pscustomobject]@{
        ImplementationSubsection = '2. Add factorial and operation dispatch'
        BodyFile = Join-Path $bodyDirectory '02-2-add-factorial-dispatch-body.md'
        RelativeBodyFile = 'issue-bodies/02-2-add-factorial-dispatch-body.md'
        Title = '2. Add factorial and operation dispatch'
    }
)

function Write-AtomicText {
    param(
        [Parameter(Mandatory)]
        [string]$Destination,

        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string]$Content
    )

    $temporary = "$Destination.tmp.$([guid]::NewGuid().ToString('N'))"
    try {
        [IO.File]::WriteAllText(
            $temporary,
            $Content + [Environment]::NewLine,
            [Text.UTF8Encoding]::new($false)
        )
        [IO.File]::Move($temporary, $Destination, $true)
    }
    finally {
        if (Test-Path -LiteralPath $temporary) {
            Remove-Item -LiteralPath $temporary -Force
        }
    }
}

function Read-CreationLedger {
    $parsed = [IO.File]::ReadAllText($ledgerPath) |
        ConvertFrom-Json -NoEnumerate
    if ($parsed -isnot [System.Array]) {
        throw 'Creation ledger JSON root must be an array.'
    }

    $ledger = [object[]]$parsed
    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {
        throw 'Creation ledger must not contain nested array entries.'
    }
    return $ledger
}

function Write-CreationLedger {
    param([Parameter(Mandatory)][AllowEmptyCollection()][object[]]$Ledger)

    $json = ConvertTo-Json -InputObject ([object[]]$Ledger) -Depth 10
    Write-AtomicText -Destination $ledgerPath -Content $json
}

function Update-LedgerFlag {
    param(
        [Parameter(Mandatory)][int]$Number,
        [Parameter(Mandatory)][ValidateSet('body_verified', 'linked')][string]$Field,
        [Parameter(Mandatory)][bool]$Value
    )

    $ledger = @(Read-CreationLedger)
    $matching = @($ledger | Where-Object { $_.number -eq $Number })
    if ($matching.Count -ne 1) {
        throw "Expected exactly one ledger entry for issue #$Number."
    }
    $matching[0].$Field = $Value
    Write-CreationLedger -Ledger ([object[]]$ledger)
}

function Write-StageResult {
    param(
        [Parameter(Mandatory)][ValidateSet('in_progress', 'failed', 'complete')][string]$Status,
        [AllowNull()][object]$OperationError
    )

    $result = [ordered]@{
        schemaVersion = 1
        status = $Status
        ledgerFile = 'creation-ledger.json'
        operationError = $OperationError
    }
    Write-AtomicText -Destination $resultPath -Content ($result | ConvertTo-Json -Depth 3)
}

function Get-NormalizedChildren {
    $childrenOutput = & gh api "repos/$repo/issues/$parentIssue/sub_issues" --paginate --slurp 2>&1
    $childrenExitCode = $LASTEXITCODE
    if ($childrenExitCode -ne 0) {
        throw "Unable to query parent children: $($childrenOutput | Out-String)"
    }

    $completeJson = $childrenOutput | Out-String
    $normalizedOutput = $completeJson |
        & jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'
    $jqExitCode = $LASTEXITCODE
    if ($jqExitCode -ne 0) {
        throw "Unable to normalize parent children: $($normalizedOutput | Out-String)"
    }

    $normalizedJson = ($normalizedOutput | Out-String).Trim()
    $items = @(($normalizedJson | ConvertFrom-Json))
    return [pscustomobject]@{
        Json = $normalizedJson
        Items = [object[]]$items
    }
}

& $draftValidator `
    -BodyDirectory $bodyDirectory `
    -ExpectedCount $expectedTaskCount `
    -LessonPropagation $lessonPropagation | Out-Null

if (-not (Test-Path -LiteralPath $preCreationChildrenPath -PathType Leaf)) {
    throw "Pre-creation child snapshot is missing: $preCreationChildrenPath"
}
if (Test-Path -LiteralPath $ledgerPath) {
    throw "Creation ledger already exists; refusing to resume or overwrite: $ledgerPath"
}
if (Test-Path -LiteralPath $resultPath) {
    throw "Stage result already exists; refusing to resume or overwrite: $resultPath"
}

Write-AtomicText -Destination $ledgerPath -Content '[]'
Write-StageResult -Status in_progress -OperationError $null

$initializedLedger = [IO.File]::ReadAllText($ledgerPath) | ConvertFrom-Json -NoEnumerate
if ($initializedLedger -isnot [System.Array] -or $initializedLedger.Count -ne 0) {
    throw 'Creation ledger initialization read-back failed.'
}
$initializedResult = [IO.File]::ReadAllText($resultPath) | ConvertFrom-Json
if (
    $initializedResult.schemaVersion -ne 1 -or
    $initializedResult.status -cne 'in_progress' -or
    $initializedResult.ledgerFile -cne 'creation-ledger.json' -or
    $null -ne $initializedResult.operationError
) {
    throw 'Stage result initialization read-back failed.'
}

$operation = 'starting issue creation'
$mutationStarted = $false

try {
    foreach ($task in $tasks) {
        $operation = "creating '$($task.Title)'"
        $createArguments = @(
            'api',
            "repos/$repo/issues",
            '-X', 'POST',
            '-f', "title=$($task.Title)",
            '-F', "body=@$($task.BodyFile)",
            '--jq', '{id,number,node_id,html_url,title}'
        )
        if (-not [string]::IsNullOrWhiteSpace($selectedIssueType)) {
            $createArguments = @(
                'api',
                "repos/$repo/issues",
                '-X', 'POST',
                '-f', "title=$($task.Title)",
                '-F', "body=@$($task.BodyFile)",
                '-f', "type=$selectedIssueType",
                '--jq', '{id,number,node_id,html_url,title}'
            )
        }

        $createOutput = & gh @createArguments 2>&1
        $createExitCode = $LASTEXITCODE
        if ($createExitCode -ne 0) {
            throw "Issue creation failed: $($createOutput | Out-String)"
        }
        $mutationStarted = $true
        $createdIssue = ($createOutput | Out-String) | ConvertFrom-Json

        $ledger = @(Read-CreationLedger)
        $ledger += [pscustomobject][ordered]@{
            implementationSubsection = $task.ImplementationSubsection
            bodyFile = $task.RelativeBodyFile
            id = [long]$createdIssue.id
            number = [int]$createdIssue.number
            title = [string]$createdIssue.title
            url = [string]$createdIssue.html_url
            body_verified = $false
            linked = $false
        }
        Write-CreationLedger -Ledger ([object[]]$ledger)

        $operation = "verifying the body of issue #$($createdIssue.number)"
        try {
            $null = & $issueBodyVerifier `
                -Repository $repo `
                -IssueNumber ([int]$createdIssue.number) `
                -ExpectedBodyPath $task.BodyFile `
                -MaxAttempts 6 `
                -DelaySeconds 5 `
                -DiagnosticPath (
                    Join-Path $logDirectory "issue-$($createdIssue.number)-body-verification-failure.json"
                )
        }
        catch {
            throw "Issue body verification failed for issue #$($createdIssue.number): $($_.Exception.Message)"
        }
        Update-LedgerFlag -Number ([int]$createdIssue.number) -Field body_verified -Value $true

        $operation = "linking issue #$($createdIssue.number) to parent #$parentIssue"
        $linkSucceeded = $false
        $lastLinkError = ''
        for ($attempt = 1; $attempt -le 3 -and -not $linkSucceeded; $attempt++) {
            $linkInputPath = Join-Path $logDirectory "link-$($createdIssue.number)-$attempt.json"
            try {
                [IO.File]::WriteAllText(
                    $linkInputPath,
                    (@{ sub_issue_id = [long]$createdIssue.id } | ConvertTo-Json -Compress),
                    [Text.UTF8Encoding]::new($false)
                )
                $linkOutput = & gh api "repos/$repo/issues/$parentIssue/sub_issues" `
                    -X POST `
                    --input $linkInputPath 2>&1
                $linkExitCode = $LASTEXITCODE
                if ($linkExitCode -eq 0) {
                    $linkSucceeded = $true
                }
                else {
                    $lastLinkError = ($linkOutput | Out-String).Trim()
                }
            }
            finally {
                if (Test-Path -LiteralPath $linkInputPath) {
                    Remove-Item -LiteralPath $linkInputPath -Force
                }
            }
        }
        if (-not $linkSucceeded) {
            throw "Linking failed after 3 attempts: $lastLinkError"
        }
        Update-LedgerFlag -Number ([int]$createdIssue.number) -Field linked -Value $true
    }

    $operation = 'fetching final parent children'
    $finalChildren = Get-NormalizedChildren
    Write-AtomicText -Destination $finalChildrenPath -Content $finalChildren.Json

    $operation = 'verifying parent-child count, identity, and order'
    & $childLinkVerifier `
        -PreCreationChildrenPath $preCreationChildrenPath `
        -FinalChildrenPath $finalChildrenPath `
        -CreationLedgerPath $ledgerPath | Out-Null

    $operation = 'verifying final issue bodies, states, assignees, and types'
    $ledger = @(Read-CreationLedger)
    foreach ($entry in $ledger) {
        $bodyPath = Join-Path $logDirectory $entry.bodyFile
        try {
            $observedIssue = & $issueBodyVerifier `
                -Repository $repo `
                -IssueNumber ([int]$entry.number) `
                -ExpectedBodyPath $bodyPath `
                -MaxAttempts 6 `
                -DelaySeconds 5 `
                -DiagnosticPath (
                    Join-Path $logDirectory "issue-$($entry.number)-final-body-verification-failure.json"
                )
        }
        catch {
            throw "Final body verification failed for issue #$($entry.number): $($_.Exception.Message)"
        }

        if ($observedIssue.state -cne 'open') {
            throw "Issue #$($entry.number) is not open."
        }
        if (@($observedIssue.assignees).Count -ne 0) {
            throw "Issue #$($entry.number) unexpectedly has assignees."
        }
        if (
            -not [string]::IsNullOrWhiteSpace($selectedIssueType) -and
            $observedIssue.type.name -cne $selectedIssueType
        ) {
            throw "Issue #$($entry.number) does not have type '$selectedIssueType'."
        }
    }

    Write-StageResult -Status complete -OperationError $null
    [pscustomobject]@{
        Status = 'complete'
        IssueType = if ($selectedIssueType) { $selectedIssueType } else { '(none)' }
        Ledger = @(Read-CreationLedger)
    } | ConvertTo-Json -Depth 10
}
catch {
    $failureMessage = "$operation`: $($_.Exception.Message)"
    if ($mutationStarted) {
        try {
            $serverChildren = Get-NormalizedChildren
            $linkedIds = @($serverChildren.Items | ForEach-Object { [long]$_.id })
            $ledger = @(Read-CreationLedger)
            foreach ($entry in $ledger) {
                $entry.linked = $linkedIds -contains [long]$entry.id
            }
            Write-CreationLedger -Ledger ([object[]]$ledger)
        }
        catch {
            $failureMessage += " Reconciliation also failed: $($_.Exception.Message)"
        }
        Write-StageResult -Status failed -OperationError $failureMessage

        Write-Error "Stage 20 did not complete: $failureMessage" -ErrorAction Continue
        $ledger = @(Read-CreationLedger)
        if ($ledger.Count -eq 0) {
            Write-Host 'No issues were created; no cleanup is required.'
        }
        else {
            $ledger |
                Select-Object number, title, url, bodyFile, body_verified, linked |
                Format-Table -AutoSize |
                Out-Host
            foreach ($entry in $ledger) {
                Write-Host "gh issue delete $($entry.number) --repo `"$repo`" --yes"
            }
            Write-Host 'No automatic rollback was performed. Delete every ledger issue before invoking stage 20 again.'
        }
    }
    throw
}
