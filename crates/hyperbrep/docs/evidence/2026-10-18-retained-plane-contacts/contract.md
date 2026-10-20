# Retained finite curve/plane contacts

Baseline `f88e9882b87a9c969237c5d54388d888a9c99f32` on `brep`; a fresh
upstream fetch still names `540074a8c05ccc676d7c70b8f0093f98804b81d9`.
The previous selected-planar increment is committed progress. Preserve its
complete workflows, 212 WASM groups, 432 native/STEP artifacts and every
recorded adverse cost. All 28 full-plan work packages remain open/in-progress.

The construction trace finds scalar assumptions in planar-image source charts,
profile vertices, axial edges and extrusion-side pcurves. A complete selected
procedural-profile extrusion needs those representations together; changing
only a constructor guard would publish an incomplete model. That remains work.
The next shared dependency is exact contact output consumable by existing
selected-point queries and edge splitting: `CurveSurfacePoint` currently stores
only `Real` and `Point3`, and general nonzero cubic/higher plane equations and
planar-image/plane dispatch are unsupported.

Before implementation, reproduce a cubic curve/plane root of `2t^3-1`, its
nonunit NURBS equivalent, and an actual nonlinear parallel/plane contact on
this revision. The new contract must retain the original spatial source,
selected parameter and frame instead of reconstructing independent scalar
coordinates. Required consumers include exact point/plane predicates,
coordinate separation, affine transforms, edge splitting, opposite edge uses,
native cold replay and subsequent supported solid operations. STEP encoding
limits remain explicit; exact contact does not imply format encodability.

Hypercurve owns planar contact/root/normal-sheet predicates and their proof
domains; Hypersolve owns algebraic solving; HyperBRep owns spatial projection,
source-chart transport, contact assembly and topology. IO owns STEP boundaries.
Keep formulas in their earliest sufficient owner. This advances WP02/WP05b/
WP06/WP08 under P1-P6, P8-P11, P14-P20, P24-P27 and P35-P39.

Test complete finite root sets, repeated roots, tangencies, endpoints, reversed
and nonunit charts, NURBS joints, disjoint/contained curves and partial or mixed
coincidence. Do not treat absence of a transverse certificate as a tangency
proof. Retain branch-specific evidence or expose the missing classification
explicitly. Distinct visits to the same spatial point keep distinct parameters.
No false empty result, discarded overlap, fitted curve or approximate coordinate
may replace an unavailable proof. Signed-weight planar poles, invalid inputs,
strict/approximate/strict reuse, tiny exact gaps, budget exhaustion and recovery
need separate controls.

This is greenfield development: a coherent public contact-carrier API break is
allowed, with consumers migrated directly. No compatibility shim or adapter.
Preserve existing numerical/topological meaning and deterministic archives
unless an explicit representation migration is necessary and recorded.
Record the actual local/downstream native and WASM checks, retained failures,
same-contract costs, allocations, sizes and resource limits. A fixed precision
or solver counter is not a bound on all work, retained heap or cancellation.
Use external containment while those internal contracts remain open.

Research: CGAL's [algebraic kernel](https://doc.cgal.org/latest/Algebraic_kernel_d/classCGAL_1_1Algebraic__kernel__d__1.html)
retains root-selection evidence and supports exact algebraic queries. Its
[circular arcs](https://doc.cgal.org/latest/Circular_kernel_2/classCGAL_1_1Circular__arc__2.html)
separate the supporting curve from algebraic endpoints. Reusing this stack's
existing selected authorities and keeping spatial parameters attached to their
source is our implementation decision, not an external proof of this code.

The strengthened containment consumer reproduced a separate BRep projection
frontier (`migrated-frontiers-1.log`): `planar_pcurve` still rejected a finite
planar image after exact containment. Extend that public conversion only where
the source frame projects through a certified owner similarity. Keep the actual
source interval and signed source-to-spatial affine map; test exterior, reversed
and restricted charts against `U=(y+3)/2`, `V=(5-x)/2`. Uncertified similarities
retain the owner's typed construction failure. This is a pcurve materialization
extension in BRep, not a general affine transform for procedural Curve2 sources.

The independent full-multiplicity knot probe in `final-review/joint-probe`
found that a partial planar NURBS coincidence could publish a closed range
whose endpoint has unresolved one-sided point images. Isolated contacts already
propagated the owner's `Boundary` blocker. Closed ranges must certify both
transported endpoint images on the target plane before publication. Keep that
check in BRep's contact assembly; retain typed owner failures and require
recovery on unambiguous interior contacts and finite subcurves in both directions.
