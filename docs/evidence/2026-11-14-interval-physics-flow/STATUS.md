# Source-bound continuous point-mass flow

Retained source 6fade18056dc7e63865def845aae091d4255c413 adds opt-in Hyperphysics
`certified-flow`: fixed strictly positive exact mass and exact authored F(t,x,v)
become the six-state continuous ODE x'=v, v'=F/m. This implements a physical consumer
within Phase 13, not completion of that phase or the fifteen-phase goal.

## Ownership and admitted contract

Hyperphysics owns physical meaning and provenance. The original validated force
graph, exact mass and strict positivity receipt, arbitrary seven-symbol binding order,
time/state interpretation and source references remain immutable and queryable.
ForceAccumulator3 uses its existing total_force and snapshots every contribution;
later accumulator mutation does not change the source. General forces use the existing
Hypersolve expression grammar, including time, position and velocity dependence.
The original graph is validated before adding velocity/mass nodes so an invalid source
reference cannot accidentally refer to a newly appended node. All original guards remain.

Hypersolve owns source validation and derivatives; Hyperinterval/Hyperlattice own
native set arithmetic; Hyperdynamics owns Picard/evolution verification. The adapter
adds no integrator and does not relabel existing discrete Euler replay as a continuous
solution. Physical step/evolution wrappers retain the original model and full native
report, including policy/proposal/source/evidence, qualified failures and attempts.
Generated endpoint boxes feed subsequent steps or whole-horizon evolution. A stopped
certified prefix is separate from a certified whole-request endpoint; rejected steps
expose no endpoint. Empty state products do not bypass invalid model/time checks.

An opaque EnclosureGraphBudget view shares the existing graph counter. It forwards
bounded charge/size/validate/compile operations without permitting counter replacement
or changing configuration. Existing scalar counters and predicate order are untouched.
One EnclosureBudget spans source lowering, validation, derivative preparation and
native verification. Scalar mass refinement/arithmetic, exact payloads, metadata strings,
total heap and cancellation within scalar/force accumulation operations are explicitly
outside a whole-resource bound. Rejected construction publishes no model and does not
poison a larger-budget retry. Replay rebuilds original source/mass/requests, never
trusts serialized success flags. Physical units, frame consistency and validity of the
authored force law remain assumptions; interval certificates do not establish them.

## Acceptance and validation

The missing consumer was reproduced as E0599 on baseline 8c51ff690 before production
edits. Ten new acceptance tests pass: independent constant-acceleration trajectories
versus existing velocity-first Euler; uncertain initial boxes; chained steps and full
horizons; nonlinear/time/velocity forces and independently checked Jacobians across
seven binding permutations; invalid original references and reciprocal domain guards;
zero/negative/unresolved/algebraic mass with retained strict receipts; empty versus
invalid input; shared budget precharge, final one-unit-short failure, cancellation and
retry; stopped prefixes and exhausted step outputs; fresh-process exact fixture replay;
and zero-dispatch getters. Initial compiler/fixture errors and observer corrections
are preserved in TEST-CORRECTIONS.md and raw logs, without weakened expectations.

The isolated owner run passes 189 tests in 30 groups. Strict all-feature/all-target
Clippy, warnings-denied docs, disabled-feature checks, WASM, formatting and repository
budget all pass. The final benchmark has an explicit strict Clippy run. Downstream
circuit MNA/simulation/nonlinear tests pass all 42 cases with the new feature enabled.
The combined main checkout passes 200 owner tests and 42 downstream circuit tests, strict owner Clippy, formatting and repository budget; main-validation.json records the commands.
Existing owner golden/dispatch tests remain intact. No all-stack geometry campaign,
full pre-push/workflow matrix, fuzz/coverage/sanitizer, platform/HIL or release
qualification is claimed; no push occurred.

## Completed-workload costs

The maintained certified_flow benchmark uses m=2, F=[4,-4,0], zero initial state and
h=1/4. It materializes the same tube/end, derivative/contraction evidence, source
identity, exact mass receipt, provenance and individual force contributions. The
independent continuous positions +/-1/16 are contained and velocities +/-1/2 exact.
Preparation, prepared-model reuse and fresh preparation plus step are separate modes.
Three trials, CPU0/ASLR disabled, 16 warmups per mode and 10,000 construct/verify/drop
operations per trial give mean nanoseconds per operation:

| Work | Min–max ns/op |
| --- | ---: |
| Prepare | 6517–6582 |
| Reuse | 32785–33050 |
| Prepare and step | 41468–41575 |

Reuse includes prepared-source/cache benefits; it is not a universal cold-call speedup
or a comparison with discrete Euler. The external observer copies the complete bench
body and checks matching workspace dependency versions. Across 32 operations per mode,
preparation allocates 7576 bytes/op with peak 4182; reuse 15004 with peak 7048; combined
22580 with peak 10974. All return to zero incremental live heap after drop. Prepared
model ownership adds 3926 bytes beyond the original source objects; a retained step
adds 328, with 449 graph/316536 scalar units consumed. Preparation uses 467 graph/0 scalar
units in these counters; the explicitly excluded scalar positivity work still occurs.
These fixture counts exclude already-retained objects, allocator/platform overhead
and whole-process memory; they are not universal bounds.

Six existing physics benchmark runs retain all sixteen completed fixtures/checksums.
Default candidate and baseline have identical 3935656-byte executable sizes, identical
.text/.rodata sizes and all 1702 demangled symbol size multisets; 24 symbol groups move,
so executables are not byte-identical. No default adverse separation is observed by
the two-run min/max screen, which is limited by visible drift and is not statistical
proof. Enabling the feature adds 21816 executable bytes (+10056 GNU size text, -3184
.text section bytes). An unfavorable existing slab-conduction control is preserved:
baseline 2005–2206ns, default 1997–2015ns, enabled 2314–2350ns. The optional feature's code
cost and this observed regression are explicitly accepted for the higher-priority new
continuous proof capability; default behavior remains available. No enabled-feature
blanket no-regression claim is made.

The existing Hyperdynamics taylor_evolution executable grows 16 raw bytes but has
byte-identical .text, .rodata and .data.rel.ro sections and unchanged 3256 demangled
symbol groups/size multisets/addresses. Four actual Criterion constant-flow trials
exercise Picard, Taylor, preparation and reachability. Sample intervals vary despite
identical executable sections; raw sequential significance labels are not interpreted
as source-level improvement/regression. Exponential and constant completion assertions
also execute before filtering. Initial invocations without --bench ran acceptance
only and are explicitly excluded from timing evidence.

## Integration and remaining work

Alternate-index application and exact reversal recover the original pending tree.
All 41 staged extraction paths and logical diff content remain identical; Cargo.lock
and changelog offsets/blob IDs change the raw pending hash from e52d18c6... to
d0f3f56e94d54d5f7330111f7bd6051cfe2caaf7ea23b21910b9b2cfaf69f6c0.
Interface's eight edits and Firmware's clean state are preserved. All 34 previous
frozen stages verify unchanged. Final snapshots and archive metadata record the exact
source/repository states. No frozen evidence directory was edited.

Variable/uncertain mass, rotations, contact impulses, coupled bodies, automatic
physical-law lowering/units validation and wider consumer adoption remain open.
The original Phase 11 extraction timing blocker, automatic Taylor/order/frame evolution,
embedded flash/whole-call-stack/cycles/HIL, outstanding Interface Clippy issues and
coordinated release/whole-plan acceptance also remain open. This addition does not
establish the full requested final state.
