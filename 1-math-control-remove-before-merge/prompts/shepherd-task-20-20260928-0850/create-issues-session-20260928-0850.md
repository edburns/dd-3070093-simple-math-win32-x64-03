# Copilot CLI Session

> [!NOTE]
> - **Session ID:** `71f34acd-d228-429e-9bcb-078f77a12bbc`  
> - **Started:** 9/28/2026, 8:50:58 AM  
> - **Duration:** 3m 54s  
> - **Exported:** 9/28/2026, 8:54:53 AM  

---

<sub>6s</sub>

### User

Invoke skill `shepherd-task-20-create-issues-from-plan` with these inputs:

- CAMPAIGN_ID: 4580d57a-f581-4be1-8dcf-9a609c077343
- LESSON_PROPAGATION: off
- REPO: edburns/dd-3070093-simple-math-win32-x64-03
- BASE_BRANCH: experiment/shepherd-control
- PARENT_ISSUE: 1
- PLAN_DIRECTORY: 1-math-control-remove-before-merge
- PLAN_FILE_NAME: math-tool-ignorance-reduction-plan.md
- QUESTIONS_SECTION: ## Ignorance reduction
- IMPLEMENTATION_SECTION: ## Implementation
- EXPECTED_TASK_COUNT: 2
- BASE_REMOTE: origin
- LOG_DIRECTORY: C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850
- DRAFT_VALIDATOR: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1
- ISSUE_BODY_VERIFIER: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1
- CHILD_LINK_VERIFIER: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-stage20-child-links.ps1

Fixture pagination response contract (mandatory):

- `gh api ... --paginate --slurp` returns a JSON array of page payloads, so a
  one-page response has the shape `[[{...}]]`, not `[{...}]`.
- Before indexing child issue fields such as `.id`, normalize the response to
  one flat issue array exactly once.
- In Bash, use:
  `jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'`.
- In PowerShell, capture the `gh` output and `$LASTEXITCODE` first, then pass
  the complete JSON through the same `jq` normalization before
  `ConvertFrom-Json`.
- Use the normalized flat array for the pre-creation baseline, final child
  count/order checks, and failure reconciliation. Do not apply `add` a second
  time to an already-flat array.


---

<sub>10s</sub>

### `skill`

**shepherd-task-20-create-issues-from-plan**

<details>
<summary>Arguments</summary>

```json
{
  "skill": "shepherd-task-20-create-issues-from-plan"
}
```

</details>

```
Skill "shepherd-task-20-create-issues-from-plan" loaded successfully. Follow the instructions in the skill context.
```


---

<sub>13s</sub>

### Copilot

I’ll preflight the campaign, repository, plan, validators, and issue-format examples before drafting or mutating GitHub.

---

<sub>26s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md

<details>
<summary>15 lines</summary>

```
# Example 01: 1682-java-tool-ergonomics-prompts-remove-before-merge

Read `copilot-sdk/1682-java-tool-ergonomics-prompts-remove-before-merge/dd-3018003-ignorance-reduction-for-implementation-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 3 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating issues of type **Task** as children of Epic https://github.com/github/copilot-sdk/issues/1682 . These issues correspond to the sub-sections in `## Phase 4 — Implementation (the build order)`.

I want you to use `gh` to create issues as sub-issues of 1682.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Set the type to **Task**.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `upstream`: `edburns/1682-java-tool-ergonomics`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `1682-java-tool-ergonomics-prompts-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**, I want you to carefully consider if there are additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>27s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md

<details>
<summary>12 lines</summary>

```
# Example 02: 1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge

Carefully read the plan `copilot-sdk/1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`.

We have completed Phases 1 - 3. We are now on Phase 4.

For each sub item in Phase 4, file a child issue of Feature #1810.

Use `gh` to look at Epic #1682 and its child issues for the standard of verbosity and concreteness for issue descriptions.

The issue should be assignable to a coding agent and there must be sufficient detail in the description for the agent to proceed to completion.

Pull out the specific relevant content from Phase 3 as it applies to this current issue in Phase 4.

Tell the agent to take `edburns/1810-java-tool-ergonomics-tool-as-lambda` as the base branch. When I assign the issue to the coding agent, I will set this as the base branch.

Tell the agent to read `1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`, which is present on the branch, for context.

Tell the agent which sub-item within Phase 4 they are solving.

Tell the agent that each issue will be assigned, resolved and merged to the base branch in the order in which they appear in the plan.

No work is to start until I assign each issue to the coding agent, in turn.
```

</details>


---

<sub>27s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md

<details>
<summary>14 lines</summary>

```
# Example 03: dd-3017826-java-real-estate-demo-remove-before-merge

Read `dd-3017826-java-real-estate-demo-remove-before-merge\dd-3017826-java-real-estate-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/2 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #2.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/2-build-out-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `dd-3017826-java-real-estate-demo-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there are additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>28s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md

<details>
<summary>16 lines</summary>

```
# Example 04: 28-python-agent-demo-remove-before-merge

Read `28-python-agent-demo-remove-before-merge/28-python-agent-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`. These pertain to the implementation tasks in Phase 3. ✅✅✅ Include relevant spike findings as self-contained prose in the issue description; do not direct the agent to spike directories or source files.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/28 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #28

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Again, ✅✅For each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`, include the relevant Resolution values in the issue description. These pertain to the implementation tasks in Phase 3. ✅✅✅ State relevant spike findings directly in the issue body with enough detail to implement them without reading spike code.

- For tasks dealing with the UI, make sure to refer to the relevant screengrabs, but only ones within `28-python-agent-demo-remove-before-merge/`.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/28-python-agent-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `28-python-agent-demo-remove-before-merge/`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there are additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>29s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\shepherd-task-component.json.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\shepherd-task-component.json

<details>
<summary>5 lines</summary>

```
{
  "schemaVersion": 1,
  "shepherdTaskVersion": "1.0.5",
  "component": "shepherd-task-20-create-issues-from-plan"
}
```

</details>


---

<sub>25s</sub>

### `glob`

