# Whole-horizon trajectory Taylor evolution: admission record

This Phase-13 increment composes certified trajectory Taylor endpoints across a
finite dyadic horizon at a prepared order. The existing Picard search adapts
step durations through bounded expansion and halving. Automatic order/frame
selection, independent-noise retention, wider adoption and the full fifteen-phase
goal remain open. CONTRACT.md records ownership, domain, resource limits and the
missing witness before implementation; DERIVATION.md gives the composition and
resource argument. SOURCE.json and candidate-source/ identify the retained source.

The optional `taylor-evolution` feature adds FlowTaylorProgram::integrate.
Hyperdynamics reuses ExpressionField::integrate with an internal one-accepted-step
limit and borrows its accepted Picard proof in the existing Taylor verifier.
No Picard predicates are rerun and no entire Picard proof is cloned. Each complete
Taylor endpoint, including certified overestimation, becomes the next initial
set. Exact time, field/source interpretation, analytic-domain evidence, every
coefficient and complete remainder contribution remain retained. The old Picard
search and trajectory formula are unchanged. The internal StepLimit(1) is a
qualified native prefix; it is never called native whole-horizon success.

The outer report owns original source/order/request/options/policy, all native
searches and rejected attempts, partial/completed Taylor evidence and accepted
indices. Only certified Taylor segments advance the prefix. Taylor failure
stops without falling back to a weaker endpoint. Exact horizon equality and final
cancellation checks precede completed output. Empty/unit/identity outcomes remain
distinct; malformed time/cap input is not hidden by empty geometry. Replay rebuilds
source and proofs; no serialized success flag is authoritative.

One budget is shared through all stages. Outer record accounting includes nested
native attempt and accepted-index records. Counts are checked before an outer
record and again after a search returns, before refinement/segment publication.
A failed aggregate check retains the last search in the stopped report. This is
not a peak-memory reservation or a bound on all retained coefficient/proof graphs,
scalar payload bytes, vector capacity or scalar refinement. Exact arithmetic,
predicate internals and within-scalar cancellation retain the existing exclusions.
No universal finite-horizon completion or exact reachable-set equality is claimed.

## Acceptance and qualification

The baseline `taylor-flow` witness fails because FlowTaylorProgram has no integrate
method. Eleven final focused tests establish independent exact constant and
nonautonomous polynomial flows, uncertain initial data, exponential containment
against rational series bounds, strictly tighter endpoints than Picard, actual
endpoint chaining, bounded halving with retained failure, empty/unit/identity and
invalid-empty cases, stopped prefixes, and analyticity failure without fallback.
They also cover final graph/native cutoffs, aggregate nested-record exhaustion,
cancellation, larger-budget retry, zero getter dispatch, fresh-process full
proof/work replay, and QR-generated fields whose evolved endpoints are transported
into a changed chart and consumed by another Taylor evolution.

The full all-feature Hypersolve/Hyperdynamics run passes 1,591 top-level tests in
73 test/doc groups, with zero failures, ignored or filtered top-level tests. One
existing selected bivariate replay child is counted separately; its parent runs
all seven. This run compiled the preceding ten-test version of the new target.
The subsequently added aggregate-record regression is covered by a final focused
11-test all-feature run and an 8-test minimal-feature run. Only test coverage and
the benchmark's explicit resource envelope changed after that full compilation;
production code did not change. Strict all-feature/all-target Clippy,
warning-denied docs, minimal/disabled builds, WASM and formatting then pass on the
final source. Exact logs and test-summary.json distinguish these scopes. Full
pre-push/release/platform/sanitizer/fuzz qualification is not claimed.

## Completed cost contract and failed probes

The maintained benchmark compares the original whole-horizon Picard integrator
with fixed-order-three whole-horizon Taylor composition using the same backend.
Both materialize and drop all search attempts, accepted reports and required
proofs. Original field preparation is outside timing; Taylor preparation is
measured separately. This is not an independent external solver comparison or an
optimality claim. Requests share exact source initial sets and horizon 1/2.

For x'=x, x(0)=1, both completed endpoints contain an independent rational bracket
for exp(1/2) and have width <= 1/512. The Picard cap 2^-12 gives 2,048 segments and
4,096 attempts; the Taylor cap 1/4 gives two segments, two searches and four native
attempts. Exact endpoint boxes differ. For x'=2, x(0)=0, both methods use two
segments/four native attempts and return the exact singleton one. This fixture
retains the cost where the simpler method already meets the contract.

The original Picard comparison exhausted the default scalar-size limit before
completion (completed-cost-probe.log and benchmark-default-budget.rs). It is not
counted as a successful performance observation. Both methods now use the same
explicit benchmark envelope: precision -64, scalar stage limit 1,048,576 bits,
100,000,000,000,000 native work units, and the unchanged default graph limits.
The exact flow, horizon, endpoint-quality threshold and reports are unchanged.
All six final cost probe cases complete; this larger envelope is not a production
default change or a general resource guarantee.

