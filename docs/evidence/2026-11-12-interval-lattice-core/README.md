# Cartesian interval foundation qualification (2026-11-12)

Source: `b03b3a4c98b0ee8731423816fa0666ecb7bbe50f`; baseline: `a76acf1ac83c6532e72279ced05305dd29181e5d`.
The full implementation plan remains active; this is a Phase 6 foundation,
not completion of that phase or of the 15-phase goal.

## Scope and authority

One implementation of Cartesian vectors/matrices/boxes in the Rust 1.88
no_std `hyperlattice-interval` package, additively re-exported by Hyperlattice.
All scalar calculations and relations delegate to Hyperinterval. The original
main crate cannot build under 1.88 with defaults disabled (`primitive-blocker.log`)
and still depends on Hyperreal (`dependency-baseline.log`). Existing no-default
consumers need its Real API, so the companion satisfies the plan's conditional
production-split allowance. The default primitive graph has only two packages.

A Cartesian product is empty if any lane is empty. A zero-dimensional unit
product is a singleton, distinct from explicit empty. Products return enclosures,
not generally exact correlated images. Scalar failures and shared dyadic budgets
are preserved; no partial numeric value escapes an error. Rational arithmetic,
explicit clones and serialization have no total-work/heap bound. Dyadic size/work
accounting is not a CPU-time, heap-byte, cancellation or stack bound. Inline
storage and stack consumption grow with compile-time dimensions.

## Evidence and commands

- `checks.py` / `checks.json`: 38 selected commands passed, including the host
  feature matrix, owner/re-export Clippy, docs, release tests, no-default legacy
  build, four solver differential/dispatch tests, ARM/Wasm 1.88 checks and zizmor.
- `final_checks.py` / `final-checks.json`: 34 commands passed after the final
  test additions. Core tests, all feature/MSRV combinations, docs, lint and
  release checks were rerun; the 240 legacy tests were not rerun merely because
  unrelated new-core tests were extended. Their source did not change.
- `stable-portable.json`: all four corresponding stable ARM/Wasm checks pass.
- `legacy-baseline.log`: 240 existing tests pass. `check-27.log`: the same 240
  plus the new public re-export surface test pass. `legacy-tests-comparison.json`
  lists the names; it is not a replacement for their assertions.
- `unchanged-numerical-source.json`: byte-identical 47 scalar/legacy source files,
  removing only the new lib.rs re-export block for comparison. No arithmetic or
  predicate calls were reordered in existing code. No legacy Real benchmark,
  successive-operation or monomorphized-size comparison is claimed here.
- `precommit-tests.log`: final 12 tests pass; no doctests exist in this package.
  Six backend instantiations each exhaust 1,296 two-lane interval combinations
  (dot, 1x1 and 2x2 products), and 2,916 point-matrix/box combinations (affine and
  subsequent product). A separate 50,625-case fractional fixed test compares to
  exact integer corner numerators. Constructor, empty/unit, overflow, replay,
  shared-budget, retry and no-allocation cases remain named maintained tests.
- `asan-final.log`: these deterministic tests pass with address sanitizer and
  leak detection. Command: `RUSTFLAGS='-Z sanitizer=address'
  CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan
  ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked -p
  hyperlattice-interval --all-features --tests --target x86_64-unknown-linux-gnu`.
  This is not a directed libFuzzer campaign.
- `coverage-final-2/` and `coverage_report_final_2.py`: Rust 1.95 instrumentation,
  final 472/483 lines (97.72%), 605/639 regions (94.68%), 101/101 functions.
  No branch denominator was emitted. Dependencies, tests, conformance, toolchain
  and standard-library code are excluded. Earlier reports/profiles are retained.
  LLVM report/export uses one thread because the earlier tangent checkpoint
  retained an LLVM diagnostic threading failure. The instrumented source is
  unchanged between the final tests and the source commit.
- `wasm-consumer/`, `wasm-build.log`, `wasm-replay.py`, `wasm-replay.json`:
  clean path-dependency cdylib build with Rust 1.88 for wasm32-unknown-unknown,
  release, no_std, no global allocator and zero module imports. Wasmtime 50.0.1
  verifies 2,049 calls (513 unique clamped inputs); the 15,592-byte artifact has
  SHA-256 `3750aea345e141daab5daf3d082474ad5f9dd5f2324ab71c44a561da407e4655`.
  The executable is deliberately not archived. This is a local development
  consumer, not proof of registry publication or firmware hardware operation.
- `final-check-31.log`: package file inventory includes the runnable fixed
  example. `final-check-30.log` executes it successfully.
- `linear-cost.csv`, `linear-cost.log`, `cost-summary.json`: 200 raw samples;
  five 2x2 cases, two paths, 20 samples, 128 completed/materialized/dropped
  outputs per sample after 64 warmups per path/case. Inputs are constructed
  outside timing; paths alternate by sample. Scalar-loop control uses the same
  authoritative scalar operations and is a cost control, not an independent
  oracle. Outputs are compared before timing. Allocation counters report calls
  and requested bytes, not retained/peak memory. Primitive rows allocate zero;
  other rows match the control. Small/wide rational medians are slower in this
  run. No speedup is claimed, and validation ran concurrently on this shared
  host. Command: `cargo run --locked -p hyperlattice-interval --all-features
  --release --example linear_cost`. Numerical inputs live in source.patch.
- `environment.json` captures compilers, host, CPU and lock diff.
- `repository-budget.log`, `precommit-fmt.log`, `precommit-diff.log` pass.
  No push was attempted; the full workspace pre-push gate has not been run.

## Adverse evidence and limits

`missing-witness.log` records absent public carriers on the baseline. The first
legacy run discovered that temporary compile-fail target before its deletion;
`legacy-baseline-contaminated.log` retains that failure and is excluded from
correctness claims. The subsequent baseline ran on unchanged legacy sources.
`initial-tests.log` records a missing const-generic annotation in a newly added
test; the test was fixed without weakening its assertion. Initial fmt differences,
coverage and ASan logs are preserved. No production numerical failure was hidden.

Full phase acceptance still needs exact correlated affine images, width/widest
axis, midpoint/radius forms, norms/measures, contraction/Krawczyk helpers, measured
specializations/facts and downstream migration/performance evidence. The solver
production migration remains rejected at the earlier size gate. This checkpoint
changes neither solver nor firmware production arithmetic. 100% coverage,
directed fuzzing, registry packaging, non-Linux hosted tests, hardware cycles/HIL,
stack bounds and full legacy performance qualification are not established.
