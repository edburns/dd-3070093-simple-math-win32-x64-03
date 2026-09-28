BeforeAll {
    $script:MathToolPath = Join-Path $PSScriptRoot 'math-tool.ps1'
    $script:PwshPath = (Get-Process -Id $PID).Path

    function Invoke-MathToolProcess {
        param([string[]]$Arguments)

        $startInfo = [System.Diagnostics.ProcessStartInfo]::new($script:PwshPath)
        foreach ($argument in @('-NoLogo', '-NoProfile', '-NonInteractive', '-File', $script:MathToolPath) + $Arguments) {
            $startInfo.ArgumentList.Add($argument)
        }
        $startInfo.RedirectStandardOutput = $true
        $startInfo.RedirectStandardError = $true
        $startInfo.UseShellExecute = $false

        $process = [System.Diagnostics.Process]::Start($startInfo)
        $stderrTask = $process.StandardError.ReadToEndAsync()
        $stdout = $process.StandardOutput.ReadToEnd()
        $process.WaitForExit()

        [pscustomobject]@{
            ExitCode = $process.ExitCode
            StdOut   = $stdout
            StdErr   = $stderrTask.GetAwaiter().GetResult()
        }
    }

    $script:DotSourceOutput = @(. $script:MathToolPath -N 0)
}

Describe 'Get-Fibonacci' {
    It 'produces no output when dot-sourced' {
        $script:DotSourceOutput.Count | Should -Be 0
    }

    It 'returns <Expected> for N=<N>' -ForEach @(
        @{ N = 0; Expected = 0 }
        @{ N = 1; Expected = 1 }
        @{ N = 2; Expected = 1 }
        @{ N = 10; Expected = 55 }
    ) {
        Get-Fibonacci -N $N | Should -Be $Expected
    }

    It 'emits exactly one numeric result and no incidental output' {
        $output = @(Get-Fibonacci -N 10 *>&1)
        $output.Count | Should -Be 1
        $output[0] | Should -BeOfType ([System.Numerics.BigInteger])
        $output[0] | Should -Be 55
    }

    It 'rejects negative N' {
        { Get-Fibonacci -N -1 } | Should -Throw
    }
}

Describe 'Get-Factorial' {
    It 'returns <Expected> for N=<N>' -ForEach @(
        @{ N = 0; Expected = 1 }
        @{ N = 1; Expected = 1 }
        @{ N = 5; Expected = 120 }
    ) {
        Get-Factorial -N $N | Should -Be $Expected
    }

    It 'emits exactly one numeric result and no incidental output' {
        $output = @(Get-Factorial -N 5 *>&1)
        $output.Count | Should -Be 1
        $output[0] | Should -BeOfType ([System.Numerics.BigInteger])
        $output[0] | Should -Be 120
    }

    It 'rejects negative N' {
        { Get-Factorial -N -1 } | Should -Throw
    }
}

Describe 'Invoke-MathOperation' {
    It 'dispatches <Operation> to the matching function' -ForEach @(
        @{ Operation = 'fibonacci'; Line = 'Fibonacci(5) = 5' }
        @{ Operation = 'factorial'; Line = 'Factorial(5) = 120' }
    ) {
        Invoke-MathOperation -Operation $Operation -N 5 | Should -BeExactly $Line
    }

    It 'rejects an unsupported operation' {
        { Invoke-MathOperation -Operation 'sum' -N 5 } | Should -Throw
    }
}

Describe 'math-tool.ps1 CLI' {
    It 'writes exactly "<Line>" for N=<N>' -ForEach @(
        @{ N = 0; Line = 'Fibonacci(0) = 0' }
        @{ N = 1; Line = 'Fibonacci(1) = 1' }
        @{ N = 10; Line = 'Fibonacci(10) = 55' }
    ) {
        $result = Invoke-MathToolProcess -Arguments @('-N', "$N")
        $result.ExitCode | Should -Be 0
        $result.StdOut | Should -BeExactly ($Line + [Environment]::NewLine)
        $result.StdErr | Should -BeNullOrEmpty
    }

    It 'rejects negative N without writing a result' {
        $result = Invoke-MathToolProcess -Arguments @('-N', '-1')
        $result.ExitCode | Should -Not -Be 0
        $result.StdOut | Should -Not -Match 'Fibonacci'
    }

    It 'writes exactly "<Line>" for -Operation <Operation> -N <N>' -ForEach @(
        @{ Operation = 'fibonacci'; N = 10; Line = 'Fibonacci(10) = 55' }
        @{ Operation = 'factorial'; N = 0; Line = 'Factorial(0) = 1' }
        @{ Operation = 'factorial'; N = 1; Line = 'Factorial(1) = 1' }
        @{ Operation = 'factorial'; N = 5; Line = 'Factorial(5) = 120' }
    ) {
        $result = Invoke-MathToolProcess -Arguments @('-Operation', $Operation, '-N', "$N")
        $result.ExitCode | Should -Be 0
        $result.StdOut | Should -BeExactly ($Line + [Environment]::NewLine)
        $result.StdErr | Should -BeNullOrEmpty
    }

    It 'rejects negative N for factorial without writing a result' {
        $result = Invoke-MathToolProcess -Arguments @('-Operation', 'factorial', '-N', '-1')
        $result.ExitCode | Should -Not -Be 0
        $result.StdOut | Should -Not -Match 'Factorial|Fibonacci'
    }

    It 'rejects an unsupported operation without writing a result' {
        $result = Invoke-MathToolProcess -Arguments @('-Operation', 'sum', '-N', '5')
        $result.ExitCode | Should -Not -Be 0
        $result.StdOut | Should -Not -Match '='
    }
}
