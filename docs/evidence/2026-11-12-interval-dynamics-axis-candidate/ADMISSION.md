# Hyperdynamics affine-axis extraction

Baseline 0d17fe178839b002b95173adf1f05137291639f3, clean managed trees.
Previous turn progressed by repairing dyadic zero resource closure. Owner: new
Hyperdynamics dynamics layer (plan 10.1-10.4 and Phase 11); keep exact scalars,
predicates and replay in Hyperreal/Hyperlimit/Hypersolve. Properties P1-P11,
P18-P20,P25-P27,P30-P39. This candidate moves the existing affine axis limit
algorithm unchanged; static path geometry stays in Hyperpath. Missing witness:
a direct dynamics consumer can select/replay axis limits without depending on
Hyperpath, and legacy calls give identical reports, errors and predicate traces.

Input domain: all existing finite sequences of dense affine derivatives and
axis limits accepted by the old projection API, with both policies, exact
rational/symbolic values, zeros, ties and distinct bottlenecks. Preserve invalid
shape/sign/empty/undecided and rejected-proposal outcomes and their precedence.
No changed predicate order, eager hooks, new mathematical algorithm, rounded
fallback or stronger bounded-work claim. Scalar growth and unbounded Vec input
cost remain existing limitations, not fixed here. No geometry is approximated.

Make the exact replay/report types native in Hyperdynamics. Keep Hyperpath's
existing type import paths and deprecated function wrappers for a release;
translate dynamics errors exactly into existing RouteCertificationError variants.
Migrate the Interface caller to the new owner without changing its error or
canonical evidence encodings. Reports and certification authority stay intact.

Retain original code as a test-only differential module. Fresh-process strict
and approximate runs compare all report fields and traces; independent expected
limits, row order, tie selection, invalid cases and generated corpus supplement
wrapper agreement. Verify the existing full Hyperpath and Interface core suites.
Measure matched successful projection workloads and allocations, owning and
successive-operation benchmark smoke, executable and monomorphized size before
retaining the extraction. Any unresolved regression remains a gate and the
candidate may be rejected. No full phase or goal completion claim.
