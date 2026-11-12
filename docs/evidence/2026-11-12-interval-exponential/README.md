# Budgeted exponential qualification

SOURCE.json identifies the committed source. Source patch, missing API witness,
two reproduced assembly exhaustion failures and their pre-fix source snapshots
are retained. Replace exponential.rs with the appropriate snapshot and run the
interval_assembly test to reproduce each failure. The maintained hard cases
remain in the accepted source tests.

checks.py reproduces the 26-command feature, test, release, lint, docs, fuzz
compile, workflow security, downstream dispatch, dependency and portable-build
matrix. The all-feature corpus has 101 unit/integration tests and 11 doctests.
Final supplemental logs qualify large rational inputs and coarse tail boundaries
added after the first matrix. No production code changed during that addition.

The exponential fuzz target requires rational features. Final parameters are
seed=20261118, runs=10000, max_len=8, max_total_time=30; it completed 10000 runs
in 13 seconds without failure. Earlier logs used grid exponents -72..-8; final
code extends through zero. Both corpus directories and all campaign logs are
retained. The final oracle uses independent directed MPFR at 4096 bits followed
by exact GMP grid rounding, never another wrapper of the interval evaluator.

Build exp_cost in stable release with rational,dyadic and no default features,
then run measure.py from the source root. All 480 samples completed, including
all refinement work and owned output. Raw samples contain work units per image;
summary, compiler/hardware metadata, binary hash and whole-executable size are
retained. The executable includes GMP/MPFR oracle code; no binary is archived.

Coverage uses Rust 1.95, -C instrument-coverage, all-feature tests and a fresh
%p-%m.profraw directory. Final coverage is 2388/2432 lines and 4583/4790 regions;
LLVM gives no branch denominator. Exclusions are in the report scripts. Dump
identifies all four mismatches as excluded Rug OptRational::parts. Earlier
profile directories are retained separately, not merged with final data.

This evaluator has a deterministic cumulative work/intermediate-size contract,
not actual heap-byte, CPU-instruction, wall-time or cancellation guarantees.
Internal scale-storage failure remains Overflow. No consumer migration or
full-plan completion is claimed; the existing Hyperreal scalar evaluator and
predicate order are unchanged.
