# FOC conformance and cost client admission

Baseline CSGRS a4560f1c9209396bc4409d0dc5d5f2fe92db2225; firmware
bdee397d0b80841f16bf17e7bcd029b4feb2c212. All four managed repos clean.
Owner: a standalone conformance client for Hyperinterval fixed arithmetic and
Hyperlattice interval products; Alumina continues to own domain wrappers,
rotation validation, balance policy, transform ordering and FocError semantics.
P1, P5, P6, P18–P20, P31–P33. Existing FixedInterval convert/i64 widening,
checked arithmetic and IntervalMatrix products are reused. No kernel copies.
Missing acceptance: plan Phase 6 requires a maintained Clarke/Park consumer and
completed-work cost evidence; no such client exists on the target revision.
Domain: valid nonempty Q2.30 intervals, valid public Rotation values, all signed
maximum-zero-sequence bounds, exact public outputs/errors for forward/inverse
Clarke/Park and finite chains. Full i32 endpoints and overflow remain admitted.
A dense signed matrix can change intermediate-overflow behavior; pre-rounded
Clarke coefficients can widen exact outputs. Preserve stage order and widened
Clarke integer numerators. The baseline witness will reproduce both mismatches.
Use independent i128 rational corner expectations as well as native differential
checks; maintain hard cases, full endpoints, rounding residues and signed zero.
Primitive kernels have dimension-bounded loops, i128 intermediates, no heap;
no new resource/policy/serialization claims or production firmware migration.
Measure matched completed transforms, allocation counts and retained code size,
including regressions; no speed claim from one favorable case. ARM/Wasm builds
and actual no-allocator Wasm execution are required local consumer checks.
No HIL/cycle/whole-phase completion claim.
