# Reproduce the reconsideration

Use an isolated checkout of c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb, without
primary's staged extraction or Interface's pending work. Copy these drivers to
a new writable stage and rewrite output/target paths; never run inside this
frozen record. Absolute source/build paths participate in artifact identity.
Record new baseline hashes if paths, compiler, flags or dependencies differ.

1. Run build.py baseline for the 42 native owner/solver/dynamics executables.
   Source-path keys distinguish colliding example/benchmark names. Use run.py
   and the saved baseline-controls.json command for the four trace records.
   Build successive_operations with scripts/successive-operations.py, features
   curve,stl-io,obj-io, and the centered-wasm manifest with Rust 1.95 release/WASM.
2. Apply only the cartesian test hunk from matrix-candidate-before-builder.patch
   and run missing-matrix-scale.json's command. It fails at 19 missing methods.
3. Restore that test, then apply matrix-candidate-before-builder.patch. Copy
   rejected-source/crates/hyperdynamics/tests/matrix_scale_trace.rs into place.
   The patch includes the original matrix method and all new test assertions.
   Run checks.py, portable.py (install the 1.95 Thumb target if needed), and
   build.py candidate. Preserve failed target-installation diagnostics separately.
4. The scale-probe manifest selects explicit scalar code by default and the
   matrix API with feature shared. Build/copy each final executable before the
   next variant. Preserve Cargo.lock. The initial baseline uses the original
   source; the candidate uses the new method. build-wasm-scale.py creates a
   separate final WASM comparison at the same candidate source with manual/API
   selection. Run verify-wasm.cjs against the independent wasm-cases.json oracle.
5. Run size-account.py with the originally declared size-budget.json. Initial
   new-client caps fail. Run timing.py after builds/tests are idle; it executes
   four CPU 0/ASLR-disabled ABBA blocks and preserves every normalized output and
   allocation column. Valgrind commands use the locally unpacked tool paths
   recorded in the profile logs and the two final scale-probe binaries.
6. single-pass-builder.patch records the alternative helper and lifecycle tests.
   The independent tests pass first on the original helper. Recreate each variant
   separately, save its binary, and run the focused builder/inline timing drivers.
   Neither qualifies. The wrapper trial uses inline, not inline(always), and the
   shared original helper; its complete source is in inline-candidate.patch.
7. Restore all production API/helper and matrix test modifications. Apply only
   retained-tests.patch (the new cfg(test) module). Run retained-owner/controls/
   clippy/format commands and the Rust 1.88 no-feature unit tests. Build retained
   native and centered WASM artifacts. Compare 41 existing runtime-section byte
   sets and the new test executable separately. retained-account.py consumes
   retained-size-budget.json and writes the fixed-baseline cumulative account.

The candidate's 2,022-test suite and portable/WASM checks are evidence of that
candidate, not acceptance. Its production code was removed after the independent
completed-operation cost comparison. Full successive timing, broad fuzz/coverage,
full CI and release qualification were not completed for the rejected API.
The retained test change has its own final checks and bounded test-executable
account. No first-use matrix-client budget enlargement is adopted.
