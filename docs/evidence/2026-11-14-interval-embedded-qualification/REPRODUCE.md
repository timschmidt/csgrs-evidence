# Reproduction

Copy this frozen record into a new mutable stage. Do not run its writers here.
Check out baseline bdee397 plus firmware-fix.patch's one-line source change and
candidate b9ecf8d; use the exact full revisions in BASELINE.json and
FINAL-REPOSITORIES.json. Candidate core contains the committed clock/Q30/servo
changes; preserve its stable ../csgrs dependency path. Pin source and toolchain
identities before comparing bytes or costs.

The official espup/espflash release URLs and verified SHA-256 values are retained
in *-download.txt. Tool install invocation was:

    espup install --name esp --targets esp32,esp32s3 --toolchain-version 1.90.0.0 --crosstool-toolchain-version 14.2.0_20241119 --extended-llvm --export-file <new export path>

Source that export file for each build shell. build-images.sh runs all five
board-aware release builds and preserves each canonical board artifact through
xtask. Adapt its repository/stage paths and the tool paths in the Python drivers.
All builds use the repository release profile; do not infer historical binary
comparisons from builds with another GCC bundle or compiler.

Run cargo +1.88.0 test --locked and cargo +1.88.0 clippy --all-targets --locked
-- -D warnings on the portable default members. Target formatting uses rustfmt
1.88.0 --edition 2024 --check firmware/src/main.rs. These commands do not run HIL.

inspect-image.py captures sections, symbols, disassembly and strictly scoped
static entry-frame observations. inspect-matrix.py compares complete capability
JSON, runs the inspector and executes espflash save-image with explicit flash
sizes/default partition layout. Its output paths must be absent; do not rerun
over completed package files. summarize-images.py produces comparisons without
rebuilding. The two 4 MiB package failures are expected unresolved baseline
findings, not a passing acceptance gate.

Compressed artifact names and decoded hashes/sizes are listed in
archived-artifacts.json. These files are evidence, not hardware deployment
approval. The parser's maximal local frame is not a runtime stack bound.
verify-prior-stages.py writes into the stage and must only run in a fresh copy;
post-archive integrity verification belongs outside the frozen record.
