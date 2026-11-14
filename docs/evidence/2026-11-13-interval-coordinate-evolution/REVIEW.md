# Source review

Production integration is a new child module reexported by coordinates.rs. The
existing field, step verifier, search loop, source_enclosure and one-step report
are byte-identical to baseline. Every native attempt remains owned in exactly
one report; source segments borrow that report and its retained chart. No
scalar coordinates, proof nodes or native final endpoint are reconstructed to
stand in for the exact chart. The source final projection borrows the last
projected endpoint (or the initial projection for identity/empty).

The native engine validates malformed time/options even with empty/identity
inputs. A stopped native report bypasses transport, preserving its original
reason and charged work. For completed reports, checked arithmetic accounts
for all selected retained output records and lanes plus transport temporaries
before allocation. All projections remain local until the final charge passes;
error drops them and exposes only the separately qualified native report.

The graph/scalar counters are shared; no retries are internalized as new budgets.
Scalar refinement, payload lifecycle, allocator capacity, total heap and
intra-scalar cancellation exclusions remain. Cancellation is tested at entry;
cooperative checks in each existing transport and before publication are
reviewed, without claiming asynchronous cancellation timing guarantees.

Eight new integration tests reuse the existing fixture helpers. Existing
assertions are unchanged. The missing method was reproduced before source edits.
Tests check analytic endpoints/tubes, retained correlation, subsequent input,
all native attempts, empty/unit/identity/invalid inputs, stopped prefixes,
separate graph/scalar/entry failures, exact budget boundaries, retry, replay
and fixed empty scalar-dispatch counts. The extended affine example checks
analytic inclusion and explicitly retains native overestimation. Fuzzing adds
one to four segments with exact independently calculated endpoints to the
existing shear/nonlinear/Jacobian/inverse/replay corpus.

Fixed charts close this particular whole-horizon representation gap. They do
not implement adaptive QR, recharting, arbitrary nonlinear wrapping or general
exact reachable-set equality. The complete fifteen-phase plan remains active.
