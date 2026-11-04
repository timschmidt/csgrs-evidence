# Native source/display/export boundary, 4 November 2026

SynapsCAD baseline124c31d, candidate1f1ec3e; CSGRS25fafc4bc9 (Rust identical to d9b06483a3). Source patch is retained.

Baseline near-boundary probe reproduces four exact triangles whose distinct vertices share f32 positions; native GPU projection succeeds. Original app conversion fails. The display/export witness adds only the new obj_export_ignores_display_buffer_edits test to baseline; it fails because exported geometry follows edited display buffers. The independent exact-source preflight witness removes the new original-source validation from the intermediate candidate: collinear rational points (0,0),(1/2,1/5),(3/2,3/5) become noncollinear after binary64 projection and export falsely succeeds. Final source validation restores explicit failure. The stage helper is retained for attribution, not promised idempotent against later formatted source. Final tests are in candidate commit.

Full configured .github/scripts/test-ci.sh, unchanged, uses CCACHE_DISABLE=1 CARGO_BUILD_JOBS=8 CARGO_TARGET_DIR=/tmp/csgrs-research-target CARGO_NET_OFFLINE=true with external timeout1200. Terminal exit101:64 passed,1 failed,2 ignored,53 filtered,935.18sec. B text times out. No passing full-CI claim. This run predates lint-only documentation/bit-comparison edits and later binary-export tests; final conversion and binary suites were rerun. All43 binary/UI tests pass; all4 conversion tests pass. Adjacent diagnostic suite explicitly skips B in addition to the existing script skips:64 passed,2 ignored,54 filtered,32.19sec. It does not replace full CI.

Final-source Clippy log final4 passes all-targets/dispatch-trace/-D warnings. Locked WASM binary, fuzz bins, warning-denied library rustdoc, native release binary, format and diff checks pass. Initial lint/build failures remain. The unchanged benchmark driver completes default:all at fn_override16, one smoke run479.84ms; no speedup claim.

Visual ordinary/near/near-control include identical authored sources and app/OpenSCAD images. Ordinary through-hole and disconnected cube agree visually. Tiny rotation references differ; installed OpenSCAD2021.01 warns its result is not a valid2-manifold (including a camera-direction control). General visual conformity for these cases is unqualified. No other user's window/settings were accessed.

Cost probe includes a source-carrying shim of old normal arithmetic. Twenty alternating warm pairs in one shared-host process compare the same exact source, indices and evidence, not identical display values. Initial strict position-equality assertion fails on sphere projection; that adverse record is retained. Current probe records component differences:176 sphere position components change, maximum4.7683716e-7; native normals also change. Native source and evidence remain equal. Warm conversion medians (old-shim/native):cube5.55/22.20us,sphere11233.54/83198.34us,drilled9.54/50.59us,rotated cylinder248.39/1335.12us. This is capability migration cost, not a performance-only admission. Old/new layout104/152bytes; native carrier48bytes. Shared buffers retain longer lifetimes; no total-heap or resource bound is measured. Default candidate compile smoke, three runs:288–320ms,20parts,2632native triangles,5views,0failures/0warnings.

The live CI stack snapshot identifies scalar/orientation work but truncates before the owning caller; no operation-level causal conclusion. Follow-up debugger attachment found the process had already exited. Worker706042, executable766345a30d20781c; terminal status established by tool session39850 exit101. No public environment/credentials were read. No pre-push qualification, installed distribution, universal curve closure, source preservation for wholly unrenderable models, or projected-topology guarantee.

Replay focused commands from synaps-cad, with CCACHE_DISABLE=1 CARGO_BUILD_JOBS=8 and the /tmp targets used above:

```sh
cargo test --offline --locked --release --bin synaps-cad --features dispatch-trace
cargo test --offline --locked --release --lib --features dispatch-trace compiler::geometry::conversions::tests
cargo test --offline --locked --release --lib --features dispatch-trace near_coincident_boolean_covers_signed_axes_and_angle_syntax
cargo clippy --offline --locked --all-targets --features dispatch-trace -- -D warnings
cargo check --offline --locked --target wasm32-unknown-unknown --bin synaps-cad
cargo check --offline --locked --bins --manifest-path fuzz/Cargo.toml
RUSTDOCFLAGS='-D warnings' cargo doc --offline --locked --no-deps --lib
cargo build --offline --locked --release --bin synaps-cad --features dispatch-trace
SYNAPS_BENCH_ONCE=1 cargo bench --offline --locked --bench compile_default --features dispatch-trace
cargo fmt --all -- --check
git diff --check
```
