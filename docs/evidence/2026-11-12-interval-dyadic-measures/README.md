# Dyadic measurements and unary image qualification

Source: `7e7d200320f0c83c153904f46498a81b0aeb6c36` in timschmidt/csgrs; baseline `f69ee758c`.
All new APIs live in Hyperinterval. No solver or domain consumer migration.

## Commands and evidence

- checks.py / checks.json: 13 compiler, feature, downstream, documentation,
  formatting, lint and target checks; all exit zero.
- final-tests-retry.log: final 36 all-feature tests and 3 compile-fail doc tests.
- final-clippy-retry.log: final strict all-target Clippy.
- final-msrv.log / final-fmt.log: final Rust 1.88 dyadic tests and workspace format.
- fuzz-final.log / corpus: expanded ASan campaign, 100,000 runs, seed 20261112.
  Command (from crates/hyperinterval):
  `PATH=/tmp/interval-refactor/tools/bin:$PATH CARGO_TARGET_DIR=/tmp/interval-refactor/fuzz-target cargo +nightly fuzz run dyadic_arithmetic /tmp/interval-refactor/dyadic-measures/corpus -- -runs=100000 -max_len=14 -max_total_time=30 -seed=20261112`.
- coverage-final: final instrumented compiler artifacts metadata, raw profiles,
  merged data and LLVM JSON/text reports. Run with `RUSTFLAGS='-C instrument-coverage'`,
  `LLVM_PROFILE_FILE='/tmp/interval-refactor/dyadic-measures/coverage-final/%p-%m.profraw'`,
  `CARGO_TARGET_DIR=/tmp/interval-refactor/coverage-phase3`,
  `cargo test --locked -p hyperinterval --all-features --tests --message-format=json`.
  coverage_report.py records report reconstruction. Build binaries are external
  and can be rebuilt from this source. Absolute paths need remapping elsewhere.

## Scope and limits

1,710 small intervals, 35,910 finer-grid point queries and 5,670 reciprocal
images have independent integer expectations. A 512-bit square has an independent
binomial expectation. Generated values are consumed by arithmetic, rational
bridges and validated serde. Exponent limits, successful normalization, typed
failures, cumulative work exhaustion and retry are exercised.

Dyadic line coverage is 479/483 (99.17%). Branch counters are unavailable;
this is not full branch or universal domain coverage. Budget accounting is
in magnitude-bit reservations and deterministic work units, not CPU cycles
or heap bytes. No performance improvement is claimed. The full interval
refactor and its consumer migration gates remain incomplete.

Early PATH and test type-inference failures and their passing corrected runs
are preserved. coverage/ is the earlier test revision; coverage-final/ is the
final retained test revision. Production code was unchanged between those runs.
