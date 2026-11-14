# Trajectory coefficient and remainder argument

The prepared exact program defines a1=F and recursively
`a(k+1)=(partial_t a(k)+sum_i F_i partial_x_i a(k))/(k+1)`.
Hypersolve constructs each requested first partial with its original source
association. The recurrence only appends exact multiplication/addition/division
nodes and preserves every source/derivative guard output. Degree k divides by
the exact positive integer k. Original output positions 0..N remain F at every
stage; current coefficient positions are retained separately.

Picard certification first proves a unique solution for every initial point
on the whole proposed time interval. Its returned tube contains every such
trajectory. The existing TaylorModel authority, applied to F over time times
that tube, supplies an analytic source-domain proof, including time dependence.
It uses the existing exhaustive primitive check and full-domain regularity guards;
C1 in state alone is not assumed to prove time analyticity. Generated derivative
formulas must also evaluate successfully with full coverage. A source may fail
these sufficient representation-dependent checks without being mathematically
nondifferentiable. The existing Picard path is retained independently.

Along any admitted trajectory the chain rule gives
`d^k x/dt^k = k! a(k)(t,x(t))`. Taylor's integral remainder for degree n is

`h^(n+1) (n+1) integral_0^1 (1-u)^n a(n+1)(t0+u*h, x(t0+u*h)) du`.

The weight is nonnegative and integrates to one. Thus a Cartesian enclosure of
a(n+1) over the full time/tube product encloses the weighted average in each
coordinate. For uncertain initial points, evaluating a1..an on t0 times X0
contains their individual initial coefficients. Native outward interval sums
include every coefficient term and the complete next-order contribution.
The same argument for each elapsed s in [0,h] proves the trajectory tube.
No common Lagrange point across coordinates or independence of coefficients is
assumed. These are conservative Cartesian images; flow correlations are not
claimed preserved by the projection.

Intersection with the independently certified Picard endpoint and tube preserves
all solutions. An unexpected empty intersection is a typed failure. Publication
occurs only after both complete contributions, intersections and final budget/
cancellation checks. Empty initial sets retain canonical empty without asserting
existence; malformed times still fail before that shortcut. Unit zero-dimensional
products remain nonempty. Public reports cannot accept a foreign derivative or
Picard certificate: both are constructed from the privately retained field.

A fixed analytic-domain requirement is a sufficient contract of this opt-in
verifier, not a universal characterization of smooth flows. Preparation, proof
size, expression/scalar growth, and width costs can grow with finite order. The
charged graph/native budgets and their documented exclusions remain in force;
controlled exhaustion is not a successful high-order flow proof.
