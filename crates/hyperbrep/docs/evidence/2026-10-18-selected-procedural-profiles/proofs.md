# Retained definitions and proof obligations

This describes the implementation's finite domain and the witnesses its tests
exercise. Final admission requires the separate qualification, consumer,
artifact and cost records; these definitions alone are not verification.

## Lowest sufficient owner

Hypercurve retains `CurveParameter2` authority through authored affine maps and
correlated affine points. `CurvePointAffineForm2::parameter` first reuses exact
constant coordinates and the original scalar parameter when the source is
already affine in that parameter. Otherwise it constructs a correlated field
query with its source recipe. It does not eliminate x and y independently.
A strict-compatible similarity is composed into the affine coefficients both
when a recipe is retained and when it is replayed.

`CurvePointDefinition2` contains authored coordinates, rational evaluation,
regular analytic-parallel evaluation, correlated rational coordinate expressions
in one selected parameter, or a strict-compatible similarity. Replay proves a
nonzero denominator and, for a nonzero parallel distance, a defined source
normal. General recursively constructed points without these definitions are
explicitly unsupported. No serialized certainty or regularity flag is trusted.

`Curve2::scalar_chart` keeps the original curve available in its returned view.
Authored scalar charts are borrowed. Retained rational fragments become checked
restrictions in their original scalar chart. A point-ordered straight chord
requires a certified authored affine support; conservative bounds choose a
finite authored support interval, while its endpoints retain their own fields.
Hypercurve proves support incidence and finite ordering. Native line evaluation
can recover the retained point only when the affine query is the inverse line
chart and the point lies on the complete support and inside the finite domain.
The off-support regression prevents a coincident query value from becoming a
false point-identity proof.

`BezierParameterRange2` uses the existing retained-root comparison cascade.
Two distinct selected roots with overlapping isolators need refinement rather
than an interval-only failure. The regression keeps the original quartic
polynomials and isolators and checks increasing, decreasing and equal ranges.
This does not add a solver, a precision tolerance or an independent root cache.

## Spatial carriers and side images

BRep's `Parameter` owns a `CurveParameter2`. `Curve3::domain`, closed surface
domains and contact-pcurve domains use `ParameterRange`. Coefficient consumers
request explicit fallible represented views. `PlanarCurveGeometry` stores
`source_scale` and `source_offset`: represented endpoint intervals use the unit
spatial chart; selected intervals use a signed source chart. Source restrictions
stay finite through projection, bounds and inverse queries. General affine
spatial frames remain exact; planar projection requires an owner-certified
similarity where Hypercurve's source representation requires one.

`Curve3::translation(origin, displacement)` represents `origin+t*displacement`
on the unit interval. An authored origin uses the native line carrier; a retained
origin keeps its source curve and selected parameter. Displacement must be
nonzero. Authored-parameter evaluation, subdivision and invertible affine
transforms retain the source. Independently selected axial evaluation remains
unsupported. Missing independent point coordinates report
`UnrepresentablePoint`, not an invalid parameter or a zero coordinate.

Construction reuses represented planar endpoints and their existing rational or
named scalar facts before requesting a retained spatial point. Repeated slab
reconstruction must not replace these available facts with opaque expressions.
The original archive corpus checks this alongside exact geometry and topology.

Selected side pcurves retain their exact UV corners. Coordinate correspondence
uses one U/V coordinate with nonzero authored scale and offset. Whole-image
admission requires a straight pcurve with constant orthogonal coordinate and
compares the entire extrusion profile or axial translation image. It also
checks the actual endpoint correspondence and the edge domain. Reflection
transports the coordinate map; ordinary traversal reversal alone does not
reflect the surface coordinate. This is separate from a sampled endpoint test.

Prism admission traces straight cross-cap chains after excluding the cap edges.
Every chain is nonbranching, collinear and forward, has distinct cap endpoints,
and belongs to the complete cross-edge inventory. All chain displacements must
agree. A lateral boundary contains two whole chains, cap boundaries and no
unaccounted edges; partial chains fail. Existing full edge/surface, wire,
orientation and shell checks still apply. This extends the prism recognizer,
not general shell embedding or arbitrary self-intersection detection.

## Cold replay and consumption

Archive version 10 replaces version 9 without a reader adapter. The selected
DAG adds affine point-query definitions with references only to earlier nodes;
correlated expressions retain one defining parameter. Translation origins,
planar source maps and retained chord pcurves are definitions, not cached proof
objects. Syntax/record/degree/element admission accounts for nested sources and
variable polynomial arrays before scalar decoding. Geometry validation then
rebuilds all applicable proofs. These limits do not bound coefficient arithmetic,
total geometry work, retained heap or cancellation.

The full nonlinear cap and its quadratic closing segments remain in the
selected clipping fixture. Subsequent workflows consume the constructed solid
through authored axial and selected profile splits, cold replay, reflection and
shear, holes, disconnected components, reversed contours, repeated slab cuts,
reunion, both directed identities and canonical empty recovery. Independent
inside/outside/boundary expectations include exact 1e-12 gaps. Forged records,
zero work budgets and strict/approximate/strict reuse have separate outcomes.
STEP must preserve its existing attributed carrier rejection and permit native
recovery. Exact native persistence does not establish STEP encodability.

## Explicit finite-source encoding

Two preceding pole-exclusion archives represented a rational planar image with
the original source and source endpoints `[0, 1/2]` (or reversed). Version 10
stores that identical source in the source table and wraps it in the explicit
restriction `[0, 1/2]`. Its source chart `(scale, offset)` is respectively
`(1/2, 0)` or `(-1/2, 1/2)`. In both cases the spatial parameter domain is
`[0, 1]`, and every parameter evaluates the same source at the same argument.
The original source coefficients, root selectors, points, frames and topology
remain unchanged. Keeping the full source without this restriction would
incorrectly expand the new carrier's domain.

The original narrow comparison and its failure remain recorded. The
[supplemental comparison](final-review/finite_source_comparison.py) requires
exact field equality outside these schema changes, consumes every added source
definition, and proves the interval and affine-map relation with rational
arithmetic. Both traversal directions pass. Changed finite endpoints, source
coefficients, source references, reversal flags, chart scales and unconsumed
definitions fail, as do the six earlier scalar-fact losses. This is an evidence
relation for the intentional migration, not a production compatibility reader
or a substitute for independently checked geometry workflows.
