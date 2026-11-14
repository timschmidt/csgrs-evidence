# Initial harness corrections and limits

The initial missing-consumer compiler failure is reproduced on the baseline before
implementation. Subsequent first-test compiler failures were fixture API mistakes:
Real division is fallible, and Expr has no exponential node. Checked divisions now
unwrap only positive constant denominators in independent expectations. The nonlinear
fixture uses the normalized inverse Shockley equation ln(1+I)-V=0 on I>-1, within
the existing expression grammar. Its logarithm-domain rejection is explicitly tested.
No exponential implementation or automatic diode lowering is claimed.

The first executable resistor test incorrectly required a minimal derivative hull.
The existing Jacobian generator emits R/R^2 for the V partial of V/R, yielding
[1/4,2] on R in [1,2], rather than the mathematical derivative range [1/2,1].
The admitted lower-layer contract promises containment, not a minimal hull. The
final test asserts the actual conservative bounds and matrix norm, separately
retains the analytical [1/2,1] range as an independent inclusion requirement, and
checks exact derivative values at all corners. No production derivative rule,
source fixture, domain or policy changed to conceal this overestimation. The first
failure is retained. The benchmark requires the same completed conservative output
for preparation/reuse comparisons; it makes no tighter-enclosure claim.

The algebraic-source test was added after the full 116-test core run. The final
focused run passes 11 cases; the subsequent all-feature/all-target Clippy includes
that final test. No full-core count of 117 is asserted without a full rerun.

The external allocation observer initially retained an unused generic measurement
helper copied from the previous observer, producing a dead-code warning. It was
removed before the final observer build; the first build log remains available.
