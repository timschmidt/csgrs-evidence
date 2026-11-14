# Certified physical point-mass flow

Owner: Hyperphysics retains mass, force definition/provenance and Newtonian state
meaning; Hyperdynamics owns field interpretation, Picard/evolution proofs and
resource/status handling; Hypersolve owns exact expression graphs/derivatives;
Hyperinterval/Hyperlattice own native products. Plan Phase 13 / Tier 4 physics,
properties P1, P5–P6, P8–P10, P19–P20, P30, P35–P37.

Missing witness at 8c51ff690: ForceAccumulator3 only feeds point-valued discrete
Euler replay. No physical consumer lifts exact source-defined F(t,x,v) into the
continuous ODE x'=v, v'=F/m, preserving physical evidence through uncertain-state
Picard/whole-horizon operations. Reproduce missing consumer before implementation.

Admitted domain: fixed strictly positive exact Real mass; three force outputs in
the existing Hypersolve grammar with seven distinct time/position/velocity bindings,
in arbitrary binding order. Retain original graph, all domain guards, exact mass,
strict positivity receipt, state ordering and source provenance. General nonlinear
and time/velocity-dependent forces are accepted subject to existing sufficient
regularity/enclosure checks. ForceAccumulator3 supplies a constant-force convenience
path retaining every contribution, using existing total_force rather than reimplementing
summation. Original Euler replay remains discrete replay, never relabeled as exact
continuous dynamics. Time-varying/uncertain mass, rotation, contacts/impulses, coupled
bodies and transcendental nodes absent from the grammar remain separate requirements.

Native state order is [x,y,z,vx,vy,vz]. Initial boxes may be uncertain or empty.
Only certified native reports expose endpoints/tubes; wrappers retain the attempted
proposal, original model and typed native status, including rejected partial stages.
Generated endpoints must feed later steps and whole-horizon evolution, keeping
source/mass/force evidence. Empty sets do not bypass model/time validation. Rebuilding
from original definitions regenerates mass, source and trajectory proofs; no success
flag or stale cache is accepted as evidence.

One existing EnclosureBudget spans domain-adapter graph work and field construction,
verification and evolution. A lower-layer graph-counter borrowing API is justified
by this consumer; it must expose the same counters, never fresh budgets. Native
arithmetic remains governed by the existing budget. Exact scalar operations and
positivity refinement, source strings/payload, total heap and cancellation within
scalar operations/force accumulation remain explicit exclusions. Exhaustion is typed
before publishing a model; native partial attempted reports retain their existing
separate contract. Failed construction/retry does not mutate original inputs.

Acceptance: independently derived constant-force trajectories and harmonic/drag
force equations/Jacobians; uncertain initial states; all binding permutations;
valid nonlinear force guards and failures; exact algebraic mass and retained strict
receipt; invalid/undecided mass; invalid references/shapes; empty versus invalid
proposal times; cancellation and final-work cutoffs/retry; step output as subsequent
input and full-horizon consumption; immutable provenance; fresh-process replay and
zero-work/zero-dispatch getters. Compare completed prepared physical queries with
fresh construction for the same tube/end/proof contract; retain preparation and
optional code/memory costs. Existing discrete replay outputs/dispatch remain unchanged.
