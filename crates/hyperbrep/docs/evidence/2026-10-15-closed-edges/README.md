# Closed analytic edges on the integrated branch

This is partial WP03/WP08 progress against
`d60bd1cf4ec64f64dfe920a64400f15e62eb2cf9`, under the updated
[admission protocol](../../../../../docs/admission.md). All 28 work-package
gates remain open. The [pre-code contract](admission.md) names the owning layers,
input domain, failure reproductions and scope. The
[architecture](../../ARCHITECTURE.md#closed-edges-and-periodic-seam-uses)
describes the public behavior.

`ModelBuilder::edge` admits a circle or ellipse spanning exactly one period
with the same vertex at both ends. The carrier proves regularity, and both
endpoint images must match the vertex. Vertex adjacency includes that edge
once; directed uses and parameter endpoints remain distinct. An incomplete
period returns `ClosedEdgePeriodMismatch`; other closed families return
`UnsupportedClosedEdge`. This replaces the old `DegenerateEdge` variant
directly, without a compatibility adapter. Version-9 archive records suffice;
untrusted replay reconstructs the proofs.

Hypercurve's `CurveString2` checks zero-length chords for lines. A native
`CircularArc2` with equal endpoints represents a full circle. The arc carrier's
validation and subsequent exact-consumer checks remain required. Full-circle
contours now compose through the existing `CurveRegion2`, winding, moments,
Booleans and offsets.

The new selected-cylinder test also found that an unavailable face bound made
an unchanged closed-edge component undergo a topology rebuild. The shared face
bound now encloses a finite cylindrical trim using its boundary curves: each
Cartesian coordinate is affine along axial lines, which reach the trim boundary.
This supplies a per-face certificate for the existing disjoint Boolean path.
It does not promise tight bounds or universal preservation of Boolean input
records. A provisional whole-model fallback was replaced by this narrower proof;
its source, six fault controls and all 15 cost runs remain under
`superseded-model-bounds/` and do not qualify the final source.

## Reproductions and correctness

The two probes in `current-reproductions.json` fail at runtime on this baseline:
BREP reports `DegenerateEdge` and Hypercurve reports `ZeroLengthLine`.
`focused-hyperbrep-before-bound-fallback.log` retains the new composition
failure: the intended two closed cylinders became 16 vertices/24 edges rather
than 4/6. The original assertions remain in the passing regression.

Eight native tests cover the two-vertex/three-edge cylinder, shifted charts,
reversal, distinct seam parameters, cold/warm queries, complete archive equality,
circle and shared-seam subdivision, reflection, coincident-cylinder Booleans,
standalone ellipses and six forged archive mutations. Exact period and endpoint
displacements of `1/10^12` remain distinct. A shared native/WASM workflow
accumulates disconnected bodies from empty, selects a subgraph, transfers its
closed edges without the unselected body, checks exact volume and classification,
subtracts everything, and consumes the empty result again. Two Hypercurve tests
cover full-circle area/moment/winding, an open mixed string, Boolean composition,
an annular difference and offset reversal. All 40 contour-target tests pass.

Six deliberately broken implementations must fail at runtime and restore their
original source hashes: reject closed edges, duplicate adjacency, omit the
period proof, omit endpoint proof, restore the arc chord guard, and omit the
cylinder face bound. The period control checks its specific diagnostic;
it does not claim that removing that guard alone publishes an invalid solid.

Final current-source qualification has **391** combined BREP/IO passes in each
of debug and release, **383** minimal-feature release passes, **2,441** Hypercurve
release passes with **28 existing ignored** tests, and all **40** focused contour
tests passing in debug. Eight actual zero-import Wasmtime groups pass. All
scoped Clippy configurations, warning-denied documentation, fuzz-bin compilation,
formatting and diff checks pass. `commands.json` and `attempts.json` retain the
16 commands, exits, logs, external timeouts and the same 943-source snapshot.

Root acceptance has **141 passes and two inherited failures**: the 16/32-segment
strict drill composition cases still return `PredicateUndecided`. This command
retains exit 101; it is not counted as a pass. The other 15 commands exit zero.
Debug/release/configuration counts overlap. WASM probes execute native APIs
through Wasmtime and do not establish a production JavaScript binding.

## Costs and evidence

Both original default-feature benchmarks were built, frozen and run successfully
before production edits: 64 BREP rows and 12 arc rows. The two optional BREP
tessellation rows are absent from both default-feature binaries. The arc corpus
keeps its 256-arc cases and ten large-case iterations. Its eleven result tails
and one timing-only row are existing observations, not independent geometry
oracles. The benchmark reader rejects missing, duplicate and changed-result
rows. All 15 final benchmark processes complete with unchanged observations.
The median of case median timing ratios is 1.020399 for BREP and 1.003615 for
arcs. The largest arc ratio, 1.118080 for a 6.462-to-7.225 ns replay row, exceeds
the default 10% cohort budget and remains exposed. The semantic reason for
retention is native composition completeness; no optimization or all-cohort
timing-gate pass is claimed. See [BREP performance](../../../PERFORMANCE.md)
and [Hypercurve performance](../../../../hypercurve/PERFORMANCE.md) for every
reported limit, the new feature baseline, allocation costs and size/RSS data.

Five new allocation-instrumented rows measure construction, replay, circle split,
seam split and reversed/shifted replay, each with 100 completions. Exact
measurements/classifications, topology counts, serialization and complete archive
equality are inside timing. Expected-output preparation, initial replay checks
and reusable input preparation are outside. These are absolute costs of newly
supported work; the old constructor failed. Three fresh processes per binary
run serially on CPU 0. The C launcher records child peak RSS with `wait4`.
Allocation counters measure Rust allocation/reallocation requests, not retained
heap or stack. Existing BREP/arc rows do not isolate the new cylinder face bound.

`pre-integration/` is a byte-preserved copy of the earlier unfinished candidate's
evidence from stash `b00958cb640fedbe041c46581327df3e64deacf5`; its original
draft README includes claims that were never fully qualified. Those claims are
**not admitted here**. Its Hypercurve debug run was interrupted for upstream
integration. The 63-file saved snapshot was verified before selective recovery;
the stash remains a backup. Current caller migrations and tests use `BodySet`.
`pre-integration-preservation.json` binds the historical copies. Current evidence
uses the integrated dependencies and is separately hashed in `manifest.json`.
Patch and log files retain their raw whitespace; scoped Git attributes preserve
that archival data, while the verifier checks hashes, test outcomes and receipts.

Run `controls.py`, `benchmark.py`, then `qualify.py` serially from this directory
or the repository root. Qualification supports `--only` and preserves attempts;
it refuses source changes during a run. `collect.py` and `verify.py` bind and
check the final files. Baseline benchmark reproduction requires building the
unchanged harnesses on the recorded baseline first; the frozen binary hashes
are checked, never silently replaced by candidate builds.

## Remaining scope

The [research note](../../ALGORITHM_RESEARCH.md#native-closed-edges-before-analytic-step-mapping-2026-10-15)
separates this native prerequisite from future analytic STEP mapping, angle-unit
conversion and exact source-parameter correspondence. The independent OCCT
cylinder still has a nonzero exact-decimal radial residual; this increment
neither imports nor heals it. Closed splines, general ellipse/plane image proofs,
singular charts, general curved shells and complete STEP exchange remain open.
Whole-operation work/retained-byte bounds and cancellation are not supplied by
external timeouts. No new runtime fuzz/ASan/lexicase campaign, coverage proof,
released-package/MSRV qualification or full pre-push matrix is claimed. The
historical archive performance gate remains open.

The separate `seam_frame_probe.rs` experiment completes 24 native circle-edge
construction/replay cases at non-cardinal rational seam points, with both fixed
and seam-anchored frames and shifted periods. Two exact off-carrier cases fail
typed. It uses the existing `Real::try_atan2` and frame APIs; it does not implement
source parameter maps, pcurves, units or STEP import. Archive size observations
are not a completed-contract optimization comparison. The setup compile error
is preserved separately and is not a runtime finding.
