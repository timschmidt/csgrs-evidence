# Follow-on exchange feasibility, 2026-10-16

This is design research during builder qualification, not implementation or
acceptance of another surface family. Runtime scope remains the current proof
reuse experiment. Reproduce each actual blocker before the next code change.

The published Part 42 definition uses axial distance for cone V:
`C + (R + v*tan(a))*radial(u) + v*axis`. It also gives both torus coordinates
as angles. Ring-torus admission therefore needs both chart directions and their
periodic lifts. The schema permits broader torus data than the native kernel's
strict `R > r > 0` domain; unsupported horn/spindle cases must stay typed.
[Part 42 geometry definitions](https://www.steptools.com/stds/smrl/data/resource_docs/geometric_and_topological_representation/sys/4_schema.htm).

OCCT's native cone uses slant distance, with axial displacement `v*cos(a)` and
radial increment `v*sin(a)`. Its native BREP chart is consequently not a direct
STEP pcurve oracle without conversion.
[OCCT BREP surface format](https://github.com/Open-Cascade-SAS/OCCT/wiki/brep_format).

Local source inspection shows HyperBRep uses the same slant-distance evaluation
in `SurfaceGeometry::Cone`, with an apex origin and positive angle below pi/2.
Inference: an apex-centered STEP cone with radius zero requires
`v_step = v_native*cos(a)/length_scale`. Any alternate reference section also
needs an origin shift. Test actual pcurve/spatial-image agreement, orientation,
seam lifting and cap placement; endpoint agreement is insufficient.

The current writer emits radian angular units and requires exactly representable
Part 21 numbers. An arbitrary symbolic cone angle cannot simply be printed as
a rounded decimal. Before selecting a cone milestone, reproduce that numeric
boundary and define its exact admitted angle/unit domain. An explicit lossy
export would be a separate operation with its own fidelity contract. Ring tori
may offer a broader direct exact domain because the entity stores radii and a
frame rather than a semi-angle; this remains a hypothesis pending full graph
reproduction and independent STEP round trips.

Owners: native analytic parameter access/image evidence in `hyperbrep::geometry`
and `topology`; support mapping, units, emitted chart receipts and selected
topology in `hyperbrep-io::step::{advanced,write::advanced}`. Extend the current
shared graph and mapping types. Preserve all current Plane/Cylinder output
bytes, imported source maps, malformed controls and completed composition
workflows. Include whole and cut tori, sector/band continuation, reflection,
unit changes, unwrapped seams, exact near offsets and typed unsupported cases.
OCCT remains an optional floating-point interoperability check, never an exact
source authority. No code from these references was copied.
