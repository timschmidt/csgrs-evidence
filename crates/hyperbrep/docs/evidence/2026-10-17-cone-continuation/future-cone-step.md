# Next cone exchange investigation

Reviewed 2026-10-17 against this candidate. This note extends the
[earlier feasibility review](../2026-10-16-torus-exchange/future-cone-exchange.md);
it admits no new exchange capability. Cone export still returns its typed
unsupported-surface result.

The current [advanced writer](../../../../hyperbrep-io/src/step/write/advanced/types.rs)
serializes direct spatial boundary curves. Native pcurves and the exact chart
map are retained in the returned encoding report, not written as STEP numeric
fields. Consequently, irrational native slant coordinates do not by themselves
rule out an exact cone encoding. For the admitted radius-5 to radius-2,
height-6 frustum, the two cap coordinates are `5*sqrt(5)` and `2*sqrt(5)`.
Those coordinates would matter to a future serialized-pcurve path, but need
not be finite decimals for the current direct-boundary path.

STEP's revolution surface uses an angular first parameter and the generating
curve's parameter as its second. A line generator is permitted for an advanced
face; a polyline generator must contain at least three points. A degree-one
B-spline is another allowed generator. These are schema constraints, not
evidence that a particular kernel accepts our proposed files.
[Revolution definition](https://www.steptools.com/stds/smrl/data/resource_docs/geometric_and_topological_representation/sys/4_schema.htm#surface_of_revolution),
[advanced-face rules](https://www.steptools.com/stds/stp_aim/html/t_advanced_face.html).

The following parameter mappings are mathematical implementation inferences.
Native [cone evaluation](../../../src/geometry.rs) is
`S(u,v)=A+v*(sin(alpha)*radial(u)+cos(alpha)*axis)`, with `v>=0`.
For an encodable apex and projective unit-generatrix direction, a STEP line
through the apex with vector magnitude one has the map
`u_step=u_native`, `v_step=v_native/L`, where positive `L` is the output length
unit. The chart orientation agrees. This representation must still restrict
the selected face to the intended cone branch; the underlying line includes
negative parameters. Recognition must certify the whole retained trim and
handle the apex singularity explicitly.

A line need not be anchored at the apex. If an encodable generatrix point is
`Q=S(0,v0)` and an encodable axis point is available, use Q as the line origin
and that axis point for the revolution placement. Then
`v_step=(v_native-v0)/L`. Negative STEP line parameters can therefore belong
to the positive native cone: the branch condition is
`v0+L*v_step>=0`, not `v_step>=0`. For an anchor at native longitude `u0`,
also retain `u_step=u_native-u0`. This avoids requiring an encodable apex;
the native recognizer can derive the exact apex and affine shift.

Do not reuse that map for a direct `CONICAL_SURFACE`. Part 42 defines its V
coordinate axially, using radial coefficient `R+v*tan(alpha)`.
[Cone parameterization](https://www.steptools.com/stds/smrl/data/resource_docs/geometric_and_topological_representation/sys/4_schema.htm#conical_surface).
Our derived map for a reference section at native slant `v_ref` would be
`v_step=(v_native-v_ref)*cos(alpha)/L`, with output radius
`v_ref*sin(alpha)/L`. That path separately requires an exact finite angle
encoding. The unit-line revolution and direct-cone charts have different V
semantics even when their selected geometric images agree.

A finite degree-one B-spline between two encodable points on one generatrix is
another option when a finite generating interval is useful. With native slant
coordinates `v0` and `v1`, its knot parameter can be `t` in `[0,1]`, giving
`v_native=v0+(v1-v0)*t`. Its affine chart map has
`t=(v_native-v0)/(v1-v0)`. A negative difference reverses the chart orientation.
The admitted frustum's endpoints `(5,0,0)` and `(2,0,6)` have finite encodings
even though their slant distances are irrational. Choosing actual finite trim
endpoints also avoids assuming that the cone's extrapolated apex always has a
terminating decimal. General trims might not provide such endpoints; they
remain a separate representability obligation.

Vertex encoding is a separate limit. An exact angular edge split can introduce
an irrational model-space vertex even when the original frustum used finite
decimals. The advanced-face rules require Cartesian vertex points, and the
current writer's exact number encoder requires a finite decimal. Such states
must keep their typed number-encoding failure and intact native archive.
Successful native split/reunion therefore does not imply that every
intermediate state can pass through this STEP representation. Do not round a
new vertex or discard a split to manufacture an exact round trip.
[Advanced-face vertex constraints](https://www.steptools.com/stds/stp_aim/html/t_advanced_face.html).

Implement the smaller native line-generator path first. Before code changes,
reproduce the current unsupported export on the complete cone workflow, and
name the exact representability and selected-domain contract. Native geometry
owns exact conical-generator recognition, branch/domain proof and normal/chart
correspondence. The I/O crate owns entity syntax, unit conversion, source maps
and typed encoding limits. Import must recover native cone support so the next
Boolean has the same available operations; a generic revolution that merely
looks conical does not establish continuation.

Acceptance needs full-size whole, half, band, remainder and reunited bodies;
both reconstruction orders; exact rotations and positive similarities;
negative/zero-length generators, wrong branch, apex and unencodable inputs;
source topology and parameter maps; independent analytic measures; archive
reload; repeated split/reunion after import; and an independent OCCT read.
Retain all old STEP byte fixtures, capability failures and performance cases.
Prove the selected domain before broadening support, and measure the completed
workflow, including recognition and cold import, before making cost claims.

The [independent reader probe](cone-step-feasibility/result.json) now gives
limited executable support for these representations. Its
[recipe](final-review/cone_step_feasibility.py) authors three complete frusta
from the existing direct-boundary topology template, with exact finite STEP
coordinates and no decimal cone angle. OCP 7.9.3.1 reads the two height-6 cases as valid solids
with three faces, three shared edges and two vertices; volume and surface area
match `78*pi` and `(29+21*sqrt(5))*pi` within relative tolerance `1e-12`.
The curved supports remain reported as surfaces of revolution. The B-spline
case reverses the face's `same_sense` to account for its opposite generating
direction. The third case has height 7, an apex at Z=`35/3`, and a line anchored
at `(5,0,0)` with direction ratios `(3,0,-7)`. It contains no decimal apex
approximation and passes the same topology checks, with volume `91*pi` and
area `(29+7*sqrt(58))*pi`. Its positive native branch includes negative STEP
line parameters. The original two fixture byte sequences remain unchanged.
Raw files, the [first reader log](cone-step-feasibility.log) and the
[extended reader log](cone-step-feasibility-v2.log) are retained.
These float interoperability experiments ran before any timed campaign.
They do not supply native exact recognition, prove general
STEP conformance or admit cone exchange as a production capability.

Proposed implementation locations, subject to the reproduced native contract:

- `hyperbrep/src/geometry/analytic.rs`: a borrowed `ConeGeometry` view and
  `Surface::conical_geometry`, following the existing cylinder/torus views.
  Expose the authored apex, orthonormal frame and semi-angle, with explicit
  slant-distance documentation. Inspection must not canonicalize the surface.
- A native geometry module for recognizing a straight conical generator and
  its exact parameter map. Return the recognized support together with domain
  and orientation correspondence. A line parallel to the axis, a generator
  missing the axis, zero length and an unresolved incidence proof need distinct
  typed outcomes. Do not duplicate those geometric decisions in the parser.
- `hyperbrep-io/src/step/write/advanced/geometry.rs`: emit the admitted
  `SURFACE_OF_REVOLUTION`/`LINE` representation, use existing exact number and
  projective-direction encoders, and return its `WrittenSurfaceParameters`.
  Select generator and axis anchors from certified finite source geometry
  when the apex is not encodable; retain the longitude and slant shifts.
  This may require passing selected-face boundary context to the writer helper.
  Update the public encoding-report documentation to name the new entity.
- `hyperbrep-io/src/step/advanced/cone.rs` and `surfaces.rs`: parse the supported
  generator and axis, consume native recognition, preserve periodic lifts and
  branch restrictions, and derive boundary pcurves for native whole-image
  validation. Keep unsupported generator families and unproved branches typed.
- Public native geometry and I/O continuation tests: retain the three manually
  authored files as external parser controls alongside native writer round
  trips. Exercise exact unit conversion, shifted line origins, negative STEP
  parameters on the positive native branch, chart reversal and continuation on
  the original full cone cases. Defer the B-spline generator path until the
  simpler line path has complete acceptance; this experiment does not obligate
  the first implementation to accept every revolution surface.

For the native recognizer, the following derivation is a proposed proof
obligation, not executable admission. Let the normalized revolution axis be
`a` through C and the generator be `P+t*D`, with units already converted.
Set `c=D.dot(a)`, `r=D-c*a`, and
`q=(P-C)-((P-C).dot(a))*a`. Require nonzero c and r for the cone case.
The candidate apex parameter is `t0=-q.dot(r)/r.dot(r)`; certify
`q+t0*r=0` before taking `A=P+t0*D` as the apex. A skew generator must not
be mistaken for a cone. Parallel, perpendicular and zero generators need
their own typed outcomes.

Let `n=norm(D)`, `rho=norm(r)` and `alpha=atan(rho/abs(c))`.
For branch sign b in `{-1,1}`, use native radial X=`b*r/rho`, native
axis Z=`sign(b*c)*a` and Y=`Z.cross(X)`. The exact proposed chart is
`u_native=sign(b*c)*u_step`, `v_native=b*n*(t-t0)`.
Its orientation determinant has sign `sign(c)`, independent of b. Select a
branch using a certified non-apex source witness and validate the entire
selected trim in that branch; an apex witness alone cannot determine a chart.
This derives the offset, negative-parameter and reversed-axis cases through
one native authority. Tests must independently verify incidence, normals,
units and both branches before the parser or a future revolve builder consumes
the result. The recognition result should carry its exact UV correspondence
along with the native surface, rather than require each consumer to reconstruct
these formulas.

The current importer resolves and caches a support by STEP entity ID before
reading its face loops. Branch selection cannot be inserted into that sequence
without an explicit witness. Parse and retain the revolution descriptor first,
obtain a certified non-apex boundary witness, then resolve the native branch and
validate all bounds. Cache the branch and its chart correspondence as part of
the resolved support identity; two faces can reference the same STEP support
while using opposite branches. Preserve the common STEP source identity in
both mappings. Apply the chart orientation sign to the face's `same_sense` before
interpreting outer and inner loop orientation. Add an opposite-branch shared-
surface fixture and an apex-only witness control; do not let the first face
silently select every later face's native branch.

The writer also caches one encoding and parameter map per native support. If
the finite generator anchor comes from a face boundary, either choose one
certified anchor usable for all faces sharing that support or retain distinct
encodings with their own maps. Test face traversal order and source mappings.
This is a representation and ownership requirement, not a reason to add a
second approximate geometry recognizer to either I/O path. As part of the
borrowed cone-view API change, correct the constructor's current ambiguous
`radial-height` documentation to the actual slant-distance semantics.
