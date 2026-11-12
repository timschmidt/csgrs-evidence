# Dyadic nonnegative powers qualification

Source: `731967920007e99363010a00ddbfe8c13b15cf66` in timschmidt/csgrs; baseline `054342332`.
This adds checked_pow(u32, shared budget) without changing solver or domain consumers.

## Reproduction

checks.py and checks.json record the final 13 commands, logs and successful exits.
They cover Rust 1.88/1.95, features, linting, docs, format, fuzz compilation,
retained Hypersolve migration tests and ARM/WASM. initial-matrix retains the
first run, including the parity-style lint failure. clippy-final.log is the
final stable all-feature/all-target strict lint. check-3.log includes the final
38 tests and 3 compile-fail examples.

The final sanitizer command, run from crates/hyperinterval, was:
`PATH=/tmp/interval-refactor/tools/bin:$PATH CARGO_TARGET_DIR=/tmp/interval-refactor/fuzz-target cargo +nightly fuzz run dyadic_arithmetic /tmp/interval-refactor/dyadic-powers/corpus -- -runs=100000 -max_len=14 -max_total_time=30 -seed=20261113`.
Both 100,000-run logs and final corpus are retained; the final run completed
without failures in 12 seconds. This duration is a campaign observation, not
a performance qualification.

Coverage build used `RUSTFLAGS='-C instrument-coverage'`,
`LLVM_PROFILE_FILE='/tmp/interval-refactor/dyadic-powers/coverage-final/%p-%m.profraw'`,
`CARGO_TARGET_DIR=/tmp/interval-refactor/coverage-phase3` and
`cargo test --locked -p hyperinterval --all-features --tests --message-format=json`.
coverage_report.py records LLVM report generation. coverage-final contains final
profiles, merged profile and reports; coverage-initial is before the lint fix.
Build binaries are omitted and can be rebuilt from the source revision. Absolute
paths need remapping for another checkout.

## Contract and limits

6,370 small images have independent integer extrema. Tests exercise generated
output through regrid, reciprocal, product and validated replay. Further cases
cover maximal exponent, units and zero, exact exponent normalization, pre-growth
size rejection, cumulative work failure and retry. The budget reserves magnitude
bits and deterministic work units, not measured bytes or CPU cycles.

Dyadic line coverage: 522/526 (99.24%); all Hyperinterval lines: 1305/1347
(96.88%). Branch counters are unavailable. No universal completeness or
performance improvement is claimed. Negative-power composition requires a
representable/affordable positive-power intermediate. Direct negative-power
and rational-power APIs remain work to do; no plan phase is marked complete.
