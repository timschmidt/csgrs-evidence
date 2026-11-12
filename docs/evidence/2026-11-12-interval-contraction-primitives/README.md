# Contraction evidence and identity-remainder qualification

Source `fb5806c4d156dd267d934b480d6f5a2aac364820`, baseline `be11e97da74bf8221dbe18e6c17f1c54e5ce9b6b`.
The patch and SOURCE.json identify the exact source revision. ADMISSION.md was
written before implementation; initial-state.json covers all four managed repos.
No push. This is an additive Phase 6 checkpoint, not phase/plan completion.

## Contract and witnesses

Hyperlattice's interval companion owns square Cartesian matrix identity
subtraction and one/infinity norm contraction margins. Existing Hyperinterval
constructors and arithmetic own every scalar step. Exact one is a new sealed
adapter constant, not a new scalar algorithm. No solver status/Jacobian
certificate, point selection, cached proof, or production migration is added.

An empty input has an empty image. Zero-dimensional identity subtraction returns
the unit with no scalar one. Nonempty margins and positive-dimensional identity
subtraction require representable +1; i32/F31 and i64/F63 fail Overflow explicitly.
Dyadic work shares one caller budget; constant construction follows the existing
zero-constructor accounting exclusion. Rational work is unbounded internally.
Successful Cartesian projections do not acquire lost correlations.

baseline-witness.log reproduces all three missing methods. final-witness.log
shows the identical witness builds and runs on the source revision:

    CARGO_TARGET_DIR=/tmp/interval-refactor/contraction-witness-target cargo +1.88.0 run --locked --manifest-path /tmp/interval-refactor/contraction-primitives/witness/Cargo.toml

The existing independent integer-member oracle now covers 625 square matrices
per backend, six backends, including zero breakpoints, exact margins and identity
images, output reuse and transpose duality. New fractional Krawczyk arithmetic
clients use a coupled quadratic, unequal radii, repeated narrowing, a two-root
case and a nonzero residual. Expected images are independently derived exact
fractions. Tests cover IEEE subnormal tails, margins containing zero, full-scale
fixed failures, empty/unit behavior, shared dyadic work/size exhaustion and retry,
existing validated serde with fresh-process recomputation, and no allocation for
fixed/f32/f64 primitives. Existing assertions and hard cases remain.

## Executed checks

`checks-final.py` and `checks-final.json` record all 49 final commands, exits,
timing and log names. Every command passes. This repeats the complete selected
44-command matrix and adds five feature-isolated Clippy runs after correction.
Coverage includes Rust 1.88 and stable isolated features, Rust 1.95/all-feature
and optimized tests, Clippy -D warnings, docs -D warnings, seven main-lattice
facade tests, four unchanged solver migration/dispatch tests, ARM/Wasm builds,
format, package and dependency inspection. There are 64 companion parent-suite
tests and five doctests. Initial check-3/7 warnings (test import) and check-31
format failure are retained. Both were corrected without changing assertions.
The final matrix logs are warning-free.

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked -p hyperlattice-interval --all-features --tests --target x86_64-unknown-linux-gnu

`asan-final.log`: 64 parent-suite tests across 17 executables pass, including
fresh-process tests; no leak/sanitizer failure. Initial full run also retained.

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-coverage RUSTFLAGS='-C instrument-coverage' LLVM_PROFILE_FILE='/tmp/interval-refactor/contraction-primitives/coverage/%p-%m.profraw' cargo +1.95.0 test --locked -p hyperlattice-interval --all-features --tests --message-format=json
    python3 /tmp/interval-refactor/contraction-primitives/coverage_report.py

Both initial/final test passes, raw profiles, merged data and reports are kept.
The script uses LLVM -num-threads=1. Scope is the companion's implementation,
excluding test/conformance/dependency source. Report: 1157/1177 lines (98.30%),
1527/1609 regions (94.90%), 232/234 functions. New module: 39/42 lines,
63/74 regions, 5/7 functions; the two closures in the zero-dimensional array
construction are never entered. No 100% or full dependency coverage claim.
This scoped run emitted no LLVM warnings. Earlier scalar-oracle Rug warnings
in other checkpoints are not asserted fixed by this record.

## Wasm and completed cost

    CARGO_TARGET_DIR=/tmp/interval-refactor/contraction-primitives-wasm-target cargo +1.88.0 build --locked --manifest-path /tmp/interval-refactor/contraction-primitives/wasm-consumer/Cargo.toml --target wasm32-unknown-unknown --release
    /tmp/interval-refactor/tools/bin/python /tmp/interval-refactor/contraction-primitives/wasm-replay.py

The no_std consumer supplies no allocator and has zero imports. Wasmtime 50.0.1
passes 2051 contraction calls, 513 effective inputs, all prior static probes and
73836 chain calls, with 1,000,000 fuel/call. Artifact: 69039 bytes, SHA-256
621b2807b75718344902512512ac123b8e0bb8964189fc0787f9860bc8bc68a2.
A seventh export adds 7323 bytes versus the prior consumer; workloads differ,
so this is not a same-contract regression comparison. System Python lacked
wasmtime (wasm-replay.log); the existing tools environment passed (JSON/log).

    cargo run --locked -p hyperlattice-interval --all-features --release --example norm_cost

Cost was run after validation completed. 880 samples cover 11 actions on four
backends; 240 samples are the three new actions. Each has 64 warmups followed
by 20 samples of 128 complete calls, including context creation, output
materialization and destruction. The original eight actions remain. The 4x4
fixture has [-8,-7] diagonals and [-1,2] off-diagonals; all exact expectations
are asserted before timing. Fixed Q16/f64 allocate zero. Rational identity
subtraction allocates 24 times/960 bytes and margins six times/240 bytes;
dyadic identity subtraction allocates 42 times/360 bytes and margins 94 times/
776 bytes per call. cost-summary.json retains all timing/allocation samples;
cost.log gives inline storage, and binary digest/section sizes are separate.
These are fixture measurements, not universal bounds or comparative speedups.
No owned executables are archived.

## Preservation and limits

source-preservation.json verifies 168 byte-identical scalar/main-lattice/solver/
companion implementation files, plus retention of every original line in order
in the two extended companion implementation files. No old arithmetic or
predicate dispatch body/order was changed. repository-budget.log passes.

No full legacy benchmark, successive_operations, monomorphized/binary-size
comparison, all-workflow pre-push run, new fuzz campaign, hosted OS, firmware
HIL or additional float-target qualification is claimed. Native float success
remains x86_64-qualified. These exact arithmetic helpers do not establish a
Jacobian's relationship to a function. Independently authored center/radius,
Jacobian carriers, specialized consumers and the remaining phases stay open.
