# R12: one joint tangent query in offset reversal and opposition

Target: CSGRS `3cca6a894858c8b98497a3cfe81cff5e17e1a7f2` plus the locally
retained R01/R04/R05/R08/R11/R25 changes. The baseline and candidate source
patches and all external dependency locks are retained. No remote push or
release is claimed. The research ledger is `docs/research-program.md`.

Owner: Hypercurve's private offset reversal and tangent opposition dispatch.
Properties: P4/P8/P9/P17/P19/P20/P35–P39. A retained-parallel/represented-vector
kernel already computes cross and dot together. The reversal caller originally
requested cross, then opposition requested cross and the joint relation again.
The candidate removes the redundant outer cross and consumes the pair's one
joint result directly. Other families retain cross-first evaluation and their
existing fallback. Cheap cross-only entry points are unchanged. There is no new
cache, retained state, carrier, public API or representation migration.

The original public quadratic/line probe did not reach this repeated route.
Adding an analytic parallel with native end-cap centers exposed three joint
queries per reversal, and the missing one-query gate failed. The candidate
passes that gate. Whole-workflow joint counts change from 24/28 to 17/20 on the
two analytic cases in forward/reverse order; the native quadratic changes from
15/19 to 12/15; the line control remains zero. These traced runs are evidence
of routing, not timing measurements. Direct analytic end-cap construction was
already unsupported and remains an explicitly retained negative probe.

Correctness evidence includes the original positive-scale matrix and an expanded
8,064-case independent derivative oracle: seven signed distances, four rotations,
two reflections, both endpoints and traversal directions, nine represented
vectors (including zero), both operand orders and both policies. Terminal cases
exercise strict→approximate→strict, and separate tests preserve the cheap
represented cross path when the unused dot is unresolved. A six-family cardinal
matrix records 1,152 ordered outcomes, including existing Unsupported/Boundary
frontiers; baseline and candidate logs match exactly. The installed regression
fixes those expected outcomes rather than accepting arbitrary uncertainty.

An initial expanded oracle supplied a false Positive range-scale certificate
and treated an endpoint cusp as an undefined tangent. Baseline and candidate
both fail that assertion. `cusp-oracle-review.txt` explains the corrected
independently derived one-sided range direction; the failed tests remain here.
No production behavior or pre-existing assertion was weakened.

The public stroke fixture covers lines, a native quadratic, a zero-distance
analytic parallel and a nonzero analytic parallel, each with both traversal
directions and strict/approximate/strict policies. Exact centerline/endpoints
are inside and a distant point is outside. The output region is dropped before
boundary reconstruction, and the reconstructed result consumes retained source
evidence. The WASM probe also drops the input path before continuation.

## Build isolation review

The original native and WASM probe builders used shared target directories
between variants. A later R04 validation reproduced cross-checkout artifact
reuse. R12's measurements therefore remain provisional until dedicated-target
replay. `isolated-verification/` reconstructs both historical measurement
sources from HEAD plus the retained patches and compiles into separate targets.
Its first 640 results match every historical non-timing field, including all
allocation/live counts; all 32 audit artifacts match byte for byte. Native
text sizes match the originals, but binary sections differ with source paths.
The next matched build remaps both source/probe paths identically before
repeating timing and WASM size evidence. No final R12 adoption is claimed yet.

## Matched completed workloads

`paired_probe.py paired 30` ran 30 alternating baseline/candidate pairs for 16
cases, 20 samples per process: 19,200 certified completed results. Source input
is built before timing. Sample 0 is a fresh process; samples 10–19 are the
reported warm interval. The stroke timer includes complete result construction.
A separate timer covers strict witness queries, boundary rebuild and audit
materialization. Outputs are dropped each sample; no cache is artificially reset.
The counted allocator records requested allocation/reallocation bytes, calls,
live bytes and peak growth, not OS RSS or a universal memory bound.

Every paired first audit file is byte-identical, and all sample certainty,
output-size and checksum rows match. The audit includes exact native controls,
parallel source/distance/ranges, point definitions and roles. Chord domains use
their exact ordered endpoint definitions. Some retained rational carriers and
recursive parameter charts have no public lossless export view: their full
Rust Debug structural records are retained in the audit. This is a same-build
structural comparison, not a portable serialization format or a proof of full
history preservation. The earlier native Bézier and native-image export
blockers are retained in the pilot logs; no display approximation substitutes
for those definitions. Byte/checksum equality supplements the independent
sign oracle and public geometry/continuation checks.

Strict warm medians, native release probe:

| Input | Stroke time baseline → candidate | Requested bytes baseline → candidate |
| --- | ---: | ---: |
| zero parallel, forward | 10.058 → 9.950 ms | 7,978,124 → 7,959,756 |
| zero parallel, reverse | 9.591 → 9.481 ms | 7,460,244 → 7,439,220 |
| nonzero parallel, forward | 8.381 → 8.244 ms | 7,303,659 → 7,277,115 |
| nonzero parallel, reverse | 7.828 → 7.716 ms | 6,809,867 → 6,778,843 |

Across both policies, paired warm stroke ratios for these eight cases range
from 0.9824 to 0.9913; every paired-bootstrap 95% interval lies below 1.
The four line controls and four native-quadratic controls retain identical
allocation counts and bytes in every sample. All 9,600 paired sample comparisons
have identical peak live growth, result live growth, continuation allocations,
and post-drop retention. Warm samples retain zero additional bytes after drop.
There is no cold-speedup claim: all cold stroke intervals include 1; point
estimates include regressions, including +2.45% on reverse approximate lines.
The warm strict forward line point estimate is +1.12%, interval [0.9910,1.0352].
Raw unfavorable measurements are kept in `paired/` and `paired-summary.json`.

Native probe `.text` is 11,493,807 → 11,493,711 bytes; file size is
18,568,872 → 18,568,688 bytes. The separate WASM stroke/rebuild export is
11,773,125 → 11,769,444 bytes. Both WASM binaries execute 32 source-drop,
stroke/rebuild invocations in Node, all certified and with identical output.
These are matched probe sizes, not production package size claims. Native and
WASM dependency versions/checksums match the workspace lock. Compiler, hardware,
build flags, binary digests, timing boundaries, seed and raw samples are retained.

## Final validation and limitations

The final scoped check record is under `final-checks-*`: 262 passing Rust test
executions, two failures and 28 pre-existing ignored executions (the selected
unit filters overlap). Curve, BRep, PCB, mixed-profile preservation, receipt and
enclosure groups pass, along with real JS/TypeScript WASM bindings, all-target/
all-feature Clippy for csgrs, hypercurve, hyperbrep and hypercircuit with warnings
denied, Hypercurve docs with warnings denied, formatting, repository budget and
diff checks. The unchanged downstream_profiles target has four passes and two
failures: sampled parabola volume and exact circle-wall triangulation.
`regression-check/` reproduces both without R12, then gets all six passes by
restoring only the pre-R04 modeling adapter. These are earlier R04 regressions,
not evidence against the narrow tangent transformation, but the combined
worktree is not yet admitted. R04 repair evidence is tracked separately.
The full pre-push workflow/release matrix has not been run and no push is
requested or performed.

This change does not solve R02's missing fillet-contact authority, R03's hard
NURBS completion gate, unavailable export views, all unsupported tangent pairs,
or unbounded internal work. Per-process measurement containment is 120 seconds;
unit and downstream checks have their own recorded external limits. Counter
instrumentation is excluded from measured binaries and the retained production
change. Initial compiler/fixture/serialization failures remain in the evidence.
