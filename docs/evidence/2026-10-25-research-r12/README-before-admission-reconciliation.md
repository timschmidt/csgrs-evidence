# R12: one joint tangent query in offset reversal and opposition

Target: CSGRS `3cca6a894858c8b98497a3cfe81cff5e17e1a7f2` plus the locally
retained R01/R04/R05/R08/R11/R25 changes. The baseline and candidate source
patches and all external dependency locks are retained. The matched binaries
link Hypercurve and its dependencies; their patches cover Hypercurve, while
other local dependencies stay at HEAD. Root modeling and PCB changes are
checked in the combined worktree, not linked into these probe binaries. No remote push or
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

The original native and WASM builders shared target directories between
variants. A later R04 validation reproduced cross-checkout artifact reuse.
The original cost results are superseded by `isolated-verification/remapped/`:
separate targets for every source/variant/kind, identically remapped source
paths, and external dependencies verified against the workspace lock.
Both frozen source patches were unchanged before and after all paired runs.
The earlier 640-result reconstruction also matched every historical non-timing
field and all 32 exact audit artifacts. The patches are Hypercurve-only;
using one as a whole-modeling-worktree snapshot was an erroneous R04
counterfactual setup, preserved and corrected in that record.

## Matched completed workloads

`isolated-verification/remapped/paired_probe.py paired 30` ran 30 alternating baseline/candidate pairs for 16
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

Strict warm medians from the isolated native release probe:

| Input | Stroke time baseline → candidate | Requested bytes baseline → candidate |
| --- | ---: | ---: |
| zero parallel, forward | 10.037 → 10.061 ms | 7,978,124 → 7,959,756 |
| zero parallel, reverse | 9.542 → 9.553 ms | 7,460,244 → 7,439,220 |
| nonzero parallel, forward | 8.380 → 8.314 ms | 7,303,659 → 7,277,115 |
| nonzero parallel, reverse | 7.847 → 7.802 ms | 6,809,867 → 6,778,843 |

Across both policies, the four nonzero-parallel warm stroke ratios are
0.9894–0.9928, with paired-bootstrap 95% intervals below 1. Zero-parallel
stroke intervals overlap 1; the original blanket retained-parallel speedup
claim is withdrawn. Line and native-quadratic allocation counts/bytes remain
identical. All 9,600 paired comparisons preserve certainty, checksum, output
size, peak/result live growth, continuation allocations and post-drop
retention. Every retained-parallel sample allocates fewer bytes and calls.
Warm post-drop retention is zero; all exact audit rows match the historical
artifact bytes. See `invariant-audit.json` beside the new paired results.

Unfavorable timing is retained. Warm whole-workflow ratios (stroke plus
continuation) are 1.0134 [1.0007, 1.0283] for the forward approximate line and
1.0057 [1.0003, 1.0120] for the forward strict zero parallel. No cold speedup
or general workflow speedup is claimed. The timing includes neither fixture
construction nor drop; these have distinct boundaries in the harness.

Three additional alternating Callgrind pairs investigate those adverse controls
and the nonzero parallel. Whole-process instruction ratios are 1.00005 for
the line, 0.99912 for the zero parallel and 0.99699 for the nonzero parallel
(geometric means). Counts include fixture creation, all 20 strokes, continuation,
serialization and teardown, with process cache/hash variation; they do not
replace native latency. The joint tangent helper is called 480 → 340 times
for both analytic processes (24 → 17 per workflow), and zero times on the
line. All 18 exact artifacts match the native corpus. These profiles come
from the same isolated binaries, without inserted counter instrumentation.

Matched native `.text` is 11,493,807 → 11,493,711 bytes; file size is
18,564,304 → 18,563,704 bytes. The remapped WASM probe is
11,767,478 → 11,767,286 bytes (192 bytes smaller, superseding the original
3,681-byte claim). Both WASM builds execute all 32 source-drop/stroke/rebuild
invocations with identical outputs. These are probe sizes, not production
package sizes. Compiler, flags, lock comparisons, digests and all raw samples
are in the isolated record. The earlier samples and source-path differences
remain available; no failed experiment was deleted.

## Final validation and limitations

The earlier scoped check record is under `final-checks-*`: 262 passing Rust test
executions, two failures and 28 pre-existing ignored executions (the selected
unit filters overlap). Curve, BRep, PCB, mixed-profile preservation, receipt and
enclosure groups pass, along with real JS/TypeScript WASM bindings, all-target/
all-feature Clippy for csgrs, hypercurve, hyperbrep and hypercircuit with warnings
denied, Hypercurve docs with warnings denied, formatting, repository budget and
diff checks. The unchanged downstream_profiles target has four passes and two
failures: sampled parabola volume and exact circle-wall triangulation.
`regression-check/` reproduces both without R12, then gets all six passes by
restoring only the pre-R04 modeling adapter. A new clean legacy → mixed-profile-function → legacy comparison independently
reproduces both failures and their removal, without R12. The current repair
passes all six profiles plus the full predicate, triangulation and mesh suites.
The full combined Hypercurve/modeling/BRep/PCB/binding matrix is still running
and remains a condition of adoption. R04 repair evidence is tracked separately.
The full pre-push workflow/release matrix has not been run and no push is
requested or performed.

This change does not solve R02's missing fillet-contact authority, R03's hard
NURBS completion gate, unavailable export views, all unsupported tangent pairs,
or unbounded internal work. Per-process measurement containment is 120 seconds;
unit and downstream checks have their own recorded external limits. Counter
instrumentation is excluded from measured binaries and the retained production
change. Initial compiler/fixture/serialization failures remain in the evidence.