The first allocation observer resolved num-bigint 0.4.8 while the maintained
benchmark uses 0.4.6. The mismatch, original observer results and lock correction
are retained under unmatched-* and observer-lock-fix.log. They are not used as
matched cost evidence. The final observer is pinned to 0.4.6; core dependency
versions/features and operation/validation body match the maintained benchmark.
final-allocation-artifact.json and allocation-run.json identify the successful
matched artifact/run; cost-builds-final.json identifies the preceding observer
build and is not the authority for the corrected observer.

Warm allocation observations use eight warmups and 32 complete construction/drop
epochs. Every epoch returns to zero incremental live heap:

| Case | Mode | Allocations | Allocated bytes | Retained bytes | Peak bytes |
| --- | --- | ---: | ---: | ---: | ---: |
| Exponential | Picard | 370661 | 493194344 | 123685072 | 123732912 |
| Exponential | Taylor | 2338 | 80132 | 22224 | 26256 |
| Exponential | Taylor preparation | 213 | 30296 | 9520 | 10320 |
| Constant | Picard | 281 | 10740 | 4552 | 5792 |
| Constant | Taylor | 1094 | 56052 | 18160 | 21408 |
| Constant | Taylor preparation | 78 | 18592 | 7600 | 8400 |

Graph/native query work is 190467/18178689623999 versus 1420/3088363 for exponential
Picard versus Taylor, and 185/140496 versus 1130/1605906 for constant flow.
Taylor preparation uses graph work 634/452, zero native dyadic work and four
coefficient stages for each fixture. Zero native preparation work excludes exact
Real arithmetic, not all computation. Preexisting source/coefficient storage and
stack are outside query heap epochs. Warm zero live heap does not establish zero
cold-cache growth or a total heap/work bound. The many-step Picard representation
has substantial exact dyadic coefficient growth; these measurements include that
actual retained output and cannot be generalized to other solvers or workloads.

## Final integration and measurements

Source commit `d1ff299482dd25367d49cf4e3c243413c6f1d1ad` is integrated on `afad545036eba5eb5117a0c108ce1add2af0161d`. Alternate-index application and reversal recover the complete original pending tree exactly. The 41 extraction paths remain staged with SHA-256 `9641b4df9a65e2fcd0c3c10c305a164c8f7d3e80c0a1b73ebf5711e299e69fe5`. Interface's eight edits and Firmware's clean state are unchanged. Main's combined pending extraction passes 115 Hyperdynamics tests, 8 minimal-feature Taylor evolution tests, strict Hyperdynamics Clippy, formatting and repository budget. Commands/outcomes are in main-validation.json; no push occurred.

Three same-path feature-disabled controls cover native evolution, the existing trajectory Taylor benchmark and QR evolution. All have identical allocated sections except build IDs and canonical function layouts. Their raw file deltas and byte identity:

| Consumer | Raw byte delta | Byte-identical |
| --- | ---: | --- |
| old-native-cost | 0 | True |
| flow-cost | -8 | False |
| qr-cost | 0 | True |

Other differences are confined to nonallocated metadata and build IDs. This does not prove arbitrary-platform or unified all-feature invariance. No old-path timing claim is made.

Three maintained Criterion trials each complete six workloads on CPU 0 with ASLR disabled, one-second warmup, two-second requested measurement and 30 samples, after builds/tests completed. Criterion can extend measurement for a slow completed workload. Independent exact-flow and width checks pass. Median microsecond ranges:

| Workload | Minimum trial median | Maximum trial median |
| --- | ---: | ---: |
| constant/picard | 31.575 | 31.696 |
| constant/prepare_taylor3 | 10.727 | 10.873 |
| constant/taylor | 127.612 | 128.194 |
| exponential/picard | 170734.985 | 172609.394 |
| exponential/prepare_taylor3 | 21.634 | 21.669 |
| exponential/taylor | 255.594 | 257.307 |

The exponential fixture demonstrates the advantage of a full Taylor remainder at a fixed endpoint-quality contract, including all retained output and exact coefficient growth of the compared Picard strategy. Constant flow records the added overhead. Preparation must be amortized by use. These measurements do not establish a universal speedup or competitive external solver result. All estimates, samples and artifact hashes are retained.

All 29 prior frozen stages verify unchanged. This stage freezes at archival; subsequent committed-blob, registry and final frozen-stage checks live outside it. Phase 11 timing regressions, remaining migrations, automatic order/frame control, broader adoption, embedded qualification and coordinated release remain open.
