# Admission before implementation

Previous turn: progress. Finite epsilon reachability covers were committed and
qualified. The fifteen-phase objective remains unchanged. Current source base is
e72c0d8b06f91e9bf915d6ae6ac975c94a96b72e; forty staged extraction paths and eight
Interface edits are preserved separately. Work uses an isolated checkout.

Owners: Hypersolve owns the expression graph, symbolic derivative association,
demanded sparse coefficient construction and Taylor remainder proof. Hyperinterval
owns scalar rounding; Hyperdynamics supplies a concrete source-bound field-enclosure
consumer. P1-P6, P8-P10, P19 and P36-P39, plan 10.7/phase 13 and docs/admission.md
apply. No new standalone jet kernel or speculative crate dependency is needed.

Missing witness: requested normalized mixed partials in one shared flat graph,
followed by an exact-coefficient centered Taylor model with an explicit certified
remainder over a finite dyadic box. Existing Jacobians only supply first partials;
they do not certify a finite Taylor expansion or a truncation bound. Concrete
consumer witness: x(1-x) on [0,1] should yield [0,1/4] through its centered quadratic
model, while the unchanged natural image is [0,1]. Wider/nonsmooth cases must
retain typed proof failure rather than claim a dropped remainder is zero.

Coefficient requests use canonical sparse nonzero powers keyed by bound symbols,
with an output index. Only requested derivative paths are generated, their common
subgraphs/memoized partials are shared, and normalized coefficients retain exact
factorials. The executable evaluates all original outputs first, preserving
source guards even for a zero derivative. Derivative formulas alone are not
smoothness evidence. Reuse the existing local Expr derivative rules; any refactor
of the old Jacobian loop must preserve old outputs, work counts, traces and costs.

Taylor models use exact singleton dyadic centers within their finite domain,
exact Real/rational coefficients, and a dyadic remainder. For total degree n,
every degree n+1 contribution is bounded and included using the multivariate
Taylor remainder on the convex domain. The current expression grammar's open
smooth primitive domains are analytic; this stronger claim must be explicitly
checked and tied to that exhaustive grammar, not inferred for arbitrary future
C1 primitives. Preserve source definitions, selectors, domains, requested order,
regularity evidence, coefficient association and all remainder contributions.
Models are immutable; replay reconstructs proofs instead of trusting flags.

All structural construction/evaluation uses the caller's shared graph budget;
native enclosure arithmetic shares its scalar budget. Existing exclusions for
exact scalar construction/refinement, byte-level heap bounds and cancellation
inside scalar calls remain explicit. No universal completion, total-resource or
performance guarantee is introduced. Failure must occur before publication;
failed builds must not poison a later retry. Empty, zero-dimensional, invalid,
coarse-grid, domain and resource cases need separate expectations.

Independent rational coefficients, mixed partials, high-degree factorials,
source-domain counterexamples, exact quadratic ranges, rational-function tails,
subdomain reuse, source replay, cancellation and budget boundaries will qualify
the extension. Measure completed new work and old consumers separately. Whole
Taylor/wrapping/adoption/release scope remains open beyond this increment.

The first polynomial-grid oracle used authored PowI(0) at zero, which is invalid
in the existing Expr/Real grammar (unlike native set power). Preserve that
original failing input in an explicit source-guard regression. Construct the
polynomial control with an exact constant for absent zero-exponent factors. No
source-domain rule or existing test is weakened.

The forced-inline closure helper preserves old semantic output but grows the
old consumers by 3,832/3,960 ELF bytes and 3,066 function-union bytes. Reject that
refactor shape. Use one shared local-rule macro expanded into the original loop
and the new demand traversal, preserving temporary/operation order. Gate the
new coefficient/model module under an explicit taylor-model feature so legacy
consumers do not compile unused new machinery. This still requires renewed
semantic, trace and completed-cost qualification.

Subdomain reuse reproduced an empty-set defect: an empty Cartesian product was
rejected when another lane lay outside the original domain. Keep that original
failure. Validate shape and resources first, then recognize the canonical empty
product before coordinate containment; no point of an empty product extrapolates.
Nonsingleton or malformed original centers remain invalid, including with empty.

Field consumer admission reproduced the missing `field::taylor` module and method
before implementation (missing-field-model.log). The adapter retains source,
time/state binding order, original request, full Hypersolve evidence, and native
empty/unit carriers. Its exact midpoint failure remains explicit; no flow claim
is inferred from a field image. Reuse keeps the original grid/global remainder.

Owner all-target validation exposed an existing benchmark-report catalog test
expecting six targets while the admitted manifest registers seven. The owning
layer is benchmark-report validation, domain the complete manifest catalog, P10
and the refactoring evidence contract. Reproduce on the unmodified baseline;
extend the inventory assertion to the seven exact names/features rather than
loosening it to a lower bound. Keep the original failure and generated smoke
reports outside the source tree.

External legacy probes retain their previously locked dependencies for paired
comparisons (including num-bigint 0.4.8); both variants use identical lockfiles.
Initial new-probe smoke builds selected that dependency set too. Those smoke
logs are not workspace qualification. The direct Jacobian trace fixture and new
model cost probe were rebuilt with the workspace's locked registry versions
(including num-bigint 0.4.6); original lockfiles/logs remain preserved.
