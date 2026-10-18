# Meaning, reconstruction and boundaries

The encoded curve is the procedural definition
`P(t) + d * left_normal(P'(t))`, with the existing zero-distance convention.
Polynomial controls or homogeneous rational controls determine `P` completely;
the signed distance determines the normal sheet. No sample, endpoint chord or
fitted spline replaces this definition. Zero-weight rational controls are kept.
The ascending range and independent traversal flag determine the finite curve.

`Curve2::analytic_parallel()` borrows both direct parallel fragments and the
analytic selected-fiber restrictions produced by subdivision. It borrows the
original curve as well, so callers can retain its endpoint evidence. Other
families return no view. Obtaining this structural view performs no predicate
or coordinate reconstruction. Reading its range may initialize the existing
structural parameter-domain cache; it does not refine or materialize a root.

The archive reuses the existing selected-root graph. One root and one affine
image node encode the tested transported cubic selector, shared by forward and
reverse pcurves. It does not serialize refinement caches, pointer identity,
regularity bits or a trusted image certificate. The root's defining isolator
is serialized; subsequent refinement caches are not. Non-Bezier selected
parameter fields still fail typed at the existing graph boundary.

Loading reconstructs each source and selector, checks ascending nonempty range
order, then calls Hypercurve's checked parallel constructor on the oriented
range. That owner rechecks poles, undefined source normals and unsplit interior
cusps. Cusp endpoints remain admissible. Zero distance removes the need for a
source normal, but does not remove the need for a finite rational source.
The complete strict proof can fail or exhaust resources; the raw carrier does
not become a model on that path. Numerical certainty about these current
definitions does not certify the intent of an earlier approximate authoring
operation. Full authoring-history persistence remains open.

The independent quadratic expectation uses `P(t)=(4t,4t(1-t))`, with unit
normal `(-(1-2t),1)/sqrt(1+(1-2t)^2)`. Interior values include `(2,2)` at
`t=1/2` and `(1-1/sqrt(5),3/4+2/sqrt(5))` at `t=1/4`, for distance one.
Definition equality additionally compares the complete source, distance,
range and traversal, covering the complete image rather than only those
points. Replayed cap paths classify both sides of their apex with exact
`1e-12` offsets, in both directions and under an orientation-reversing planar
similarity. These pcurve paths use native straight closing segments. The
original seven-profile extrusion diagnostic, including its quadratic straight
segments and full nonlinear cap, is retained unchanged as a separate frontier.

The new complete workflow is an unattached pcurve model, its archive and
subsequent supported planar operations. It does not prove that a spatial edge
agrees with a pcurve, that a shell is embedded, or that an offset solid can be
constructed. No STEP representation or measurement availability is added.

Source records, degrees and controls are charged in the same pre-decode
metadata pass as other geometry. A malformed scalar payload whose source
degree exceeds the allowance fails resource admission before scalar decoding.
The existing solver-work scope can reject cold cusp replay, then recover on
retry outside the exhausted scope. The simple selected arch needs no instrumented refinement
and remains valid under a zero allowance. These counters do not bound all
scalar work, heap bytes, coefficient growth, cancellation or elapsed time.

New owned archive data is acyclic: roots precede chart images; parallel
definitions contain source controls and references to the existing parameter
graph. No new persistent cache, global identity map or source back-reference
is introduced. Repeated serialization, cold replay and strict/approximate/
strict scopes exercise existing cache semantics. This is not a proof of
operation-wide memory bounds or of every concurrent lower-layer cache state.
