# Rational Bezier range consumer admission

Owner: Hypercurve's native rational-span representation adapter. Hypersolve owns
exact expression graphs, differentiation and continuity/C1 certification;
Hyperinterval owns certified dyadic arithmetic. Plan sections11/Tier2 and Phase13;
P1/P3/P5/P6/P8/P19/P20/P35-P39. This adds a required geometry consumer rather than
retrying rejected Phase11 transformations without a new causal hypothesis.

Domain: existing valid RationalBezier2 sources of arbitrary finite degree, including
polynomial spans, homogeneous zero weights, exact algebraic coefficients and
native generated/split/reversed/reconstructed spans. Queries are canonical empty
or finite dyadic subintervals of the retained source's local unit parameter chart.
This does not replace Curve2, certify filled regions or claim general algebraic
curve closure. Arbitrary implicit/normal-parallel families are outside this
adapter's representation, not outside the geometry target contract.

Missing witness: no prepared native-source adapter currently supplies both
coordinate and tangent enclosures with original source/parameter/derivative
association. Reproduce the absent public API before edits. Reuse existing
homogeneous power-basis conversion, ExpressionProgram and regular Jacobian
certification; do not duplicate interval arithmetic, derivatives or topology.

Prepare one graph and derivative program, shared by repeated queries. Keep native
curve and exact graph immutable in the prepared object and output evidence.
Check the requested local parameter interval before evaluation. Preserve denominator
and scalar-source guards; failure to certify a whole interval is not proof of an
actual pole. Empty results remain empty and carry source/domain association.
No deserialized certificate flag is proof: fresh reconstruction must replay native
source construction and prepared-program evaluation. Native subdivision/reversal
and algebraic controls must feed the adapter without rounded conversion.

Use caller-owned ExpressionBudget and DyadicBudget through nested calls. Account
adapter structural construction, entry bounds and copies. Native source conversion
and exact scalar cloning/refinement retain explicit accounting exclusions; do not
claim total heap, scalar coefficient-growth or wall-time bounds. Invalid domain,
source conversion failure, interval/graph exhaustion and cancellation stay typed;
failed query/prepare attempts publish no partial certificate and permit retry.

Acceptance: independent defining polynomial/rational relations and exact endpoint,
coordinate and derivative expectations; generated-source and continuation queries;
empty/invalid/pole-overestimation cases; small budgets, cancellation/retry, fresh
process replay; full affected feature tests/Clippy/docs and meaningful owner/consumer
checks. Measure repeated completed queries with all output evidence materialization
against rebuilding the identical prepared proof per query, including preparation
on both sides. Preserve all adverse evidence and qualify the measured scope.
Existing default executable bodies and policy/predicate ordering stay unchanged.
No acceptance or full phase completion is inferred merely from added API/tests.

Isolate all changes. Preserve41 staged main paths,8 Interface paths, firmware,
and43 immutable evidence stages. No push/publication.

Consumer refinement before implementing the native-box projection: merely printing
coordinate ranges does not exercise the next geometric operation. Add a borrowed
projection into the existing Aabb2 carrier, keeping its range report attached.
Exact dyadic-to-rational conversion owns outward endpoints; no predicate or box
kernel is duplicated. Empty parameter sets project to None, not a fabricated zero
box. Existing Aabb2::overlaps owns comparison and uncertainty; no overlap is a
sufficient curve exclusion, while overlap is not proof of curve intersection.
Missing tests: empty projection, exact ordered endpoints, touching-box retention,
strict exclusion and projection budget/cancellation/retry. Include this projection
and actual native broad-phase calls in the completed consumer benchmark contract.
