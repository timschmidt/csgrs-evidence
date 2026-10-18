# Next exact STEP domain: polynomial profile extrusion

Research checked 2026-10-18. The executed consumer currently fails at
`UnsupportedCurve(RationalBezier)`, body 0, edge 0. This is an implementation
blocker, not evidence that STEP cannot represent the fixture.

STEP Tools' schema documentation provides degree, controls, knots and
multiplicities for
[B-spline curves with knots](https://downloads.steptools.com/docs/stp_aim/html/t_b_spline_curve_with_knots.html).
Its [rational B-spline definition](https://downloads.steptools.com/docs/stp_aim/html/t_rational_b_spline_curve.html)
adds one weight per control and requires positive weights. The
[linear extrusion surface](https://steptools.com/docs/stp_aim/html/t_surface_of_linear_extrusion.html)
retains a swept curve and extrusion vector. The
[advanced-face constraints](https://downloads.steptools.com/docs/stp_aim/html/t_advanced_face.html)
permit B-spline edge geometry and B-spline swept generators, while requiring
Cartesian vertex geometry. These pages describe a merged schema and flag
application-protocol differences; verify the writer's chosen schema/edition
before claiming conformance.

Inference and proposed bounded implementation: a degree-p Bezier curve on
[0,1] is the corresponding clamped B-spline with endpoint multiplicities p+1.
The fixture's polynomial controls, unit weights, endpoints and extrusion vector
are already finite-decimal exact values. Its spatial surface is the direct
product C(u)+vD. Thus the native data has a plausible exact exchange route;
this is not yet an executed import/export result or full schema proof.

HyperBRep IO should own entity decoding/encoding, exact numeric preflight,
source IDs, units and native-to-STEP parameter maps. HyperBRep should own any
missing curve/surface image and trim validation. Reuse existing rational
Bezier/NURBS/extrusion carriers and Hypercurve projections; do not fit a spline
or introduce an exchange-only geometry kernel. Start with positive weights,
finite nonperiodic charts and explicitly representable coordinates/knots.
Preserve typed failures for other weights, charts and scalar encodings.

The current implementation has several concrete handoffs beyond the first
reported rejection. This is a source review, not an execution of those later
branches:

| Owner / location | Required work |
| --- | --- |
| IO [advanced writer](../../../../hyperbrep-io/src/step/write/advanced/mod.rs) and a focused spline encoding module | Extend `Body::edge` beyond its line/circle dispatch. Encode degree, controls, knots and positive weights with exact numeric preflight; preserve directed trim parameters and source edge identity. Keep existing entity order for unchanged families. |
| IO [output builder](../../../../hyperbrep-io/src/step/write/output.rs) | Rational spline complex instances need bounded component emission under the same entity/output-byte accounting. Keep the shared exact decimal boundary and checked allocation path. |
| IO [edge importer](../../../../hyperbrep-io/src/step/advanced/curves.rs) | Replace the blanket complex-edge rejection with explicit supported component admission. Decode through native spline constructors, locate both vertices on the whole carrier, prove traversal/sense, and retain spatial and supplied-pcurve source maps. The existing non-circle branch currently assumes a proved line. |
| IO [surface importer](../../../../hyperbrep-io/src/step/advanced/surfaces.rs) and writer geometry | Add an extrusion support chart with explicit generator and vector units. Derive exact parameter maps from the native chart and prove the edge lies on the entire surface image. |
| IO [face importer](../../../../hyperbrep-io/src/step/advanced/faces.rs) | `edge_loop` currently collects native `Segment2` values and computes `Contour2` area. Generalize the handoff through native `Curve2`/`CurvePath2` and shared Hypercurve area/winding admission so a curved cap is retained exactly. Preserve source-oriented edge uses, hole roles and native whole-wire validation. |
| IO [written source maps](../../../../hyperbrep-io/src/step/write/advanced/types.rs) and [imported maps](../../../../hyperbrep-io/src/step/imported.rs) | Specify the admitted source-to-native parameter relation for splines. Existing endpoint maps must only promise affine interpolation when proved; selected/unrepresentable trims remain typed. Update public docs alongside the implementation. |
| HyperBRep geometry/topology | Expose any needed reusable whole-curve plane projection or extrusion iso-image proof at its native owner. Reuse existing rational carriers, parameter correspondences and validators; IO supplies decoded format data rather than duplicating geometry proofs. |

Native geometry already exposes `Surface::extrusion_profile_and_direction()`
with the exact authored chart `C(u) + vD`, including nonunit `D`.
`Curve3::rational_bezier` and `Curve3::nurbs` validate positive weights and finite
charts. Their control/weight/knot data currently remains private behind
`Curve3ExactData`; exporting through JSON to recover it would be an unnecessary
representation round trip. Add narrow borrowed native geometry views for the
needed spline families, following the existing circular geometry accessor.
Expose degree, controls, weights, native knot vector and domain without copying
the private persistence enum or making its fields mutable. Geometry inspection
does not by itself prove edge-to-surface agreement or trim traversal.

Endpoint parameter location needs a separate admission rule. A spline can pass
through the same vertex at several parameters; `Curve3::parameters_of` returns
selected parameters rather than certifying that the first candidate is the
intended trim. The initial domain should prove a unique supported directed
interval, or consume independently validated selection evidence from supplied
pcurves. Keep ambiguous and unrepresentable parameter cases typed and retain
their source entity IDs. Include repeated-knot, reversed-sense, nonunit-chart,
nonuniform-weight and off-curve-vertex controls in that decoder matrix.

The schema's [B-spline base entity](https://downloads.steptools.com/docs/stp_aim/html/t_b_spline_curve.html)
also carries logical closure and self-intersection attributes. Treat these as
separate claims about the full carrier. A valid trimmed native edge does not
prove either claim about portions outside its trim. Preserve logical unknown
when that whole-carrier proof is unavailable, and never use an imported hint
as a substitute for native image/topology admission. Decoder tests should cover
unknown flags as well as contradictory declared attributes.

The admission fixture is the full mixed profile from this increment, followed
by its holes/components, reversed/affine variants, cold replay and repeated
height cuts/restoration. Prove degree/control/knot/weight validity and whole
edge-to-face agreement, including independent pcurves and chart changes.
Decode and validate independently authored records; an exporter reading its
own output is insufficient. Check independent exact volume/classification,
native archive replay, deterministic exchange, actual WASM execution, malformed
records, resource exhaustion and existing STEP inputs. Use OCCT only as an
optional reader with its numerical limitations reported separately. Preserve
the current full comparison corpus and add costs for complete exchange work;
returning the former error faster cannot count as a speedup.

This is separate from general selected-root integration, nonlinear analytic
parallel spatial carriers, unequal-profile stepped shells, authoring-graph
persistence and complete STEP/AP coverage. All remain roadmap obligations.
