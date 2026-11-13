# Owned expression field adapter: admission in progress

Base: 767de272ea1b8ddf420d3917e469bd19e1cfffbd. Previous turn was progress:
source-bound symbolic Jacobians and identity-power correction were committed.
Hyperdynamics owns time/state dimensions, field identity and field semantics;
Hypersolve owns expression validation/derivatives/images; Hyperlattice owns
Cartesian vector/matrix carriers; Hyperinterval owns scalar arithmetic.
P1-P6, P19-P20, P25, P36-P37. Missing acceptance witness: plan 10.5 has no
owned field object mapping explicit time/state bindings to native BoxN,
IntervalVector and IntervalMatrix while retaining validated source association.

Implement a sealed EnclosedVectorField interface and ExpressionField<N>, with
N outputs, exactly one time and N distinct state variables, arbitrary source
binding order, immutable structural identity and replay by validated source
and regenerated Jacobian. Reuse canonical zero-dimensional unit/empty products.
Image need not evaluate derivatives; Jacobian must consume original source
outputs before derivatives. Do not claim an invalid field merely because a
Jacobian formula or interval dependency enclosure cannot certify its domain.

One EnclosureBudget carries the selected precision, graph work/entry limits and
native scalar bit/work limits through nested field calls. Expose the existing
ExpressionBudget work/entry admission primitives for adapter accounting rather
than making another counter kernel. No scalar copies escape native accounting.
Preserve cancellation, typed source errors, exhausted retries and empty values.
Source ingress/serde, scalar payload cloning, Hyperreal constant refinement and
heap bytes retain their existing accounting exclusions; this increment must not
be presented as a wholly bounded ODE solver or a global continuity certificate.

The Hyperdynamics extraction is already staged and remains unaccepted under its
cost gates. Keep its preexisting patch and the new field increment distinguishable
in evidence. Do not claim extraction retention from additive field correctness.
Tests must cover independent constant/affine/nonlinear images and Jacobians,
time dependence, reordered variables, zero dimension, invalid source/shape,
source mutation and fresh replay, singular derivatives paired with valid images,
small budgets, cancellation/retry, and output consumption by native linear algebra.
