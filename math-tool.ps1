[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateRange(0, [int]::MaxValue)]
    [int]$N,

    [ValidateSet('fibonacci', 'factorial')]
    [string]$Operation = 'fibonacci'
)

Set-StrictMode -Version Latest

function Get-Fibonacci {
    [CmdletBinding()]
    [OutputType([System.Numerics.BigInteger])]
    param(
        [Parameter(Mandatory)]
        [ValidateRange(0, [int]::MaxValue)]
        [int]$N
    )

    $previous = [System.Numerics.BigInteger]::Zero
    $current = [System.Numerics.BigInteger]::One
    for ($i = 0; $i -lt $N; $i++) {
        $next = $previous + $current
        $previous = $current
        $current = $next
    }
    return $previous
}

function Get-Factorial {
    [CmdletBinding()]
    [OutputType([System.Numerics.BigInteger])]
    param(
        [Parameter(Mandatory)]
        [ValidateRange(0, [int]::MaxValue)]
        [int]$N
    )

    $result = [System.Numerics.BigInteger]::One
    for ($i = 2; $i -le $N; $i++) {
        $result = $result * $i
    }
    return $result
}

function Invoke-MathOperation {
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('fibonacci', 'factorial')]
        [string]$Operation,

        [Parameter(Mandatory)]
        [ValidateRange(0, [int]::MaxValue)]
        [int]$N
    )

    switch ($Operation) {
        'fibonacci' { return "Fibonacci($N) = $(Get-Fibonacci -N $N)" }
        'factorial' { return "Factorial($N) = $(Get-Factorial -N $N)" }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    Write-Output (Invoke-MathOperation -Operation $Operation -N $N)
}
