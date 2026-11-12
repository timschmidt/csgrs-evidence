# Rational and dyadic square-root qualification

The source revision is recorded in SOURCE.json. The record retains the missing
API witness, intermediate compile/lint diagnostics, final 26-command matrix,
independent GMP/MPFR tests, two completed ASan campaigns plus the initial
missing-directory launch failure, final-source coverage and diagnostics, and
640 completed cost samples. Production implementations and maintained tests,
fuzz harness and cost probe are in the source repository revision.

Run checks.py from the CSGRS root to repeat the command matrix. Run the
square_roots fuzz target with rational features, max_len=10, seed=20261116,
100000 maximum runs and max_total_time=30; create the corpus directory first.
Final-source campaign stopped successfully at 92929 runs after 31 seconds;
the earlier source completed 100000. No crash or oracle failure occurred.

Build/run the sqrt_cost example in release with no default features and
rational,dyadic enabled to reproduce the completed-output probe. Metadata
contains executable hash, compiler, machine, flags and exit status; samples
and summary retain all 32 case/grid/backend groups. The probe includes its
independent GMP/MPFR oracle, so whole executable size is not kernel size.

Coverage uses Rust 1.95 -C instrument-coverage, all-feature tests, and the
record's fresh %p-%m.profraw directory. Report and diagnostic scripts record
exclusions. Both mismatch diagnostics refer to excluded Rug OptRational::parts.
The 2186/2230 line and 4123/4289 region totals are not full coverage; LLVM
supplies no branch denominator. No compiled program is archived.

This is a new-operation qualification, not a behavior-preserving consumer
migration. Resource units are deterministic reservations, not a CPU or actual
heap-byte bound; cancellation and those broader budgets remain open. Primitive
root backends, later elementary functions and the full refactor are incomplete.
