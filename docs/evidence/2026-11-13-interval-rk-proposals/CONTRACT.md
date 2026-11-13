# Source-bound non-authoritative RK4 proposals

Previous turn: progress, accepted rational clocks. Base bb111ce9f. Full fifteen-
phase goal remains active. Missing acceptance witness in plan phase 12: an f64
RK candidate generated from the owned field and consumed by the exact step
verifier without becoming an assumed enclosure. Current source has no primitive
owned-program evaluator or RK implementation (searched Hypersolve, Hyperdynamics,
Hyperphysics). P1-P6, P19-P20, P25, P36-P37; proposal/certificate boundary also
implements plan sections 3.11 and 10.5-10.8.

Hypersolve owns a prepared primitive-float proposal view of its exact owned DAG.
Keep the original source, demanded-node order, bindings and domain guards. Project
only demanded constants through Hyperreal's explicit lossy edge. Use the native
floating environment without an exactness/enclosure claim; typed argument,
constant-projection, native-domain and nonfinite-result failures are proposal
failures, not proofs about the original function. Integer powers must retain the
full signed i64 exponent (including MIN and parity); no floating exponent cast.
Graph admission/cancellation are shared; scalar projection/refinement and heap
remain outside whole-work accounting. No existing exact evaluator is refactored.

Hyperdynamics owns an explicitly optional RK proposal feature. Prepare the float
view once. A requested forward dyadic step retains exact start/end/initial box;
float time/state estimates never control exact horizon or source validation.
Classical RK4 estimates use four stage evaluations. Initial-box radius plus all
stage/end point estimates and explicit finite nonnegative padding propose a tube,
not a rounding/truncation bound. Reinterpret finite candidate endpoint bits via
Hyperreal's exact Rational ingress, then native outward grid conversion and hull
with the unchanged exact initial box. Only the existing Picard verifier can
establish a tube/end enclosure. No widening heuristic promotes a float result.

Retain stage inputs, available derivatives, estimate options, prepared source and
failed proposal diagnostics. Preparation failure and rejected certification stay
distinct; source-bound successful proposals can be consumed once by the original
field verifier without cloning or dropping their exact input. Expose certified
endpoints only through the resulting Picard report. Replay source/request/options,
not projected constants, stages or success flags. Existing deterministic native
integration and its options/serialization remain unchanged. A proposal may fail
while native integration succeeds; this does not narrow the old supported domain.

Acceptance: independent RK polynomial controls, every grammar primitive, binding
order, sharing/unused invalid nodes, full-width powers, domain/nonfinite/overflow,
small/exact budgets, cancellation/retry; exact constant/affine/oscillator/Riccati
controls under verification, uncertain initial sets, maliciously narrow/poor
candidates, original-domain traps missed by float rounding, finite composition,
rational-clock normalized fields, fresh-process replay and failure retention.
Validate affected owners/downstream, minimal/features/MSRV/release/ASan/WASM/docs/
examples, native-path unchanged artifacts/traces, and complete proposal+verification
cost/allocation including output retention/destruction. Keep controlled failures
separate. No universal ODE closure, global error bound or whole-resource claim.

Reuse finding before the RK adapter: Hyperinterval already provides bit-validated
`F64Enclosure::new(...).to_dyadic(budget)`, with reservations before mantissa
allocation and exact scale alignment. Reuse that endpoint ingress rather than
adding a decoder or unbudgeted Rational allocation. Here it adopts the estimated
IEEE coordinates as a candidate set only; it establishes no relation to the flow.
The retained F64ProposalInterval and exact original request make this distinction
explicit, and only source replay through Picard can certify the candidate. No
Hyperinterval kernel change is needed. RK feature enables proposal and enclosure
carriers for this existing conversion; default/native field paths stay unchanged.

Further boundary review: F64Enclosure::new requires strict environment qualification,
which would unnecessarily couple a non-authoritative proposal to that backend's
platform support. Replace the adapter dependency with exact finite-f64 point ingress
at Hyperinterval. Reuse the existing IEEE decoder and budget-before-allocation point
construction, shared with the current enclosure conversion; do not copy bit arithmetic
into Hyperdynamics. Input is the exact IEEE value, with no source-error claim. Add
independent Rational bit-value controls, NaN/infinity/subnormal/signed-zero cases,
small budget/retry and old conversion work/dispatch/artifact checks. This is the
lowest sufficient owning layer; no float-enclosure qualification is bypassed.

Layout evidence: the initial extracted IEEE helper moved a preexisting Format
implementation block, lengthening mangled names and adding eight unstripped file
bytes despite identical executable/function sizes. Preserve the existing block
order and append the shared decoding block instead. Likewise append optional
modules and ingress methods so unrelated native source positions stay stable.
No execution, predicate, dispatch or accounting order changes. Rebuild and rerun
affected checks after these final source edits. Record raw file and loaded/code
sizes separately; no padding or compiler-option workaround is used.

Final review found another missing acceptance witness in the new RK options
validation: native `padding < 0.0` may accept a negative subnormal under DAZ.
Hyperdynamics owns option validity (P1/P6); the exact finite/nonnegative IEEE
input domain must not depend on that mode. Reuse Hyperinterval's existing
F64ProposalInterval constructor for `[0,padding]` validity. Reproduce on the
previous candidate still in the isolated checkout, using the existing MXCSR
test helper verbatim in an external probe; check both padding fields in all
16 modes. Then copy the fix, rerun the probe and affected RK checks. Existing
exact evaluator and native integrator paths are unchanged.

Reproduction correction: the initial release-mode baseline rejects all 32 negative
subnormal cases, including DAZ. The suspected input-validation gap is not yet
reproduced; compiler lowering can avoid the native comparison. Preserve that
unfavorable result and check debug behavior before claiming a defect or retaining
a speculative change.

Confirmed: debug baseline accepts all 16 negative-subnormal cases with DAZ
(eight modes times both option fields), failing the maintained expectation. The
release baseline rejects them because its optimized lowering differs. The fix
must pass both configurations, using the shared bit-exact option-domain check.
