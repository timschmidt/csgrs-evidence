# Bounded adaptive dyadic evolution

Previous turn: progress, source-bound Picard step f6c48522 and registration
0166809643cbbf42a84addcf7fef43392d4e8618. Owner Hyperdynamics: exact time
composition, proposal selection, retention of every attempt and complete horizon
semantics. P1-P6, P19-P20, P25, P36-P37. Missing witness on this revision: no
public horizon integrator or bounded adaptive halving consumes certified steps.
Native scalar/Cartesian kernels and accepted Picard authority are reused.

Input: validated ExpressionField, exact singleton dyadic start/end (end >= start),
uncertain initial box, optional positive exact singleton maximum step, explicit
step/halving/candidate-expansion limits and one existing mutable enclosure budget.
Deterministic proposals start at the initial box for each attempted step; a failed
self-map's Picard image is hulled with the candidate and widened by its native
width in each direction, using native subtraction/addition. After bounded
expansions, halve the exact duration and restart from the initial box. Domain and
regularity proof failures may trigger halving; resource/cancellation/other typed
failures stop without resets. Every actual Picard attempt is retained, with its
proposal source (seed or previous attempt expansion), step index and halving.

A successful segment is the accepted Picard report, not a sampled trajectory.
All segments share source and policy; each next initial box is a checked native
copy of the preceding endpoint. Cap attempted duration by exact remaining time;
verify strict progress before accepting a segment and final exact horizon before
success. A zero horizon is identity and empty initial state is successful empty,
after time/option validation. Failed runs expose an explicitly scoped certified
prefix, never a completed requested horizon endpoint. No proof deserialization;
replay source/request/options reexecutes every attempt deterministically.

The loop bounds cover steps, halvings and candidate expansions, with shared graph
and scalar counters and stage-entry checks before retaining attempts. They do
not establish total heap or work bounds beyond the existing symbolic refinement,
payload lifecycle and source ingress exclusions. Limits are typed only when
reached; mathematical/domain reasons remain separately retained in attempts.

Acceptance: exact uncertain constant and time-affine flows, known affine and
oscillator bounds, Riccati blowup/domain stress, strict halving progress and exact
non-power-of-two dyadic horizon cap, zero horizon, empty/unit/invalid, every
rejection retained, source/step provenance, exhausted work/steps/halvings and
cancellation/retry, final contribution, fresh-process replay and endpoint reuse.
Qualify isolated package, affected owner/downstream, MSRV, release, ASan, Wasm,
lints/docs, examples; measure completed flow/replay allocation/cleanup/artifacts.
This is a phase-12 increment, not a redefinition of completion: rational time,
f64 RK proposals, full resource closure, broader flows/end covers and all other
plan obligations remain required.
