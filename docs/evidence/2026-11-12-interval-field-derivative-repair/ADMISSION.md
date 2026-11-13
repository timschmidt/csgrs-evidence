# Symbolic derivative boundary required by owned fields

Previous turn: progress; ordinary cross-crate inline availability clears measured
size gates, while timing gates remain failed. Current root e0eb94168cfbe8257f70827eb4775248ada9baa7
has the unchanged staged whole dynamics candidate. Section 10.5 requires adapting
Hypersolve expressions and symbolic derivatives for owned/replayable fields.

Owner: Hypersolve Expr::derivative, integer power rule. P1, P2, P6, P18-P20 and
interval plan 10.5/Phase 12 apply. Input: the existing full i64 exponent domain,
with original source and differentiated-domain guards retained. The current
unconditional exponent - 1 overflows at i64::MIN. Reproduce debug/release failure
with independent wide-exponent homogeneity and exact unit-value expectations.
Do not evaluate an exponentially huge rational as a test proxy.

Use an exact quotient representation only for the minimum exponent, preserving
the original nonzero-base obligation. Keep every other branch and predicate
sequence unchanged. Repeated derivatives and composed bases must remain valid
inputs, and singular/unbound inputs must fail explicitly. This is a correctness
repair, not a behavior-preserving refactor or a claim of completed field/ODE
support. The general owned field, resource contract and evolution work remain.

The same review finds the existing public dense symbolic-Jacobian adapter maps
an unavailable binary64 conversion to 0.0. Add an independently expected typed
failure witness with finite exact slope 2^2048 at x=0, in both plain and analyzed
entry points, before changing that branch. Reuse EvalError::DenseSolverEstimateUnavailable;
retain all successful conversion and predicate/evaluation ordering. Dense
Jacobian estimates remain proposals and cannot implement the rigorous field
image/Jacobian contract. This second repair enforces P6 at its existing boundary.
