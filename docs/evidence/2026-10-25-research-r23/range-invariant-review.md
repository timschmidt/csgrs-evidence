# Final source-range invariant review

The extremum membership helper consumes ascending native source ranges.
CurveSourceRange2::validate requires start < end in the authored chart.
Curve2::subcurve_at_parameters likewise validates strict source ordering after
normalizing retained subdivision parameters. SelectedFiber reversal toggles a
separate reversed flag and swaps endpoint access; it does not reverse range.
BezierSplitFragment2::RetainedBezier carries ordered start/end plus traversal.
Thus filtering start <= stationary parameter <= end preserves the active image
for the supported rational retained cases. Reversed chord parameter types have
their own comparator and are outside this rational stationary-root branch.

RationalBezier2::denominator_sign always uses STRICT for the active-domain
proof. Its unit cache is populated only from whole-unit control weights or a
whole-unit root-exclusion proof; a proper trim cannot set that certificate.
The cached monotonicity computation requires that finite-unit proof before
publishing monotonicity. The second candidate's early monotone reuse therefore
preserves the same proof obligation; nonmonotone/trim paths still perform an
explicit active-range denominator check before selected-point creation.

This is source review supporting the executed reversal, source-drop, source-
parameter replay and inside/outside-pole tests, not a formal proof claim.
