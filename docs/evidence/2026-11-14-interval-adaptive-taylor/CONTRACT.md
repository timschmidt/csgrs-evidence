# Bounded adaptive trajectory Taylor selection

Owner: Hyperdynamics controls finite order/duration selection; existing Picard proves
existence/uniqueness; existing trajectory Taylor validates analytic guards, recurrence
and complete remainder. Hypersolve/Hyperinterval/Hyperlattice retain derivative/scalar
and set authority. Plan 10.7, Phase12/13; P1,P5,P6,P8-P10,P19,P20,P30,P35-P37.

Missing acceptance: current FlowTaylorProgram::integrate fixes one order, only shrinks
step caps and stops on a Taylor failure. It cannot automatically increase order until
a declared exact local truncation contribution is small enough, halve at the last
order, then regrow proposals on subsequent steps. Reproduce absent entry on current
base before edits. Existing fixed-order behavior/predicate order must remain unchanged.

Admitted source grammar is exactly the existing Taylor flow grammar, with its existing
sufficient whole-tube analyticity/regularity guarantees. State uncertainty remains a
set, not a nominal point. Source and initial state may be empty/unit, but validation
precedes empty/identity success. Time endpoints and caps are exact dyadic singletons.
The quality requirement is a nonnegative finite singleton bound per coordinate on the
absolute endpoint remainder contribution, not its interval width and not total/global
trajectory error. Never claim reachable-set equality or convergence below irreducible
uncertainty. Zero remainder limit is valid for exactly vanishing remainder.

Selection contract: try caller-bounded ascending orders on a single certified Picard
proposal; retain each completed original Taylor proof and exact remainder magnitudes.
Use the first order satisfying every coordinate bound. If all orders fail quality,
exactly halve and repeat up to a declared local halving limit. Native Picard search
retains its own bounded refinement attempts. Any mathematical/domain/resource failure
stops with its original typed cause; do not call it quality failure or skip it. Advance
only a fully certified quality-checked endpoint. Propose doubling accepted duration
for the next segment, capped by caller maximum and exact remaining horizon. Reset
order search each step; finite candidate order range and maximum accepted steps bound
controller choices. Preserve all input/source/options/policy, prepared programs,
searches/refinements, quality failures and accepted choices in immutable report.

One EnclosureBudget covers source preparation, native search, refinement, quality
comparison, record accounting and publication. Lazily prepare each distinct order once
per run and share it across all attempts. Check aggregate structural record counts,
with typed exhaustion before completed publication; explicitly retained partial history
is distinct from certified prefix and whole-horizon success. Existing exclusions of
scalar payload/refinement, graph duplication inside existing coefficient preparation,
vector capacity, total heap, and within-scalar cancellation remain explicit. Failed
attempts do not create permanent undecidability; larger-budget retry starts fresh.

Acceptance: independent constant/exponential/oscillator expectations, exact remainder
quality including nonzero singleton remainder, order escalation, last-order halving,
step regrowth, exact horizon cap, generated endpoint as subsequent input, uncertainty,
empty/unit/invalid inputs, distinct no-quality/native/resource failures, all final
work cutoffs, cancellation/retry, fresh-process replay and source/getter dispatch.
Benchmark against fixed-order completed proofs meeting the same source/horizon and
quality obligations, with preparation, output/proof materialization and rejection costs
visible. This is not a performance-only refactor or a universal optimal-order claim.
