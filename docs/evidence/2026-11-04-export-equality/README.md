# Export equality correction, 4 November 2026

App baseline 4fcb1d3; candidate 124c31d, CSGRS source 75b7cbd2c6 (Rust unchanged from d9b06483a3).

Before log runs the three new witnesses with the original production export implementation: one pass, OBJ loses eight corners to four, and 3MF reader rejects repeated triangle vertices. The test source is retained in candidate commit and fix.patch; baseline witness source adds that same tests module to baseline src/export.rs. After log runs all 35 app binary tests; all pass. Compiler conversion, geometry, rendering and library tests were unchanged.

Run from synaps-cad:

```sh
CCACHE_DISABLE=1 CARGO_BUILD_JOBS=8 CARGO_TARGET_DIR=/tmp/csgrs-research-target cargo test --offline --locked --release --bin synaps-cad --features dispatch-trace export::tests
CCACHE_DISABLE=1 CARGO_BUILD_JOBS=8 CARGO_TARGET_DIR=/tmp/csgrs-research-target cargo test --offline --locked --release --bin synaps-cad --features dispatch-trace
CCACHE_DISABLE=1 CARGO_BUILD_JOBS=8 CARGO_TARGET_DIR=/tmp/csgrs-research-clippy cargo clippy --offline --locked --all-targets --features dispatch-trace -- -D warnings
CCACHE_DISABLE=1 CARGO_BUILD_JOBS=8 CARGO_TARGET_DIR=/tmp/csgrs-research-clippy cargo check --offline --locked --target wasm32-unknown-unknown --bin synaps-cad
cargo fmt --all -- --check
git diff --check
```

A 1/16777216 by 1 by 1 box is authored exactly, projected through the production renderer, exported and reloaded through the OBJ coordinate/index reader in the test or lib3mf. Both x planes, eight corners, twelve triangles, closed manifoldness and exact nondegeneracy are checked. File coordinates are recovered as f32. This is a finite-buffer preservation witness, not lossless native real-valued interchange, general projection/weld topology preservation or a performance claim. Signed zeros still deduplicate. No renderer changes or new general-geometry admission; native-source export, normal fallbacks and the two previous full-library CI failures remain open. No push.
