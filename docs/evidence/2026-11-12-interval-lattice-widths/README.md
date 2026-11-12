# Exact interval widths and widest-axis selection

Baseline: `6768c26ae0f995973834e50be761e1fe2969c242`; source checkpoint in
SOURCE.json. Initial repository/branch/status records and environment are in
initial-state.json and environment.json. Commands run from
/mnt/development/csgrs unless stated. No push or production migration.

## Contract and witnesses

Hyperinterval owns exact scalar widths and their order. Hyperlattice owns
coordinate selection. FixedWidth<F> preserves the full unsigned endpoint
difference with its binary scale; its checked projection into i64 endpoints may
overflow. F32Width/F64Width preserve the checked defining interval and order the
exact difference by b+c-a-d on the finite IEEE grid. Two bounded positive and
negative limb accumulators need five/33 u64 limbs for binary32/binary64. No
native float arithmetic, rounding, allocation or new adapter-level kernel.
Different defining intervals can have equal widths and different serialized
bytes. Projection can round or overflow without modifying the retained width.
Rational/dyadic widths are exact singleton intervals, with dyadic comparisons
using the existing budgeted scalar-order kernel. Empty box widths return None,
unit widths Some([]); widest_axis returns None for both, otherwise the first
maximum (index zero for all-zero widths). Failure publishes no partial axis or
array. Float ingress remains qualified only on x86_64.

missing-witness.rs/log reproduce absent APIs; baseline-scalar/lattice.log record
baseline tests. New scalar tests include full signed fixed ranges, invalid
scales/replay, subnormals, widths above MAX, equal rounded projections with
unequal exact distances, and translated equal distances. Each IEEE format has
10,000 deterministic xorshift comparisons plus 2,025 edge comparisons against
independent Rug/GMP rational subtraction. Shared dyadic size/work exhaustion,
exact-work retry, non-singleton validation and extreme exponent gaps are tested.
All 16 ambient rounding/FTZ/DAZ combinations run in child processes, including
optimized Rust 1.88, 1.95 and stable builds.

The lattice corpus enumerates 3,375 boxes per backend, six backends, with
independent integer width and first-maximum expectations. Additional tests cover
fractions, empty/unit/zero ties, fixed full range, float projection ties/overflow,
restrictions, further consumption, shared dyadic budgets and retry. Fresh child
processes reconstruct source, recompute selection and replay width definitions;
fixed overflowing widths and float projection ties survive. Primitive counted
allocation tests pass. Main Hyperlattice facade consumes rational widths.

## Validation and adverse evidence

checks.py/json and check-N.log preserve all 56 commands, statuses and elapsed
times. All passed: feature isolation on Rust 1.88/stable, 1.95/stable owner suites,
release tests, all-target Clippy -D warnings, docs with warnings denied, format,
five facade tests, four existing Hypersolve migration/dispatch tests, package
listing/dependency closure, ARM/Wasm checks. The lattice suite has 52 tests and
four doctests. Initial compile failed because Rational has PartialOrd rather
than Ord; using its existing total PartialOrd authority fixed this. Initial
Clippy found a collapsible if; the final let-chain preserves short-circuit order.
All adverse and corrected logs remain. No CI configuration changed. This is
selected qualification, not the complete pre-push workflow set.

Passing sanitizer commands (leak detection enabled):

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked -p hyperinterval --all-features --test widths --test float --target x86_64-unknown-linux-gnu
    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked -p hyperlattice-interval --all-features --tests --target x86_64-unknown-linux-gnu

See asan-widths-rebuilt.log (24 tests) and asan-lattice.log (52 tests). A broader
both-package --tests run failed after the scalar arctangent suite passed its
five tests: LeakSanitizer found 1,576 bytes in three allocations. The identical
leak reproduces at the unchanged baseline in a detached worktree
/mnt/development/csgrs-width-baseline, using the same explicit-target command
restricted to -p hyperinterval --test arctangent. Symbolized allocation frames
in baseline-leak-symbols.txt identify mpfr_cache, mpfr_atan and Rug pi/atan oracle
calls. Cache cleanup is still open; broad ASan is NOT a pass. The first baseline
attempt omitted --target and failed instrumenting proc macros; its log remains.
Sharing the target directory across worktrees then yielded stale baseline
artifacts on the focused test compile (asan-widths.log). Targeted cargo clean
of hyperinterval and hyperlattice-interval, recorded in asan-cache-reset.log,
followed by current-tree rebuild produced the passing logs. No test suppression
or leak-detection disabling was used.

