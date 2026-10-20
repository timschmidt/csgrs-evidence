# The retained diagonal STEP blocker

This is a feasibility review for future work, not an implemented STEP extension.
The current [full-size native fixture](final-prism-artifacts/cylinder-cover-diagonal-difference.json)
and its [consumer log](final-prism-cylinder-cover-diagonal-difference-1.log)
preserve the successful native result and `WriteError` / `NonRational` export
failure. No fixture, writer, topology or serialization policy changes here.

STEP Tools' published merged schema constrains `ADVANCED_FACE` edge endpoints
to Cartesian vertex geometry in WR3, and vertex-loop geometry similarly in
WR6. The general `VERTEX_POINT` attribute being typed as `POINT` does not
remove those narrower constraints. Consequently, using `POINT_ON_CURVE` as a
replacement for an irrational vertex would not conform to this advanced-face
profile. Check the exact targeted AP/edition and its additional rules before
any future extension. Sources reviewed 2026-10-18 UTC:
[advanced_face](https://www.steptools.com/docs/stp_aim/html/t_advanced_face.html),
[vertex_point](https://www.steptools.com/docs/stp_aim/html/t_vertex_point.html),
[point_on_curve](https://www.steptools.com/docs/stp_aim/html/t_point_on_curve.html).

The merged `ADVANCED_BREP_SHAPE_REPRESENTATION` permits mapped items but
requires their source to be another advanced BREP representation. This opens
an instance/assembly route for suitable models, not a general exemption from
Cartesian endpoint constraints. Source:
[advanced_brep_shape_representation](https://www.steptools.com/docs/stp_aim/html/t_advanced_brep_shape_representation.html).

There is also a direct obstruction for this particular topology. Its lower
vertices are exactly

```text
v0 = (-5 sqrt(2)/2,  5 sqrt(2)/2, 0)
v1 = (-5,           0,           0)
v2 = ( 0,          -5,           0)
v3 = ( 5 sqrt(2)/2, -5 sqrt(2)/2, 0)
```

Thus `v3 - v0 = sqrt(2) (v2 - v1)`. Every affine map preserves this relation
between differences, and an invertible map keeps the second difference
nonzero. Two nonzero rational-coordinate vectors cannot have the irrational
ratio `sqrt(2)`: taking any nonzero component gives a contradiction. Finite
decimal Cartesian coordinates are rational. Therefore one invertible affine
instance transform cannot turn all four existing vertices into finite-decimal
Cartesian points while retaining this topology. This conclusion is our
algebraic inference from the retained native coordinates; it is not a result
claimed by the schema source or a general impossibility theorem for all STEP
representations.

Future options need separate contracts and acceptance evidence: an explicit
exact representation-normalization operation with complete topology/source
mapping, a different conforming procedural representation where supported, or
an explicitly lossy exchange operation with a declared error budget, retained
source qualification, and independently admitted output topology. Ordinary
coordinate rounding, point substitution or dropping existing vertices cannot
be credited as this strict writer's exact completion. Keep the original full
case and typed failure while implementing the broader CAD/STEP roadmap.
