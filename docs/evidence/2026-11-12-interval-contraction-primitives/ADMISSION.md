# Contraction and identity-remainder primitives

Baseline: be11e97da74bf8221dbe18e6c17f1c54e5ce9b6b.
Owner: hyperlattice-interval, scalar constants delegated to Hyperinterval.
Properties: P1, P3, P5, P6, P18–P20.
Domain: checked finite Cartesian square matrices over the six existing real
interval backends, including canonical empty and zero-dimensional unit.
Add identity_minus and contraction_margin_one/infinity. No solver status or
Jacobian validity claim. Positive lower margin is numerical norm evidence;
zero-containing or negative margins never become uniqueness/no-root claims.
The exact one constant must be representable in the backend. In particular,
fixed i32 F31 and i64 F63 report Overflow for positive-dimensional identity
subtraction and nonempty margin queries; empty remains empty and 0x0 identity
subtraction remains the unit without constructing a one. Arithmetic is composed
from existing checked scalar methods in deterministic order. No predicate
policy/dispatch or production consumer migration.
Dyadic operations share a caller budget; constant constructors have the same
explicit exclusion as existing zero constructors. Rational work is unbounded
internally. Fixed loops are dimension bounded, no heap. No partial output.
Missing witness: named identity subtraction and contraction margins do not
compile on baseline. Acceptance: independent integer-member extrema, all six
backends, exact fractional Krawczyk images including unequal radii and a
two-root example, output reuse/replay, overflow, exhausted budget and retry,
primitive allocation count, no_std builds and facade/solver downstream checks.
No full phase completion, performance improvement, solver migration or push
claim follows from this additive extension.
