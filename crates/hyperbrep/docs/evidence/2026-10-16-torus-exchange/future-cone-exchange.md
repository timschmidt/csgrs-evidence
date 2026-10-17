# Cone exchange feasibility, not an implemented capability

Reviewed 2026-10-17 while qualifying the torus increment. STEP defines a cone
using its semi-angle, while `surface_of_revolution` retains a generating curve
and axis with the generating parameter as its second coordinate. The standard
therefore supplies a possible exact representation that does not require a
finite-decimal cone angle. This is an implementation inference, not an
interoperability result. [Part 42 geometry definitions](https://www.steptools.com/stds/smrl/data/resource_docs/geometric_and_topological_representation/sys/4_schema.htm#surface_of_revolution)

`advanced_face` permits swept surfaces with a line, conic, polyline or B-spline
generator. Its polyline rule requires at least three points; a two-point
polyline shortcut would violate that rule. A degree-one B-spline is one
candidate when a finite generating interval is needed.
[Advanced-face constraints](https://www.steptools.com/stds/stp_aim/html/t_advanced_face.html)

The smaller candidate is a `LINE` through the apex, with projective direction
ratios and `VECTOR` magnitude one. STEP normalizes direction ratios when
interpreting a vector, so an irrational norm need not be serialized just to
encode a unit generatrix. [Direction and vector definitions](https://www.steptools.com/stds/smrl/data/resource_docs/geometric_and_topological_representation/sys/4_schema.htm#vector)

The native [cone evaluation](../../../src/geometry.rs) uses slant distance:
`S(u,v) = A + v*(sin(alpha)*radial(u) + cos(alpha)*axis)`. Inference: rotating
the unit line with direction `sin(alpha)*x + cos(alpha)*axis` gives this same
parameterization. With output length scale `L`, the candidate map is
`u_step = u_native` in radians and `v_step = v_native/L`. Its normal orientation
is preserved for positive `L`. This derivation still needs executable admission.
Use the existing exact projective-direction authority and retain any typed
number-encoding blocker; do not assume every symbolic frame is encodable.

An unbounded line sweeps both cone nappes, whereas the native cone has
nonnegative slant distance. The importer must certify the selected face domain
and its apex handling before recognizing the positive cone. The generic native
revolution constructor instead takes a finite profile; reusing it blindly would
change the domain. A finite B-spline profile needs its own affine parameter map
and recognition proof. These are reasons to prototype both representations,
not to admit an unsupported negative branch or discard a singular endpoint.

Before implementation, compare native cone and revolution parameterizations,
including their oriented normals, periodic seams, finite domains and inverse
maps. A STEP representation change must preserve native cone continuation
after import; merely constructing a generic revolution is insufficient if the
next Boolean becomes unsupported. Recognizing the exact conical generator
belongs in native geometry; entity selection and parameter-unit conversion
belong in `hyperbrep-io`. Exercise whole-image admission and full-size existing
cone recuts, reconstruction, clear, replay and independent exact measures.

Prototype both a directly representable `CONICAL_SURFACE` and a finite exact
revolution encoding. Keep nonrepresentable coordinates, apex singularities and
general trims typed. Independently read resulting files with OCCT, preserving
its diagnostics; float interoperability is separate from exact acceptance.
No new cone support or measured performance is claimed by this note.
