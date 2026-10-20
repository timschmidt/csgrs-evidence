# Native analytic similarity transport

Owner: HyperBRep geometry, chart binding and topology certificates. P1–P6,
P8–P9, P15–P20, P24–P27 and P35–P39 apply. Baseline is the merged branch
`f3d34bef56f26bb1e20fa8cc816f9451a7bee59d`; surrounding crates remain upstream work.

Reproduce the retained cylinder scale failure on this revision, then admit
certified nonsingular similarities (including reflections and translations)
through native analytic geometry, edits, validation/replay, queries, Boolean
continuation and representable STEP output. Exact frames stay unit length;
radii and physical axial coordinates scale by the positive metric factor.
Angular and curve parameters keep their meaning. Transport every affected
analytic shell certificate, including clipped/void bodies and revolution
profiles. Keep planar/spline affine behavior and all existing rigid behavior.

The matrix proof is A^T A = s^2 I, s > 0; transformed unit directions are A*d/s.
Cylinder/cone chart maps are (u,v) -> (u,s*v), with existing reflected longitude
and wire reversal when orientation changes. Plane/extrusion charts retain their
authored affine bases; sphere/torus angles and revolution profile parameters do
not acquire a length factor. Shared pcurves must follow each owning face chart.
Exact chart images, selected source parameters and correspondences must survive.

Hypercurve owns planar transformation. Reuse its native source-preserving
similarities on straight axial-chart images, including retained line source
restrictions, instead of reconstructing selected endpoints. General nonlinearly
curved axial pcurves need a native affine image carrier; if encountered without
a proof, report unsupported rather than silently applying an isotropic map.
Record this remaining domain boundary. General nonuniform transforms of curved
analytic carriers remain typed unsupported; ordinary invalid/singular matrices
and undecided predicates remain distinct. No epsilon or float ingress.

Before implementation, retain the failing workflow and baseline binaries.
Regression coverage must compare independently derived dimensions, areas and
volumes, mapped classification samples, actual surface/edge correspondence,
selected subdivision, inverse/repeated compositions and fresh archive replay.
Exercise native/reflected/rotated/radical frames, multiple exact scales, voids,
clipped Boolean certificates, tiny distinct offsets and failure/recovery.
The original 1/1000 and 127/5000 scale/export/reimport workflow must succeed.

After the final edit, run scoped BREP/IO all-feature debug/release/minimal tests,
strict Clippy/docs, examples, fuzz-target compilation and actual WASM consumers.
Retain full existing benchmark corpora/receipts and allocation/size observations
with alternating trials; measure newly completed scale workflows separately.
No performance claim compares prior failure with new success. Scalar coefficient
work, total heap and cancellation remain unbounded internally; use external
containment and disclose the limitation. Preserve all failed attempts and
unfavorable observations. This extension does not close the full CAD plan,
release/package/MSRV/binding, runtime-fuzz/ASan/lexicase or formal gates.

## Reproduced archive transport dependency

The first implemented radical scale/inverse workflow reaches exact validation
but fails deterministic archive replay: `similarity-primitives-2.log` and the
retained `archive-expression-{left,right}.json` record all 120 expression-field
differences. Native persistence canonicalizes emitted analytic endpoints from
their curves, then projects planar pcurves using the old runtime vertices. The
next replay therefore derives different expressions from the emitted vertices.
Fix this at the BREP serializer by projecting the actual emitted coordinates;
retain the original deterministic assertion and the complete workflow. Check
all existing artifact receipts. If existing archives change, identify the
representation migration explicitly rather than claiming performance-only work.

## Reproduced scaled torus measurement dependency

The original positive torus-band formula passes before scaling, and after
rational scaling. `clipped-diagnostic-1.log` isolates strict equality failure
for the sqrt(2)-scaled band. Its length-based antiderivative introduces mixed
radicals that obscure the existing exact relation. Normalize the disk-height
coordinate by minor radius before sqrt/asin, then multiply by the common
R*r^2 factor. This is the same exact integral, with unchanged domain and strict
expected volume; no predicate demotion, changed fixture or scalar patch.

