# Reproduction

Use a clean checkout of d17bd974757330dd739a23556d409539e8e9d7cb with the
locked sibling dependency arrangement. Build/run from its CSGRS root, Rust 1.95.0,
CARGO_BUILD_JOBS=16 and CARGO_NET_OFFLINE=true. run.py documents the debug target.
Use one external release target directory for all three measured states.

1. Copy candidate-new-files/crates/hyperdynamics/tests/stage_ownership_baseline.rs
   into the checkout and run baseline-artifacts.json's exact command. The missing
   witness is the added test in candidate.patch; apply only that test hunk for
   the pre-edit failure command in missing-proof-sharing.json.
2. Build baseline release benches with the feature set below. Save each executable
   reported in Cargo JSON, its SHA-256, size -A output and nm -S --defined-only -C.
3. Apply candidate.patch, then copy candidate-new-files/ into the checkout.
   Run candidate-correctness.json and candidate-clippy.json commands. Check both
   observer blocks against baseline-full-artifacts.txt. Build/save candidate benches.
4. Restore the five paths and remove the seven experiment-only files listed in
   restoration.json. Run restored-tests.json and restored-format.json commands.
   Rebuild benches and compare all eight hashes with baseline-binaries.json.

Release build command (stdout JSON and stderr logs retained for all three states):

    cargo +1.95.0 build --locked -p hyperdynamics --release --features adaptive-taylor,taylor-evolution,coordinates,qr-evolution --benches --message-format=json

The candidate includes the prior typed shared strategy, available for comparison
in frozen adaptive-order-sharing/typed-candidate.patch; it excludes that prior
patch's README/CHANGELOG hunks, whose contexts no longer applied. All executable
candidate changes and the full original hard-case fixture are retained here.
No doc-only prior content is needed to reproduce this rejection.

Measured ELFs remain outside the evidence record at
/mnt/development/.interval-refactor-build/adaptive-stage-ownership-artifacts.
Source patches, feature/artifact JSON, hashes, sections and symbols are archived
instead of duplicate binaries. They establish size/restoration claims; they do
not establish performance. Full primary/Interface patch snapshots are protected
context and must not be applied to the isolated measurement checkout.
