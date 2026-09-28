## Campaign context and required reading

**On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.**

Read the entire plan before working. Then re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`
- `### 2. Add factorial and operation dispatch`

Carry these resolved decisions into the implementation:

- The only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing `.github/workflows/shepherd-task-math-tool.yml` workflow installs exactly Pester 5.7.1 and invokes that repository-owned runner. Do not replace or bypass either mechanism.
- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, according to the selected operation.
- `Get-Fibonacci` and `Get-Factorial` return only their numeric values, with no incidental output.
- Inputs are non-negative integers.
- The production and test files remain repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.
- This task depends on the merged implementation from task 1 and must preserve its Fibonacci behavior and coverage.

The plan records no spike-specific implementation findings for this task. Do not seek out, copy, or adapt spike source code; implement from the resolved production contract.

## Branch and execution order

Use `experiment/shepherd-control` as the base branch for the pull request. Do not start work until this issue is assigned to the coding agent.

The campaign tasks are assigned, completed, and merged serially in plan order. This is task 2 of 2. Begin only after task 1, `1. Implement Fibonacci with unit and isolated CLI coverage`, has been merged into `experiment/shepherd-control`.

## Implement

Extend the task-1 `math-tool.ps1` implementation with:

- A pure `Get-Factorial` function that computes factorial for non-negative integer `N` and emits only that numeric return value.
- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the `N` parameter.
- Direct CLI output of exactly `Fibonacci(N) = value` for Fibonacci and exactly `Factorial(N) = value` for factorial.
- Preservation of the task-1 Fibonacci invocation and behavior. An invocation that omits `Operation` must continue to perform Fibonacci so existing task-1 callers and tests remain valid.
- Correct factorial behavior for `N=0`, `N=1`, and ordinary small positive values.
- Explicit rejection of unsupported operation names rather than silently selecting an operation.

Extend `math-tool.Tests.ps1` using production code and production dependencies. Keep all task-1 Fibonacci tests and add objective coverage for:

- Unit-level `Get-Factorial` results for `N=0`, `N=1`, and at least one representative small value.
- Dispatch to both supported operations.
- Isolated child-`pwsh` CLI execution for factorial with exact single-line stdout and a zero exit code.
- Fibonacci CLI regression behavior, including invocation without an explicit operation.
- Unsupported operation rejection without a success-shaped result.

Follow existing repository conventions and keep the interface and tests small.

## Completion gates

- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined Fibonacci and factorial regression suite.
- Factorial unit tests prove `0! = 1`, `1! = 1`, and a representative value.
- Dispatch tests prove `fibonacci` and `factorial` select the correct pure function.
- Isolated CLI tests prove both output formats, exactly one result line on successful execution, and zero exit codes.
- Existing task-1 Fibonacci tests continue to pass unchanged in behavioral intent.
- Negative `N` and unsupported operations are rejected; no specific error wording is required.
- The pinned pull-request CI workflow passes.

## Out of scope

- Do not add mathematical operations beyond Fibonacci and factorial.
- Do not replace the script interface with interactive input, a module, packaging, or another executable.
- Do not change the repository-owned test runner, pinned Pester version, or CI workflow.
- Do not add dependencies, logging, or unrelated refactoring.
- Do not copy or adapt research/spike code or test infrastructure.
