# Public normalized-region extrusion

Baseline: `e2b812fd804be6c5ceacb41fa9707ed4c126eab6`, including upstream
`be2a0c37bfe57799c62a36125a5cb883a5458f00`. The public API was first absent
([compiler receipt](missing-public-api-1.log)). The new
`builder::extrude_curve_region(&region, z_min, z_max)` enters a strict scope,
reuses the existing native component constructor, and returns model-owning bodies.
The original component remains the planar support proof; native circle evidence
is borrowed from Hypercurve. Existing private callers and all surrounding crate
runtime implementations are unchanged.

Read the prospective [contract](contract.md), mathematical and ownership
[review](review.md), [qualification summary](qualification-summary.json),
[retention decision](retention-decision.json) and [idea ledger](idea-ledger.json).

## Completed and preserved behavior

Native/IO release suites pass 560 all-feature and 552 minimal-feature tests; eight new focused tests pass in debug. Both all-target Clippy configurations, external consumer lints, warning-denied rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. The warning-denied standalone WASM build executes 119 groups with zero imports, preserving all 111 preceding groups. Four normalized stroke workflows and two multi-component workflows complete exact measures, incidence, near-boundary classification, cold native replay, STEP import and continued Boolean/empty recovery checks. Optional OCCT reads independently check all six new STEP outputs. All 81 preceding native diagnostic outcomes, all 24 prism outcomes and 71 old STEP files are preserved. The unchanged general-path control retains two butt successes, four byte-identical artifacts and two round-cap UnsupportedMeasurement failures. The absent-API compile failure, initial test API errors and missing reader argument remain recorded; their corrections do not weaken acceptance. Scalar/dependency implementations are unchanged from the merged baseline; its two inherited zero-factor debug failures remain upstream-owned.

The 3–4–5 line stroke has radius 1 and height 3. Independent exact expectations
are volume 30 / 30+3*pi and area 62 / 50+8*pi for butt / round caps.
The multi-component input has outer area 36, hole 16, island 4 and separate
component 1: volume 75, boundary area 206 and three solids. Both authored
directions complete their entire workflows. Native tests separately cover
canonical emptiness, invalid height ordering, removal/reunion, preserved caller
certainty and inherited exhausted-budget recovery.

The [new artifacts](new-artifacts.json) contain six STEP and six native JSON
outputs. Four stroke pairs agree byte-for-byte between the external consumer,
documented example and first prototype. Benchmark receipts hash the same full
bytes. Exact formulas, classifications and incidence establish semantic claims
separately from deterministic bytes and OCCT's floating-point interoperability.
The [old path control](old-path-control.json) remains incomplete for round caps;
this different public input route does not change that original contract.

## Cost observations

Three fresh benchmark processes each execute one warmup and three measured iterations of all four new complete stroke workflows, with exact checks and STEP/native materialization inside timing. Three further processes execute both multi-component workflows; 24 alternating old-path processes retain every success and unsupported failure. Old successful-process timing observations: Butt-reverse-false ratio 1.019337; Butt-reverse-true ratio 1.029781. All latency, allocator requests, process RSS, artifact checksums and executable sizes remain. These are absolute new-capability costs and short shared-host preservation observations, not a general speedup, retained-heap bound or package-size claim. Private construction and existing callers are unchanged; historical broad benchmark campaigns are not reattributed to this source.

| Completed stroke workflow | Median ms per call | Allocation requests per call | Requested bytes per call |
| --- | ---: | ---: | ---: |
| `Butt-reverse-false` | 13.323994 | 26,919.667 | 4,797,360.333 |
| `Butt-reverse-true` | 13.304208 | 26,941.667 | 4,800,831.333 |
| `Round-reverse-false` | 35.024829 | 94,662.333 | 10,763,923.667 |
| `Round-reverse-true` | 35.053538 | 94,351.333 | 10,763,410.667 |

See [every raw process and case](resource-observations.json), including adverse
old-path samples and binary sizes. Allocation bytes count cumulative requests,
including reallocations; they do not measure live heap. New full-work success
has no valid speed ratio against old unsupported work. The benchmark build and
features are recorded in [all commands](attempts.json); all task builds and
correctness runs finished before these timed processes. OS/shared caches were
not flushed. The source-path WASM harness grows from 111 to 119 groups; its
size is not a matched shipped-package comparison.

## Reproduction and limits

The [manifest](manifest.json) binds every recipe, source, lock, log and output.
[Source reconstruction](source-reconstruction.json) pairs the pinned baseline
with compressed overlays, including the missing-API and failed test prototypes.
Retained external projects document their local absolute dependency paths;
recreate those paths or explicitly record relocation before reproducing them.
The final [audit](audit.json) verifies sources, frozen executables, exact
artifacts, ledger ownership and preserved stashes. It is a local admission
audit, not release qualification.

All attempts remain in [attempts.json](attempts.json). The initial test API
errors were corrected without changing inputs or assertions. The first cone
reader invocation omitted its required directory argument; it failed before
reading a file. The corrected invocation uses the unchanged reader and inputs.
The twelve timed old round-path failures and two preserved controls remain
unsupported outcomes, not successful completions.

This exposes the existing native component constructor through a strict model-owning API. It does not add general rational-path area, a new planar arrangement or broader Boolean/analytic closure. A local strict construction does not certify an earlier approximate source intent; complete source-qualification delivery remains open. Solver budgets do not bound total work, expression growth, retained heap or cancellation. Source-path native/WASM consumers and optional OCCT reads do not establish package/MSRV, actual C/Python/JavaScript bindings, formal proofs, coverage, runtime fuzz/ASan/lexicase, release or the full pre-push matrix. All 28 work packages remain open or in progress. No push is included.
