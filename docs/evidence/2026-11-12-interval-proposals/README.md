# Primitive proposal interval qualification

Source: `f7b20ff272ac88f7c8a8d92ad5b937d519d76e06` in timschmidt/csgrs; baseline `6bd4b882c`.
This adds non-authoritative primitive proposal types, not strict float enclosures.
The full refactor remains active; phase 4 is not complete.

## Reproduction

checks.py/checks.json contain the final 17 commands and exits. check-4.log
contains 46 passing tests and 9 compile-fail examples. Other commands cover
Rust 1.88/1.95 features, strict lint, docs, formatting, fuzz-target compilation,
retained Hypersolve migration witnesses, ARM/WASM and pedantic zizmor.
initial-matrix preserves the earlier run. initial-check.log retains the
initial feature-isolation dead-code warnings; proper feature gates resolved them.

Final ASan command, from crates/hyperinterval:
`PATH=/tmp/interval-refactor/tools/bin:$PATH CARGO_TARGET_DIR=/tmp/interval-refactor/fuzz-target cargo +nightly fuzz run primitive_proposals /tmp/interval-refactor/proposals/corpus -- -runs=100000 -max_len=32 -max_total_time=30 -seed=20261113`.
The final run completed 100,000 cases with no failures. The initial campaign,
final corpus and compile log are preserved.

Coverage command used `RUSTFLAGS='-C instrument-coverage'`,
`LLVM_PROFILE_FILE='/tmp/interval-refactor/proposals/coverage-final/%p-%m.profraw'`,
`CARGO_TARGET_DIR=/tmp/interval-refactor/coverage-phase3` and
`cargo test --locked -p hyperinterval --all-features --tests --message-format=json`.
coverage_report.py specifies the LLVM reconstruction. Raw and merged profiles,
reports and compiler artifact metadata are included. Binaries can be rebuilt
from the source commit and are omitted. Absolute paths need remapping elsewhere.

The cost command is `cargo build --locked -p hyperinterval --release --example
proposal_cost --no-default-features --features float-proposal`, followed by
`target/release/examples/proposal_cost`. Final samples, layout, section sizes,
compiler/CPU metadata and executable hash are retained. The probe includes host
benchmark infrastructure; its size is not a standalone kernel-size measurement.
Observed medians are 83.85 ns (f32), 67.73 ns (f64) per completed add/affine step;
there is no paired speedup claim. Dependency output contains only Hyperinterval.

## Authority and limitations

Tests exercise finite ingress, signed zeros/subnormals, special-value rejection,
20,000 generated bit pairs, empty/error precedence, native arithmetic, exact
bit-pair replay and compile-time absence of containment/sign/conversion APIs.
A rounded sum deliberately fails to enclose the exact sum. Proposal equality is
bit-based, but native arithmetic remains environment-dependent and approximate.
Only exact-source replay can certify a proposed operation.

proposal.rs covers 103/104 lines and ieee.rs 15/15; branch counters are absent.
No full coverage, universal completion, strict-float qualification, firmware
cycle bound or consumer migration is claimed. Existing exact consumer dispatch
and production source are unchanged.
