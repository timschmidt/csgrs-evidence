# Budgeted logarithm and extended real-carrier qualification

SOURCE.json identifies the committed source. The source patch and missing-API
witness are retained. The baseline has neither ExtendedIntervalView nor log;
copy the initial domain test from the patch to reproduce the missing methods.
The admission record in INTERVAL_REFACTOR_PROGRESS.md states the domain,
mathematical argument, resource accounting, composition and remaining gaps.

Run checks.py from the CSGRS source root. It executes 34 affected feature,
release, lint, documentation, downstream dispatch, dependency and portable-build
checks. Five initial failures are the same missing BigInt type annotation in
the new cost probe. Those logs remain intact. recheck.py reruns the failed rows;
all five pass after the annotation. The all-feature suite has 113 tests and
12 doctests. Rust 1.88 covers the dyadic/primitive core, Rust 1.95 and stable
cover all features. Strict IEEE code scans/native-mode tests are rerun because
the shared error enum gained variants. No existing finite predicate order or
Hyperreal computable evaluator changes.

Fuzz reproduction, from crates/hyperinterval, with cargo-fuzz available:

    cargo +nightly fuzz run logarithm --features rational CORPUS_DIR -- -runs=10000 -max_len=8 -max_total_time=30 -seed=20261119

The ASan campaign completes 10000 runs in 13 seconds. The retained corpus and
log include directed independent MPFR/GMP bounds, extended set operations,
serde and subsequent exp. Core tests add extreme i32 scales, 1024-bit rational
coefficients, refusal/retry and exact endpoint-order laws. Four unchanged
Hypersolve value/dispatch tests pass. These are local results, not hosted
platform, firmware/HIL, release-distribution or consumer-migration qualification.

Cost reproduction from source root:

    cargo +stable build --locked -p hyperinterval --release --no-default-features --features rational,dyadic --example log_cost
    python3 /tmp/interval-refactor/logarithm/measure.py

All 600 samples complete, including finite and partial-domain results, owned
output, coverage receipt and all refinement work. Inputs and independent
oracles are outside timing. Raw samples retain deterministic work units;
summary, compiler/hardware metadata, binary hash and size are included.
The probe includes GMP/MPFR oracle code. Binary executables are not archived.
Dyadic and extended layouts measure 72/80 bytes, excluding heap storage.

Coverage reproduction uses Rust 1.95 all-feature tests in a separate target
with RUSTFLAGS='-C instrument-coverage' and LLVM_PROFILE_FILE pointing to a
fresh coverage-1.95/%p-%m.profraw directory. Capture Cargo --message-format=json
stdout as build.jsonl; then run coverage_report_1_95.py and its diagnostic
companion. Paths in these scripts refer to the original staging directory;
restore this record there or adjust them to a new empty staging directory.
Coverage is 2811/2871 lines and 5483/5791 regions. No branch denominator is
reported. Scripts exclude dependencies, Hyperreal, tests, conformance and
ieee_tests.rs. All five mismatches are excluded Rug OptRational::parts;
--dump diagnostics are retained. The full-coverage target remains open.

DyadicBudget bounds deterministic cumulative work units and intermediate
coefficient size. It does not bound actual heap bytes, CPU instructions,
wall time or cancellation. Storage exponent limits remain typed Overflow.
Infinity denotes an unbounded direction, not a real member. Extended exp
uses a closed enclosure and can include an unattained zero infimum. Domain
coverage is operation-local: keep earlier Partial receipts through later
Complete operations. No full-plan or universal closure claim is made.
