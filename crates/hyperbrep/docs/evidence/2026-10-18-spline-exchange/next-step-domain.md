# Next retained-profile handoffs

The frozen final diagnostic preserves all seven original recipes. In
[difference](final-original-difference-1.log) and its reversed affine image,
the original region still classifies exactly, but its retained quadratic and
chord have selected endpoints without stored coordinates. The independent
area query returns unsupported; extrusion returns `UnsupportedPlanarProfile`.
The two observations are separate handoffs, not evidence that fixing area
alone admits the solid. XOR and both affine variants remain in the corpus.

Source review of [construction](../../../src/construction.rs) identifies
`persistent_curve_image` before the component-area query: its current complete
native-image bridge is limited to lines and circular arcs. HyperBRep already
retains selected spatial points and trim ranges, but its current extrusion
assembly still expects native profile coefficients. Investigate this assembly
and the shared Hypercurve image/measurement APIs together.

Hypercurve's existing
[selected-root projection](../../../../hypercurve/src/bezier_parameter/represented_roots.rs)
can prove a quadratic root's exact scalar view by replaying its defining
polynomial and isolator. It deliberately leaves the original selected-field
authority and caches unchanged. This is a possible ingredient for a narrow
complete native polynomial-image view, not permission to sample a root or
discard source parameters. Reuse that proof if applicable; do not reproduce
root formulas in HyperBRep or IO. More general selected roots require their
own representation and integration contract.

Before implementation, reproduce the cases on the next committed revision and
add missing public acceptance for the entire workflow. Preserve the original
exact expected areas `8*sqrt(2)/3` (difference) and
`22/3 + 16*sqrt(2)/3` (XOR), affine determinant factor 6, all source-selection
evidence, near-boundary classification, holes/components, native cold replay
and continued modeling. Hypercurve owns planar images and integrals;
HyperBRep owns spatial lifting, topology and replay. STEP must continue to
report unencodable irrational vertices explicitly. No next-step implementation
or completion is established by this source review.
