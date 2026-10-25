# Remaining R15 cache and singleton gates

The existing native-equality cache is capped at four entries, shares identity
through clone/refinement, separates changed charts, accepts only exact proved
equality and treats a poisoned lock as empty. Existing production tests cover
a retained proof, an unequal conjugate, a perturbed root and reuse after clone/
refinement. Remaining acceptance should exercise cap saturation with genuinely
distinct native identities; chart changes; a forced approximate-terminal path
without caching equality; resource exhaustion then a fresh larger-budget retry;
and poisoned lookup/retention followed by the exact fallback.

Current WorkBudget counts refinement/promotion attempts only. It exposes no
cancellation token. No cancellation guarantee or completed cancellation test
will be inferred from process termination or zero-budget exhaustion. That
separate P20/R19 interface gap remains open.

The singleton sign theorem concerns a unique distinct zero in a certified
interval with opposite strict endpoint signs. An odd repeated zero can satisfy
that theorem; sign change does not imply simplicity. Even repeated-root input
requires its native square-free/root-count authority or a correct decline.
Artificially bypassing a carrier constructor's stronger invariants would not
establish a supported-input regression.

Expanded gates use actual comparisons: six independent singleton brackets, reciprocal/negative charts, poisoned lookup and retention, zero/one-budget failures with larger and cached-zero retries, native (2x^2-1)^m for m=1,2,3 with negative scaling and exact +/-2^-200 offsets, and a bounded-normalization-unresolved angle-addition zero. The terminal control uses ordinary constructors and fallback; no fabricated proof or forced implementation branch. Both variants receive identical tests and explicit certainty scopes.
