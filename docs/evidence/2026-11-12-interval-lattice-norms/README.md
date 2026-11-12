# Interval norms, logarithmic matrix measures and dominance margins

Baseline: `5336b85d2c23bb71c593e3e521435471a0ed4123`; source checkpoint is in
SOURCE.json. Repository states, compiler and CPU are in initial-state.json and
environment.json. All commands run from /mnt/development/csgrs unless noted.
No push, hosted CI, production solver or firmware migration was attempted.

## Contract

Hyperlattice owns Cartesian norm/measure reductions; Hyperinterval owns scalar
absolute images, maximum images, sums and differences. The new methods return
interval evidence, not decision or solver statuses. Vector one/infinity norms
and induced matrix one/infinity norms include lower bounds, including interior
zero minima. Square logarithmic measures use signed diagonals, and dominance
margins use absolute diagonals. Cartesian independence lets rational/dyadic
successful ranges attain their extrema simultaneously. Primitive sums may round
outward or overflow. Exact scalar failures are retained; no partial success.
Empty source yields empty; nonempty zero-dimensional products have zero norm.
For a nonempty 0x0 matrix, the norm-limit logarithmic measure is negative infinity
and the finite output API returns UnboundedImage. Zero-dimensional dominance
vectors retain unit semantics. No changes to serde or existing arithmetic.

## Correctness and resource evidence

missing-witness.rs/log reproduces absent APIs before code edits. baseline-tests.log
is the previous owner suite. The final owner suite has 45 passing tests and three
doctests. Maintained tests enumerate 125 vector and 625 square-matrix cases per
backend across six backends. Every integer member is evaluated independently,
including zero breakpoints; with integer endpoints, disjoint row/column variables
and these piecewise-linear formulas, the enumerations attain the continuous
extrema. Additional tests cover a rectangular 2x3 input, negative logarithmic
measures, empty/unit and zero-dimensional orientations, exact rational fractions,
fixed extreme scales, subnormal IEEE inputs and outward rounding.

All eight query kinds exercise one shared DyadicBudget with size failure,
one-unit-short work failure, exact-work success and unchanged-input retry.
Output margins then feed another norm with the same context. A fresh process
replays inputs, recomputes results, replays output ranges and consumes them again.
The affine (x,1-x) case distinguishes its box's norm [0,2] from exact retained
summation {1}; a projection never replaces the retained affine source.

Initial tests passed. Initial Clippy rejected a needless range-index loop; direct
row/column iterators corrected it without lint suppression. Both logs remain.
`checks.py`, `checks.json`, and check-N.log preserve all 44 final commands,
statuses and elapsed times: Rust 1.88/stable feature isolation, all-targets,
all-features and release tests; Clippy -D warnings; docs with RUSTDOCFLAGS=-D
warnings; fmt; four Hyperlattice facade tests; four existing Hypersolve migration/
dispatch tests; package file listing and primitive dependency closure; ARM/Wasm
checks on both portable toolchains. All passed. No CI files changed. This is
selected local/downstream qualification, not the full pre-push validation set.

ASan command (passed, including fresh replay children):

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked -p hyperlattice-interval --all-features --tests --target x86_64-unknown-linux-gnu

Coverage command (passed):

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-coverage RUSTFLAGS='-C instrument-coverage' LLVM_PROFILE_FILE='/tmp/interval-refactor/lattice-norms/coverage/%p-%m.profraw' cargo +1.95.0 test --locked -p hyperlattice-interval --all-features --tests --message-format=json

coverage_report.py merges raw profiles and runs llvm-cov with one thread.
Owner report: 920/935 lines (98.40%), 1234/1300 regions (94.92%), 182/182 functions.
New norms file: 117/122 lines, 193/212 regions. The annotated merged line report
is retained as norms-lines.txt; no 100% claim replaces the aggregate report.
No branch denominator. Excludes tests, conformance, dependencies and toolchain
code; exact regex retained in script. 100% and directed fuzz remain open. ASan
is the deterministic suite, not a directed-fuzz campaign.

## Portable consumer

wasm-consumer holds source/lock/manifest, pointing to the development package:

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-norms-wasm-target cargo +1.88.0 build --locked --manifest-path /tmp/interval-refactor/lattice-norms/wasm-consumer/Cargo.toml --release --target wasm32-unknown-unknown
    /tmp/interval-refactor/tools/bin/python /tmp/interval-refactor/lattice-norms/wasm-replay.py

The no_std cdylib links without a global allocator; imports=0. wasmtime 50.0.1
runs 2,051 norm calls, 255 distinct effective norm inputs, plus the previous
73,836 runtime-chain calls and 2,051 calls to each of two static exports. Each
call has an external one-million-fuel limit. Independent external norm checksum
is 50-44*clamp(input,2,256), after explicit inside-module range assertions.
wasm-replay.json records size 39,592 and SHA-256
`d41badc0780d71a287e3522d8f90f3e14c7c022088ce50a518f2aeb7e1163df6`.
This four-export artifact is 11,292 bytes larger than the previous three-export
consumer, with a different workload; no same-contract size comparison. No HIL,
firmware cycle/stack measurement or registry-release claim.

## Completed-work cost probe

    cargo +1.95.0 run --locked --release -p hyperlattice-interval --all-features --example norm_cost

norm-cost.csv/log and cost-summary.json retain 640 samples: four backends, eight
query kinds, 20 samples each, 128 completed calls/sample after 64 warmups. Inputs
are dimension 4, constructed outside timing. Independent fixture expectations
validate all outputs before measurement. Complete scalar/vector results are
materialized and consumed; caller context creation is included. This shared host
run follows the main check batch; no affinity/isolation or universal latency
claim. No speedup comparison. Primitive Q16 and strict f64 allocate zero.
Dimension-4 vector/matrix inline storage: 48/192 bytes Q16, 96/384 f64, 72/264
rational, 288/1152 dyadic. These exclude heap and are not peak stack values.
Native probe ELF section sizes and artifact digest/length are recorded, without
a baseline binary comparison. Only source/digests, not executables, are archived.

## Preservation and open gates

source-preservation.json verifies 52 tracked scalar/Cartesian/affine/legacy source
files byte-identical to baseline. additive-adapters.json verifies the only two
existing implementation files changed have additions only: scalar pass-throughs
and the new module. Predicates, existing arithmetic, serde and dispatch stay
unchanged. No tests/policies/fixtures were weakened.

The full Phase 6 and 15-phase goal remain active. Width/midpoint/radius,
contraction/Jacobian helpers, specialized kernels, broad consumer qualification,
legacy benchmarks/successive_operations/monomorphized sizes, hosted OS/HIL,
stack maximum, directed fuzz and complete coverage remain open. Dimension and
dyadic scalar bounds do not claim general cancellation or rational heap/time
bounds; constructor validation, serde and explicit clones remain caller-owned.
The later archive check covers only this record and preserves previous rows.
