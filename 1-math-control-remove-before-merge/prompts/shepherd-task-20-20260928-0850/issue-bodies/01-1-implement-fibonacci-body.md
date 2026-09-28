## Campaign context and required reading

**On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.**

Read the entire plan before working. Then re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`

Carry these resolved decisions into the implementation:

- The only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing `.github/workflows/shepherd-task-math-tool.yml` workflow installs exactly Pester 5.7.1 and invokes that repository-owned runner. Do not replace or bypass either mechanism.
- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.
- `Get-Fibonacci` returns only the numeric value, with no incidental output.
- Inputs are non-negative integers.
- The production and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.
- This is the first task. The factorial/dispatch task starts only after this issue is completed and merged.

The plan records no spike-specific implementation findings for this task. Do not seek out, copy, or adapt spike source code; implement from the resolved production contract.

## Branch and execution order

Use `experiment/shepherd-control` as the base branch for the pull request. Do not start work until this issue is assigned to the coding agent.

The campaign tasks are assigned, completed, and merged serially in plan order. This is task 1 of 2 and has no task prerequisite. It must be merged into `experiment/shepherd-control` before task 2 begins.

## Implement

Create repository-root `math-tool.ps1` with:

- A script parameter named `N` constrained to non-negative integer input.
- A pure `Get-Fibonacci` function that computes the Fibonacci value for `N` and emits only that numeric return value.
- Direct-execution behavior that calls the function and writes exactly one stdout line: `Fibonacci(N) = value`, with the actual input and result substituted.
- Correct edge behavior for `N=0` and `N=1`, plus ordinary small positive values.

Create repository-root `math-tool.Tests.ps1` with Pester coverage that:

- Dot-sources `math-tool.ps1` for unit-level function tests without producing CLI output.
- Exercises `Get-Fibonacci` for `N=0`, `N=1`, and at least one representative small value.
- Starts isolated child `pwsh` processes to exercise direct CLI behavior rather than treating an in-process invocation as equivalent.
- Asserts the child process exits successfully and stdout is exactly the single expected result line.
- Verifies the function emits one numeric result and no incidental output.

Follow existing repository conventions and keep the implementation objective and small.

## Completion gates

- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero using the repository-pinned Pester 5.7.1 path.
- Unit tests prove the Fibonacci base cases and a representative recurrence result.
- Isolated CLI tests prove exact stdout text, exactly one output line, and a zero exit code.
- A negative `N` is rejected before Fibonacci computation; no specific error wording is required.
- `math-tool.ps1` and `math-tool.Tests.ps1` are introduced together.
- The pinned pull-request CI workflow passes.

## Out of scope

- Do not add factorial, operation dispatch, or other mathematical operations; those belong to task 2.
- Do not change the repository-owned test runner, pinned Pester version, or CI workflow.
- Do not add dependencies, packaging, interactive prompts, logging, or unrelated refactoring.
- Do not modify files outside `math-tool.ps1` and `math-tool.Tests.ps1` unless a directly necessary repository convention requires it.
