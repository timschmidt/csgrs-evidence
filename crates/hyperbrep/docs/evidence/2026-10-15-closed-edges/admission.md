# Closed analytic edges on the integrated source

Baseline: `d60bd1cf4ec64f64dfe920a64400f15e62eb2cf9`. The immediately preceding
increment establishes native BodySet composition; it and the updated upstream
acceptance rules remain in force. The earlier candidate is recovered from
`b00958cb640fedbe041c46581327df3e64deacf5`, with all 63 saved files verified.
Its interrupted qualification and old dependencies are historical evidence,
preserved under `pre-integration/`, not admission of this source.

Owners: BREP topology admission/adjacency and Hypercurve native contour
construction. Relevant properties: P6, P12–P20, P25, P26, P27, P35, P36, P39.
The two current-source reproductions require one valid full circle to enter
native topology and native contours. Both fail on this baseline: BREP reports
`DegenerateEdge`; Hypercurve reports `ZeroLengthLine`. They are runtime failures,
not compilation failures or a missing user-interface wrapper.

Admit a single-vertex circular/elliptic edge only when its interval is exactly
one period and both actual endpoint images agree with that vertex. Existing
positive-radius and independent-axis proofs establish regularity and injectivity
modulo the period. Keep each incident edge once in vertex adjacency, but retain
all distinct edge uses, pcurve senses and the two parameter endpoints. Other
closed families need their own proofs and remain explicitly unsupported.

Hypercurve must distinguish a full-circle arc from a zero-length line, using
the existing CircularArc2 carrier and CurveRegion2 operations. Do not weaken
arc radius/incidence validation or accept malformed unchecked lines. Existing
periodic coverage, wire image, cap, shell and archive validation remain required.
No tolerance, synthetic split vertex, foreign kernel or approximate terminal is
introduced. There is no new archive schema or compatibility layer.

Test construct → query → save/reload → split → reflect → Boolean → continue
from empty or disconnected results. Preserve selected body ownership and exact
seam maps through the new common topology-transfer path. Retain original
clockwise/reversed/shifted fixtures, all six archive forgeries, the standalone
ellipse and the native full-circle Boolean/offset cases. Add further cases when
current-source review reveals a missing closure assertion. Re-run the runtime
fault controls, affected native/curve/IO suites and actual WASM probes.

Rebuild and freeze the complete existing default BREP and arc benchmark corpora
before production edits. Their original counts and iterations remain fixed.
Compare matched completed contracts; new closed-edge operations have absolute
costs because the former path failed. Record allocations, process peak RSS,
binary sizes, source/toolchain hashes and unfavorable rows. Existing solver
budgets still do not bound all work, retained bytes or cancellation; process
timeouts provide external containment, not a kernel contract.

STEP entity declarations preserve separate endpoint references, geometry and
sense, but do not certify native geometry. The exact-decimal radial residual in
the independent OCCT cylinder remains a separate import problem. Native closed
edges enable later analytic mapping; they do not admit that file, implicit
healing, arbitrary closed splines, singular charts or complete CAD workflows.
All 28 work-package gates remain open until their complete criteria are met.

The first current-source focused run passes the seven recovered BREP tests but
fails the added disconnected-selection case: two unchanged closed cylinders
become 16 vertices/24 edges rather than 4/6. The single-solid disjoint path
preserves topology; selecting one body from a larger model makes the per-face
bound unavailable on the unbounded cylindrical carrier and triggers a rebuild.
The owning Boolean broad phase can reuse the existing conservative complete-
model bound when its tighter per-solid bound is unavailable. Unselected geometry
may enlarge that bound and prevent a rejection, but cannot create a false
disjointness proof. Retain the failing log and the original assertions; test
the selected transfer, exact volume/classification, replay and empty continuation.
This adds one Boolean bound fallback to the recovered candidate, with P18/P19
as its contract. It does not change the geometry bounds algorithm or claim
general per-solid tight bounds.

Before final qualification, review found a narrower proof at the face-bound
owner: a finite cylindrical trim's Cartesian coordinates are affine in its
axial parameter. A coordinate with nonzero axial derivative cannot have an
interior extremum; with zero derivative its value is constant along each axial
line, which reaches the finite trim's boundary. Thus existing bounds of all
boundary curves enclose the complete face. Extend the shared plane/cone boundary
bound path to cylinders and remove the provisional whole-model fallback.
Preserve the provisional samples separately, and repeat final measurements and
controls. This retains the same test without assuming tightness or consulting
unselected bodies. The new proof does not admit arbitrary unbounded carriers.
