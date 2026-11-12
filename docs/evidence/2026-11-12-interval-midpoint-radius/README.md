# Retained midpoint/radius vector and matrix decomposition

Baseline: `9b1274ce8141d56764e3d6652540e0fe0833d68a`; source commit in SOURCE.json.
initial-state.json and environment.txt record repository states and toolchains.
Commands run from /mnt/development/csgrs unless their manifest path says otherwise.
The previous goal turn made progress by restoring broad sanitizer qualification.
This extends Phase 6 without claiming phase or full-plan completion. No push.

## Contract

Hyperinterval owns scalar center/radius projections. Hyperlattice owns Cartesian
structure. MidpointRadiusVector<I,N> and MidpointRadiusMatrix<I,R,C> retain checked
bounds once, defining each center c=(a+b)/2 and radius r=(b-a)/2 exactly. Source
ownership transfers into midpoint_radius() and back through into_intervals();
intervals() borrows the exact source. No scalar copies, arithmetic, rounding or
work budget is needed for these transfers. Half-step values need not fit the
endpoint family. Empty is distinct from the zero-dimensional unit product.
Serde delegates to validated source serialization; no cached fact is accepted
as proof. Equality follows source-set equality. Inline layout is transparent.

Explicit midpoint_enclosure and radius_enclosure queries materialize endpoint-
family enclosures. Fixed uses the existing widened directed quotient helper;
rational delegates to exact measurements; dyadic delegates to exact measurement
except for minimum-exponent outward grid rounding with scaled_quotient. IEEE
halves decoded exponents and reuses add_wide; it never rounds intermediate
halves, overflows an otherwise representable mean by first adding, or relies on
native float rounding. Float ingress retains its x86_64 qualification. Fixed
radius projection may overflow, while exact reconstruction still succeeds.
Every dyadic projection shares its caller's budget through all lanes/rows;
no partial array or matrix escapes on failure. A projected radius describes
the exact original radius, not one adjusted around a separately rounded center.
A projected midpoint can be nonsingleton and cannot silently become a point.
The retained definition remains authoritative after any projection.

This refines the plan's illustrative separate C/R type parameters into a
source-parameterized decomposition. It covers checked bound inputs. Independently
authored center/radius forms and their representation/closure work remain open.
No solver certification status or production solver migration is introduced.

## Correctness and replay

missing-witness records the absent method on baseline; witness-now-passes.log
checks the identical witness after implementation. baseline-lattice.log retains
the preceding owner suite. New corpus: 3,375 vectors and 3,375 rectangular 2x3
matrices per backend, six backends, with independent integer center/radius
expectations. Reconstructed sources feed dot/matrix-vector products with exact
independently calculated weighted extrema. Scalar fixed tests establish half-
step enclosure tightness with integer inequalities and test full signed ranges.
IEEE tests compare both projections for 10,081 source pairs per format against
independent GMP rational sums/differences and MPFR directed grid conversion.
This includes MAX+MAX, +/-MAX, subnormals, cancellation and random exponent gaps.
All 16 native rounding/FTZ/DAZ combinations pass, including optimized Rust 1.88,
1.95 and stable builds. Existing finite-ingress barrier remains intact.

Dyadic tests cover exact halves, minimum-exponent half-step projection,
maximum exponents, work/size exhaustion and exact-work retry without source
mutation. Lattice tests share budgets across whole matrices. Empty/unit, zero
matrix orientations, 33-lane serialization and malformed scale/order/shape
inputs are covered. Fresh child processes replay fixed, float matrix and dyadic
forms, recompute projections, reconstruct sources and consume widths/intersections
and another decomposition. Fixed projection overflow does not lose the source.

## Validation and adverse records

The 59-command selected matrix is in checks.py/json. Two initial failures were
the new main-facade test and its Clippy check: its constructor helper had only
existed as local closures in other tests. Extracting the existing identical
constructor into one shared test helper fixed it without removing assertions.
check-27-retry, check-28-retry and check-31-retry retain affected reruns;
checks-final.json records all 59 passing statuses. The original matrix logs and
failing driver assertion remain. Coverage/sanitizer owner sources did not change
in that facade-test correction. An earlier lattice test draft had an extra cfg
parenthesis; lattice-tests.log and its corrected retry remain.

Scope: Rust 1.88/stable feature isolation, 1.95/all-feature and release owner
suites, all-target Clippy -D warnings, docs with warnings denied, format, six
facade tests, four unchanged Hypersolve migration/dispatch tests, packaging and
primitive dependency inspection, ARM/Wasm builds, fuzz manifest/Clippy/format.
Rust 1.88 uses portable features; Hyperreal retains its Rust 1.95 requirement.
The lattice suite has 58 tests and five doctests. No CI configuration changed.
These selected checks do not replace the complete pre-push workflow set.

Full sanitizer command (passed):

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked -p hyperinterval -p hyperlattice-interval --all-features --tests --target x86_64-unknown-linux-gnu

