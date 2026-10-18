# Proof ownership and limits

The new orientation query proves simplicity before interpreting winding. Complete
carrier-pair replay must leave one unsplit fragment per injective carrier, no
overlaps, a cyclic endpoint walk, and no repeated start vertex. Every authored
span must survive unary normalization; removing retracing is useful region
normalization but cannot establish that the original path was simple. Existing
arrangement winding decisions then distinguish interior-on-left (+1 inside,
zero outside) from interior-on-right (-1 inside, zero outside). No endpoint
polygon or sampled tangent establishes this result.

This uses the simple-loop winding principle described in
[Erickson's winding-number notes](https://jeffe.cs.illinois.edu/teaching/comptop/2020/notes/02-winding-number.pdf).
The distinction between orientation and a proof of simplicity also appears in
[CGAL's polygon orientation precondition](https://doc.cgal.org/Manual/3.1/doc_html/cgal_manual/Polygon_ref/Function_orientation_2.html).
Those references motivate the contract; they are not formal verification of
this implementation. The retained-pair and winding code, exact regressions and
independent point expectations are the executable evidence.

For a positive-weight rational Bezier curve, plane incidence has a Bernstein
numerator divided by a strictly positive denominator. Every zero numerator
coefficient proves whole-curve containment at any degree. NURBS containment
requires this proof on every exact Bezier span. Nonzero higher-degree equations
still need their own root contract. Endpoints on a plane do not suffice: the
negative native fixture retains both endpoints while moving an interior control
off the plane.

HyperBRep separately proves prism cap pairing and transverse translation.
A simple outer loop minus strictly contained disjoint simple holes has positive
material area, whether or not an integral is represented. The cap frame's
orientation, its face sense and transverse translation therefore prove shell
orientation. Full inward archives still fail with InwardSolidShell. Replay
rebuilds these proofs from native carriers; no trusted archive flag or positive
placeholder volume is introduced. Existing represented measurements are kept.
When a prism has no represented profile area, its volume query is explicitly
UnsupportedMeasurement.

The new fallback handles absent integrals (Ok(None)). Errors encountered while
attempting an available integral still propagate. Fully deferred metric
computation, certified integration, arbitrary shell orientation and retained
non-native spatial carriers remain separate work. The selected parabola Boolean
fixture now has a lower-layer orientation proof without materializing its
endpoints; its extrusion still lacks the spatial representation bridge.

Independent exact native probes use Bernstein evaluation at t=1/2. The profile
(0,0),(1,-1),(2,-1),(3,-1),(4,-1),(5,0), with weights 1,2,3,4,5,1,
has midpoint (295/107,-105/107). The independently authored STEP profile has
midpoint (22/107,-412/107). Positive weights and increasing control x establish
the graph domain; exact offsets of 1/10^12 distinguish material from exterior.
The external OCCT probe uses an independent numerical Green integral solely for
interoperability. Neither its quadrature convergence nor its mass estimator is
a certified error bound, and neither is consumed by production geometry.
