# Exact direct chart transitions: admission record

This Phase-13 increment supplies a transport prerequisite for adaptive frame/QR
wrapping control. It does not complete automatic frame selection, QR reduction,
whole-horizon Taylor integration or the full fifteen-phase goal. CONTRACT.md
records the owning layers, properties, input domain and missing witness before
implementation; DERIVATION.md supplies the affine relation and containment argument.
The exact qualified source is recorded in SOURCE.json and candidate-source/.

Hypersolve's opt-in `coordinate-transition` feature prepares z=B1*A0*y+B1*(c0-c1)
from two already validated charts of the same structural source and ordered
variables. Existing Real::sum_products, the coordinate affine-row builder, source
validation and evaluators remain authoritative. The result retains both source
associations and inverse proofs, exact coefficients and executable. Independently
reconstructed equal definitions are admitted; allocation identity is not required.
The Hyperdynamics adapter additionally checks original time/state interpretation,
then publishes an owned input and direct native enclosure beside that relation.
An enclosure is explicitly an outer projection of the exact affine image, not
proof of Cartesian equality, source-domain validity or ODE existence. All original
field/domain checks remain in the destination field's next operation.

Existing scalar payload, exact arithmetic/refinement/predicate internals, total
heap and within-scalar cancellation exclusions remain. Structural source scans,
coefficient-product setup, executable construction, native evaluation and final
publication are charged to shared budgets. Per-stage entry checks are not total
retained graph or heap limits. Final checks precede publication; failures return
no completed relation or transport proof. Empty and zero-dimensional unit sets
remain distinct. No proof type is deserializable: replay regenerates source,
charts, inverse proofs and transition from definitions and original input.

## Acceptance

Five core tests cover independent matrix/translation/point expectations, exact
algebraic scaling and translation, zero dimension, independent reconstruction,
foreign sources/orders, invalid inverse rejection, final-work cutoff, entry
exhaustion, cancellation and retry. Seven field tests cover exact width/correlation
expectations, changed-chart Picard endpoint chaining, empty/unit/time/source cases,
final structural/native work cutoffs, retry, fresh-process complete proof/work
replay, zero getter dispatch, and transported Taylor endpoints consumed by another
Taylor step. No test or existing assertion was weakened.

The missing-method witness fails on the baseline and passes after implementation.
A draft algebraic fixture consumed its sqrt value before reuse; cloning fixes the
test ownership error. A draft getter test called is_empty on the trace snapshot;
it now separately asserts empty dispatch and zero rational counters. Both failed
compiler logs are retained. No production algorithm was altered to bypass them.

Final isolated qualification passes 1,569 top-level tests in 71 test/doc groups,
with no top-level failures, ignored or filtered tests. A separately spawned
existing bivariate-vertical replay child passes one selected test and filters six;
its parent runs all seven. The child is not double-counted in the top-level total.
Strict all-feature/all-target Clippy, warning-denied docs, minimal and disabled
feature checks, WASM and workspace formatting all pass (qualification.json).
Full pre-push workflows, package/release builds, sanitizer/fuzz and further
platform qualification are not claimed. No push is performed.

## Completed cost contract

The maintained benchmark prepares charts outside repeated queries and compares
one direct affine projection with two certified projections through Cartesian
source coordinates. Both enclose the same exact affine image, retain all required
transport proofs and include destruction. Each complete output is checked against
an independent exact affine expectation. This is a comparison of enclosure
strategies using the same backend, not an independent external solver benchmark
or a claim that the output boxes are equal. No ODE speedup follows from it.

The identity case has identical output. For Y={0}*[-1,1] in shear 128, direct
transport to the same chart preserves first-coordinate width zero; the Cartesian
round trip gives width 512. Changing the destination shear to 64 and translating
the origin gives first-coordinate interval [-2,126] directly and [-130,254] by
the round trip. Both target enclosures are sound; no universal width improvement
or optimal-frame claim is made.

Warm allocation observations (eight warmups, 32 construction/drop callbacks):

| Case | Direct allocated / retained / peak bytes | Roundtrip allocated / retained / peak bytes |
| --- | ---: | ---: |
| Identity | 2408 / 32 / 1808 | 5288 / 96 / 1888 |
| Same shear | 2408 / 32 / 1808 | 5544 / 112 / 1904 |
| Changed shear | 2720 / 40 / 1840 | 5544 / 104 / 1904 |

Every warm epoch returns to zero incremental live heap. Preexisting fields,
charts, exact prepared relations and stack storage are outside these heap epochs.
Direct relation preparation separately allocates 3432 bytes, retains 1768 and
peaks at 2016 for each fixture, again returning to zero on drop. Its structural
work is 91 with 16 executable nodes. Native scalar work is zero during preparation
because exact Real product sums are outside that counter, not because preparation
performs no arithmetic. Direct transport uses graph work 109 and native work
102900/102900/110612, versus graph work 218 and native work
212372/224418/223268 through the round trip. These are measured fixture costs,
not a total-work/heap guarantee or a zero cold-cache-growth claim.

The observer operation/validation body matches the maintained benchmark. Core
package versions and enabled features match after correcting an initially omitted
empty default feature on Hyperdynamics. The mismatch and original logs are kept;
all allocation/retained/work rows remain identical after correction. The final
observer and supplemental preparation observations have separate artifact hashes.
No frozen prior evidence driver was modified or executed in place.

## Final integration and cost results

Source commit `86dbb4dd80d3997a5ca566a52c8e0c5cdff6ccaa` is integrated on top of
`c460a81fec1fa643a2586b2cc30cae037c320ea2`. An alternate-index three-way application
and reversal recover the entire original pending tree exactly. INTEGRATION.json
records both trees and the preserved 41-path extraction patch hash
`408c1215508fab22167f00f39d0829b8e006df5e4bfef72fea32062137134c5f`.
Interface's eight edits and Firmware's clean state remain unchanged. Main passes
97 Hyperdynamics tests, the five focused core tests, standalone minimal core feature,
strict Hyperdynamics Clippy, formatting and the repository budget. The exact
commands and outcomes are in main-validation.json; repository size is recorded
in main-repository-budget.log. No pre-push or release completion is implied.

All four old-feature consumers preserve their complete allocated sections except
build IDs and canonical function layouts (candidate-inspected-controls.json).
The native executable is byte-identical. Taylor-model and affine-model raw sizes
are unchanged; the coordinate-evolution executable is 32 bytes smaller. Other
byte differences are confined to nonallocated symbol/string tables and build IDs.
No old-path timing claim is made, and these compiled controls do not establish
arbitrary-platform or unified all-feature invariance.

Three completed Criterion trials yield median microsecond ranges:

| Case | Direct | Cartesian roundtrip |
| --- | ---: | ---: |
| Identity | 4.565–4.606 | 12.552–12.945 |
| Same shear | 4.521–4.594 | 13.986–14.351 |
| Changed shear | 6.204–6.352 | 13.749–13.990 |

All 18 measured workloads complete their independent checks. Commands, executable
hashes, estimates and samples are retained. CPU 0, ASLR disabled, one-second warmup,
two-second measurement and 30 samples were used after builds/tests completed.
No blanket speed, optimality, whole-ODE or platform-general claim is made.

All 27 prior frozen stages pass the final digest verifier. This stage is frozen
at archival; subsequent committed-blob, full frozen-stage and ledger checks live
outside it. Phase 11 regressions, remaining solver/machine migrations, adaptive
frame/QR selection, broader adoption, embedded qualification and coordinated
release remain open under the full goal.
