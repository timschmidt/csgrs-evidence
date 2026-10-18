# Exact planar spatial curves and nonlinear cap extrusion

Baseline `7510a3603805364cf5409dd9efbcf0d7f4a0c201` on `brep` includes
upstream `540074a8c05ccc676d7c70b8f0093f98804b81d9`. A checkpoint fetch found
no new upstream commits. This increment admits the original full nonlinear
parallel cap, including its three quadratic straight closing segments.

`Curve3::planar_image` retains the Curve2 source, an injective affine plane frame
and an explicit unit-to-source chart. Scalar evaluation, derivatives, bounds and
inverse queries reuse the planar owner. Reversal/subdivision retain the source;
nonuniform transforms change the frame. Whole edge-image agreement and complete
procedural-loop proofs precede prism topology admission. Native replay rebuilds
those proofs with no trusted flags, copied offset formulas or sampled geometry.
Quadratic/cubic native pcurve definitions are retained without family demotion.
Version 9 gains family tags; preceding encodable bytes are unchanged.

The [contract](contract.md) identifies ownership, input and missing acceptance
before production changes. [Proofs](proofs.md) give the exact source/frame/chart
witness and independently derived expectations. [Decisions](ideas.md) and
[next domains](next-domains.md) retain alternatives and remaining work.

## Qualification

The unchanged original nonlinear parallel cap now extrudes and cold-replays through retained planar spatial curves. Whole source/frame/chart proofs admit edge images; Hypercurve supplies exact evaluation, inverse parameters and complete simple-loop winding. Eleven core acceptance groups cover independent values/derivatives, nonunit/reversed charts, conservative bounds, inverse queries, path/region extrusion, planar faces, holes/components, split edges, reflected nonuniform affine transforms, repeated same-profile slab cuts/restoration, near-boundary classification, forged interiors, metadata limits and typed failures/recovery. BRep/IO release suites pass 650/642 tests with all/minimal features; new debug acceptance passes 11. Affected Hypercurve tests pass 351 integration, 165 retained-boundary, 4 winding and 62 successor tests. Warnings-denied affected all-target Clippy/rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. External source-path native consumers pass; actual zero-import WASM passes 12+7+11+7+9+14+138=198 groups. All 362 preceding artifacts remain byte-identical, including eight typed encoding diagnostics; 48 new native archives agree across two fresh processes. All 24 prism and 81 continuation outcomes remain. All seven original full profile recipes now complete native cold replay; the nonlinear cap volume remains explicitly unsupported. Earlier two-complete/two-unsupported path controls remain. Twenty prism OCCT observations were rerun; prior quintic observations apply only to identical bytes. A separate native pole review confirms that storing a source definition is not a finite-loop certificate: interior poles retain typed query and face-admission blockers across replay, followed by finite-source recovery.

[Qualification](qualification-summary.json), [attempts](attempts.json),
[consumer identities](consumers.json), [preserved artifacts](artifact-preservation.json)
and [original profile outcomes](original-profiles.json) bind results to fixed
source. The eleven native groups plus the STEP failure control execute in a
real zero-import WASM module. These are source-path consumers, not installed
packages or production language bindings. Failed candidates and original hard
controls remain in the [attempt review](attempt-review.md). The additional
[pole review](pole-review.json) records its own native source and typed outcomes.

## Cost and remaining gates

Three alternating pairs preserve all 40 preceding consumer groups in 30 processes, with original assertions, iterations and outcomes. Time ratios range 0.965088–1.121568; 1 of 40 groups exceed the 10% review marker and 20 increase allocation calls or requested bytes. Twelve new complete acceptance groups have absolute costs from three processes. Every slower and adverse observation is retained. This finite shared-host comparison does not rerun the historical 192-case catalogue or establish a general speedup, significance or an internal resource bound.

[Costs](costs.md) include full assertions, native replay and supported output
materialization. [Resource records](resource-review.json) retain every slower
row, allocation request increase, RSS, executable size and finite archive
observation. External timeouts contain checks without establishing internal
bounds. Earlier adverse observations remain open.

This is finite planar lifting and procedural cap continuation, not complete general CAD. General selected spatial evaluation/domain views, unlike procedural-source equivalence/ordering, arbitrary surface intersections, general metrics, full source history and wider STEP representation remain open. Polynomial B-spline planar-source archives remain unsupported; existing builder NURBS promotion is retained. Local strict replay does not certify earlier approximate source intent. No operation-wide work, coefficient-growth, retained-heap or cancellation bound is added. Source-path consumers do not establish registry installation, MSRV or production bindings. Coverage/formal verification, runtime fuzz/ASan/lexicase campaigns, full pre-push qualification and all 28 work packages remain open/in-progress. No push. Production changes are confined to BRep; unrelated concurrent-thread breakage is untouched. Qualification is pinned to upstream 540074a8c and unchanged source.

[Source reconstruction](source-reconstruction.json) retains every checked epoch,
including failures. The [manifest](manifest.json) binds source, evidence and
public documents; the [audit](final-audit.json) checks raw arithmetic, artifacts,
ledger ownership and protected stashes. Raw Cargo log whitespace is preserved
and reported separately in [staged checks](staged-whitespace.json); non-log
staged files must pass. No full pre-push or goal-completion claim is made.
