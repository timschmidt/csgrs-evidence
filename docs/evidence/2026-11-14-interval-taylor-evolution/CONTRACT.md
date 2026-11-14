# Whole-horizon validated trajectory Taylor composition

Owner: Hyperdynamics composes its existing source-bound Picard search and
trajectory Taylor verifier. Hypersolve retains coefficient/differential authority;
Hyperinterval/Hyperlattice retain scalar/set arithmetic. Plan 10.6–10.8 and
Phase 13; P1/P5/P6/P8–P10/P19/P20/P35–P39. Input: prepared finite-order trajectory
Taylor program, exact dyadic singleton start/end, finite initial Cartesian box,
EvolutionOptions and one shared EnclosureBudget. Empty and zero-dimensional unit
sets remain distinct. No new symbolic grammar or universal ODE completion claim.

Missing witness: no whole-horizon method on FlowTaylorProgram composes the
certified Taylor endpoint as the next initial set, while retaining all rejected
Picard searches and complete analytic/remainder evidence. Reproduce missing API
before implementing it. Existing handwritten step chains are not that controller.

Use the existing ExpressionField::integrate search with an internal accepted-step
cap of one. An internal StepLimit(1) after one certified step is an explicitly
qualified search prefix, not a failed mathematical step. Reuse its PicardReport
by reference in the existing Taylor verifier; never rerun Picard or clone its
entire proof just to refine it. Retain the complete search report, completed
Taylor stages, original diagnostics and accepted-index sequence. Only a certified
Taylor endpoint advances the outer controller. No fallback to a weaker Picard
endpoint after Taylor failure. Native search policy, exact halving/capping and
all rejected attempts remain authoritative. Respect outer accepted-step cap,
positive progress, exact horizon comparison and final cancellation checks.

The prepared Taylor order is fixed; bounded step search adapts duration. This
completes finite-horizon composition at that order, not automatic order choice,
QR frame selection, correlation retention or the entire fifteen-phase objective.
The correlated chart's transformed field can use the same controller and its
endpoint remains input to exact chart transport and a further operation.

Reports retain source/program, original request/options/policy, per-search full
history, per-attempt analytic/coefficient/remainder contributions, accepted
segments and qualified prefix separate from completed output. Replay source,
order and request/options from definitions; no serialized proof flags. Invalid
input is not hidden by an empty initial set. Resource/unknown/domain/unsupported
failures retain original types; a real configured step/halving/work limit must
actually be reached to report exhaustion.

Charge new bookkeeping/state copies and nested structural entry counts, using
one shared budget through preparation/search/refinement/publication. Account all
retained nested attempt and accepted-index records when reserving the outer
report, not only each inner search. Per-stage checks remain distinct from whole
retained proof-graph/heap limits. Existing scalar payload/refinement/predicate,
heap, vector capacity and within-scalar cancellation exclusions remain explicit.

Tests: missing baseline method, independent exact polynomial/nonautonomous flow,
uncertain initial data, exponential bounds from rational series, tighter whole
horizon than Picard and actual endpoint chaining, late failure with retained
prefix, invalid+empty, unit dimension, final graph/native cutoffs, cancellation
and retry, source replay in fresh processes, zero getter dispatch, generated QR
chart consumption/transport. Completed benchmarks compare the same original flow,
horizon and declared endpoint quality; measure full reports including all
search attempts, Taylor contributions and destruction. Include an unfavorable
constant-flow case and preparation separately. Qualify feature-disabled old
consumers and affected local/downstream paths before retention. Preserve all
pending extraction, sibling edits and frozen evidence; no push.
