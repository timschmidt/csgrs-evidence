# Exact QR coordinates: admission record

This Phase-13 increment constructs and certifies an exact orthonormal state
frame from a caller-supplied square basis, then consumes it in validated native
Picard/Taylor steps, chart transitions and finite-horizon integration. It does
not implement automatic basis selection, adaptive whole-horizon QR/Lohner
integration or complete the fifteen-phase objective. CONTRACT.md records the
owning layers, properties, domain and missing witness before implementation;
DERIVATION.md supplies the QR and coordinate-field argument. SOURCE.json and
candidate-source/ identify the qualified source.

Hypersolve's opt-in `qr-coordinates` feature performs unpivoted modified
Gram-Schmidt in authored column order using the existing exact product-sum
kernel. Every residual squared norm must be strictly positive before taking its
principal square root and normalizing. Proved zero is dependence; undecided is
retained as an original predicate outcome, never reinterpreted as zero. Existing
coordinate admission independently checks Q-transpose*Q=I and binds the frame to
the source. Every Q*R-M residual is then proved exactly zero. The successful
shared result retains M, Q, R, source, origin, order and norm/inverse/reconstruction
evidence. Positive diagonal fixes the QR sign convention; reflections are allowed.

Hyperdynamics reuses that admitted transformation and its existing field/Jacobian
constructor. The resulting chart feeds existing step, evolution and direct
transport APIs. No second inverse or differential kernel is introduced. Finite
square exact Real data, including zero-dimensional units, are accepted when the
required strict decisions and budgets complete. No universal computable-real
rank decision or practical arbitrary-degree bound is claimed. Shape, binding,
dependence, unknown, scalar errors and exhausted construction remain distinct.
Proof objects cannot be deserialized; replay rebuilds source and request and
reestablishes admission. An ODE proof is still required after frame construction.

Shared graph work and stage-entry checks charge structural construction,
product-sum setup, predicate-call setup and final publication. Existing exact
Real arithmetic/refinement, predicate internals, scalar payload lifetime, total
heap and within-scalar cancellation exclusions remain. This is not a total work,
whole-memory or arbitrary-latency guarantee. Stage-entry checks are not total
retained-graph limits. No failed attempt publishes a
partial frame. Larger-budget retries and cancellation are exercised.

## Acceptance corpus and failures retained

Five core tests cover independent 2D and 3D rational decompositions, algebraic
sqrt(2) reflection, negative one-dimensional basis, near-dependence at 2^-100,
zero dimension, dependent columns, malformed shapes and bindings, genuinely
unresolved norm classification, strict receipts and final graph cutoffs/retry.
Seven new field tests cover exact transformed field/Jacobian expectations,
independent source flows, Picard and Taylor endpoints used in changed charts
and subsequent steps, empty/unit inputs, final resource checks, getter dispatch,
and two fresh child processes rebuilding the complete QR/step proof and work.
Tampered dependent replay requests are rejected. Existing tests are preserved.

The baseline missing-method/type witness fails as expected. Draft compiler
failures from ambiguous Real equality expectations, nonexistent test helpers and
an incomplete allocation-observer dependency are retained with their fixes.
Three draft field assertions incorrectly expected native singleton results for
exact coefficients 3/5; outward dyadic enclosure does not preserve that equality.
The original draft and failure log remain. Corrected tests separately prove
exact point equations, enforce native containment and width <= 2^-48, and retain
the tight candidate's SelfMapNotCertified rejection. A widened proposal proves
the original source flow. No production algorithm was changed to evade failure.

Isolated qualification passes 1,581 top-level tests in 72 test/doc groups, with
zero failures, ignored or filtered top-level tests. An existing bivariate replay
child separately passes one selected test and filters six; its parent runs all
seven and the child is not double-counted. Strict all-feature/all-target Clippy,
warning-denied docs, minimal/disabled feature builds, WASM and formatting pass.
qualification.json and test-summary.json record exact commands and counts.
Full pre-push/release/platform/sanitizer/fuzz qualification is not claimed.

## Completed cost contract

The maintained benchmark compares identity and QR charts through the same
CoordinateField::integrate API. Both retain complete native attempts and source
projections, materialize and destroy the full CoordinateEvolution, start from
the same source singleton zero, reach the same horizon, contain an independent
exact endpoint, and satisfy endpoint width <= 2^-48. Exact box equality is not
claimed. Both charts are prepared outside query timing. Separate prepare_qr
measurements include full QR/chart construction and destruction from an already
constructed original source. No independent external solver comparison is made.

