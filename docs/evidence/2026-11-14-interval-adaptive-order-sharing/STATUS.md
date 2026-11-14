# Unretained: lazy shared adaptive Taylor preparation

The experiment implements an explicit shared controller and incremental prepared
order extension, but neither candidate meets all retention gates. No production
code from this stage is integrated into the interval-refactor branch.

Macro candidate62ecffb2c reproduces complete default artifacts, but a controlled
comparison measured about3.5% slower existing order-three preparation. Its
extraction-only control also measured about3.1% slower. The typed replacement
c6c574909fe42990512ef76f89e39a85906a01ba passes all150 owner tests, strict Clippy,
formatting and the actual example on Rust1.95.0. Its full default proofs, graph
and scalar work, and dispatch artifacts exactly match the frozen baseline.
The source inverse comparison preserves every original recurrence/controller
statement and predicate order. Compiler/cost preservation does not follow from
those facts.

The typed four-sweep, fixed-path, ASLR-disabled comparison covers35 Criterion
rows across seven existing executables, plus four manual adaptive rows per sweep.
Seven rows meet the recorded adverse-separation screen, including about3.13%
slower exponential order-three preparation. The screen is observational, not a
family-wise statistical test or a universal causal claim. Smaller adverse
observations include a benchmark whose allocated executable sections are byte
identical; environmental variability remains. All raw runs are retained.
Several existing raw executables grow by8–72 bytes, including symbol-string and
exception-table differences; executable text totals do not increase. Neither
size nor default timing gates are declared satisfied.

The new opt-in strategy's30-sample completed workload intervals (microseconds;
mean95% intervals) are independent/shared:

- Constant:159.741–159.904 /164.807–165.106, an adverse result.
- Exponential:415.162–416.263 /411.636–412.222.
- Riccati:1579.907–1581.952 /1546.819–1555.263.

Common source/controller construction is excluded equally. All demanded Taylor
preparation, exact verification, quality checks, complete history materialization
and destruction are included. The separate allocation/work probe records six
rows in cost-summary.json, retaining common-input and allocator-overhead exclusions.
Constant-flow graph work increases949→957 and retained requested bytes stay27992.
Exponential graph work falls2390→2338 and retained requested bytes53568→52224;
Riccati work falls10225→9669 and retained requested bytes156200→148280.
Native arithmetic work is identical within each pair. All instrumented allocation
scopes balance after report destruction across repeated runs. These three fixtures
do not establish universal savings.

Tests include incremental/fresh recurrence equality, source and derivative sharing,
nonzero starting order, two-state trigonometric expectations, independent exact
polynomial endpoints and continuation, algebraic constants, empty/unit/invalid
inputs, lazy unrequested maximum orders, resource cutoffs, cancellation/retry and
three fresh-process replays. Existing tests and policies were not weakened.
The default API has an EnclosurePolicy rather than Hyperlimit STRICT/APPROXIMATE
selection; no modeling-policy transition is introduced by this candidate.

Stable, package-only consumption, full downstream validation, WASM, fuzz, coverage
and full pre-push qualification were not rerun after rejection. The root default
csgrs dependency graph does not contain Hyperdynamics; no successive_operations
execution is claimed. Existing main extraction edits and sibling states remain
unchanged. The goal and automatic-controller preparation reuse remain incomplete.
No push or publication occurred.

The source commits, complete patches, golden artifacts, binary hashes/section and
symbol reports, controlled timing scripts/raw samples and all adverse findings
remain available. Do not repeat these rejected transformations without a concrete
change addressing their failed gates. Continue the plan's outstanding acceptance
work without treating this optimization experiment as completed support.
