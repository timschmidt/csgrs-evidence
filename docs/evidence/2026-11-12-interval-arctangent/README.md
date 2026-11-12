# Budgeted arctangent qualification

SOURCE.json identifies the committed implementation. initial-state.json records
all four repository states before edits. source.patch and missing-witness.log
retain the missing method witness and accepted changes. The admission record
in INTERVAL_REFACTOR_PROGRESS.md gives the domain, identities, tail proof,
resource limits and remaining gaps. No Hyperreal production evaluator changed.

Run checks.py from the CSGRS root. All 26 commands passed locally. The original
check-23.log records an accidentally copied filter selecting zero tests;
resource-contained.log records the corrected explicit test under timeout 60s.
checks.py now uses that correct filter. All-feature tests have 118 unit/
integration tests and 12 doctests. precision-corpus.log supplements the first
run with MPFR checks through 2048-bit precision. oracles.log retains an initial
test-only type-inference compile error; oracles-2.log records its successful
repair. No production source changed after the first complete oracle run.

Independent tests cover reduction boundaries, exact zero, rational
coefficients beyond 1024 bits, i32 scale extremes, complete and unbounded
images, retry, serde and output-as-input chains. Extreme positive-scale checks
bound the reciprocal tail against independently directed MPFR pi/2 bounds;
they do not try to materialize 2^i32::MAX. Earlier Partial domain receipts are
retained through later locally Complete atan operations. Unbounded source ends
are limit directions, not finite surrogate values.

ASan fuzz reproduction from crates/hyperinterval, with cargo-fuzz installed:

    cargo +nightly fuzz run arctangent --features rational CORPUS_DIR -- -runs=10000 -max_len=8 -max_total_time=30 -seed=20261120

The retained campaign completes 10000 runs in 9 seconds. Its oracle is directed
MPFR4096 followed by exact GMP grid conversion. It also tests serde, continued
atan/set operations and the entire-real-line limit image. Corpus and log remain.

Cost reproduction from the source root:

    cargo +stable build --locked -p hyperinterval --release --no-default-features --features rational,dyadic --example atan_cost
    python3 /tmp/interval-refactor/arctangent/measure.py

All 660 samples complete (11 groups x 3 precisions x 20 samples). Each sample
contains 128 completed images, after 128 warmups per group/precision. All
refinement, output, receipt and destruction are timed; construction and oracle
work are excluded. Raw samples include actual deterministic work units, and
compiler/hardware metadata, executable hash and size are retained. The probe
includes GMP/MPFR oracle code; no executable binary is archived.

Coverage uses Rust 1.95 all-feature tests with -C instrument-coverage and a
fresh coverage-1.95/%p-%m.profraw directory. Capture Cargo --message-format=json
stdout in build.jsonl, then run coverage_report_1_95.py and its diagnostic
companion. Scripts use the original staging path; restore this record there
or adjust paths into a new empty directory when reproducing. Coverage is
3000/3063 lines and 5981/6364 regions. LLVM has no branch denominator. Exclusions
are explicit in the scripts. All six mismatches are excluded Rug
OptRational::parts, diagnosed with --dump. Full coverage remains open.

The checks include strict Clippy/docs/format, repository Zizmor, feature and
portable builds, primitive dependency closure and four unchanged Hypersolve
value/dispatch tests. They do not establish hosted platform, distribution,
consumer migration or firmware/HIL qualification. DyadicBudget measures
cumulative deterministic work and intermediate coefficient size, not heap
bytes, CPU instructions, wall time or cancellation. Exponent storage limits
remain typed Overflow. No full-plan completion or speedup is claimed.