For the rotated equilibrium, M=[[-7/25,24/25],[24/25,7/25]] has Cartesian infinity
norm 31/25. Q=[[3/5,-4/5],[4/5,3/5]] diagonalizes it with norm one. At horizon
7/8, identity integration completes two segments in three attempts; QR completes
one in one. The independent exact flow is zero. For constant F=(2,1), horizon
one gives exact endpoint (2,1); both use one segment and two attempts. This
second fixture intentionally retains the overhead where no frame benefit is
needed. QR native outputs can be slightly wider than exact identity outputs.

Warm allocation observations use eight warmups and 32 construction/drop epochs.
Every epoch returns to zero incremental live heap:

| Case | Mode | Allocations | Allocated bytes | Retained bytes | Peak bytes |
| --- | --- | ---: | ---: | ---: | ---: |
| Rotated equilibrium | Identity query | 868 | 54030 | 7360 | 10408 |
| Rotated equilibrium | QR query | 467 | 24226 | 2288 | 7176 |
| Rotated equilibrium | QR preparation | 874 | 75502 | 13466 | 15730 |
| Constant flow | Identity query | 350 | 21828 | 3728 | 5792 |
| Constant flow | QR query | 489 | 26076 | 4112 | 6096 |
| Constant flow | QR preparation | 64 | 17622 | 8122 | 9298 |

Graph/native query work is 1769/1834946 versus 614/2478206 for rotated identity
versus QR; constant-flow work is 564/619950 versus 564/1434334. QR performs more
native arithmetic on both fixtures despite fewer rotated-flow reports. Frame
preparation graph work is 1200/514 with 40/32 transformed program nodes. Its zero
native dyadic work counter excludes exact Real arithmetic; it is not zero work.
Preexisting source/frame storage and stack are outside query heap epochs. Warm
zero live heap is not a zero cold-cache-growth or total heap-bound claim.

The allocation observer's operation/validation body and core dependency
versions/features match the maintained benchmark. Initial observer compilation
fails and its logs remain; cost-allocation-fixed.jsonl/log,
final-allocation-artifact.json and allocation-run.json record the successful
replacement. cost-builds.json intentionally retains the initial failed attempt.
No previous frozen evidence driver was modified or executed in place.

## Final integration and measurements

Source commit `35bc68ed30cde1d267aa7af5e4776318aca2284b` is integrated on `807aab42ec3c4b4adafcf3d94d0a1c0c4a41675e`. An alternate-index application and reversal recover the complete original pending tree exactly. The 41 extraction paths remain staged with SHA-256 `6713fe7fcebdd216a23d1ee5867701999f94ac6c772dcd50202d4648d9281e62`. Interface's eight edits and Firmware's clean state are unchanged. Main's combined pending extraction passes 104 Hyperdynamics tests, 5 focused Hypersolve QR tests, the standalone minimal core feature, strict Hyperdynamics Clippy, formatting and repository budget. Exact commands and outcomes are in main-validation.json. No push occurred.

All five old-feature consumers have identical allocated sections except build IDs and identical canonical function layouts. The control comparison includes native evolution, Taylor models, affine models, coordinate evolution and direct chart transitions. Raw file deltas and byte identity:

| Consumer | Raw byte delta | Byte-identical |
| --- | ---: | --- |
| old-native-cost | 0 | True |
| model-cost | 8 | False |
| affine-cost | 0 | False |
| coordinate-cost | -16 | False |
| transition-cost | 0 | True |

Other differences are confined to nonallocated symbol/string metadata and build IDs. These same-path fixed-feature controls do not establish arbitrary-platform or unified all-feature cost invariance. No old-path timing claim is made.

Three maintained Criterion trials each complete six workloads. CPU 0, ASLR disabled, one-second warmup, two-second measurement and 30 samples were used after builds/tests completed. All exact-flow checks pass. Median microsecond ranges:

| Workload | Minimum trial median | Maximum trial median |
| --- | ---: | ---: |
| constant_flow/identity | 43.208 | 43.377 |
| constant_flow/prepare_qr | 12.111 | 12.300 |
| constant_flow/qr | 55.430 | 55.763 |
| rotated_equilibrium/identity | 111.140 | 111.737 |
| rotated_equilibrium/prepare_qr | 50.883 | 51.076 |
| rotated_equilibrium/qr | 55.277 | 55.701 |

QR reduces completed report count and warm allocations on the rotated fixture while increasing native arithmetic. The constant fixture retains adverse overhead. Preparation is separately measured and must be amortized by actual use; these results do not establish a universal speedup or wrapping reduction. Complete samples, estimates and binary hashes are retained.

All 28 prior frozen stages verify unchanged. This stage freezes at archival; subsequent committed-blob, registry and final frozen-stage checks live outside it. Phase 11 timing regressions, remaining migrations, adaptive frame/order/step control, broader adoption, embedded qualification and coordinated release remain open.
