# Explicit BREP operation scopes

`OperationContext::strict(WorkBudget)` evaluates a synchronous batch with one
strict policy and shared refinement/promotion accounting. It delegates to the
existing [Hypersolve scope](../../../../hypersolve/src/work_budget.rs) and
BREP's strict Hypercurve scope. The public result is the existing
`BudgetOutcome<T>`: resource exhaustion is outermost, while domain errors and
geometric uncertainty retain the callback's return type. No second budget
implementation or unenforced limit fields are added.

Seven [integration tests](../../../tests/work_budget.rs) exercise actual BREP
parameter location, parent/child sharing, a smaller child failure, cheap/warm
geometry, domain errors, ambient approximation and unwind restoration. A
Hypercurve intersection additionally exercises promotion accounting and
prevents publication of an incomplete report after exhaustion. The exact
five-root BREP fixture has roots `1/8, 1/4, 1/2, 3/4, 7/8`; it tests accounting
and complete represented output, not non-materializable algebraic topology.

Two [negative controls](controls.json) deliberately bypass the budget or
inherit ambient approximation. Each fails its focused assertion, not
compilation. Their zero-context patches apply with `git apply --unidiff-zero`.
The control source differs from the retained source only by the recorded
doctest method-name correction; runtime code and integration tests are the
same. [controls.py](controls.py) retains the replay procedure.

[commands.json](commands.json) records qualification exit codes and all cost
runs. The unchanged 66-row kernel benchmark is compared with `52ebe6bba` in
three paired process trials on CPU 0, alternating executable order.
[comparison.json](comparison.json) retains every receipt and timing sample;
the baseline identity matches the prior
[cache experiment](../2026-10-14-retryable-caches/executables.json).

The new [budget benchmark](../../../benches/work_budget.rs) compares direct
and scoped line/five-root queries in the same executable. Five process trials
alternate measurement order while preserving output order. The exact answers,
iteration counts, checksums and scoped usage assertions are checked.
[budget-comparison.json](budget-comparison.json) records all samples. Those
ratios include scope setup, charging and usage checks; they measure the cost
of opting into resource accounting, not a cross-revision optimization.

| Query | Direct median | Scoped median | Ratio |
| --- | ---: | ---: | ---: |
| Exact line point | 678 ns | 709 ns | 1.04572 |
| Five exact parameter roots | 329,898 ns | 331,251 ns | 1.00410 |

Both experiments use the tested
[C resource launcher](../2026-10-14-model-ownership/measure.c). Process peak RSS
and executable sizes are retained, not allocation counts or hard bounds.
Descriptive timing samples do not establish statistical significance.

To replay, build and preserve the recorded baseline and candidate executables,
compile the measurement helper, then adjust the paths in
[qualification.py](qualification.py) and use a fresh output directory.
The existing receipt checker verifies both benchmark sources and every run.
[manifest.json](manifest.json) binds the retained sources and artifacts.

The implementation is kept for explicit resource control. It counts existing
instrumented root refinements and algebraic promotions. It does not bound
scalar precision, all geometry/elimination work, degree/coefficient growth,
allocations or time; nor does it allocate worker budgets, follow futures,
cancel work or undo arbitrary callback side effects. Detailed proof-stage
receipts and all WP01 completion gates remain open. Native tests, WASM
compilation and fuzz-target compilation are separate evidence; no new WASM
execution, ASan, fuzz/lexicase campaign or whole-workspace qualification is
claimed.
