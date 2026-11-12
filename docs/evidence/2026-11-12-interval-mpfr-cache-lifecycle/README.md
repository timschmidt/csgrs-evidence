# MPFR oracle thread-cache lifecycle

Baseline: `1b62459197944b4ebd3356054a560d1e0af97f07`. SOURCE.json identifies
this source checkpoint. initial-state.json records clean branches/heads for
all four managed repositories. Commands run from /mnt/development/csgrs.
The preceding width checkpoint was progress; this work closes its reproducible
broad sanitizer blocker. No phase or full-plan completion is claimed.

## Failure and ownership

On this baseline, arctangent's five tests pass their exact assertions, then
LeakSanitizer reports 1,576 leaked bytes in three allocations. The reproduction
uses the current tree, not an assumed old review:

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS='detect_leaks=1:fast_unwind_on_malloc=0' cargo +nightly test --locked -p hyperinterval --all-features --test arctangent --target x86_64-unknown-linux-gnu

baseline-asan-arctangent.log records exit 1. The previous checkpoint also
symbolized these frames to GMP allocation, mpfr_cache, MPFR atan and pi calls.
Rug 1.30's local float/mod.rs documents local-cache cleanup before thread exit.
The repository already implements this in hyperreal/tests/support/mpfr.rs;
this change reuses that file rather than defining another cleanup mechanism.

Hyperinterval's independent test/oracle layer owns this fix (P5/P6/P20 and plan
14.4/14.5). Each affected executable imports one existing helper. Oracle entry
points register its thread-local destructor before first MPFR work. Caches
remain available during the test and are released on normal or unwinding thread
exit. Only FreeCache::Local is used: shared caches remain available to other
threads. No unsafe code, sanitizer suppression, disabled leak check, weakened
assertion, rounding/precision change or production arithmetic change.

The new mpfr_cache_lifecycle regression runs eight concurrent workers, warms pi
caches before a barrier, registers cleanup twice, then four workers unwind and
four compute atan(1). Exact dyadic equality to the rounded pi/4 and rational
bounds validate successful oracle outputs; joined panic payloads validate the
intended unwind path. LeakSanitizer validates cleanup when the process exits.
The ordinary regression also passes on Rust 1.88 without crate features.

## Consumer integration and adverse records

The first wiring put the helper at integration-test roots but missed consumers
that include the same oracles: cost probes and fuzz targets. Feature-isolated
compilation failed for fractional_power_cost. initial-checks retains that
failure. A self-contained oracle-module attempt passed ASan but Clippy rejected
duplicate helper modules in executables combining phase/trig or float/root
oracles; duplicate-owner-checks retains those diagnostics. Neither attempt is
the final qualified wiring. The final implementation has one helper import per
affected test/cost/fuzz executable, and shared oracle functions register it.
Final Clippy passes without lint exceptions. asan-initial.log,
asan-duplicate-owner.log and fuzz-build-duplicate-owner.log preserve intermediate
runs; only asan-all.log and fuzz-build.log qualify the final implementation.

## Final validation

All 37 final selected commands passed. checks.py/json and check-N.log record status and
elapsed time: Rust 1.88/1.95/stable feature isolation (none/fixed/dyadic/float),
all-target owner tests, doctests, Clippy with warnings denied, docs with warnings
denied; full lattice suite, main Hyperlattice facade, four Hypersolve migration/
dispatch tests, optimized scalar tests, fuzz manifests in primitive/rational
configurations, fuzz Clippy/format and workspace format. Rust 1.88 uses the
portable feature set, since Hyperreal requires Rust 1.95. This is a selected
local/downstream validation set, not the full pre-push workflow set. No push.

Final sanitizer command:

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked -p hyperinterval -p hyperlattice-interval --all-features --tests --target x86_64-unknown-linux-gnu

It passes all 206 parent-suite tests across 36 executables, including the
concurrent unwind regression and fresh-process replay children. asan-summary.json
counts each parent suite once rather than double-counting child reports.
No leaks, ASan errors or failed tests are suppressed.

Fuzz build:

    RUSTUP_TOOLCHAIN=nightly /tmp/interval-refactor/tools/bin/cargo-fuzz fuzz build --all-features --target-dir /tmp/interval-refactor/fuzz-target --fuzz-dir crates/hyperinterval/fuzz

All targets build with the default address sanitizer. fuzz-smoke.py then runs
nine affected targets: arctangent, exponential, fractional power, logarithm,
primitive roots, square roots, strict float, tangent and trigonometry. Each
receives 32 deterministic shape-valid seeds and 128 libFuzzer executions, seed
20261112, input-length cap, ten-second per-input timeout, 2,048 MiB RSS limit,
and 180-second external process limit, with leak detection enabled. All nine
complete. Inputs/corpora, raw logs, arguments, binary digests and statuses are
retained; generated executables are not archived. These short smoke runs are
not an exhaustive fuzz campaign or a full numerical coverage claim.

## Preservation and limits

source-preservation.json verifies 39 source/manifest/shared-helper files are
byte-identical to baseline, including both owner implementations, workspace and
owner manifests/locks, and the reused helper. oracle-preservation.json verifies
all original lines in 37 changed oracle/consumer files survive in their original
order; additions are imports and lifecycle registration. Original directed
precision, rounding, oracle expectations, kernel-call order and measured cost
closures remain. The new test adds concurrency/lifecycle evidence. Package
listing remains free of test/support files; no package dependency is added.

No production algorithm or representation changed, so this checkpoint makes no
new arithmetic, speedup, allocation-rate or binary-size claim. Existing width
coverage remains the prior checkpoint's report with its documented external Rug
profile warning; it was not rerun or promoted to warning-free coverage here.
Hosted Windows/macOS, full pre-push workflows, firmware HIL, full coverage/fuzz,
other resource gaps and remaining plan phases remain open.
