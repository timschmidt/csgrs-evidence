# Bounded runtime exact affine chains

Baseline: `948aed757ecfe417c7f82e280099d578740dcb6c`. Source checkpoint is
recorded in SOURCE.json. The source patch includes admission, implementation,
maintained qualification tests/probes and public documentation. Repository states
and compiler/CPU details are in initial-state.json and environment.json. All
commands run from /mnt/development/csgrs unless a manifest path is specified.
No push or hosted CI run. This is an additive capability, not a numerical refactor.

## Contract and witnesses

Exact retained runtime map sequences with declared inline capacity. Original
parameters and maps remain authoritative through restriction, replay, and further
static/runtime affine operations. Zero maps require no scalar identity. Capacity
failure leaves the chain unchanged; the moved rejected map is dropped as the API
documents. Scalar arithmetic remains Hyperinterval-owned. Queries iterate backward
with existing matrix/translation operations; no intermediate output box replaces
the source. Rational/dyadic successful projections give coordinate hulls; primitive
rounding may widen projections without changing the retained exact definition.

missing-witness.rs/log reproduces missing AffineChain on the baseline (expected
compile failure). baseline-tests.log is the unchanged pre-edit owner suite. The
final owner has 35 tests and two doctests. Six backends complete 781 words each
of lengths 0–4 over five maps with independent integer-corner expectations.
Other maintained tests cover mixed rectangular/static/runtime chains, capacities,
zero maps with unrepresentable +1, empty/unit sets, fixed off-grid recovery,
overflow/recovery, shared dyadic budget limits and exact-work retry. A fresh child
replays 33 maps into capacity 40 before further exact operations. Shape/scale/
capacity and every-position coefficient validation include empty sources.

## Executed checks

`checks.py`, `checks.json` and check-N.log retain all 44 commands and statuses:
Rust 1.88/stable isolated features, all-targets and all-features, Rust 1.95 owner
tests, release tests, Clippy -D warnings, docs with RUSTDOCFLAGS=-D warnings,
fmt, package file listing, primitive dependency closure, three Hyperlattice facade
tests, four Hypersolve migration/dispatch tests, and ARM/Wasm checks on both
portable toolchains. All passed. Initial targeted and all-feature test/lint logs
are retained separately. No CI files changed; this is not the full pre-push matrix.

ASan command (passed, including fresh child replays):

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-asan RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked -p hyperlattice-interval --all-features --tests --target x86_64-unknown-linux-gnu

Coverage command (passed):

    CARGO_TARGET_DIR=/tmp/interval-refactor/lattice-core-target-coverage RUSTFLAGS='-C instrument-coverage' LLVM_PROFILE_FILE='/tmp/interval-refactor/affine-chains/coverage/%p-%m.profraw' cargo +1.95.0 test --locked -p hyperlattice-interval --all-features --tests --message-format=json

coverage_report.py merges raw profiles and runs llvm-cov with one thread. Owner
coverage: 779/789 lines, 1008/1055 regions, 157/157 functions. Chain implementation:
116/116 lines, 152/156 regions. No branch denominator. Excludes tests, conformance,
dependencies and toolchain code; exact regex retained in script. 100% and directed
fuzz qualification remain open. ASan is a deterministic suite, not directed fuzz.

## Portable consumer

wasm-consumer contains source/lock/manifest only, pointing to the development
package. Build: CARGO_TARGET_DIR=/tmp/interval-refactor/affine-chains-wasm-target
cargo +1.88.0 build --locked --manifest-path <record>/wasm-consumer/Cargo.toml
--release --target wasm32-unknown-unknown. wasm-build.log records completion.
wasm-replay.py runs via /tmp/interval-refactor/tools/bin/python with wasmtime 50.0.1.
wasm-replay.json records imports=0, allocator-free link, 73,836 chain calls over
33 effective depths and 513 unique clamped inputs, plus 2,051 calls per original
export, under one million fuel/call. Three-export artifact: 28,300 bytes, SHA-256
`ee696ee92cef75463c7db6e704d05b905b2ca6e30597e363f97ec5babcb7a1c6`.
This is 10,139 bytes above the prior two-export artifact, with a different workload;
no same-contract size comparison, firmware HIL or registry-release claim.

## Cost and preservation

Both probe runs:

    cargo +1.95.0 run --locked --release -p hyperlattice-interval --all-features --example affine_chain_cost

chain-cost*.csv/log contain 800 samples/run: four backends × counts 0/1/4/16/32 ×
enclosure/restriction × 20, each 128 completed operations after 64 warmups. Input
construction is outside timing, complete returned outputs are materialized and
consumed. Independent shear formulas validate outputs before measurement.
Q16/f64 queries and restrictions allocate zero. Capacity-32 inline sizes:
2336/4664/3632/13976 bytes for Q16/f64/rational/dyadic, excluding heap and not
measuring peak stack. The initial run overlaps other checks; final run follows
the check batch. Both use a shared host, without affinity/isolation; no speedup
or universal latency bound. JSON summaries retain allocation/time rows. Size
and hash of the final native probe are recorded; no baseline native-size claim.

source-preservation.json records 49 byte-identical tracked scalar/Cartesian/legacy
files. preserved-helpers.json verifies original static affine arithmetic/pullbacks,
serde, dot/array helpers and legacy facade except its new type re-export. No
production solver/firmware migration, predicates or decision sequence changed.

## Remaining gates

Full Phase 6, all 15 phases and production consumer migration remain open.
No full legacy benchmarks/successive_operations/monomorphized-size campaign,
measured stack maximum, hosted OS/HIL, broad runtime consumer qualification or
cancellation contract is claimed. Capacity bounds map storage, not arbitrary
scalar heap/time. Dyadic scalar work/size accounting is shared; rational arithmetic,
validation/serde and explicit clones have no internal total-resource bound.
No test or policy was weakened. No new implementation failure was observed;
the expected missing-API failure remains recorded. Evidence verification later
covers this new record only and preserves all earlier ledger rows.
