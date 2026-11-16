# Reproduction

Use a fresh isolated checkout of c64758fbc4480312e398cdc05cce8c59aeb1f046.
Do not import primary's staged extraction or Interface's pending changes. Use
Rust/Cargo 1.95.0 and copy these drivers to a new writable evidence stage before
running them; this record is frozen. Rewrite their output/target directories as
needed and preserve the original archive.

1. Capture the baseline using build.py and the baseline-controls.json command.
2. Copy rejected-prototype/crates/hyperdynamics/tests/flow_sensitivity.rs into
   the checkout, and apply only the cartesian test hunk in prototype-tracked.patch.
   Run the two missing-*.json commands. Both fail at the intended missing APIs.
3. Apply the matrix and field module changes in prototype-tracked.patch and copy
   rejected-prototype/crates/hyperdynamics/src/field/sensitivity.rs. Run
   initial-witnesses.json, matrix-witnesses.json and build.py candidate.
4. Restore both dynamics files and remove its new test/module. Apply
   matrix-tracked.patch against the original checkout to recreate the complete
   matrix-only candidate. Run retained-owner.json, retained-downstream.json and
   build.py retained. Compare all 26 records using target plus executable path.
5. Restore every candidate path to the pinned revision. Run build.py restored,
   restored-owner.json, restored-controls.json and restored-format.json.
   Compare all 26 hashes against baseline, not just target names.

All commands, statuses, exact diagnostics, proof controls, test summaries,
section sizes, symbol-size attribution and source snapshots are retained here.
The positive tests establish only the explicitly tested contracts. The rejected
sensitivity implementation has substantial unexecuted acceptance obligations.
