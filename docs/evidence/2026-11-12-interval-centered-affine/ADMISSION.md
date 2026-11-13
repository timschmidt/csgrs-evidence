# Exact authored-center affine source admission

Baseline b02248ec61add81ea21414ac183a7b804283e4af, all managed repositories clean.
Previous turn progressed through authored definitions and qualification. Owner:
Hyperlattice affine source/parameter protocol, P1-P7/P18-P20/P25-P27/P35-P37,
plan Phase 6. Missing witness: AffineMap cannot consume CenteredVector without
projecting absolute bounds, which can overflow before a later map cancels them.

Add a translated parameter box, retaining an exact singleton center and a native
offset box. CenteredVector::affine_source borrows the definition and constructs
[-r,r] using existing zero/subtraction/hull kernels, accounting owned copies in
the caller context. Radius nonnegativity proves -r is representable whenever r
is in a finite admitted primitive family. No identity coefficient or scalar one
is required. Empty conversion does not request a scalar zero; zero-dimensional
units remain units. All six existing scalar families remain admitted.

A point is c+u, u in the retained offset domain. Pullback evaluates B*c+t, then
B*u+that translation; native affine image/chain composition still happens before
source evaluation. Exact backends give the exact coordinate hull on success;
primitive rounding can widen or fail typed. Restriction intersects the offset
parameter domain, not absolute image coordinates; center is copied with the same
context. Canonical empty may have no center; restriction to empty may retain one.
Replay validates native dimensions/families and singleton center; no flags.

Missing acceptance: extreme source overflow followed by half-scale success and
by duplicate/difference cancellation; F31/F63 without representable one; mixed
finite chains, empty/unit, restrictions, shared dyadic exhaustion/retry, fresh
replay and invalid center/empty selectors. Preserve old predicate/operation
bodies and order. No second scalar algorithm, rounded source replacement,
whole Phase 6, heterogeneous arithmetic or full-goal completion claim.

Qualification finding: the minimum-exponent dyadic witness returned
SizeExhausted under zero-minus-radius because that kernel aligns the canonical
zero exponent. Keep the witness and forward existing scalar exact negation via
IntervalArithmetic::neg. The bridge now reflects radius lanes directly, then
hulls them; no scalar algorithm or existing decision order is changed. This
supersedes only the proposed zero/subtraction construction, not the domain or
acceptance test. General zero-alignment behavior of existing scalar additions
and subtractions is not changed or claimed repaired.
