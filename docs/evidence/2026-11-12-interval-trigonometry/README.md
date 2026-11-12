# Periodic sine/cosine and feature-gate qualification

SOURCE.json identifies the committed source and baseline. source.patch contains
the final implementation. The missing API/interior-extremum witness, initial
compile failures, feature-gate regression, initial lint failures and final
successful runs remain in this record. Baseline no-feature strict Clippy can
be reproduced at 9bbeb1012; moving arctangent back above the bounds cfg restores
that guard. CI now checks no-feature strict Clippy on each host compiler.
state-after-gate-repair.json is explicitly a post-repair state record.

Run checks.py from the CSGRS root. All 29 final commands pass, including 123
unit/integration tests and 12 doctests. matrix-initial retains two strict-Clippy
failures on the quadrant parity expression; pre-lint-trigonometry.rs records
that source. The final expression matches quadrants 0/2, and the full matrix
was repeated after that source change. Type-inference compiler failures and
successful repairs are also retained. No existing scalar evaluator or
predicate decision order was changed.

The admission proof in INTERVAL_REFACTOR_PROGRESS.md explains quadrant
selection, negative-source symmetry, signed Taylor remainders, crossed extrema,
whole-period and unbounded images. Tests include 256-bit brackets around
critical values, phases through 2^512, precision through -1024, tiny values,
i32 extreme completion/refusal, resources/retry, serde and subsequent operations.
The independent oracle applies directed MPFR at a representable point plus
an exact GMP input-error allowance using the global unit Lipschitz bound.
It does not round a source down then assume sine/cosine monotonicity. Directed
pi bounds and GMP arithmetic select extrema independently from production.

Fuzz reproduction from crates/hyperinterval with cargo-fuzz installed:

    cargo +nightly fuzz run trigonometry --features rational CORPUS_DIR -- -runs=10000 -max_len=8 -max_total_time=60 -seed=20261121

The original 30-second campaign reaches 8199 runs (31 seconds reported).
The supplemental pre-lint campaign and final post-lint campaign both complete
10000 in 39 seconds. Final corpus and all logs remain. CI retains its 30-second
bounded campaign; a 10000-case completion is not claimed for that first run.
The targets check independent bounds, domain receipts, replay and continued use.

Cost reproduction from the source root:

    cargo +stable build --locked -p hyperinterval --release --no-default-features --features rational,dyadic --example trig_cost
    python3 /tmp/interval-refactor/trigonometry/measure.py

All 1560 samples complete (26 backend/function/input groups x 3 precisions x
20 samples). There are 128 warmups and 128 images per sample. Timing includes
all reduction, constant, series, refinement, output, receipt and destruction;
input construction/oracle checks are excluded. Raw samples retain deterministic
work units; host/compiler metadata, binary hash and whole-probe size are saved.
The probe links GMP/MPFR oracle code; binaries are not archived. These are
new-capability measurements, not baseline speedups or consumer qualification.

Coverage uses Rust 1.95 all-feature tests, -C instrument-coverage, a fresh
coverage-1.95/%p-%m.profraw directory, and Cargo --message-format=json captured
as build.jsonl. Run the report and diagnostic scripts with these paths (or
adjust all original staging paths into a new empty directory). Final coverage
is 3298/3374 lines and 6612/7090 regions, with no branch denominator. Scripts
exclude tests, conformance, Hyperreal, dependencies and ieee_tests.rs. All
seven mismatches are excluded Rug OptRational::parts, diagnosed with --dump.
The earlier coverage-initial profiles are not merged with the final set.

Local qualification includes strict Clippy/docs/format, all repository Zizmor,
feature and no_std portable builds, primitive dependency closure and four
unchanged Hypersolve value/dispatch tests. It does not establish hosted jobs,
release packaging, firmware/HIL or consumer migrations. DyadicBudget bounds
deterministic cumulative work and intermediate coefficient reservations, not
actual heap bytes, CPU instructions, wall time or cancellation. Unresolved
narrow huge phases fail before publishing an image. Empty, exact-zero and
proved whole-period outputs retain their distinct successful semantics.
