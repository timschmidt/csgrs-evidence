# Owned field review and remaining work

Section 10.5 remains an owned, replayable exact expression/derivative interface;
these repairs are prerequisites, not that implementation. Hypersolve Expr owns
symbolic mathematical semantics and Hyperinterval owns enclosures. Hyperlattice's
IntervalVector/IntervalMatrix/BoxN already own Cartesian shape/empty semantics.
Reuse those authorities instead of adding field-local interval arithmetic.

The new interface must own immutable source expressions, explicit unique time/
state/parameter bindings and a structural identity that can be replayed. Keep
original source-domain obligations beside differentiated expressions, including
nondifferentiable boundaries: a derivative expression alone may extend the
source domain. Do not infer the function's validity from derivative values or
serialized flags. Exact source coefficients remain authoritative.

The current symbolic_jacobian functions return dense binary64 proposals. They
cannot implement a rigorous interval Jacobian, even after this conversion-error
repair. finite_difference_jacobian still filters unavailable residual estimates,
and solver.rs has other zero-default conversions; their broader proposal/domain
qualification remains open. This step neither rewrites nor certifies those paths.

Expr::derivative and recursive expression traversal have no new total-work,
retained-memory, depth or cancellation contract. The owned evaluator/compiler
needs accounted construction, evaluation and Jacobian work before publishing a
complete result; precision limits alone are insufficient. Shared source/dependency
structure and failed-budget retry must be preserved. Domain/unsupported/undecided/
exhausted outcomes cannot be treated as completed coverage.

The field is then input to the complete Phase 12 contract: constant/affine and
nonlinear witnesses, Euler/Picard self-map existence, uniqueness, retained flow
tube and end enclosure, bounded positive-progress halving, exact horizon capping
and independent replay. No unchecked callback or partial protocol definition
satisfies that contract. Existing Hyperdynamics timing retention stays open;
previous binary/timing measurements precede this Hypersolve correctness repair
and must not be attributed to freshly rebuilt artifacts without verification.
