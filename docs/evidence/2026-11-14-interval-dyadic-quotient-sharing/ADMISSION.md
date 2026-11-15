# One division for directed dyadic quotient bounds

Owner Hyperinterval scaled_quotient; Phase 3 adaptive arithmetic and consumers in
Phases 5/6/7. P1/P4/P6/P10/P18-P20/P36/P37. This is a behavior-preserving cost
refactor, subject to all unchanged refactoring gates. No claim of phase completion.

On the target revision, scaled_quotient calls BigInt div_floor and div_ceil on
identical scaled operands. The pinned num-bigint implementation performs magnitude
division in each call. Missing acceptance witness: direct private-kernel equality
(including budgets/errors) versus the original algorithm across signs, exact and
inexact results, scale directions, limb sizes and resource boundaries. Reproduce
that witness on baseline before production edits; compare independently with small
signed-integer floor/ceiling inequalities. Keep original algorithm test-only.

Reuse the existing BigInt quotient/remainder API to derive both directed bounds
from one division. Do not change scaled operand construction, resource reservations,
public endpoint/sign predicate order, output representation, domain semantics,
Hyperreal dispatch, certainty, serialization, cancellation or caches. Budget weights
remain conservative and identical; they are not exact CPU or heap accounting.
No fallback, input narrowing, precision lowering or error relabeling is allowed.

Early matched same-path native artifact and completed-operation probes gate further
qualification. Retain only with unchanged exact output/work/dispatch, no allocation,
monomorphized-function or binary-size regression, and owning/affected downstream
cost checks including successive_operations. Run focused/full owner and affected
consumer tests, strict Clippy, no_std/portable checks, docs, fuzz/coverage appropriate
to the changed arithmetic. If a gate fails, retain adverse evidence and restore
production; do not search arbitrary inlining/layout variants. Preserve all pending
repository work and all 51 frozen stages. No push or publication.

## Revised arithmetic hypothesis after the first measured gate failure

The signed div_rem candidate adds 1,008 executable bytes under the external lock
and 432 under the workspace-derived lock; scaled_quotient itself grows from 3122
to 3908 bytes and from 2628 to 3190 respectively. It is not acceptable.
The backend source shows that signed div_rem assigns signs to both quotient and
remainder before this caller decides directed corrections; the old floor/ceil
implementations instead work from unsigned quotient/remainder and assign signs
only to the required result. Test one structurally different single-division
candidate retaining unsigned magnitude quotient/remainder until directed output
construction. This follows the existing backend's floor/ceil algorithm while
sharing its division, avoiding an unused signed remainder. It is not an inlining,
layout or compiler-flag campaign. Both dependency contracts must pass size and
allocation gates before any candidate can proceed. Retain the first failure.
