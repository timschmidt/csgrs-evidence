# Source-bound nonlinear program composition

Previous turn: progress, rejected provider-owned scheduling errors after repeated
runtime regressions, archived at b7c58335ea0ce9f0fad2c7ab726e174d0ae696c3.
The full fifteen-phase INTERVAL_REFACTOR_PLAN.md goal remains active.

Owning layer: Hypersolve exact ExpressionProgram DAG construction; existing
Jacobian/Taylor proofs remain their owners. Consumer: Hyperdynamics expression
fields. P1, P4, P6, P8-P10, P19, P27, P35-P37; phase 13 source composition and
model closure, not a claim of completed nonlinear residual-model arithmetic.

Domain: every admitted finite ExpressionProgram grammar, explicit ordered inputs
and outputs, including repeated/unused outputs, zero-dimensional products and
ordinary scalar/domain errors. Compose outer(inner(x)) by matching outer binding
slots to inner output order. Identifiers in the two sources are independently
scoped. Preserve every inner node then every non-variable outer node in source
order. Repeated outer variable references share the corresponding inner output.
No simplification may remove domain guards, including unused nodes or zero
multiplication/powers. Keep original source programs and node mappings for
provenance and reconstruction; serialized generated nodes are not proof.

Missing acceptance: a native source-bound composition API consumable by exact,
dyadic, Jacobian, Taylor and field operations without rebuilding expression trees.
Reproduce missing API compilation first. Check independent exact polynomial and
nonlinear expectations, explicit input order, identifier collisions, source guard
errors, repeated composition, source-only replay, empty/unit domains, work/size
limits, cancellation and independent retries. No new algorithm or arithmetic
kernel in consumers. This constructs a source DAG and then reuses Taylor proof
construction; it does not multiply/truncate already-built Taylor remainders.

One caller-owned ExpressionBudget accounts for visits, copies, mappings,
validation and publication. Stage entry checks include temporary mapping records
and graph entries; retain existing explicit scalar/payload/heap exclusions. No
failed cache survives. New code lives in a separate module and leaves existing
predicate/callback order and implementations unchanged. Baseline/candidate owner
artifacts, affected tests/Clippy/docs/features and downstream field composition
checks gate retention. Measure new completion and graph growth separately from
legacy artifact equivalence; no speculative performance claim. Preserve the main
41-path extraction and Interface eight-path pending state. No push.


Pre-implementation review correction: ExpressionProgram evaluates reached nodes,
not every stored node. Unreached nodes are validated but must stay unevaluated.
Strict partial-function composition must evaluate all inner outputs before outer
outputs, even if a binding is ignored. Follow CoefficientProgram's established
augmented-output protocol: retain all inner outputs as the executable prefix,
followed by composed outputs. Expose composed_output slots and explicit binding
indices into inner outputs; repeated composition can select prior composed slots
without dropping prior guard outputs. Retain unused nodes without forcing them.
No new node kind, scalar guard surrogate or evaluation-kernel mutation is needed.

The immediate proof consumer is TaylorAffineModel: exact output projection keeps
the complete augmented source proof and therefore all inner domain checks. The
existing Taylor regularity envelope still applies to every retained output; this
is not a claim of optimal regularity for ignored inner values. Direct field-output
selection remains a separate consumer extension. This step delivers source-bound
general nonlinear composition plus native Jacobian/Taylor/projection consumption;
it does not claim all nonlinear Taylor-model algebra or higher-layer adoption.
