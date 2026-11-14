# Interval release admission

Retained source: `2611ab263ba58c5ce928374127d4bf2cc25e2c6d`, based on
`50b16d5b6e5acc2ac04fa0355c300cc6ba87ea28`. Phase 14 remains open.

The original release command failed resolving Hyperlattice Interval because
three retained interval packages were missing from coordinated packaging.
The fix adds Hyperinterval, Hyperlattice Interval and Hyperdynamics to the
21-package release list and exercises their packaged README examples. Examples
preserve typed rejection, Cartesian output-to-input composition, and source-bound
certified flow endpoint consumption. Metadata uses the selected toolchain;
archive selection requires one artifact per package. No production Rust kernel,
manifest, lockfile, fixture or CI configuration changed in the retained commit.

## Executed evidence

`QUALIFICATION.json` checks the actual logs: full release commands passed with
Rust 1.95 and stable 1.99.0, followed by a full clean Rust 1.95 checkout run with
neither --allow-dirty nor --no-verify. Each verified 21 packages, documented 21
workspace docs.rs configurations with warnings denied, resolved all 21 consumer
dependencies from unpacked archives, and passed 26 client rows: 20 README
programs, modeling user path, C/C++ programs, Python/Go programs and a TypeScript
compiler check. The latter is not a browser/WASM runtime test. Go was 1.27.4,
not the workflow's 1.27.3. Tool manifests record exact versions and hashes.
Existing Cargo notices about excluded test/bench targets and unused patches
remain visible; these logs are not represented as warning-free.

The three new crates additionally passed archive-derived all-feature checking,
strict Clippy and warnings-denied documentation. cargo-hack executed 42 locked
individual feature configurations (16 scalar, 8 lattice, 18 dynamics) against
seven extracted packages in an external workspace; source bytes and the locked
dependency file remained unchanged. This is not a 21-package each-feature matrix.
The scalar/lattice fixed subset passed Rust 1.88 native binaries and allocation-free
no_std checks for wasm32-unknown-unknown and thumbv7em-none-eabihf. Focused
quickstart checks and strict Clippy passed. Actual consumer manifests, lockfiles,
metadata and source hashes were captured before temporary-directory cleanup.

`package-reproducibility.json` proves all 21 clean archives byte-identical across
two fresh checkouts at the retained commit. Only the second artifact generation
used --no-verify; the first clean run performed full verification. Dirty versus
clean artifacts differ in VCS metadata and dependent archive checksums in
embedded Cargo.lock files. Every changed checksum was checked against its actual
upstream archive; all other lock fields and package source bytes agree.

Main-checkout shell syntax, ShellCheck, formatting, repository budget and diff
checks passed after integration. `INTEGRATION.json` records exact reversal of the
integration patch and equality of the 41 pending extraction changes except blob
IDs and hunk offsets. Interface's eight pending files, firmware and prior evidence
repository states are unchanged. No performance or binary-size improvement is
claimed for this tooling/documentation change.

## Adverse evidence and limits

Baseline exit101 is preserved. The first candidate's independent packaged
quickstart probe caught E0277; that candidate was deliberately stopped with130,
then fixed and fully rerun. Both failed feature-probe harness attempts, the
cargo-hack version-query mistake, and the initial too-narrow dirty/clean archive
comparison are preserved. No acceptance assertion was weakened. A later shell
invocation used unavailable `python`; the actual qualification runner was executed
successfully with python3, before integration.

The optional hypervoxel/voxelis publication dependency remains blocked. Registry
availability and hosted docs.rs builds are unverified; no push or publication was
performed. Full workflow/pre-push validation, remaining package/feature/platform
gates, hardware/HIL and broader plan acceptance remain open. The pending Phase 11
extraction is still unretained because its reproduced timing gates failed.
