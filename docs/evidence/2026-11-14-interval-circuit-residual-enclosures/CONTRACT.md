# Circuit residual and Jacobian enclosure admission

Owner: Hypercircuit binds circuit unknowns, component-parameter identity, units,
provenance and equation names to an immutable Hypersolve source. Hypersolve owns
source validation, derivative generation and sufficient regularity; Hyperinterval
owns native arithmetic and domain outcomes. Plan Phase 13 / section 11 Tier 4;
properties P1, P5–P6, P8–P10, P19–P20, P30, P35–P37.

Missing witness on e6ecb73b3: LinearMnaSystem has point replay only; no source-bound
whole-box residual/Jacobian consumer retains circuit input ordering/provenance.
Before implementation, reproduce the missing consumer by compiling its use.

Required extension: arbitrary existing ExpressionProgram residual grammar, with
all ordered bindings assigned distinct circuit unknown or component/parameter
identities, and ordered equation labels. Component tolerance is the Cartesian input
domain for a retained component parameter; repeated occurrences share one symbol.
Dependent tolerances require a shared latent parameter expression, not independent
box lanes. All inputs have Jacobian columns, including parameter sensitivities.
Linear MNA lowers its existing authoritative matrix/RHS and exact unknown order to
this same carrier, with no duplicate stamping or solver. Snapshot semantics:
subsequent source/MNA mutation cannot change issued evidence.

Full-domain continuity and selected C1 claims come only from enclose_regular.
Result retains source, arguments, derivatives, metadata and precision. A residual
excluding zero proves no simultaneous root in the product; containing zero proves
neither existence nor uniqueness. Empty input products are explicit; zero-dimensional
unit products and zero equations remain distinct. Shape/identity validation precedes
empty success. Bounds can feed existing Hypersolve Jacobian matrix projections and
Hyperlattice clients. Point MNA replay remains unchanged.

Graph work/structural size and native arithmetic use caller budgets; metadata byte
copies/strings, exact scalar payload/refinement, total heap and within-operation
cancellation remain disclosed exclusions. No serialized proof flags. Replay source
and metadata through constructors. Typed validation, source/regularity, exhaustion
and cancellation failures must retain cause and publish no partial certificate.

Acceptance: independent exact residual/Jacobian expectations for MNA and uncertain
component circuits; parameter correlation; nonlinear domain guards; input/row and
duplicate identity failures; empty/unit/zero dimensions; generated source reuse,
subsequent matrix operations; immutable evidence after input mutation; budgets,
cancellation/retry, fresh-process replay; no dispatch/effect from proof getters.
Measure completed native interval workload against exact rational independent
expectations and lower-layer direct reuse overhead; check existing MNA controls.
No new defaults or unqualified full circuit solver/transient completeness claim.