asan-summary.json counts 218 parent-suite tests across 39 executables, including
fresh child replay and cache lifecycle: 160 scalar, 58 lattice. Child reports
are not double-counted. No leak checks or assertions were suppressed.

Instrumented test command (passed):

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-coverage RUSTFLAGS='-C instrument-coverage' LLVM_PROFILE_FILE='/tmp/interval-refactor/midpoint-radius/coverage/%p-%m.profraw' cargo +1.95.0 test --locked -p hyperinterval -p hyperlattice-interval --all-features --tests --message-format=json

coverage_report.py merges raw profiles and invokes llvm-cov with one thread.
Owner totals: 5,401/5,503 lines (98.15%), 9,967/10,615 regions (93.90%), 690/692
functions. New retained-form module: 83/84 lines, 90/93 regions, 21/21 functions.
The report excludes tests, conformance, dependencies and toolchain code; the
exact regex is in the script. No branch denominator or 100% claim. All twelve
mismatch warnings were checked with individual llvm-cov --dump invocations;
each names the external Rug OptRational::parts hash-zero function outside the
owner denominator. coverage/mismatch-functions.json retains these diagnostics.
This is owner coverage with dependency warnings, not warning-free aggregate
coverage of all linked dependencies.

## Fuzz

    RUSTUP_TOOLCHAIN=nightly /tmp/interval-refactor/tools/bin/cargo-fuzz fuzz build strict_float --all-features --target-dir /tmp/interval-refactor/fuzz-target --fuzz-dir crates/hyperinterval/fuzz

The existing strict-float harness retains every earlier assertion and adds
midpoint/radius projection comparisons using its independent oracle. fuzz.json
records executable digest, arguments and exit zero. 10,000 executions, seed
20261112, 52 initial seeds (preserved previous corpus plus ten half-step/extreme
cases), 24-byte input cap, ten-second input timeout, 2,048 MiB RSS cap and
180-second outer process limit; address sanitizer and leak detection enabled.
All complete. Raw corpus and log remain. This is bounded fuzz evidence, not an
exhaustive campaign or proof of universal closure.

## Portable consumer

    CARGO_TARGET_DIR=/tmp/interval-refactor/midpoint-radius-wasm-target cargo +1.88.0 build --locked --manifest-path /tmp/interval-refactor/midpoint-radius/wasm-consumer/Cargo.toml --release --target wasm32-unknown-unknown
    /tmp/interval-refactor/tools/bin/python /tmp/interval-refactor/midpoint-radius/wasm-replay.py

Standalone no_std source/manifest/lock are retained. No global allocator and
zero imports. wasmtime 50.0.1 executes 2,051 midpoint/radius calls over 513
effective inputs, including vector and matrix projections, exact reconstruction,
radius-norm consumption and source retention after extreme radius overflow.
Independent external checksum is 2*clamp(input,-256,256)+31. All prior probes
also pass (including 73,836 runtime-chain calls), each under one-million-fuel
limits. The first runner accidentally indexed exports with a tuple; its source
and failure log are preserved. The corrected runner passes. Artifact: 61,716
bytes, SHA-256 e1a8be5cf6a989fdf551cd6c4ecd3a6ece7744e0a8bf4273a3afabe64323dd6d.
Six exports versus the preceding five: +16,990 bytes, with a changed workload,
not a same-contract size comparison. No new float target qualification, firmware
HIL/cycle measurement, hosted OS or registry release claim.

## Completed-work costs and preservation

    cargo +1.95.0 run --locked --release -p hyperlattice-interval --all-features --example midpoint_radius_cost

480 samples: four backends, six vector/matrix actions, 20 samples each, 128
completed operations/sample after 64 warmups. Length-four vectors and 2x2
matrices. Inputs and independent expected outputs checked before measurement.
Ownership-transfer queries move already owned values through retained forms
and back; cloning is outside their measured loops. Projection queries include
context creation and consume/materialize their outputs. Shared host, after the
validation batch; no affinity/isolation, universal latency or speedup claim.

Ownership transfers allocate zero across all four backends; Q16/f64 projections
also allocate zero. Small rational fixtures allocate zero without establishing
a general rational bound. Dyadic projections allocate six times/48 bytes per
measured four-lane call. Source and retained-form inline sizes match: 48 bytes
Q16, 96 f64, 72 rational, 288 dyadic, for both measured shapes. These are not
peak stack or retained-heap measurements. CSV, summaries, native ELF sections
and digest are retained; generated executables are not archived.

source-preservation.json records 27 byte-identical tracked implementation files
and every original line retained in order in seven edited owner implementation
files. New methods reuse existing arithmetic authorities; original predicate
order and scalar APIs remain. Main Hyperlattice adds reexports and its facade
regression. Full legacy geometry benchmarks, successive_operations and
monomorphized-size gates are not inferred from source preservation. Independent
center/radius authoring, contraction/Krawczyk/Jacobian helpers, specialized
consumers, wider resource/coverage/performance gates and remaining plan phases
stay open. No phase completion or push is claimed.
