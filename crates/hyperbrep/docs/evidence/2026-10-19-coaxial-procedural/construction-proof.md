# Common-axis reduction and replay proof obligations

For strictly positive radius, the map
`F(r,z,[theta]) = O + z*a + r*(u*cos(theta)+v*sin(theta))`
is a homeomorphism from `(0,infinity) x R x S1` to space minus the axis,
where `(u,v,a)` is an admitted orthonormal frame. The complete turn identifies
only the angular period. Compact admitted profiles have positive axis clearance,
so taking closure or interior of the represented bounded sets introduces no
axis point. Consequently union, regularized intersection, difference and XOR
commute with this common product embedding. This argument does not apply to a
partial turn or a profile touching/crossing the axis.

`boolean_kernel/revolution.rs` obtains private profiles from already admitted
solids and proves equal or opposite unit directions and zero transverse origin
displacement with the existing exact predicates. The second meridian chart is
`(r,z) -> (r, dot(O2-O1,a1) +/- z)`. A complete turn has no privileged meridian
ray; no angular fitting or tolerance is needed. Noncoaxial or unresolved proofs
remain explicit unsupported/uncertain outcomes through existing dispatch.

`CertifiedRevolutionProfile::region` reconstructs the filled region using
Hypercurve and the admitted material/cavity roles. The existing Hypercurve
Boolean supplies contact, winding, source, selected-root and parameter evidence.
The native polygon path remains native. Other results use the existing
`revolve_curve_region`, which independently admits each ordinary complete
product shell and cavity before publication. Empty regions become canonical
empty body sets. Common similarities/reflections pass through ordinary model
transform validation. No serialized revolution-certificate flag is introduced.

Native revolution admission traverses surface groups in stable arena-ID order.
The first group seeds the retained meridian cycle and radial frame; randomized
hash-map traversal previously changed this source sequence across identical
cold admissions. Stable traversal changes neither the surface groups nor any
geometric admission predicate. It preserves the source chart sequence required
by downstream deterministic composition. This is reproducibility for the same
authored arena order, not canonicalization of differently authored equal sets.
The retained-chord scalar-chart implementation is unchanged by this fix.

Two supporting lines determine one point only when each support is nonzero
and their tangent cross product is nonzero. Hypercurve's existing checked chord
constructor and `supporting_line_intersection` prove these facts and recompute
side classifications. The new point definition stores all four original
endpoints; an intersection need not lie on either finite witness segment.
Every endpoint must have a strict-replay-compatible definition. Parallel or
coincident supports produce `ParallelLineSupports`, degenerate supports retain
`ZeroLengthLine`, and unresolved decisions remain typed blockers. No stored side
or certainty receipt is accepted as the replay proof.

Coordinate-image NURBS contacts retain the shared original root representation.
The existing root-admission method reconstructs its native selected parameter,
including the isolator's endpoint ownership. Point definitions, affine forms,
and affine line-parameter construction reuse that owner conversion. They do not
substitute independent coordinate roots. Independent supporting-line fields keep
their original affine-form source instead of expanding an incidental scalar
view, which previously caused non-idempotent archive growth.

These are mathematical arguments tied to executable entry points and exact
assertions, not formal verification of production Rust. General surface
arrangements, singular cases, total computation/heap/coefficient/cancellation
bounds, complete construction-intent provenance and shipped distributions remain
open. Metadata record limits bound input structure, not replay work or stack use.
