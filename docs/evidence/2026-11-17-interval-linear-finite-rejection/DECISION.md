# Non-finite linear proposal repair: rejected on stack

Baseline a32805da2dd4d8e038c1275969526b58e9160215; candidate
0caf282ad1e56dac31a36447a7d2a9ff52637dce is preserved under
refs/interval-unaccepted/linalg-finite-20261117. The candidate has typed
NonFiniteInput/NonFiniteArithmetic errors, unit convergence diagnostics,
finite intermediate checks, four regression tests and a proposed migration
note. None of these changes is admitted to the primary branch.

The original three failure witnesses reproduce again on the target revision.
The candidate passes all12standalone cases and four owner all-feature tests,
including non-finite inputs for all three public methods, dimension priority,
finite accumulation and norm overflow, retry, ordinary values/receipts and
nonlinear propagation. Initial owner test compilation failed because the
fixture used the nonexistent Expr::constant constructor. The retained initial
log records that failure; using existing Expr::real fixes the fixture without
weakening any assertion. Strict all-feature/all-target owner Clippy and full
workspace formatting pass. Full owner tests, stable, WASM, timing and final
size admission were not performed after the resource rejection.

The initial external-module screen suggested stack growth. A separate harness
then links the actual Hypersolve crate at both revisions, in the same worktree
with the same release profile, lock and compiler. Sixteen unchanged completed
cases cover normal/damped systems, pivot swaps, rectangular input, dimensions8
and32, empty and zero-width systems, all three dogleg branches, BFGS clipping,
and a singular result. Independent exact/dyadic expectations and segment/sphere
conditions are checked before recording each complete step/report.

The full-owner campaign has768fresh processes,384equal paired output records,
and128equal allocation/output-drop pairs.32stack groups use both explicit cold
and warm calls, two fill patterns and four repetitions. Fourteen group maxima
fall16bytes; two remain unchanged. Zero-width normal systems grow24bytes;
ordinary dogleg paths grow16bytes; BFGS paths grow48bytes, in both warm states.
The four empty dogleg/BFGS groups newly cross the watermark exclusion window.
A zero watermark is censored below that window, not zero actual stack; their
raw numeric deltas must not be described as precise added frame sizes. The
ordinary uncensored increases alone fail the unchanged stack gate.

No timing or size-budget adoption follows. The size exception does not waive
stack acceptance. There is no newly demonstrated public total-work or
cancellation contract. The candidate's independent failure handling is useful,
but cannot be retained with this evidence. No arbitrary layout/inlining trials
are part of this review. A future repair needs a materially different qualified
strategy; the current non-finite failures remain open after restoration.

Restoration evidence is in restoration.json and restored-* logs: original
source, whole-artifact hash,32functional invocations, existing solver/pivot
controls, strict Clippy and formatting. The build barrier is released only
when those checks pass. Frozen verification.json records their final status.
