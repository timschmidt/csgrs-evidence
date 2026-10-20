# Partial-depth prism Boolean continuation

Baseline: `6e00d3ba96acacf4ad8486e4e510b916fa28c93a` on `brep`, after
upstream `be2a0c37b` and public normalized-region extrusion.

The next capability is ordinary finite-depth common-axis prism modeling,
including cylinder/box cuts that leave a thin end layer, a central notch,
touching/disjoint tools and the reversed difference. Retain all original
24 prism fixtures, including the six unsupported full-size inputs. Reproduce
them on this revision and trace carrier intersection, face trimming,
partition, classification, stitching and solid admission separately.

HyperBRep geometry owns exact spatial/parameter correspondence. Its topology
layer owns whole images, manifold incidence and embedded material shells.
The Boolean pipeline consumes those facts; Hypercurve owns planar arrangements
and filled regions. Extend the existing shared pipeline and retained proofs.
Do not publish a list of overlapping slab bodies as a regularized union,
discard internal interfaces, infer embedding from volume alone, or add a second
modeling kernel in an adapter. Supporting crate changes require a reproduced
BREP need and remain in the owning layer.

Relevant requirements: P1, P3-P6, P8-P11, P12-P20, P24-P27 and P35-P39;
WP03/WP04/WP06/WP07/WP08. Exact 1/10^12 gaps remain distinct. Strict decisions,
selected endpoint identities, authored periodic charts and all boundary
contacts survive transfer and replay. Invalid, unsupported, unresolved and
exhausted outcomes remain typed. Local strict success cannot upgrade earlier
source qualification.

For cylinder radius 5, height 6, and a box covering its positive-x half over
an axial overlap of length h, intersection volume is 25*pi*h/2 and difference
volume is 150*pi-25*pi*h/2. Preserve the full-size input and test exact point
membership on both sides of every new axial and meridian boundary, surface
measures, incidence, reversal, reflections/rotations, cold native replay,
STEP where finitely encodable, further edits, reconstruction and empty recovery.
Any new shell certificate needs independent forged/overlap/missing-image
negative controls, not only a constructor round trip.

Keep all preceding successes and independently unsupported controls. A newly
completed workflow has absolute cost, not a speed ratio against old failure.
Freeze source during checks and measurement; retain failed prototypes and
their actual source. Run native/minimal/debug/lint/docs and actual WASM checks
appropriate to the implementation, complete native/STEP consumer paths and
the affected complete-work benchmark corpus. Existing solver counters are not
total-work, retained-heap or cancellation bounds; use external containment for
unbounded probes. No work-package or shipped-package completion is implied.

Research consulted on 2026-10-17: the
[OCCT Boolean specification](https://www.occt3d.com/dev/doc/overview/html/specification__boolean_operations.html)
separates retained intersection data from result building and shares that
data across Boolean/section/split operations. The
[CGAL Nef manual](https://doc.cgal.org/latest/Nef_3/index.html)
defines regularization through interior and closure and distinguishes it from
manifold restrictions. These support using HyperBRep's existing partition and
selection pipeline. This is an architectural inference, not an exactness proof
for OCCT's tolerance-based implementation or permission to convert curved
source geometry to polyhedra.

The v2 continuation tests reproduced two additional native ownership defects:
partitioned tool-box cold admission rejects a valid curved cap subdivision, and a
subsequent cut of the touching-tool result returns an incorrect empty component.
The latter profile query returns the first top-cap face rather than its complete
material cover. Extend this increment only through the owning native topology
proof/query, retaining these failing full-size tests. Coplanar boundary replay
must prove complete nonoverlapping coverage, and the profile query must preserve
all cap pieces and holes. Neither fix admits a genuinely partial-depth shell.

The retained partition-v1 diagnostics isolate the replay failure to the tool box,
not the cylinder (the earlier test only named the common replay helper). The
new convex-shell proof cancels shared coplanar boundary images, requires one
convex polygon per plane and consistent oriented face winding, and then checks
the complete convex half-space certificate. Local face image, simplicity,
hole nesting and closed incidence admission remain prerequisites. It does not
allow curved external faces, nonconvex shells or incomplete face covers.

The first full release/minimal and actual WASM qualification reproduced a cap
aggregation regression in the unchanged reversed-bore fixture: a side edge
starting at the top cap was projected before its other endpoint was checked,
producing `ZeroLengthLine`. Both endpoints must be at the cap height before
projection. The original bore fixture remains unchanged. All five original
slab inputs remain: the three true partial-depth differences now reach
`UnsupportedSolidShell`; touching/disjoint differences must complete and retain
the whole cylinder, with independent measures, replay and empty intersection.
The old `FacePartitionUnsupported` expectations are explicitly strengthened;
no policy, input size or validation is weakened. The failed first full
qualification and its WASM trap remain in `qualification-v1.json` and raw logs.

Cold partitioned-box query/Boolean continuation exposes one further native
transfer defect (`axial-cold-continuation-1.log`): planar Boolean projection
creates a native rational circular pcurve but labels its relation to the
spatial angle parameter as affine. The result is published with transferred
image evidence and then rejected by cold whole-image admission. The owning
Boolean transfer must retain the existing `AngularSweep` relation for this
native circle projection; endpoint-matched affine coefficients cannot prove
its interior parameter map. Retain the new cold continuation assertion and the
existing strict circle-image validator unchanged. This is a BREP fix required
for the new coplanar-cover output to remain consumable (P17-P19/P35).
