# Exact affine image qualification (2026-11-12)

Source `2d92066ae55632a99b298ff7c359b01728038b05`, baseline `8a6fd2f2bbdf4b60419d8dced25fbc328f96f502`.
This advances Phase 6 of the unchanged 15-phase plan. Neither the phase nor
the overall goal is complete.

## Represented set and preservation argument

`AffineMap` contains a validated singleton matrix and translation. `AffineImage`
retains that map and its source, recursively rooted at one Cartesian parameter
box. Its set is exactly `{ A*x+b | x in source }`, even when individual output
coordinates cannot be represented on the scalar backend's grid. Subsequent maps
retain this definition and the common parameters. Parameter restriction intersects
the original box; it does not clip coordinates of an output enclosure.

Enclosure uses `B(Ax+b)+c=(BA)x+(Bb+c)` and calls the existing scalar/matrix
kernels. Coefficient bounds are pulled to the original box before evaluation;
no intermediate source-image box is substituted. Rational/dyadic completion
therefore yields the exact coordinate hull. Primitive outward arithmetic may
widen coefficient bounds/projection but does not modify the stored point maps.
Scalar overflow/work/size failures propagate without publishing partial output
or poisoning the source. Restrictions share the context with all owned copies.

All point coefficients must be finite singletons; empty/non-singleton matrices
and translations fail validation, including replay with an empty source. Maps
may be rectangular or singular. Zero-dimensional unit products stay distinct
from empty source domains. Empty images retain their source definitions; their
projected bounds are canonical empty. Equality of stored definitions is not
geometric set equality. No image-membership or general Boolean API is claimed.

Scalar/Cartesian numerical authority is unchanged (`unchanged-source.json`,
`preserved-helpers.json`, and source.patch). Existing `AffineSource` implementations
are sealed to boxes and retained images. No scalar formula or geometry kernel
was copied into an adapter.

## Executed evidence

- `checks.py` / `checks.json`: 44 selected commands passed. These include Rust
  1.88 and stable isolated/all-enabled features, Rust 1.95 all features, release
  tests, no-default/all-enabled Clippy, docs with warnings as errors, fmt, two
  Hyperlattice facade tests, four Hypersolve differential/dispatch tests, package
  listing/dependency closure, and ARM/Wasm checks on 1.88/stable.
- `baseline-tests.log`: the previous 12-test core suite passed before edits.
  `precommit-tests.log`: final 26 maintained tests and one doctest pass. There
  is one additional fresh-process child invocation, not another unique test.
- Each of six backends exhausts 6,561 pairs of 2x2 point matrices over {-1,0,1}.
  The oracle evaluates point maps at all four box corners with i64 integers,
  independently of interval operations or matrix composition. Additional cases
  cover shared-parameter cancellation, inverse maps, parameter restrictions,
  rank collapse, empty/unit/rectangular shapes, invalid maps, off-grid fixed and
  subnormal IEEE definitions, large rational/fractional maps, and nested budgets.
- The dyadic stress witness first exhausts a 256-bit intermediate projection,
  then consumes the retained definition with its inverse and recovers the source
  within that size budget. This compares different queries and is not a timing
  speedup claim. Smaller-work attempts fail typed, exact-work retries complete,
  and budgeted restriction copies leave the original reusable.
- Fresh-process serde reconstructs an exact 1/4 point on a half-unit endpoint
  grid and then doubles it to recover an exact representable 1/2. All scalar
  families have affine replay cases. Invalid nested maps and invalid scales are
  rejected even with empty sources. Definitions, parameter restrictions and
  deterministic serialization are tested separately from enclosure equality.
- `asan.log`: final deterministic test suite passes with address sanitizer and
  leak detection, including the replay child. Command:
  `RUSTFLAGS='-Z sanitizer=address'
  CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan
  ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked -p
  hyperlattice-interval --all-features --tests --target x86_64-unknown-linux-gnu`.
  This is not a directed fuzz campaign.
- `coverage/` / `coverage_report.py`: Rust 1.95 instrumentation reports owner
  600/610 lines (98.36%), 767/805 regions (95.28%), 126/126 functions. The new
  affine module covers 110/110 executable lines and 121/126 regions. There is no
  branch denominator. Tests, conformance, dependencies and toolchain code are
  excluded. LLVM report/export uses one thread per the previously retained LLVM
  diagnostic issue. No 100% overall coverage claim is made.
- `wasm-consumer/`, `wasm-build.log`, `wasm-replay.py`, `wasm-replay.json`: clean
  Rust 1.88 no_std cdylib path consumer. It links without a global allocator and
  imports no runtime functions. Wasmtime 50.0.1 executes both the existing
  Cartesian export and new correlated export for 2,051 calls each, spanning 513
  unique clamped inputs plus signed input extremes. Each call has an external
  million-fuel guard. The 18,161-byte artifact SHA-256 is
  `4e49a7683a89ab534ab98bb61fe58f5a5b653d7a417b03ecebb538aaa74ee626`.
  The executable is intentionally not archived. This does not establish registry
  distribution, native firmware cycles, hardware behavior or a stack bound.
- `affine-cost-final.csv` / `.log`: 480 raw samples, four backends, depths 1/2/4,
  enclosure and owned restriction, 20 samples of 128 completed/materialized/dropped
  outputs after 64 warmups. Fixtures are constructed outside timing. Closed-form
  shear iterates supply independent exact expected outputs before timing. Primitive
  paths allocate zero. Counters report allocation calls/requested bytes; reported
  `inline_bytes` is size_of_val and excludes heap storage, not total retained or
  peak memory. Four-map inline sizes: fixed Q16 312, strict f64 624, rational 488,
  dyadic 1872 bytes. `affine-cost.csv` preserves the earlier run whose ambiguous
  `retained_bytes` label was corrected. Its measurements were never heap totals.
- `baseline-linear-cost.*` / `final-linear-cost.*`: existing Cartesian probe has
  identical completed output rows and allocation counts. ELF text grew 292 bytes;
  text/data/bss combined grew 4 bytes. No on-disk baseline binary-size delta was
  measured. This additive capability adds typed failures; it is not a numerical
  refactor. Legacy Real source is unchanged, but full legacy benchmarks,
  successive_operations and monomorphized-size gates are not rerun here.
- `cost-summary.json` retains all timing runs. Shared-host timings vary materially
  (four-map Q16 enclosure median about 0.887 us initially versus 2.069 us finally).
  No speedup or stable regression rate is inferred. No favorable run is discarded
  or substituted for the final one.
- `environment.json` captures toolchains, CPU/host; source.patch and SOURCE.json
  retain the revision and exact edits. `repository-budget.log`, final fmt and
  Clippy pass. CI configuration did not change. No push was attempted; this is
  not a claim that the full workspace pre-push gate ran.

## Limits and outstanding work

Definitions currently have finite nesting encoded in Rust types, not a runtime
expression arena. Stack/storage grow with dimensions and depth. Scalar budgets
cover nested query/copy operations; they are not wall-time, total heap-byte,
stack or cancellation bounds. Rational arithmetic, explicit clones, arbitrary
precision validation and serde retain their declared unbounded-work limitations.

Chains whose lengths are chosen at runtime, full consumer qualification,
width/midpoint/radius/norm/measure APIs, measured specializations, complete fuzz
and coverage, publishing, hardware qualification and the other plan phases
remain open. The earlier rejected solver migration has not been reinstated.
`missing-witness.rs` / `.log` retain the original compile failure; no production
numerical failure was concealed or converted into a passing approximation.
