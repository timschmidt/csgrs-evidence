# Exact elementary order images

Source commit: 435be1e85b2ffa884b08e50da6ac2d1f66edfd91. Baseline: ab528b090.
See INTERVAL_REFACTOR_PROGRESS.md at the source commit for the contract,
proof outline, measurements and remaining plan scope. No push performed.

- missing-witness.log: compile failure before implementation, missing public
  absolute/min/max methods, not a runtime correctness claim.
- checks.py/checks.json: 32 final commands, all successful. Includes feature,
  MSRV, docs, lint, formatting, target/dependency isolation, downstream value/
  dispatch and release-mode/codegen checks. release-order-checks.json adds
  three successful optimized order-image suites.
- codegen-final-* and codegen-lto: emitted integer-only kernel inspection,
  expanded to include Bounds functions; compiler/build flags and binary hash
  retained with disassembly. No whole-executable no-FP claim.
- fuzz-checks.json and *-fuzz.log: three ASan 100000-run campaigns, preserved
  corpora, seeds and byte/time caps. strict_float starts from the prior strict
  campaign corpus; fixed/dyadic start empty. Earlier archives remain unchanged.
- coverage-final: Rust 1.99 profiles, normal report/export successful.
  coverage-diagnostic.log retains the optional --dump internal malloc failure;
  that process hung in its crash handler and was explicitly terminated.
- coverage-1.95: separately compiled/instrumented tests, report/export and
  diagnostic all succeed, reproducing the same production coverage counts.
  Both diagnostics identify the excluded Rug OptRational::parts profile
  mismatch. No full-coverage or LLVM debug-tool correctness claim is made.
- samples.csv/cost-summary.json: successful per-family abs/min/max chains,
  4096 warmup calls and 30 samples of 16384 owned/dropped results per family.
  Inputs are preconstructed, distinct grids represent different workloads.
  No cross-family speedup or firmware timing equivalence is asserted.
- cost-environment.json/cost-size.txt: compiler, host, flags, binary SHA256,
  byte size and whole-executable sections. Build trees/binaries are not copied.

Reproduce the cost probe:

```
cargo +stable build --locked --release -p hyperinterval --example order_cost --all-features
target/release/examples/order_cost
```

Coverage scripts record exclusions and exact objects. Rebuild with the recorded
instrumentation flags and compiler if the external target paths no longer exist.
The LLVM 1.95 diagnostic has an explicit timeout to contain tool failures.

This extension completes three total elementary images, not phase 5 or the
15-phase plan. Power gaps, other elementary functions, full coverage, broader
consumer/target qualification and shipped distribution remain open. Existing
consumer kernels/predicate sequences were not migrated by this change.
