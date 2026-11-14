# Sensitivity-retained Taylor noise enclosures

Owner: Hypersolve expression-program Taylor proof layer; Phase13/plan10.7;
P1/P3/P6/P19/P35-P39 and admission composition/resource obligations. Current
TaylorAffineModel already combines shared monomials and retains original residual
coordinates through exact maps. No sensitivity-ranked finite noise representation
exists. New support must not change existing dispatch, predicate order, exact
sources, default APIs or tests. Implement opt-in taylor-noise only.

Input: an immutable shared TaylorAffineModel, with finite certified domain, exact
Real coefficient vectors, dyadic monomial bounds, explicit empty/unit semantics,
and caller-selected maximum retained nonconstant noise columns. Output is a
source-bound outer enclosure representation. Treat retained monomial values as
independent bounded parameters for enclosure only, not an assertion of stochastic
or functional independence. Original source and defining powers remain authoritative.
Distinct residual coordinates never become equal because their interval bounds match.

Rank each nonconstant monomial by the maximum full-domain width of its certified
coefficient-times-monomial contribution across outputs; this is a certified
sensitivity/variation upper bound, not an exact derivative ranking. Use exact
singleton dyadic comparisons, descending score and original canonical term order
for ties. Retain at most K columns; constants stay exact. Every omitted contribution
is added to its original output residual, with original residuals included first.
No lossy geometry is adopted: this is an internal certified outer enclosure query
and preserves the exact Taylor source. Empty sources and zero-dimensional unit
products remain distinct. The original domain is fixed; no extrapolation.

Affine output queries combine exact Real weights of each retained shared column
before enclosure; discarded/original residual coordinates remain distinct. The
query may intersect another independently certified projected source enclosure.
Validate map shape before empty shortcuts; typed graph/native work, entry,
precision and cancellation failures publish no partial model/query and do not
mutate the input. Reuse existing monomial, exact aggregate, interval and budget
helpers. Count selection comparisons and loops; disclose existing Real payload,
heap-byte and in-scalar cancellation exclusions and retained original source costs.
No missing algorithm may be relabeled resource exhaustion.

Witnesses: dominant shared nonlinear term cancels under an affine observation;
zero retention is conservatively wider; every discarded term remains accounted;
exact rational point oracles, nonsymmetric domains and nonzero centers; equal-bound
distinct residuals; constant/zero-output/empty cases; wrong shapes; small budgets,
cancellation and fresh retry; deterministic selection/replay; generated field
Taylor models as consumers. Compare completed query values before measuring costs.
New feature must preserve existing owner/downstream tests and dispatch witnesses.
Retain source only after correctness and proportional completed-workload cost/size
evidence; no universal speedup or complete wrapping-control/flow-noise claim.

Use a clean isolated checkout excluding41 staged extraction paths; preserve
Interface's8 pending files and40 frozen stages. No push or publication.


Review found that boxing residuals after the affine source map loses a known
original residual identity under duplication/subtraction. The first broad
validation runs were deliberately stopped with SIGTERM (143), not timed out.
The targeted regression failed101 on the candidate: f duplicated from a single
nonzero residual did not cancel to zero. Preserve that source and failure.
Keep original Taylor residual coordinates and compose their exact affine weights
at query time; only omitted monomials enter new per-affine-output residuals.
Expose both omission-only and full projected residual bounds. Requalify from
final sources; previous partial all-feature runs cannot count as final acceptance.
