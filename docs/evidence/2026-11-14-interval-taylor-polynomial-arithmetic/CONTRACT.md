# Polynomial arithmetic over retained Taylor models

Owner: Hypersolve Taylor coefficient/remainder proof layer. P1, P5-P6,
P8-P10, P19-P20, P35-P39. Phase 13 of the unchanged full interval plan.
Current base a7bf5eb21; the pending 41-path extraction remains outside this
isolated worktree. All 25 earlier frozen evidence stages are read only.

Missing acceptance: TaylorModel/TaylorAffineModel expose source-bound affine
maps and source composition followed by new differentiation, but not polynomial
arithmetic on an existing nonlinear remainder model. Reproduce with a failing
consumer fixture before implementation. Preserve all existing model APIs,
regularity evidence, coefficients, error behavior, source guards and dispatch.

Domain: finite polynomial output maps with exact Real coefficients, constant,
input, negation, addition, subtraction and multiplication nodes, acting on all
outputs of a retained TaylorModel over its original centered dyadic Cartesian
domain. Repeated maps must consume generated models without re-differentiation.
All input outputs and guards remain authoritative even if an outer map ignores
some coordinates or has zero outputs. Empty and zero-dimensional unit products
remain distinct. Map dimensions/references must be validated before empty success.

Keep the original model in shared storage and retain immutable operation/source
identity for replay. Polynomial coefficients are exact. Multiplication retains
all degrees up to the declared order and charges every discarded monomial into
the remainder, together with P*R, Q*S and R*S cross contributions. No endpoint-only
or sampled source substitute, fitted coefficient, independent residual identity,
or omitted term is permitted. Enclosure is conservative; no claim of tightness
or polynomial equality from interval bounds. Retain term/cross-remainder evidence.

Share existing monomial evaluation, shifts, checked domain validation and interval
arithmetic. New graph loops/records charge the caller's shared structural budget;
all native interval arithmetic charges the caller's dyadic budget. Existing scalar
payload/refinement, total heap-byte and in-scalar cancellation exclusions remain
explicit. Failed/exhausted/cancelled attempts publish no completed model, alter no
source and permit a fresh larger-budget retry.

Test independently derived coefficients and truncation, nonlinear source residual
cross terms, repeated maps, exact subdomain enclosure, shape/unsupported/empty/unit
cases, invalid source guards, small budgets, cancellation/retry, source sharing,
fresh-process replay and preserved old two-policy fixtures. Measure a completed
reuse workload against source composition followed by new native model proof;
compare the same source/function/domain/order/certified output materialization
and disclose enclosure-width differences. Apply affected owner/downstream checks
and unchanged cost gates; do not infer broad completeness from fixtures.
