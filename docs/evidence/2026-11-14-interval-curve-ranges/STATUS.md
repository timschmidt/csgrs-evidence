# Native rational curve interval ranges: retained local increment

Qualified source: `c6c43e095b245e753b53237aa4eda3b9dc0737f8`. Main integration and pending-patch
preservation are recorded in INTEGRATION.json and FINAL-REPOSITORIES.json.
The optional hypercurve/interval-ranges feature retains the native source
and uses the existing Hypersolve expression/Jacobian authority for coordinate
and local-parameter derivative enclosures. Native Aabb comparisons consume
exact outward bounds with borrowed range evidence. Default dependencies and
existing native evaluator bodies are unchanged.

Validation passed 12 qualified commands, including
3261 owner tests across 128 suite summaries,
12 focused witnesses in debug and optimized builds, strict Clippy and docs,
the actual example, downstream work-budget tests, a WASM library check and
a stable all-feature/all-target compile check. Eight archives were verified;
the archived example built, ran and passed strict Clippy using archived Hyper
dependencies. Stable full tests and the full pre-push matrix were not run.
Existing ignored tests remain ignored and do not count as completed coverage.

## Measured completed workloads

Each portfolio includes preparation, sixteen coordinate/derivative reports,
native bound projection and comparisons, retained output and destruction.
Common source construction is excluded; scalar caches are warm. Timing uses
30 paired samples of 32 portfolios, alternating modes on one pinned CPU.
Other host activity is uncontrolled. Allocation counts use repository-locked
dependencies, five identical observations per row and a balanced live-byte
scope. Requested bytes exclude allocator overhead and are not RSS.

| Fixture | Shared speedup, paired geometric mean (95% bootstrap) | Allocations independent → shared | Peak requested live bytes independent → shared |
| --- | --- | --- | --- |
| polynomial | 1.691× (1.685–1.699) | 14864 → 8039 | 113936 → 22976 |
| rational | 1.491× (1.488–1.495) | 13002 → 8592 | 94280 → 20600 |
| degree8 | 2.187× (2.183–2.191) | 36324 → 12729 | 380112 → 47232 |

Native arithmetic work is identical within each pair. Structural graph work
is reduced. These measurements compare shared and independent preparation
of the new complete range workload; they do not establish a universal speedup
or a performance improvement for existing modeling operations.

## Limits and adverse evidence

C1 evidence does not assert immersion, injectivity, nonzero tangents or an
exact hull. Overestimated denominator ranges can return a typed noncertificate.
Structural and dyadic limits do not bound total scalar refinement, coefficient
growth, payload cloning, whole-process memory or uninterrupted native basis
conversion. Cancellation is checked around conversion and before publication.
CAPABILITIES.json separates demonstrated fixtures from general closure targets.

The first candidate populated a native cache and changed high-degree dispatch.
Its probe and intentionally stopped owner run remain preserved. The retained
adapter borrows an existing basis or owns its conversion without filling that
cache. Fresh-process witnesses preserve complete native traces, fixed counts
and certified receipts under STRICT and APPROXIMATE_512. Earlier test-fixture
and rustdoc failures remain in their original logs; no count was loosened.

The first standalone allocation probe resolved four newer dependencies.
Its successful measurements are superseded, not erased. cost-final/ contains
the repository-locked replacement and its dependency audit. The archive-only
consumer intentionally has its own recorded consumer lock. Standalone cache
diagnostics have a matched before/after lock and are independently supported
by repository-locked unit tests.

General monotonicity, interval Newton/Krawczyk integration, certified native
subdivision scheduling, normal-parallel/implicit/surface adapters and wider
Phase 13 adoption remain open. No phase completion, push or publication is
claimed. The full fifteen-phase goal remains active.
