# Composition and resource argument

For each accepted native segment [t_i,t_(i+1)], the existing Picard report proves
existence and uniqueness for every initial point in X_i, with trajectory in Y_i.
The existing trajectory Taylor verifier consumes this exact report by reference.
Its analytic-domain certificate, normalized Lie coefficients and complete
next-order remainder enclose each trajectory and its endpoint. Intersecting with
the independent Picard enclosure preserves containment; neither enclosure alone
is promoted into the other's evidence. The result E_i is published as a segment
only after every Taylor stage and final checks complete.

The controller supplies E_i, including its interval overestimation, as X_(i+1).
The next native search therefore proves continuation for every actual endpoint.
Induction gives a sound tube chain and final enclosure for every original initial
point. Native exact singleton time comparisons, positive durations and capping
ensure contiguous progress without overshooting the requested horizon. A final
exact equality and cancellation check precede whole-horizon completion. This
proves containment and local continuation/uniqueness, not reachable-set equality
or retention of cross-segment correlations.

The native integrator searches with a one-accepted-step limit. When its endpoint
is short of the outer horizon, StepLimit(1) is an explicit qualified prefix whose
accepted PicardReport is usable. The controller admits only that precise limit
case or native completion; other stopped statuses remain failures even if native
intermediate evidence exists. Original maximum_steps governs the outer Taylor
chain, and zero-step, empty/identity and malformed requests retain native validation
precedence. Native search is not invoked again on a completed segment. Taylor
failure cannot silently select the weaker Picard endpoint.

One prepared Taylor order is reused. Candidate expansion and exact halving are
entirely owned by the existing native search. Later searches cap the step by the
last accepted duration, matching the existing controller's nonincreasing step
policy. This is finite-horizon fixed-order Taylor evolution with bounded adaptive
duration search, not automatic order growth, QR frame changes or optimal control.

Reports own the prepared source/order, original inputs/options/policy, each full
native search and its partial/completed Taylor evidence, and an accepted-index
sequence. An internal search's stopped status is not relabeled as whole-horizon
native completion. Outer successful identity/empty results make no nonempty ODE
claim. Stopped outer reports expose a prefix separately and never a completed
endpoint. Replay revalidates definitions and regenerates all evidence.

New graph work charges outer records, options and state copies; native search
and Taylor verification charge their original work through the same counters.
Aggregate structural record counts include all nested native attempt records,
native accepted indices, outer attempt records and outer accepted indices. They
are checked before each outer record and after an inner search returns, before
refinement/segment publication. A failed post-search count check retains that
search in the stopped report. This is a checked stage size, not a reservation
bounding peak live memory, all retained coefficient/proof graphs, scalar payload
bytes or vector capacity. Existing exact scalar/refinement, predicate-internal
and within-scalar cancellation exclusions remain explicit. A final failed check
cannot publish whole-horizon success; an enlarged-budget retry starts cleanly.