**1-math-control-remove-before-merge/****

"1-math-control-remove-before-merge/**"

<details>
<summary>7 matches</summary>

```
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\campaign-lessons.md
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\shepherd-test-experiment.json
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\math-tool-ignorance-reduction-plan.md
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\shepherd-campaign.json
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\create-issues-otel-20260928-0850.jsonl
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\20260928-0850-invoke-shepherd-task-20-create-issues-from-plan-skill.ps1
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\20260928-0850-invoke-shepherd-task-20-create-issues-from-plan-skill.md
```

</details>


---

<sub>29s</sub>

### `powershell`

**Inspect repository and required paths**

<details>
<summary>Arguments</summary>

```json
{
  "command": "git status --short; git remote -v; git branch --list experiment/shepherd-control; git symbolic-ref refs/remotes/origin/HEAD; $paths = @('C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850','C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1','C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1','C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-stage20-child-links.ps1'); $paths | ForEach-Object { [pscustomobject]@{Path=$_; Exists=Test-Path -LiteralPath $_; IsAbsolute=[IO.Path]::IsPathFullyQualified($_)} } | Format-Table -AutoSize",
  "description": "Inspect repository and required paths",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

<details>
<summary>12 lines</summary>

```
?? 1-math-control-remove-before-merge/prompts/
origin	git@github.com:edburns/dd-3070093-simple-math-win32-x64-03.git (fetch)
origin	git@github.com:edburns/dd-3070093-simple-math-win32-x64-03.git (push)
* experiment/shepherd-control
refs/remotes/origin/main

Path
----                                                                                                                   
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\pro…
C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1                                    
C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1                                   
C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-stage20-child-links.ps1
<shellId: 0 completed with exit code 0>
```

</details>


---

<sub>26s</sub>

### `sql`

**Initialize stage todos**

<details>
<summary>Arguments</summary>

```json
{
  "description": "Initialize stage todos",
  "query": "INSERT OR REPLACE INTO todos (id,title,description,status) VALUES ('stage20-preflight','Validating stage 20 inputs','Validate repository, branch, parent, manifest, plan, validators, and baseline children','in_progress'),('stage20-drafts','Drafting implementation issues','Build traceability map, persist two issue bodies, and validate drafts','pending'),('stage20-create','Creating and linking issues','Create and link each issue serially while maintaining the ledger','pending'),('stage20-verify','Verifying stage postconditions','Verify child links, exact bodies, open state, assignees, types, and complete result','pending'); INSERT OR REPLACE INTO todo_deps (todo_id,depends_on) VALUES ('stage20-drafts','stage20-preflight'),('stage20-create','stage20-drafts'),('stage20-verify','stage20-create');"
}
```

</details>

<details>
<summary>5 lines</summary>

```
Executed 2 statement(s):

1. INSERT
   4 row(s) inserted. Last inserted row ID: 4.

2. INSERT
   3 row(s) inserted. Last inserted row ID: 3.
```

</details>


---

<sub>33s</sub>

### Copilot

Preflight paths and branch are present. I’m now validating the base-branch plan/manifest, parent issue, issue-type capability, and normalized child baseline before any issue creation.

---

<sub>50s</sub>

### `powershell`

**Read plan from base branch**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $logDir='C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850'; $bodyDir=Join-Path $logDir 'issue-bodies'; if (-not [IO.Path]::IsPathFullyQualified($logDir)) { throw 'LOG_DIRECTORY is not absolute' }; if (-not (Test-Path -LiteralPath $logDir -PathType Container)) { throw 'LOG_DIRECTORY does not exist' }; New-Item -ItemType Directory -Path $bodyDir -Force | Out-Null; $probe=Join-Path $bodyDir '.write-probe'; [IO.File]::WriteAllText($probe,'ok'); Remove-Item -LiteralPath $probe; Get-Item -LiteralPath $bodyDir | Select-Object FullName,Attributes | Format-List; git show 'experiment/shepherd-control:1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md'; if ($LASTEXITCODE -ne 0) { throw 'Unable to read plan from base branch' }",
  "description": "Read plan from base branch",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

<details>
<summary>42 lines</summary>

```
FullName   : C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-befo
             re-merge\prompts\shepherd-task-20-20260928-0850\issue-bodies
Attributes : Directory

# PowerShell math-tool control campaign

Build the fixture in two cheap, serial tasks. The repository already contains
deterministic CI pinned to Pester 5.7.1. The acceptance command for every task
is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. Task 2 starts only after task 1 is merged.

## Ignorance reduction

### Repository-owned validation

**Question:** What command and environment define acceptance?

**Resolution:** The committed canonical command is
`pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The baseline workflow
`.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester
5.7.1 and invokes that repository-owned runner. Do not replace or bypass it.

### Output and ordering contracts

**Question:** What externally observable behavior and dependency order are required?

**Resolution:** Direct CLI execution writes exactly one result line to stdout:
`Fibonacci(N) = value` or `Factorial(N) = value`. Functions return the
numeric value without incidental output. Inputs are non-negative integers.
Implementation is serial: task 2 depends on merged task 1. The implementation
and test files are repository-root `math-tool.ps1` and
`math-tool.Tests.ps1`.

## Implementation

### 1. Implement Fibonacci with unit and isolated CLI coverage

Create `math-tool.ps1` with parameter `N` and a pure `Get-Fibonacci`
function. Direct execution must print exactly `Fibonacci(N) = value`.
Create `math-tool.Tests.ps1` containing dot-sourced unit tests for the
function and isolated child-`pwsh` process tests for direct CLI behavior.
Cover N=0, N=1, and a small representative value. Keep changes limited to the
math tool and its tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero and the pinned pull-request CI
passes.

### 2. Add factorial and operation dispatch

After task 1 is merged, extend the same script with a pure `Get-Factorial`
function and an `Operation` parameter that dispatches between `fibonacci`
and `factorial` while retaining `N`. Preserve Fibonacci behavior. Cover
factorial edge cases 0 and 1 plus a small representative value. Keep the
interface and tests objective and small; the issue does not prescribe how to
extend the tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined regression suite
and the pinned pull-request CI passes.
<shellId: 1 completed with exit code 0>
```

</details>


---

<sub>50s</sub>

### `powershell`

**Validate campaign manifest files**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; git show 'experiment/shepherd-control:1-math-control-remove-before-merge/shepherd-campaign.json'; if ($LASTEXITCODE -ne 0) { throw 'Unable to read campaign manifest' }; git cat-file -e 'experiment/shepherd-control:1-math-control-remove-before-merge/campaign-lessons.md'; if ($LASTEXITCODE -ne 0) { throw 'campaign-lessons.md missing' }; Write-Output 'campaign-lessons.md exists on base branch'",
  "description": "Validate campaign manifest files",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

<details>
<summary>18 lines</summary>

```
{
  "schemaVersion": 1,
  "campaignId": "4580d57a-f581-4be1-8dcf-9a609c077343",
  "campaignIssueNumber": 1,
  "campaignShortname": "math-control",
  "repository": "edburns/dd-3070093-simple-math-win32-x64-03",
  "baseBranch": "experiment/shepherd-control",
  "lessonPropagation": "off",
  "campaignMetadataDirectory": "1-math-control-remove-before-merge",
  "lessonsFile": "campaign-lessons.md",
  "createdBy": {
    "shepherdTaskVersion": "1.0.5",
    "stageOutcomeProtocolVersion": 1
  },
  "createdAt": "2026-09-28T12:50:52Z"
}
campaign-lessons.md exists on base branch
<shellId: 2 completed with exit code 0>
```

</details>


---

<sub>52s</sub>

### `powershell`

**Validate GitHub and baseline children**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $repo='edburns/dd-3070093-simple-math-win32-x64-03'; $parent=1; $logDir='C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850'; $repoOutput=& gh api \"repos/$repo\" 2>&1; $repoExit=$LASTEXITCODE; if($repoExit -ne 0){throw \"Repository lookup failed: $($repoOutput|Out-String)\"}; $repoData=($repoOutput|Out-String)|ConvertFrom-Json; $parentOutput=& gh api \"repos/$repo/issues/$parent\" 2>&1; $parentExit=$LASTEXITCODE; if($parentExit -ne 0){throw \"Parent lookup failed: $($parentOutput|Out-String)\"}; $parentData=($parentOutput|Out-String)|ConvertFrom-Json; $branchOutput=& gh api \"repos/$repo/branches/experiment/shepherd-control\" 2>&1; $branchExit=$LASTEXITCODE; if($branchExit -ne 0){throw \"Base branch lookup failed: $($branchOutput|Out-String)\"}; $ownerType=$repoData.owner.type; $selectedType=''; if($ownerType -eq 'Organization'){ $typesOutput=& gh api \"orgs/$($repoData.owner.login)/issue-types\" 2>&1; $typesExit=$LASTEXITCODE; if($typesExit -ne 0){throw \"Issue type lookup failed: $($typesOutput|Out-String)\"}; $types=($typesOutput|Out-String)|ConvertFrom-Json; if(@($types|Where-Object {$_.name -ceq 'Task' -and $_.is_enabled -eq $true}).Count -gt 0){$selectedType='Task'} } elseif($ownerType -ne 'User'){throw \"Unrecognized owner type: $ownerType\"}; if($repoData.default_branch -eq 'experiment/shepherd-control'){throw 'BASE_BRANCH is default branch'}; if($parentData.state -ne 'open'){throw 'Parent issue is not open'}; [pscustomobject]@{Owner=$repoData.owner.login;OwnerType=$ownerType;DefaultBranch=$repoData.default_branch;ParentNumber=$parentData.number;ParentState=$parentData.state;SelectedIssueType=if($selectedType){$selectedType}else{'(none)'}}|Format-List; $childrenOutput=& gh api \"repos/$repo/issues/$parent/sub_issues\" --paginate --slurp 2>&1; $childrenExit=$LASTEXITCODE; if($childrenExit -ne 0){throw \"Unable to query parent children: $($childrenOutput|Out-String)\"}; $rawJson=$childrenOutput|Out-String; $normalizedOutput=$rawJson | & jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'; $jqExit=$LASTEXITCODE; if($jqExit -ne 0){throw \"Unable to normalize child response: $normalizedOutput\"}; $normalizedText=$normalizedOutput|Out-String; $normalized=@($normalizedText|ConvertFrom-Json); [IO.File]::WriteAllText((Join-Path $logDir 'pre-creation-children.json'),($normalizedText.TrimEnd()+[Environment]::NewLine),[Text.UTF8Encoding]::new($false)); Write-Output \"Normalized baseline child count: $($normalized.Count)\"; $normalized | Select-Object id,number,title | Format-Table -AutoSize",
  "description": "Validate GitHub and baseline children",
  "initial_wait": 120,
  "mode": "sync"
}
```

</details>

<details>
<summary>8 lines</summary>

```
Owner             : edburns
OwnerType         : User
DefaultBranch     : main
ParentNumber      : 1
ParentState       : open
SelectedIssueType : (none)

Normalized baseline child count: 0
<shellId: 3 completed with exit code 0>
```

</details>


---

<sub>51s</sub>

### `powershell`

**Validate remote and verifier scripts**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $remoteUrl=(git remote get-url origin); if($LASTEXITCODE -ne 0){throw 'Unable to read origin URL'}; if($remoteUrl -notmatch 'github\\.com[:/]edburns/dd-3070093-simple-math-win32-x64-03(?:\\.git)?$'){throw \"origin URL does not match repository: $remoteUrl\"}; $scripts=@('C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1','C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1','C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-stage20-child-links.ps1'); foreach($script in $scripts){if(-not [IO.Path]::IsPathFullyQualified($script)){throw \"Script path is not absolute: $script\"}; if(-not (Test-Path -LiteralPath $script -PathType Leaf)){throw \"Script missing: $script\"}}; [pscustomobject]@{Remote='origin';Url=$remoteUrl;ScriptsValidated=$scripts.Count}|Format-List",
  "description": "Validate remote and verifier scripts",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

```
Remote           : origin
Url              : git@github.com:edburns/dd-3070093-simple-math-win32-x64-03.git
ScriptsValidated : 3
<shellId: 4 completed with exit code 0>
```


---

<sub>1m 3s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1

<details>
<summary>60 lines</summary>

```
# shepherd-task-version: 1.0.5
<#
.SYNOPSIS
    Validates persisted stage-20 issue bodies before GitHub mutation.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$BodyDirectory,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$ExpectedCount,

    [Parameter(Mandatory)]
    [ValidateSet('off', 'campaign')]
    [string]$LessonPropagation
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $BodyDirectory -PathType Container)) {
    throw "Stage-20 body directory does not exist: $BodyDirectory"
}

$bodyFiles = @(
    Get-ChildItem -LiteralPath $BodyDirectory -Filter '*-body.md' -File |
        Where-Object { $_.Name -notlike '*-observed-body.md' } |
        Sort-Object Name
)
if ($bodyFiles.Count -ne $ExpectedCount) {
    throw "Expected $ExpectedCount persisted stage-20 body files; found $($bodyFiles.Count)."
}

$requiredHeadings = @(
    '## Campaign context and required reading',
    '## Branch and execution order',
    '## Implement',
    '## Completion gates',
    '## Out of scope'
)

foreach ($bodyFile in $bodyFiles) {
    $text = [System.IO.File]::ReadAllText($bodyFile.FullName)
    $lines = [System.IO.File]::ReadAllLines($bodyFile.FullName)
    if ([string]::IsNullOrWhiteSpace($text) -or $text -notmatch "`r?`n" -or $lines.Count -le 1) {
        throw "Persisted issue body must contain physical Markdown lines: $($bodyFile.FullName)"
    }

    $firstNonblank = $lines | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -First 1
    if ($firstNonblank -notmatch '^##\s+\S') {
        throw "Persisted issue body must begin with a level-two heading: $($bodyFile.FullName)"
    }

    foreach ($heading in $requiredHeadings) {
        if ($lines -cnotcontains $heading) {
            throw "Persisted issue body is missing the physical heading '$heading': $($bodyFile.FullName)"
        }
    }

    $hasCampaignLessons = $lines -ccontains '## Campaign lessons (REQUIRED)'
    if ($LessonPropagation -eq 'campaign' -and -not $hasCampaignLessons) {
        throw "Treatment issue body is missing its campaign-lessons heading: $($bodyFile.FullName)"
    }
    if ($LessonPropagation -eq 'off' -and $hasCampaignLessons) {
        throw "Control issue body unexpectedly contains a campaign-lessons heading: $($bodyFile.FullName)"
    }
}

$bodyFiles
```

</details>


---

<sub>1m 4s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-stage20-child-links.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-stage20-child-links.ps1

<details>
<summary>39 lines</summary>

```
# shepherd-task-version: 1.0.5
<#
.SYNOPSIS
    Verifies Stage 20 child count, identity uniqueness, and creation order.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$PreCreationChildrenPath,

    [Parameter(Mandatory)]
    [string]$FinalChildrenPath,

    [Parameter(Mandatory)]
    [string]$CreationLedgerPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$filterPath = Join-Path $PSScriptRoot 'verify-stage20-child-links.jq'
if (-not (Test-Path -LiteralPath $filterPath -PathType Leaf)) {
    throw "Stage-20 child-link verification filter was not found: $filterPath"
}

foreach ($inputPath in @(
    $PreCreationChildrenPath,
    $FinalChildrenPath,
    $CreationLedgerPath
)) {
    if (-not (Test-Path -LiteralPath $inputPath -PathType Leaf)) {
        throw "Stage-20 child-link verification input was not found: $inputPath"
    }
}

$output = & jq -n `
    --slurpfile baseline $PreCreationChildrenPath `
    --slurpfile final $FinalChildrenPath `
    --slurpfile ledger $CreationLedgerPath `
    -f $filterPath 2>&1
$jqExitCode = $LASTEXITCODE
if ($jqExitCode -ne 0) {
    throw "Stage-20 child-link verification failed: $($output | Out-String)"
}

$output
```

</details>


---

<sub>1m 4s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1

<details>
<summary>166 lines</summary>

```
# shepherd-task-version: 1.0.5
<#
.SYNOPSIS
    Fetches a GitHub issue through REST and verifies its body against a file.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidatePattern('^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$')]
    [string]$Repository,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$IssueNumber,

    [Parameter(Mandatory)]
    [string]$ExpectedBodyPath,

    [ValidateRange(1, 100)]
    [int]$MaxAttempts = 6,

    [ValidateRange(0, 300)]
    [int]$DelaySeconds = 5,

    [string]$DiagnosticPath,

    [string]$GitHubCli = 'gh'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

function ConvertTo-NormalizedLineEndings {
    param([AllowEmptyString()][string]$Text)
    return $Text -replace "`r`n|`r", "`n"
}

function Test-EquivalentBody {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ($Actual -ceq $Expected) {
        return $true
    }
    if ($Actual.EndsWith("`n") -and $Actual.Substring(0, $Actual.Length - 1) -ceq $Expected) {
        return $true
    }
    if ($Expected.EndsWith("`n") -and $Expected.Substring(0, $Expected.Length - 1) -ceq $Actual) {
        return $true
    }
    return $false
}

function Get-Sha256 {
    param([AllowEmptyString()][string]$Text)

    $bytes = [System.Text.UTF8Encoding]::new($false).GetBytes($Text)
    return [Convert]::ToHexString([System.Security.Cryptography.SHA256]::HashData($bytes)).ToLowerInvariant()
}

function Get-FirstDifference {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    $limit = [Math]::Min($Actual.Length, $Expected.Length)
    $offset = 0
    while ($offset -lt $limit -and $Actual[$offset] -ceq $Expected[$offset]) {
        $offset++
    }
    if ($offset -eq $limit -and $Actual.Length -eq $Expected.Length) {
        return $null
    }

    $prefix = $Expected.Substring(0, [Math]::Min($offset, $Expected.Length))
    $line = ([regex]::Matches($prefix, "`n").Count) + 1
    $lastNewline = $prefix.LastIndexOf("`n", [StringComparison]::Ordinal)
    $column = if ($lastNewline -lt 0) { $offset + 1 } else { $offset - $lastNewline }
    return [ordered]@{
        offset = $offset
        line = $line
        column = $column
    }
}

function Test-TerminalGitHubFailure {
    param([string]$Message)
    return $Message -match '(?i)(HTTP\s+(401|403)|authentication|not authorized|resource not accessible)'
}

function Write-Diagnostic {
    param(
        [string]$Reason,
        [int]$Attempts,
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        return
    }

    $parent = Split-Path -Parent $DiagnosticPath
    if (-not [string]::IsNullOrWhiteSpace($parent) -and
        -not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    $diagnostic = [ordered]@{
        schemaVersion = 1
        repository = $Repository
        issueNumber = $IssueNumber
        endpoint = "repos/$Repository/issues/$IssueNumber"
        attempts = $Attempts
        observedAt = (Get-Date).ToUniversalTime().ToString('o')
        reason = $Reason
        expectedLength = $Expected.Length
        actualLength = $Actual.Length
        expectedSha256 = Get-Sha256 $Expected
        actualSha256 = Get-Sha256 $Actual
        firstDifference = Get-FirstDifference -Actual $Actual -Expected $Expected
    }
    $diagnostic | ConvertTo-Json -Depth 4 |
        Set-Content -LiteralPath $DiagnosticPath -Encoding utf8NoBOM
}

if (-not (Test-Path -LiteralPath $ExpectedBodyPath -PathType Leaf)) {
    throw "Expected issue body file not found: $ExpectedBodyPath"
}

$expected = ConvertTo-NormalizedLineEndings (
    Get-Content -LiteralPath $ExpectedBodyPath -Raw
)
$lastReason = ''
$lastActual = ''
$previousConsoleOutputEncoding = [Console]::OutputEncoding
$previousOutputEncoding = $OutputEncoding
$utf8Encoding = [System.Text.UTF8Encoding]::new($false)

try {
    [Console]::OutputEncoding = $utf8Encoding
    $OutputEncoding = $utf8Encoding

    for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
        $output = (& $GitHubCli api "repos/$Repository/issues/$IssueNumber" 2>&1 | Out-String).Trim()
        $exitCode = $LASTEXITCODE
        if ($exitCode -ne 0) {
            $lastReason = "GitHub REST request failed with exit code $exitCode."
            if (Test-TerminalGitHubFailure $output) {
                Write-Diagnostic -Reason $lastReason -Attempts $attempt -Actual '' -Expected $expected
                throw "Unable to fetch issue #$IssueNumber from ${Repository}: $output"
            }
        }
        else {
            try {
                $issue = $output | ConvertFrom-Json
                $lastActual = ConvertTo-NormalizedLineEndings ([string]$issue.body)
                if (Test-EquivalentBody -Actual $lastActual -Expected $expected) {
                    return $issue
                }
                $lastReason = 'GitHub issue body differs from the persisted draft.'
            }
            catch {
                $lastReason = "GitHub REST response was invalid JSON: $($_.Exception.Message)"
            }
        }

        if ($attempt -lt $MaxAttempts) {
            Write-Warning "$lastReason Retrying issue #$IssueNumber body verification ($attempt/$MaxAttempts)."
            if ($DelaySeconds -gt 0) {
                Start-Sleep -Seconds $DelaySeconds
            }
        }
    }

    Write-Diagnostic -Reason $lastReason -Attempts $MaxAttempts -Actual $lastActual -Expected $expected
    $diagnosticSuffix = if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        ''
    }
    else {
        " Diagnostic: $DiagnosticPath"
    }
    throw "Issue #$IssueNumber body verification failed after $MaxAttempts attempts. $lastReason$diagnosticSuffix"
}
finally {
    $OutputEncoding = $previousOutputEncoding
    [Console]::OutputEncoding = $previousConsoleOutputEncoding
}
```

</details>


---

<sub>1m 3s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\eng\test-math-tool.ps1.**

C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\eng\test-math-tool.ps1

<details>
<summary>31 lines</summary>

```
[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$requiredVersion = '5.7.1'
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$implementationPath = Join-Path $repositoryRoot 'math-tool.ps1'
$testPath = Join-Path $repositoryRoot 'math-tool.Tests.ps1'

$implementationExists = Test-Path -LiteralPath $implementationPath -PathType Leaf
$testsExist = Test-Path -LiteralPath $testPath -PathType Leaf
if (-not $implementationExists -and -not $testsExist) {
    Write-Host 'Math-tool implementation has not been introduced yet; baseline validation passed.'
    exit 0
}
if (-not $implementationExists -or -not $testsExist) {
    throw 'math-tool.ps1 and math-tool.Tests.ps1 must be introduced together.'
}

$available = Get-Module -ListAvailable Pester |
    Where-Object { $_.Version.ToString() -eq $requiredVersion } |
    Select-Object -First 1
if (-not $available) {
    Write-Host "Installing Pester $requiredVersion in CurrentUser scope..."
    Install-Module Pester -RequiredVersion $requiredVersion -Scope CurrentUser -Force
}

Import-Module Pester -RequiredVersion $requiredVersion -Force
$result = Invoke-Pester -Path $testPath -PassThru
if ($result.FailedCount -gt 0) {
    Write-Error "Pester reported $($result.FailedCount) failed test(s)."
    exit 1
}
exit 0
```

</details>


---

<sub>1m 2s</sub>

### `glob`

***.ps1**

"*.ps1"

```
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\eng\test-math-tool.ps1
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\20260928-0850-invoke-shepherd-task-20-create-issues-from-plan-skill.ps1
```


---

<sub>1m 1s</sub>

### `glob`

**.github/workflows/***

".github/workflows/*"

```
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\.github\workflows\shepherd-task-math-tool.yml
```


---

<sub>1m 14s</sub>

### Copilot

The plan has exactly two direct implementation tasks, both gating questions have complete concrete resolutions, and the campaign manifest matches. Children will be ordinary untyped issues because the repository owner is a user account. I’m persisting the two full specifications for mandatory draft validation.

---

<sub>1m 33s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260928-0850/issue-bodies/01-1-implement-fibonacci-body.md\n+## Campaign context and required reading\n+\n+**On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.**\n+\n+Read the entire plan before working. Then re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+\n+Carry these resolved decisions into the implementation:\n+\n+- The only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing `.github/workflows/shepherd-task-math-tool.yml` workflow installs exactly Pester 5.7.1 and invokes that repository-owned runner. Do not replace or bypass either mechanism.\n+- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.\n+- `Get-Fibonacci` returns only the numeric value, with no incidental output.\n+- Inputs are non-negative integers.\n+- The production and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+- This is the first task. The factorial/dispatch task starts only after this issue is completed and merged.\n+\n+The plan records no spike-specific implementation findings for this task. Do not seek out, copy, or adapt spike source code; implement from the resolved production contract.\n+\n+## Branch and execution order\n+\n+Use `experiment/shepherd-control` as the base branch for the pull request. Do not start work until this issue is assigned to the coding agent.\n+\n+The campaign tasks are assigned, completed, and merged serially in plan order. This is task 1 of 2 and has no task prerequisite. It must be merged into `experiment/shepherd-control` before task 2 begins.\n+\n+## Implement\n+\n+Create repository-root `math-tool.ps1` with:\n+\n+- A script parameter named `N` constrained to non-negative integer input.\n+- A pure `Get-Fibonacci` function that computes the Fibonacci value for `N` and emits only that numeric return value.\n+- Direct-execution behavior that calls the function and writes exactly one stdout line: `Fibonacci(N) = value`, with the actual input and result substituted.\n+- Correct edge behavior for `N=0` and `N=1`, plus ordinary small positive values.\n+\n+Create repository-root `math-tool.Tests.ps1` with Pester coverage that:\n+\n+- Dot-sources `math-tool.ps1` for unit-level function tests without producing CLI output.\n+- Exercises `Get-Fibonacci` for `N=0`, `N=1`, and at least one representative small value.\n+- Starts isolated child `pwsh` processes to exercise direct CLI behavior rather than treating an in-process invocation as equivalent.\n+- Asserts the child process exits successfully and stdout is exactly the single expected result line.\n+- Verifies the function emits one numeric result and no incidental output.\n+\n+Follow existing repository conventions and keep the implementation objective and small.\n+\n+## Completion gates\n+\n+- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero using the repository-pinned Pester 5.7.1 path.\n+- Unit tests prove the Fibonacci base cases and a representative recurrence result.\n+- Isolated CLI tests prove exact stdout text, exactly one output line, and a zero exit code.\n+- A negative `N` is rejected before Fibonacci computation; no specific error wording is required.\n+- `math-tool.ps1` and `math-tool.Tests.ps1` are introduced together.\n+- The pinned pull-request CI workflow passes.\n+\n+## Out of scope\n+\n+- Do not add factorial, operation dispatch, or other mathematical operations; those belong to task 2.\n+- Do not change the repository-owned test runner, pinned Pester version, or CI workflow.\n+- Do not add dependencies, packaging, interactive prompts, logging, or unrelated refactoring.\n+- Do not modify files outside `math-tool.ps1` and `math-tool.Tests.ps1` unless a directly necessary repository convention requires it.\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260928-0850/issue-bodies/02-2-add-factorial-dispatch-body.md\n+## Campaign context and required reading\n+\n+**On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.**\n+\n+Read the entire plan before working. Then re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+- `### 2. Add factorial and operation dispatch`\n+\n+Carry these resolved decisions into the implementation:\n+\n+- The only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing `.github/workflows/shepherd-task-math-tool.yml` workflow installs exactly Pester 5.7.1 and invokes that repository-owned runner. Do not replace or bypass either mechanism.\n+- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, according to the selected operation.\n+- `Get-Fibonacci` and `Get-Factorial` return only their numeric values, with no incidental output.\n+- Inputs are non-negative integers.\n+- The production and test files remain repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+- This task depends on the merged implementation from task 1 and must preserve its Fibonacci behavior and coverage.\n+\n+The plan records no spike-specific implementation findings for this task. Do not seek out, copy, or adapt spike source code; implement from the resolved production contract.\n+\n+## Branch and execution order\n+\n+Use `experiment/shepherd-control` as the base branch for the pull request. Do not start work until this issue is assigned to the coding agent.\n+\n+The campaign tasks are assigned, completed, and merged serially in plan order. This is task 2 of 2. Begin only after task 1, `1. Implement Fibonacci with unit and isolated CLI coverage`, has been merged into `experiment/shepherd-control`.\n+\n+## Implement\n+\n+Extend the task-1 `math-tool.ps1` implementation with:\n+\n+- A pure `Get-Factorial` function that computes factorial for non-negative integer `N` and emits only that numeric return value.\n+- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the `N` parameter.\n+- Direct CLI output of exactly `Fibonacci(N) = value` for Fibonacci and exactly `Factorial(N) = value` for factorial.\n+- Preservation of the task-1 Fibonacci invocation and behavior. An invocation that omits `Operation` must continue to perform Fibonacci so existing task-1 callers and tests remain valid.\n+- Correct factorial behavior for `N=0`, `N=1`, and ordinary small positive values.\n+- Explicit rejection of unsupported operation names rather than silently selecting an operation.\n+\n+Extend `math-tool.Tests.ps1` using production code and production dependencies. Keep all task-1 Fibonacci tests and add objective coverage for:\n+\n+- Unit-level `Get-Factorial` results for `N=0`, `N=1`, and at least one representative small value.\n+- Dispatch to both supported operations.\n+- Isolated child-`pwsh` CLI execution for factorial with exact single-line stdout and a zero exit code.\n+- Fibonacci CLI regression behavior, including invocation without an explicit operation.\n+- Unsupported operation rejection without a success-shaped result.\n+\n+Follow existing repository conventions and keep the interface and tests small.\n+\n+## Completion gates\n+\n+- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined Fibonacci and factorial regression suite.\n+- Factorial unit tests prove `0! = 1`, `1! = 1`, and a representative value.\n+- Dispatch tests prove `fibonacci` and `factorial` select the correct pure function.\n+- Isolated CLI tests prove both output formats, exactly one result line on successful execution, and zero exit codes.\n+- Existing task-1 Fibonacci tests continue to pass unchanged in behavioral intent.\n+- Negative `N` and unsupported operations are rejected; no specific error wording is required.\n+- The pinned pull-request CI workflow passes.\n+\n+## Out of scope\n+\n+- Do not add mathematical operations beyond Fibonacci and factorial.\n+- Do not replace the script interface with interactive input, a module, packaging, or another executable.\n+- Do not change the repository-owned test runner, pinned Pester version, or CI workflow.\n+- Do not add dependencies, logging, or unrelated refactoring.\n+- Do not copy or adapt research/spike code or test infrastructure.\n*** End Patch\n"
```

</details>

```
Added 2 file(s): C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\issue-bodies\01-1-implement-fibonacci-body.md, C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\issue-bodies\02-2-add-factorial-dispatch-body.md
```


---

<sub>1m 52s</sub>

### `powershell`

**Validate plan resolutions and drafts**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $planPath='1-math-control-remove-before-merge\\math-tool-ignorance-reduction-plan.md'; $text=git show \"experiment/shepherd-control:$($planPath -replace '\\','/')\"; if($LASTEXITCODE -ne 0){throw 'Unable to read plan'}; $joined=$text -join \"`n\"; foreach($heading in @('## Ignorance reduction','## Implementation')){ $count=([regex]::Matches($joined,\"(?m)^$([regex]::Escape($heading))$\" )).Count; if($count -ne 1){throw \"Heading '$heading' occurs $count times\"} }; $implementation=($joined -split '(?m)^## Implementation\\s*$')[1]; $taskCount=([regex]::Matches($implementation,'(?m)^###\\s+\\d+\\.\\s+')).Count; if($taskCount -ne 2){throw \"Expected 2 tasks; found $taskCount\"}; $resolutionMatches=[regex]::Matches($joined,'(?ms)^### (?<heading>[^\\r\\n]+).*?^\\*\\*Question:\\*\\* (?<question>[^\\r\\n]+).*?^\\*\\*Resolution:\\*\\*\\s*(?<resolution>.*?)(?=^### |^## Implementation|\\z)'); if($resolutionMatches.Count -ne 2){throw \"Expected 2 resolution blocks; found $($resolutionMatches.Count)\"}; foreach($match in $resolutionMatches){$resolution=$match.Groups['resolution'].Value.Trim(); if([string]::IsNullOrWhiteSpace($resolution)){throw \"Empty resolution: $($match.Groups['heading'].Value)\"}; Write-Output \"QUESTION: $($match.Groups['question'].Value)\"; Write-Output \"RESOLUTION:`n$resolution`n\"}; $validator='C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1'; $bodyDir='C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850\\issue-bodies'; & $validator -BodyDirectory $bodyDir -ExpectedCount 2 -LessonPropagation off | Select-Object FullName,Length | Format-Table -AutoSize",
  "description": "Validate plan resolutions and drafts",
  "initial_wait": 120,
  "mode": "sync"
}
```

</details>

<details>
<summary>6 lines</summary>

```
InvalidOperation: 
Line |
   2 |  … how "experiment/shepherd-control:$($planPath -replace '\','/')"; if($ …
     |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~
     | The regular expression pattern \ is not valid.
<shellId: 5 completed with exit code 1>
```

</details>


---

<sub>2m 2s</sub>

### `powershell`

**Validate plan resolutions and drafts**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $planPath='1-math-control-remove-before-merge\\math-tool-ignorance-reduction-plan.md'; $gitPath=$planPath.Replace('\\','/'); $text=git show \"experiment/shepherd-control:$gitPath\"; if($LASTEXITCODE -ne 0){throw 'Unable to read plan'}; $joined=$text -join \"`n\"; foreach($heading in @('## Ignorance reduction','## Implementation')){ $count=([regex]::Matches($joined,\"(?m)^$([regex]::Escape($heading))$\" )).Count; if($count -ne 1){throw \"Heading '$heading' occurs $count times\"} }; $implementation=($joined -split '(?m)^## Implementation\\s*$')[1]; $taskCount=([regex]::Matches($implementation,'(?m)^###\\s+\\d+\\.\\s+')).Count; if($taskCount -ne 2){throw \"Expected 2 tasks; found $taskCount\"}; $resolutionMatches=[regex]::Matches($joined,'(?ms)^### (?<heading>[^\\r\\n]+).*?^\\*\\*Question:\\*\\* (?<question>[^\\r\\n]+).*?^\\*\\*Resolution:\\*\\*\\s*(?<resolution>.*?)(?=^### |^## Implementation|\\z)'); if($resolutionMatches.Count -ne 2){throw \"Expected 2 resolution blocks; found $($resolutionMatches.Count)\"}; foreach($match in $resolutionMatches){$resolution=$match.Groups['resolution'].Value.Trim(); if([string]::IsNullOrWhiteSpace($resolution)){throw \"Empty resolution: $($match.Groups['heading'].Value)\"}; Write-Output \"QUESTION: $($match.Groups['question'].Value)\"; Write-Output \"RESOLUTION:`n$resolution`n\"}; $validator='C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1'; $bodyDir='C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850\\issue-bodies'; & $validator -BodyDirectory $bodyDir -ExpectedCount 2 -LessonPropagation off | Select-Object FullName,Length | Format-Table -AutoSize",
  "description": "Validate plan resolutions and drafts",
  "initial_wait": 120,
  "mode": "sync"
}
```

</details>

<details>
<summary>19 lines</summary>

```
QUESTION: What command and environment define acceptance?
RESOLUTION:
The committed canonical command is
`pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The baseline workflow
`.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester
5.7.1 and invokes that repository-owned runner. Do not replace or bypass it.

QUESTION: What externally observable behavior and dependency order are required?
RESOLUTION:
Direct CLI execution writes exactly one result line to stdout:
`Fibonacci(N) = value` or `Factorial(N) = value`. Functions return the
numeric value without incidental output. Inputs are non-negative integers.
Implementation is serial: task 2 depends on merged task 1. The implementation
and test files are repository-root `math-tool.ps1` and
`math-tool.Tests.ps1`.


FullName
--------                                                                                                               
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\pro…
C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\pro…
<shellId: 6 completed with exit code 0>
```

</details>


---

<sub>2m 17s</sub>

### Copilot

Both persisted drafts passed the mandatory validator with the complete resolution blocks. I’m starting the one-shot serial creation/link workflow with atomic ledger/result writes and exact body verification before each link.

---

<sub>2m 43s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260928-0850/run-stage20.ps1\n+[CmdletBinding()]\n+param()\n+\n+Set-StrictMode -Version Latest\n+$ErrorActionPreference = 'Stop'\n+$PSNativeCommandUseErrorActionPreference = $false\n+\n+$repo = 'edburns/dd-3070093-simple-math-win32-x64-03'\n+$parentIssue = 1\n+$expectedTaskCount = 2\n+$lessonPropagation = 'off'\n+$selectedIssueType = ''\n+$logDirectory = 'C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850'\n+$bodyDirectory = Join-Path $logDirectory 'issue-bodies'\n+$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'\n+$resultPath = Join-Path $logDirectory 'stage-20-result.json'\n+$preCreationChildrenPath = Join-Path $logDirectory 'pre-creation-children.json'\n+$finalChildrenPath = Join-Path $logDirectory 'final-children.json'\n+$draftValidator = 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1'\n+$issueBodyVerifier = 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1'\n+$childLinkVerifier = 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-stage20-child-links.ps1'\n+\n+$tasks = @(\n+    [pscustomobject]@{\n+        ImplementationSubsection = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+        BodyFile = Join-Path $bodyDirectory '01-1-implement-fibonacci-body.md'\n+        RelativeBodyFile = 'issue-bodies/01-1-implement-fibonacci-body.md'\n+        Title = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+    },\n+    [pscustomobject]@{\n+        ImplementationSubsection = '2. Add factorial and operation dispatch'\n+        BodyFile = Join-Path $bodyDirectory '02-2-add-factorial-dispatch-body.md'\n+        RelativeBodyFile = 'issue-bodies/02-2-add-factorial-dispatch-body.md'\n+        Title = '2. Add factorial and operation dispatch'\n+    }\n+)\n+\n+function Write-AtomicText {\n+    param(\n+        [Parameter(Mandatory)]\n+        [string]$Destination,\n+\n+        [Parameter(Mandatory)]\n+        [AllowEmptyString()]\n+        [string]$Content\n+    )\n+\n+    $temporary = \"$Destination.tmp.$([guid]::NewGuid().ToString('N'))\"\n+    try {\n+        [IO.File]::WriteAllText(\n+            $temporary,\n+            $Content + [Environment]::NewLine,\n+            [Text.UTF8Encoding]::new($false)\n+        )\n+        [IO.File]::Move($temporary, $Destination, $true)\n+    }\n+    finally {\n+        if (Test-Path -LiteralPath $temporary) {\n+            Remove-Item -LiteralPath $temporary -Force\n+        }\n+    }\n+}\n+\n+function Read-CreationLedger {\n+    $parsed = [IO.File]::ReadAllText($ledgerPath) |\n+        ConvertFrom-Json -NoEnumerate\n+    if ($parsed -isnot [System.Array]) {\n+        throw 'Creation ledger JSON root must be an array.'\n+    }\n+\n+    $ledger = [object[]]$parsed\n+    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {\n+        throw 'Creation ledger must not contain nested array entries.'\n+    }\n+    return $ledger\n+}\n+\n+function Write-CreationLedger {\n+    param([Parameter(Mandatory)][AllowEmptyCollection()][object[]]$Ledger)\n+\n+    $json = ConvertTo-Json -InputObject ([object[]]$Ledger) -Depth 10\n+    Write-AtomicText -Destination $ledgerPath -Content $json\n+}\n+\n+function Update-LedgerFlag {\n+    param(\n+        [Parameter(Mandatory)][int]$Number,\n+        [Parameter(Mandatory)][ValidateSet('body_verified', 'linked')][string]$Field,\n+        [Parameter(Mandatory)][bool]$Value\n+    )\n+\n+    $ledger = @(Read-CreationLedger)\n+    $matching = @($ledger | Where-Object { $_.number -eq $Number })\n+    if ($matching.Count -ne 1) {\n+        throw \"Expected exactly one ledger entry for issue #$Number.\"\n+    }\n+    $matching[0].$Field = $Value\n+    Write-CreationLedger -Ledger ([object[]]$ledger)\n+}\n+\n+function Write-StageResult {\n+    param(\n+        [Parameter(Mandatory)][ValidateSet('in_progress', 'failed', 'complete')][string]$Status,\n+        [AllowNull()][string]$OperationError\n+    )\n+\n+    $result = [ordered]@{\n+        schemaVersion = 1\n+        status = $Status\n+        ledgerFile = 'creation-ledger.json'\n+        operationError = $OperationError\n+    }\n+    Write-AtomicText -Destination $resultPath -Content ($result | ConvertTo-Json -Depth 3)\n+}\n+\n+function Get-NormalizedChildren {\n+    $childrenOutput = & gh api \"repos/$repo/issues/$parentIssue/sub_issues\" --paginate --slurp 2>&1\n+    $childrenExitCode = $LASTEXITCODE\n+    if ($childrenExitCode -ne 0) {\n+        throw \"Unable to query parent children: $($childrenOutput | Out-String)\"\n+    }\n+\n+    $completeJson = $childrenOutput | Out-String\n+    $normalizedOutput = $completeJson |\n+        & jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'\n+    $jqExitCode = $LASTEXITCODE\n+    if ($jqExitCode -ne 0) {\n+        throw \"Unable to normalize parent children: $($normalizedOutput | Out-String)\"\n+    }\n+\n+    $normalizedJson = ($normalizedOutput | Out-String).Trim()\n+    $items = @(($normalizedJson | ConvertFrom-Json))\n+    return [pscustomobject]@{\n+        Json = $normalizedJson\n+        Items = [object[]]$items\n+    }\n+}\n+\n+& $draftValidator `\n+    -BodyDirectory $bodyDirectory `\n+    -ExpectedCount $expectedTaskCount `\n+    -LessonPropagation $lessonPropagation | Out-Null\n+\n+if (-not (Test-Path -LiteralPath $preCreationChildrenPath -PathType Leaf)) {\n+    throw \"Pre-creation child snapshot is missing: $preCreationChildrenPath\"\n+}\n+if (Test-Path -LiteralPath $ledgerPath) {\n+    throw \"Creation ledger already exists; refusing to resume or overwrite: $ledgerPath\"\n+}\n+if (Test-Path -LiteralPath $resultPath) {\n+    throw \"Stage result already exists; refusing to resume or overwrite: $resultPath\"\n+}\n+\n+Write-AtomicText -Destination $ledgerPath -Content '[]'\n+Write-StageResult -Status in_progress -OperationError $null\n+\n+$initializedLedger = [IO.File]::ReadAllText($ledgerPath) | ConvertFrom-Json -NoEnumerate\n+if ($initializedLedger -isnot [System.Array] -or $initializedLedger.Count -ne 0) {\n+    throw 'Creation ledger initialization read-back failed.'\n+}\n+$initializedResult = [IO.File]::ReadAllText($resultPath) | ConvertFrom-Json\n+if (\n+    $initializedResult.schemaVersion -ne 1 -or\n+    $initializedResult.status -cne 'in_progress' -or\n+    $initializedResult.ledgerFile -cne 'creation-ledger.json' -or\n+    $null -ne $initializedResult.operationError\n+) {\n+    throw 'Stage result initialization read-back failed.'\n+}\n+\n+$operation = 'starting issue creation'\n+$mutationStarted = $false\n+\n+try {\n+    foreach ($task in $tasks) {\n+        $operation = \"creating '$($task.Title)'\"\n+        $createArguments = @(\n+            'api',\n+            \"repos/$repo/issues\",\n+            '-X', 'POST',\n+            '-f', \"title=$($task.Title)\",\n+            '-F', \"body=@$($task.BodyFile)\",\n+            '--jq', '{id,number,node_id,html_url,title}'\n+        )\n+        if (-not [string]::IsNullOrWhiteSpace($selectedIssueType)) {\n+            $createArguments = @(\n+                'api',\n+                \"repos/$repo/issues\",\n+                '-X', 'POST',\n+                '-f', \"title=$($task.Title)\",\n+                '-F', \"body=@$($task.BodyFile)\",\n+                '-f', \"type=$selectedIssueType\",\n+                '--jq', '{id,number,node_id,html_url,title}'\n+            )\n+        }\n+\n+        $createOutput = & gh @createArguments 2>&1\n+        $createExitCode = $LASTEXITCODE\n+        if ($createExitCode -ne 0) {\n+            throw \"Issue creation failed: $($createOutput | Out-String)\"\n+        }\n+        $mutationStarted = $true\n+        $createdIssue = ($createOutput | Out-String) | ConvertFrom-Json\n+\n+        $ledger = @(Read-CreationLedger)\n+        $ledger += [pscustomobject][ordered]@{\n+            implementationSubsection = $task.ImplementationSubsection\n+            bodyFile = $task.RelativeBodyFile\n+            id = [long]$createdIssue.id\n+            number = [int]$createdIssue.number\n+            title = [string]$createdIssue.title\n+            url = [string]$createdIssue.html_url\n+            body_verified = $false\n+            linked = $false\n+        }\n+        Write-CreationLedger -Ledger ([object[]]$ledger)\n+\n+        $operation = \"verifying the body of issue #$($createdIssue.number)\"\n+        try {\n+            $null = & $issueBodyVerifier `\n+                -Repository $repo `\n+                -IssueNumber ([int]$createdIssue.number) `\n+                -ExpectedBodyPath $task.BodyFile `\n+                -MaxAttempts 6 `\n+                -DelaySeconds 5 `\n+                -DiagnosticPath (\n+                    Join-Path $logDirectory \"issue-$($createdIssue.number)-body-verification-failure.json\"\n+                )\n+        }\n+        catch {\n+            throw \"Issue body verification failed for issue #$($createdIssue.number): $($_.Exception.Message)\"\n+        }\n+        Update-LedgerFlag -Number ([int]$createdIssue.number) -Field body_verified -Value $true\n+\n+        $operation = \"linking issue #$($createdIssue.number) to parent #$parentIssue\"\n+        $linkSucceeded = $false\n+        $lastLinkError = ''\n+        for ($attempt = 1; $attempt -le 3 -and -not $linkSucceeded; $attempt++) {\n+            $linkInputPath = Join-Path $logDirectory \"link-$($createdIssue.number)-$attempt.json\"\n+            try {\n+                [IO.File]::WriteAllText(\n+                    $linkInputPath,\n+                    (@{ sub_issue_id = [long]$createdIssue.id } | ConvertTo-Json -Compress),\n+                    [Text.UTF8Encoding]::new($false)\n+                )\n+                $linkOutput = & gh api \"repos/$repo/issues/$parentIssue/sub_issues\" `\n+                    -X POST `\n+                    --input $linkInputPath 2>&1\n+                $linkExitCode = $LASTEXITCODE\n+                if ($linkExitCode -eq 0) {\n+                    $linkSucceeded = $true\n+                }\n+                else {\n+                    $lastLinkError = ($linkOutput | Out-String).Trim()\n+                }\n+            }\n+            finally {\n+                if (Test-Path -LiteralPath $linkInputPath) {\n+                    Remove-Item -LiteralPath $linkInputPath -Force\n+                }\n+            }\n+        }\n+        if (-not $linkSucceeded) {\n+            throw \"Linking failed after 3 attempts: $lastLinkError\"\n+        }\n+        Update-LedgerFlag -Number ([int]$createdIssue.number) -Field linked -Value $true\n+    }\n+\n+    $operation = 'fetching final parent children'\n+    $finalChildren = Get-NormalizedChildren\n+    Write-AtomicText -Destination $finalChildrenPath -Content $finalChildren.Json\n+\n+    $operation = 'verifying parent-child count, identity, and order'\n+    & $childLinkVerifier `\n+        -PreCreationChildrenPath $preCreationChildrenPath `\n+        -FinalChildrenPath $finalChildrenPath `\n+        -CreationLedgerPath $ledgerPath | Out-Null\n+\n+    $operation = 'verifying final issue bodies, states, assignees, and types'\n+    $ledger = @(Read-CreationLedger)\n+    foreach ($entry in $ledger) {\n+        $bodyPath = Join-Path $logDirectory $entry.bodyFile\n+        try {\n+            $observedIssue = & $issueBodyVerifier `\n+                -Repository $repo `\n+                -IssueNumber ([int]$entry.number) `\n+                -ExpectedBodyPath $bodyPath `\n+                -MaxAttempts 6 `\n+                -DelaySeconds 5 `\n+                -DiagnosticPath (\n+                    Join-Path $logDirectory \"issue-$($entry.number)-final-body-verification-failure.json\"\n+                )\n+        }\n+        catch {\n+            throw \"Final body verification failed for issue #$($entry.number): $($_.Exception.Message)\"\n+        }\n+\n+        if ($observedIssue.state -cne 'open') {\n+            throw \"Issue #$($entry.number) is not open.\"\n+        }\n+        if (@($observedIssue.assignees).Count -ne 0) {\n+            throw \"Issue #$($entry.number) unexpectedly has assignees.\"\n+        }\n+        if (\n+            -not [string]::IsNullOrWhiteSpace($selectedIssueType) -and\n+            $observedIssue.type.name -cne $selectedIssueType\n+        ) {\n+            throw \"Issue #$($entry.number) does not have type '$selectedIssueType'.\"\n+        }\n+    }\n+\n+    Write-StageResult -Status complete -OperationError $null\n+    [pscustomobject]@{\n+        Status = 'complete'\n+        IssueType = if ($selectedIssueType) { $selectedIssueType } else { '(none)' }\n+        Ledger = @(Read-CreationLedger)\n+    } | ConvertTo-Json -Depth 10\n+}\n+catch {\n+    $failureMessage = \"$operation`: $($_.Exception.Message)\"\n+    if ($mutationStarted) {\n+        try {\n+            $serverChildren = Get-NormalizedChildren\n+            $linkedIds = @($serverChildren.Items | ForEach-Object { [long]$_.id })\n+            $ledger = @(Read-CreationLedger)\n+            foreach ($entry in $ledger) {\n+                $entry.linked = $linkedIds -contains [long]$entry.id\n+            }\n+            Write-CreationLedger -Ledger ([object[]]$ledger)\n+        }\n+        catch {\n+            $failureMessage += \" Reconciliation also failed: $($_.Exception.Message)\"\n+        }\n+        Write-StageResult -Status failed -OperationError $failureMessage\n+\n+        Write-Error \"Stage 20 did not complete: $failureMessage\" -ErrorAction Continue\n+        $ledger = @(Read-CreationLedger)\n+        if ($ledger.Count -eq 0) {\n+            Write-Host 'No issues were created; no cleanup is required.'\n+        }\n+        else {\n+            $ledger |\n+                Select-Object number, title, url, bodyFile, body_verified, linked |\n+                Format-Table -AutoSize |\n+                Out-Host\n+            foreach ($entry in $ledger) {\n+                Write-Host \"gh issue delete $($entry.number) --repo `\"$repo`\" --yes\"\n+            }\n+            Write-Host 'No automatic rollback was performed. Delete every ledger issue before invoking stage 20 again.'\n+        }\n+    }\n+    throw\n+}\n*** End Patch\n"
```

</details>

```
Added 1 file(s): C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\run-stage20.ps1
```


---

<sub>2m 53s</sub>

### `powershell`

**Create and verify child issues**

<details>
<summary>Arguments</summary>

```json
{
  "command": "& 'C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850\\run-stage20.ps1'",
  "description": "Create and verify child issues",
  "initial_wait": 180,
  "mode": "sync"
}
```

</details>

<details>
<summary>6 lines</summary>

```
Exception: C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\run-stage20.ps1:168
Line |
 168 |      throw 'Stage result initialization read-back failed.'
     |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     | Stage result initialization read-back failed.
<shellId: 7 completed with exit code 1>
```

</details>


---

<sub>2m 57s</sub>

### Copilot

The pre-mutation result read-back rejected PowerShell’s null-to-string coercion; no GitHub issue was created. I’m correcting the result serializer, removing only the two initialization artifacts, and rerunning the one-shot operation.

---

<sub>3m 0s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\stage-20-result.json.**

C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\stage-20-result.json

<details>
<summary>6 lines</summary>

```
{
  "schemaVersion": 1,
  "status": "in_progress",
  "ledgerFile": "creation-ledger.json",
  "operationError": ""
}
```

</details>


---

<sub>3m 1s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\creation-ledger.json.**

C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\creation-ledger.json

```
[]

```


---

<sub>3m 6s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Update File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260928-0850/run-stage20.ps1\n@@\n function Write-StageResult {\n     param(\n         [Parameter(Mandatory)][ValidateSet('in_progress', 'failed', 'complete')][string]$Status,\n-        [AllowNull()][string]$OperationError\n+        [AllowNull()][object]$OperationError\n     )\n*** End Patch\n"
```

</details>

```
Modified 1 file(s): C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\run-stage20.ps1
```


---

<sub>3m 18s</sub>

### `powershell`

**Retry issue creation workflow**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ledger='C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850\\creation-ledger.json'; $result='C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850\\stage-20-result.json'; Remove-Item -LiteralPath $ledger,$result -Force; & 'C:\\Users\\edburns\\workareas\\dd-3070093-simple-math-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260928-0850\\run-stage20.ps1'",
  "description": "Retry issue creation workflow",
  "initial_wait": 180,
  "mode": "sync"
}
```

</details>

<details>
<summary>27 lines</summary>

```
{
  "Status": "complete",
  "IssueType": "(none)",
  "Ledger": [
    {
      "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
      "bodyFile": "issue-bodies/01-1-implement-fibonacci-body.md",
      "id": 5614870229,
      "number": 2,
      "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
      "url": "https://github.com/edburns/dd-3070093-simple-math-win32-x64-03/issues/2",
      "body_verified": true,
      "linked": true
    },
    {
      "implementationSubsection": "2. Add factorial and operation dispatch",
      "bodyFile": "issue-bodies/02-2-add-factorial-dispatch-body.md",
      "id": 5614870768,
      "number": 3,
      "title": "2. Add factorial and operation dispatch",
      "url": "https://github.com/edburns/dd-3070093-simple-math-win32-x64-03/issues/3",
      "body_verified": true,
      "linked": true
    }
  ]
}
<shellId: 8 completed with exit code 0>
```

</details>


---

<sub>3m 23s</sub>

### Copilot

The two issues were created, body-verified, linked in order, and left unassigned. I’m checking the persisted completion artifacts and exact handoff syntax before returning the ordered campaign list.

---

<sub>3m 32s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\stage-20-result.json.**

C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\stage-20-result.json

<details>
<summary>6 lines</summary>

```
{
  "schemaVersion": 1,
  "status": "complete",
  "ledgerFile": "creation-ledger.json",
  "operationError": null
}
```

</details>


---

<sub>3m 32s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\creation-ledger.json.**

C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\creation-ledger.json

<details>
<summary>22 lines</summary>

```
[
  {
    "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "bodyFile": "issue-bodies/01-1-implement-fibonacci-body.md",
    "id": 5614870229,
    "number": 2,
    "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "url": "https://github.com/edburns/dd-3070093-simple-math-win32-x64-03/issues/2",
    "body_verified": true,
    "linked": true
  },
  {
    "implementationSubsection": "2. Add factorial and operation dispatch",
    "bodyFile": "issue-bodies/02-2-add-factorial-dispatch-body.md",
    "id": 5614870768,
    "number": 3,
    "title": "2. Add factorial and operation dispatch",
    "url": "https://github.com/edburns/dd-3070093-simple-math-win32-x64-03/issues/3",
    "body_verified": true,
    "linked": true
  }
]
```

</details>


---

<sub>3m 31s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\final-children.json.**

C:\Users\edburns\workareas\dd-3070093-simple-math-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260928-0850\final-children.json

```
File too large to read at once (29.5 KB). Consider using the grep tool to search within the file, or view with view_range to read specific sections.
```


---

<sub>3m 34s</sub>

### `rg`

**shepherd-task-25-given-list**

"shepherd-task-25-given-list" in *.{md,ps1,json}

```
No matches found.
```


---

<sub>3m 34s</sub>

### `powershell`

**Check final worktree status**

<details>
<summary>Arguments</summary>

```json
{
  "command": "git status --short",
  "description": "Check final worktree status",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

```
?? 1-math-control-remove-before-merge/prompts/
<shellId: 9 completed with exit code 0>
```


---

<sub>3m 33s</sub>

### `sql`

**Complete stage todos**

<details>
<summary>Arguments</summary>

```json
{
  "description": "Complete stage todos",
  "query": "UPDATE todos SET status='done', updated_at=CURRENT_TIMESTAMP WHERE id IN ('stage20-preflight','stage20-drafts','stage20-create','stage20-verify'); SELECT id,status FROM todos ORDER BY created_at;"
}
```

</details>

<details>
<summary>11 lines</summary>

```
Executed 2 statement(s):

1. UPDATE
   4 row(s) updated.

2. SELECT
   4 row(s) returned:
   
   | id | status |
   | --- | --- |
   | stage20-preflight | done |
   | stage20-drafts | done |
   | stage20-create | done |
   | stage20-verify | done |
```

</details>


---

<sub>3m 44s</sub>

### `rg`

**given-list|PLAN_DIRECTORY|ISSUE_NUMBERS**

"given-list|PLAN_DIRECTORY|ISSUE_NUMBERS" in *.{md,ps1,json,yml,yaml} (~\.copilot\plugins\shepherd-task)

<details>
<summary>100 matches</summary>

```
[grep content: 86 matches across 32 file(s) under C:/Users/edburns/.copilot/plugins/shepherd-task]

figure (7 match(es)):
  01- shepherd-task-25-given-list.md:1:# Figure 01 — Stage 25 given-list batch orchestration
  01- shepherd-task-25-given-list.md:3:Stage 25 (`shepherd-task-25-given-list`) owns one serial run. It validates the durable campaign
  01- shepherd-task-25-given-list.md:12:    participant GL as Stage 25: shepherd-task-25-given-list
  01- shepherd-task-25-given-list.md:14:    participant RM as given-list run manifest
  02- shepherd-task.md:4:existing given-list run directory. It derives repository, base branch, campaign
  02- shepherd-task.md:10:    participant GL as Stage 25 given-list runner
  05- post-mortem.md:3:The given-list exit path invokes stage 50 for both successful and failed runs.
making-of.md:248: `shepherd-task-25-given-list-run.json`. The run begins as `running` and is

README.md (16 match(es)):
  33: - one or more `shepherd-task-25-given-list` runs.
  54: | 25         |                                                    | `shepherd-task-25-given-list`                     | Runs selected child issues serially, invokes `shepherd-task` separately for each issue to perform stages 30 and 40, and always invokes stage 50 |
  57: | 50         | `shepherd-task-50-create-post-mortem`              |                                                   | Writes an evidence-based report for the given-list run                               |
  256: ./plugins/shepherd-task/scripts/shepherd-task-25-given-list.sh \
  264: .\plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1 `
  295: - [Figure 01 — stage 25 given-list batch orchestration](figure-01-shepherd-task-25-given-list.md)
  307:   <given-list-run-directory> \
  448: Every given-list invocation creates
  449: `shepherd-task-25-given-list-run.json`:
  542:     ├── shepherd-task-25-given-list-run.json
  554: Each given-list invocation has its own run directory. A campaign may have
  559: The given-list exit path invokes stage 50 after success or failure. Stage 50
  584:   <given-list-run-directory>
  604: - A given-list run stops on the first failed issue but still runs stage 50 and
  606: - Resume a campaign by starting a new given-list run with the remaining issues.
  627: | `scripts/shepherd-task-25-given-list.*` | Run stage 25: create a run and dispatch issues serially |

test/lesson-propagation-default-contract.ps1 (4 match(es)):
  9: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'
  160:         (Join-Path $harnessDirectory 'shepherd-task-25-given-list.ps1'),
  196:             Join-Path $harnessDirectory 'shepherd-task-25-given-list.ps1'
  214:         Join-Path $runDirectories[0].FullName 'shepherd-task-25-given-list-run.json'

scripts/shepherd-task (5 match(es)):
  15- prepare-create-issues.ps1:103:$PLAN_DIRECTORY = [string]$campaign.campaignMetadataDirectory
  15- prepare-create-issues.ps1:203:Write-Host "Campaign metadata directory: $PLAN_DIRECTORY"
  15- prepare-create-issues.ps1:232:- PLAN_DIRECTORY: $PLAN_DIRECTORY
  25- given-list.ps1:65:$runManifestPath = Join-Path $logDirFull 'shepherd-task-25-given-list-run.json'
  25- given-list.ps1:117:    Write-Host "Logging shepherd-task-25-given-list run to: $logDirFull"
scripts/shepherd-task-monitor.ps1:10:     Run this in a SEPARATE terminal while shepherd-task-25-given-list.ps1 is running.
scripts/shepherd-task.ps1:22:     Existing shepherd-task-25-given-list run directory.

skills/shepherd-task (15 match(es)):
  50- create-post-mortem\SKILL.md:13:This skill is designed to be invoked from `shepherd-task-25-given-list.ps1` / `shepherd-task-25-given-list.sh` in a `finally` / `trap EXIT` path so it runs for **all outcomes**, not only after success.
  50- create-post-mortem\SKILL.md:60:2. If `shepherd-task-25-given-list-run.json` exists, verify its campaign ID,
  20- create-issues-from-plan\SKILL.md:22:4. **`PLAN_DIRECTORY`** — Repo-relative path to the directory on `BASE_BRANCH` that contains the plan, spikes, and all supporting resources.
  20- create-issues-from-plan\SKILL.md:23:5. **`PLAN_FILE_NAME`** — Name of the ignorance reduction plan file within `PLAN_DIRECTORY`.
  20- create-issues-from-plan\SKILL.md:29:11. **`CAMPAIGN_ID`** — Canonical campaign UUID from `PLAN_DIRECTORY/shepherd-campaign.json`.
  20- create-issues-from-plan\SKILL.md:44:- Each issue must prominently include text stating that on the base branch, the `PLAN_DIRECTORY` contains the `PLAN_FILE_NAME` and supporting resources.
  20- create-issues-from-plan\SKILL.md:79:9. Read `PLAN_DIRECTORY/PLAN_FILE_NAME` from `BASE_BRANCH`. Prefer `git show "$BASE_BRANCH:$PLAN_DIRECTORY/$PLAN_FILE_NAME"`; fall back to `gh api`.
  20- create-issues-from-plan\SKILL.md:87:13. Read `PLAN_DIRECTORY/shepherd-campaign.json` from `BASE_BRANCH`. Verify its `campaignId` and `lessonPropagation` exactly match `CAMPAIGN_ID` and `LESSON_PROPAGATION`, and verify `campaign-lessons.md` exists.
  20- create-issues-from-plan\SKILL.md:104:6. Relevant spike **findings** (decisions, constraints, rejected approaches) from `PLAN_DIRECTORY` and resources referenced by the plan — extracted as prose, never as source file references (see "Spike firewall" section).
  20- create-issues-from-plan\SKILL.md:111:- A prominent statement: "On the `BASE_BRANCH` branch, the directory `PLAN_DIRECTORY` contains the plan (`PLAN_FILE_NAME`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code."
  20- create-issues-from-plan\SKILL.md:127:Before implementation, read `PLAN_DIRECTORY/campaign-lessons.md` from `BASE_BRANCH`.
  20- create-issues-from-plan\SKILL.md:384:2. Comma-separated child issue numbers for `shepherd-task-25-given-list`.
  20- create-issues-from-plan\SKILL.md:385:3. Suggested campaign-aware given-list invocation using the ordered issue numbers and `PLAN_DIRECTORY`; stage 25 derives `LESSON_PROPAGATION` from the campaign manifest.
  20- create-issues-from-plan\SKILL.md:418:- **Spike directory paths as working directories.** The `PLAN_DIRECTORY` contains the plan and may contain spike subdirectories; issue bodies must reference the plan and its resolutions, not the spike subdirectories themselves.
  20- create-issues-from-plan\SKILL.md:425:2. Optionally note that the finding was "established by research in `PLAN_DIRECTORY`" for human traceability.
test/simple-math/06-stage40-review-contract.ps1:14: $stage25Path = Join-Path $repoRoot 'plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1'

test/simple-math/run-campaign.ps1 (2 match(es)):
  339:                 $manifestPath = Join-Path $_.FullName 'shepherd-task-25-given-list-run.json'
  468:         'scripts\shepherd-task-25-given-list.ps1'
test/simple-math/07-driver-encoding-contract.ps1:296:         'shepherd-task-25-given-list.ps1',
test/simple-math/02-create-issues.ps1:261:     (Join-Path $PSScriptRoot '..' '..' 'scripts' 'shepherd-task-25-given-list.ps1')
test/simple-math/08-psncpps-contract.ps1:13: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'
test/simple-math/10-simple-math-fixture-contract.ps1:114:     "scripts\\shepherd-task-25-given-list\.ps1"

workshop.md (3 match(es)):
  215: & 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1' `
  229: /Users/edburns/.copilot/plugins/shepherd-task/scripts/shepherd-task-25-given-list.sh 2\,3 1-math-control-remove-before-merge
  241: By the time you have invoked `shepherd-task-25-given-list` the work proceeds in an entirely human hands-off manner. See `awesome-copilot-01/plugins/shepherd-task/README.md` Sections **Stage 30 readiness boundary** through **Workflow approval helper** and **Post-mortem behavior**.
test/cargotracker-add-change-arrival-deadline-feature-treatment-control/02-create-issues.ps1:255:     (Join-Path $PSScriptRoot '..' '..' 'scripts' 'shepherd-task-25-given-list.ps1')
test/cargotracker-add-change-arrival-deadline-feature/02-create-issues.ps1:264:     (Join-Path $PSScriptRoot '..' '..' 'scripts' 'shepherd-task-25-given-list.ps1')
test/simple-math-treatment-control/02-create-issues.ps1:252:     (Join-Path $PSScriptRoot '..' '..' 'scripts' 'shepherd-task-25-given-list.ps1')
test/cargotracker-add-change-arrival-deadline-feature-treatment-control/06-stage40-review-contract.ps1:14: $stage25Path = Join-Path $repoRoot 'plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1'
test/cargotracker-add-change-arrival-deadline-feature/06-stage40-review-contract.ps1:14: $stage25Path = Join-Path $repoRoot 'plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1'
test/cargotracker-add-change-arrival-deadline-feature-treatment-control/08-psncpps-contract.ps1:13: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'
test/simple-math-treatment-control/06-stage40-review-contract.ps1:14: $stage25Path = Join-Path $repoRoot 'plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1'
test/simple-math-treatment-control/08-psncpps-contract.ps1:13: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'
test/cargotracker-add-change-arrival-deadline-feature/07-driver-encoding-contract.ps1:296:         'shepherd-task-25-given-list.ps1',
test/cargotracker-add-change-arrival-deadline-feature/08-psncpps-contract.ps1:13: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'

test/cargotracker-add-change-arrival-deadline-feature-treatment-control/20260902-run-treatment-control-experiment.ps1 (3 match(es)):
  149:                 $manifestPath = Join-Path $_.FullName 'shepherd-task-25-given-list-run.json'
  502:         -Path (Join-Path $ShepherdPlugin 'scripts\shepherd-task-25-given-list.ps1') `
  512:         -Path (Join-Path $ShepherdPlugin 'scripts\shepherd-task-25-given-list.ps1') `

test/simple-math-treatment-control/20260831-run-treatment-control-experiment.ps1 (3 match(es)):
  150:                 $manifestPath = Join-Path $_.FullName 'shepherd-task-25-given-list-run.json'
  496:         -Path (Join-Path $ShepherdPlugin 'scripts\shepherd-task-25-given-list.ps1') `
  506:         -Path (Join-Path $ShepherdPlugin 'scripts\shepherd-task-25-given-list.ps1') `

test/cargotracker-add-change-arrival-deadline-feature-treatment-control/202609023-1638Z-run-treatment-control-experiment-resumeable.ps1 (3 match(es)):
  180:             'shepherd-task-25-given-list-run.json'
  395:         'shepherd-task-25-given-list-run.json'
  436:                 'scripts\shepherd-task-25-given-list.ps1') `

test/simple-math-treatment-control/README.md (2 match(es)):
  407: & "$ShepherdPlugin/scripts/shepherd-task-25-given-list.ps1" `
  416: & "$ShepherdPlugin/scripts/shepherd-task-25-given-list.ps1" `
test/cargotracker-add-change-arrival-deadline-feature/10-cargotracker-fixture-contract.ps1:207:     "scripts\\shepherd-task-25-given-list\.ps1"

test/cargotracker-add-change-arrival-deadline-feature-treatment-control/README.md (2 match(es)):
  305: & "$ShepherdPlugin\scripts\shepherd-task-25-given-list.ps1" `
  310: & "$ShepherdPlugin\scripts\shepherd-task-25-given-list.ps1" `

test/cargotracker-add-change-arrival-deadline-feature/run-campaign.ps1 (2 match(es)):
  341:                 $manifestPath = Join-Path $_.FullName 'shepherd-task-25-given-list-run.json'
  473:         'scripts\shepherd-task-25-given-list.ps1'
```

</details>


---

<sub>3m 48s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\workshop.md.**

C:\Users\edburns\.copilot\plugins\shepherd-task\workshop.md (lines 205-235)

<details>
<summary>24 lines</summary>

````

   1. https://github.com/edburns/dd-3056167-01-windows/issues/2

   2. https://github.com/edburns/dd-3056167-01-windows/issues/3

#### Stage 25 - Dispatch ordered issue list

```powershell
[shepherd] Working directory:
C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control
& 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1' `
    -TaskIssues '2,3' `
    -CampaignMetadataDirectory '1-math-control-remove-before-merge'
[shepherd] Stage 25 will process issues 2,3 serially.
[shepherd] For each issue, Stage 30 moves assignment to the Ready-for-review boundary, then Stage 40 reviews and merges it.
[shepherd] Stage 50 creates the campaign post-mortem after success or failure.
[shepherd] Run evidence will be written beneath: C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\shepherd-tasks-<CAMPAIGN_ID>-<TIMESTAMP>
```

macOS, GNU/Linux

```bash
[shepherd] Working directory:
/Users/edburns/workareas/dd-3061974-03-bash-simple-math-shepherd-control
/Users/edburns/.copilot/plugins/shepherd-task/scripts/shepherd-task-25-given-list.sh 2\,3 1-math-control-remove-before-merge
[shepherd] Stage 25 will process issues 2,3 serially.
[shepherd] For each issue, Stage 30 moves assignment to the Ready-for-review boundary, then Stage 40 reviews and merges it.
[shepherd] Stage 50 creates the campaign post-mortem after success or failure.
[shepherd] Run evidence will be written beneath: /Users/edburns/workareas/dd-3061974-03-bash-simple-math-shepherd-control/1-math-control-remove-before-merge/shepherd-tasks-<CAMPAIGN_ID>-<TIMESTAMP>

```
````

</details>


---

<sub>3m 49s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\README.md.**

C:\Users\edburns\.copilot\plugins\shepherd-task\README.md (lines 244-275)

<details>
<summary>23 lines</summary>

````
Stage 20 creates and links issues one at a time and records every result in
`creation-ledger.json`. It is deliberately one-shot, not resumable. On partial
failure it stops, reconciles the ledger, prints deletion commands, and requires
manual cleanup before another invocation. The launcher requires
`stage-20-result.json` to explicitly report `complete`; a zero Copilot process
exit alone is not treated as successful issue creation.

### 5. Run stage 25 with an ordered issue list

Bash:

```bash
./plugins/shepherd-task/scripts/shepherd-task-25-given-list.sh \
  "<issue-number>,<issue-number>" \
  <campaign-metadata-directory>
```

PowerShell:

```powershell
.\plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1 `
  -TaskIssues "<issue-number>,<issue-number>" `
  -CampaignMetadataDirectory <campaign-metadata-directory>
```

Stage 25 invokes `shepherd-task` for each issue in order.

**Note:** Manually invoking `shepherd-task` is also supported entry-point.

Bash:

```bash
````

</details>


---

<sub>3m 53s</sub>

### Copilot

Created and linked **2 ordered child issues** under #1. Both are open, unassigned, body-verified, and created **without an issue type**.

| Implementation subsection | Issue | Title |
|---|---:|---|
| 1. Implement Fibonacci with unit and isolated CLI coverage | [#2](https://github.com/edburns/dd-3070093-simple-math-win32-x64-03/issues/2) | 1. Implement Fibonacci with unit and isolated CLI coverage |
| 2. Add factorial and operation dispatch | [#3](https://github.com/edburns/dd-3070093-simple-math-win32-x64-03/issues/3) | 2. Add factorial and operation dispatch |

**Stage 25 ordered list:** `2,3`

```powershell
& 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1' `
    -TaskIssues '2,3' `
    -CampaignMetadataDirectory '1-math-control-remove-before-merge'
```

`stage-20-result.json` records `status: complete`; the creation ledger and normalized child snapshots are persisted in the specified log directory.

---

<sub>Generated by [GitHub Copilot CLI](https://github.com/features/copilot/cli)</sub>
