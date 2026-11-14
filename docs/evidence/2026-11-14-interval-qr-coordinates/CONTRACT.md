# Exact QR coordinates for validated dynamics

Owner: Hypersolve certifies finite exact frame construction and source-bound
coordinate changes. Hyperdynamics retains field/time/state meaning and reuses
native Picard/Taylor/transition consumers. P1/P5/P6/P8–P10/P19–P20/P35–P39,
plan 10.7 and Phase 13. This is exact QR frame construction and its use in
validated steps, not an automatic whole-horizon Lohner/QR integrator or completion
of the full fifteen-phase objective.

Missing witness: construction of an orthonormal frame and exact inverse from a
finite full-rank basis, then source-bound native step certification and endpoint
transport without a caller-authored inverse. Reproduce the missing API first.

Input: square finite exact Real basis M in row-major state order, exact origin
and variable bindings. Rational/algebraic data and arbitrary finite dimensions,
including the zero-dimensional unit, are supported when strict decisions and
configured budgets complete. Existing coordinate-program support remains intact.
Use unpivoted modified Gram-Schmidt with positive principal diagonal; no tolerance
or sampled rank. Compute dot products with Real::sum_products. Retain M, Q, R,
norm decisions, strict Q-transpose*Q=I admission and strict Q*R=M residual proofs.
Zero residual norm proves a dependent column. Unknown rank/reconstruction remains
unknown, never singular/zero by default; scalar and budget failures remain typed.
Do not discard residuals or silently round generated Q into a rational chart.
Orthogonal frames may reverse orientation; no proper-rotation claim is implicit.

The existing coordinate verifier owns inverse/source mapping. The adapter must
reuse its validated program and the existing field constructor, not construct a
parallel kernel or rediscover a completed inverse proof. Keep original source,
basis, origin and inverse/reconstruction evidence together. Native outputs must
feed exact chart transitions and further Picard/Taylor steps. Replay source and
request from definitions; no serialized orthogonality flags are authoritative.

Shared graph work and structural entries charge shape visits, product-sum setup,
normalization, exact residual checks, generated chart construction and publication.
There is no unbounded refinement/retry. Existing Real arithmetic/refinement and
predicate internals, scalar payload lifetime, total heap and within-scalar
cancellation exclusions remain explicit. These are not whole-work or heap bounds.
Only actual final checks permit completed output. Test final cutoffs, cancellation
and larger-budget retry, preserving rank-deficient/undecided/exhausted distinctions.

Independent expectations: rational 2D/3D decompositions, algebraic orthogonal
frames, reflected bases, nearly dependent but distinct columns, dependent columns,
malformed shapes/bindings, unit dimension, exact field/Jacobian chain rules,
rotated flow certificates and fresh-process reconstruction. Reuse the shared
coordinate shape validator and exact sum-products; no duplicate inversion or
interval arithmetic. Keep every original hard case and failed draft.

Qualification: old-feature binary/layout controls, owner and downstream checks,
completed materialized flow/reframing fixtures with explicit resource budgets and
independent expectations. Measure preparation separately from repeated native
queries; do not claim that a changed coordinate metric gives universal tightening
or performance gains. Preserve pending extraction, sibling edits and all frozen
evidence. Adaptive frame/step/order selection, noise-symbol retention, broader
adoption and release obligations remain open.