Coverage tests passed with:

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-coverage RUSTFLAGS='-C instrument-coverage' LLVM_PROFILE_FILE='/tmp/interval-refactor/lattice-widths/coverage/%p-%m.profraw' cargo +1.95.0 test --locked -p hyperinterval -p hyperlattice-interval --all-features --tests --message-format=json

coverage_report.py merges profiles and runs llvm-cov with one thread. Report
scope excludes dependencies, tests, toolchain and conformance source; exact
regex is retained. Owner totals: 5,230/5,331 lines (98.11%), 9,717/10,360 regions
(93.79%), 650/652 functions. New lattice widths: 31/31 lines, 49/50 regions.
There is no branch denominator and no 100% claim. LLVM emitted ten function
mismatches. Per-object --dump diagnostics identify every mismatch as the same
external Rug OptRational::parts hash-zero function, outside the owner report
scope. coverage/mismatch-functions.json and mismatch-debug.txt retain that
evidence. This is owner coverage with a dependency diagnostic, not a clean
warning-free all-dependency report. Directed fuzz remains open.

## Portable consumer

wasm-consumer includes the standalone source/manifest/lock pointing at the local
package. Rust 1.88 no_std release build, with no global allocator:

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-widths-wasm-target cargo +1.88.0 build --locked --manifest-path /tmp/interval-refactor/lattice-widths/wasm-consumer/Cargo.toml --release --target wasm32-unknown-unknown
    /tmp/interval-refactor/tools/bin/python /tmp/interval-refactor/lattice-widths/wasm-replay.py

wasm-replay.json records zero imports; 2,051 width calls/256 effective inputs,
2,051 norm calls/255 effective inputs, 73,836 chain calls, and 2,051 calls per
static export. Each call has a one-million-fuel cap. The width probe checks exact
u64 full-range differences, projection overflow and deterministic ties; the
external runner checks axis*1000+clamp(input,0,255). Artifact: 44,726 bytes, SHA
`a2aa1b70e2a0528852146afd52d2aea03f97cbe55b96881ea7af7858d2c57324`.
Five exports versus the preceding four: +5,134 bytes with a changed workload,
not a same-contract regression measurement. No float target qualification,
firmware HIL/cycles, registry release or hosted CI claim.

## Cost and preservation

    cargo +1.95.0 run --locked --release -p hyperlattice-interval --all-features --example width_cost

160 samples: four backends, two queries, 20 samples each, 128 completed calls
per sample after 64 warmups. Dimension four; inputs constructed outside timing;
all exact widths and the selected index checked before measurement. Outputs
are materialized/consumed, context creation included. Shared host, no affinity
or isolation, no speedup or universal latency claim. Raw CSV/log, medians,
allocation counts, native ELF section sizes and digest are retained. Fixed Q16
and strict f64 allocate zero; small rational fixture also allocates zero, which
is not a general rational bound. Dyadic widths/selection use 6/7 allocations,
48/56 bytes per measured call. Inline source/width-array sizes: 48/32 fixed,
96/64 f64, 72/64 rational, 288/288 dyadic. Not peak stack/heap measurements.

source-preservation.json records 47 byte-identical tracked implementation files.
preserved-functions.json confirms every original signature/body in six edited
implementation units remains, including the finite-ingress inline barrier.
Changes are additive; original arithmetic, predicate order, Real APIs and
production consumers remain. This is not a full legacy geometry/benchmark/
monomorphized-size qualification. Only source/logs/profiles/digests are archived,
not generated executables. General rational/cancellation resource bounds, broad
sanitizer cleanup, full coverage/fuzz, remaining Phase 6 and all subsequent
plan gates remain open. No phase completion is claimed.
