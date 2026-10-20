# Exact selected Bezier images

[Shene's subdivision notes](https://pages.mtu.edu/~shene/COURSES/cs3621/NOTES/surface/bezier-sub.html)
explain how the de Casteljau net gives complete polynomial subcurves of the
same degree. This supports an exact affine reparameterization, not replacement
by an endpoint chord. Reviewed 2026-10-18.

The implementation reuses existing Hypercurve subdivision. For the original
parabola, `x(t)=4t-2`, `y(t)=(4t-2)^2`; clipping at `y=2` selects the two roots
of `8t^2-8t+1`. Existing root projection replays each quadratic candidate against
that polynomial and its unique-root isolator, without publishing a scalar into
the original selected-field cache. Substitution `t=a+(b-a)u` gives the exact
control points `(-sqrt(2),2)`, `(0,-2)`, `(sqrt(2),2)` for the retained arc.
The area under `2-x^2` on `[-sqrt(2),sqrt(2)]` is `8*sqrt(2)/3`; inclusion-exclusion
with the original rectangle gives XOR area `22/3+16*sqrt(2)/3`.

These formulas are independent expectations for the original fixtures. They
are not universal root-solving, arbitrary selected-field materialization,
simplicity, shell-embedding, or integration certificates. Hypercurve's rational
subcurve operation additionally verifies that the transformed denominator has
no roots on the active unit interval. The BRep path still requires its separate
whole-boundary and material proofs. STEP Cartesian vertices remain subject to
the existing exact finite-decimal representation contract.