## Reproduced extrusion reflection dependency

The complete five-profile extrusion/revolution matrix fails in
`profile-families-1.log`: the reflected extrusion pcurve requests a parameter
outside its profile domain. The old implementation negates the extrusion vector
(`v`) while the topology reflection negates `u`. Reproduce the unchanged
reflection-only input on the pinned pre-increment source. Repair both sides at
the BREP chart owner: reverse the transformed native profile, keep the affine
extrusion vector, and reflect `u` about its original domain endpoint sum.
Retain the entire original matrix and independently revalidate the archive.
This is a correctness repair, not a performance-only change.

The initial dimensionless rewrite alone remained undecided in
`similarity-matrix-4.log`. Reusing `Real::compact_quadratic_tower` on the
normalized ratio makes the half-angle recognizable and preserves the same
strict expected volume; `similarity-matrix-5.log` passes. This reuses the scalar
owner's existing exact operation without modifying that crate.

`periodic-near-1.log` used a mistyped test filter and executed zero tests; it is
not acceptance evidence. The corrected invocation in `periodic-near-2.log`
executes and passes the named test. The reflection-only baseline probe uses the
same matched lock and pinned source described in `baseline-lock-proof.json`;
its added example is retained as `baseline-extrusion-reflection.rs.txt`.
`baseline-extrusion-reflection-1.log` reproduces `EdgeUseImageMismatch` on replay.

The first chart repair exposes a second BREP proof restriction:
`profile-families-4.log` reaches correct reflected circle endpoints but rejects
fresh replay with `EdgeUseSupportMismatch`. Extrusion complete-image validation
currently admits only equal forward profile parameterizations. It must also
certify equality with the reversed complete profile and reverse the endpoint
parameter map. This is a full-curve equality proof, not endpoint sampling or a
relaxed validator. Retain the forward check and all existing invalid-image tests.

`profile-families-5.log` additionally reproduces a missing ellipse/revolution
meridian dispatch before any transform. Axis clearance and the full exact
elliptic parameterization comparison already exist. Route this pair through
the existing meridian proof, retaining its constant-longitude requirement,
full curve comparison and affine parameter correspondence. This is a narrow
admitted pair extension, not a claim of general ellipse/plane pcurve support.

`profile-families-6.log` retains another deterministic-replay failure after
successful geometry validation. `profile-archive-{left,right}.json` and the
32-field diff show rational meridian control endpoints copied from old runtime
vertices instead of the already-emitted canonical vertices. Apply the same
emitted-coordinate rule to full-domain rational edge endpoints and nested
extrusion profiles. Selected vertex images still report their existing typed
non-coordinate boundary when these coefficient-only paths require coordinates.
Do not weaken the byte-for-byte replay check or alter the radical input.

The first WASM build fails because the external test consumer did not declare
`serde_json`, newly used by the invalid-profile test. Its runtime attempt then
fails because no executable was produced. Add the existing locked `1.0.151`
package as a direct probe dependency; no production manifest, dependency version
or Rust source changes. Native qualification snapshots differ from the final
snapshot only in these two unused probe files. Rebuild and execute the affected
WASM consumer after this correction; retain both failed attempts.

## Reflected subdivision closure

Final review adds split→reflect→archive replay for each of the five profile
families on both ruled surfaces. `profile-subdivision-1.log` reproduces failure
on the circular extrusion: the reversed expected subcurve has the same exact
parameter span but a shifted parameter origin. The existing full-curve equality
helper rejects different origins before comparing the complete carrier. Align
only the comparison chart by an exact translation for conics and NURBS, prove
both interval endpoints agree, and apply that same origin to the explicit
parameter correspondence. Preserve all control/knot/frame/radius/phase checks;
endpoints alone remain insufficient. This belongs to BREP image validation
(P17–P19), not a scalar or IO repair. Preserve the first complete qualification
and cost campaign; rerun affected checks and the full retained corpus after the
correction. The profile matrix grows from 73 to 83 workflows, so its new absolute
cost is a different workload and is not a speed comparison with the first matrix.
