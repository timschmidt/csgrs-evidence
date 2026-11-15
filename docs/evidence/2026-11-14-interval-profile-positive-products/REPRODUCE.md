# Reproduction

Copy this record into a new writable staging directory before running any writer
script. Frozen evidence directories must stay read-only. Use clean worktrees at
BASELINE.json's committed CSGRS and Interface revisions; keep the sibling layout
expected by Interface's relative path dependencies. Firmware must match its
recorded revision. Exclude the pending extraction and Interface patches.

1. Reproduce the missing API by compiling the positive-chain test on the base.
   The test grew after the original negative observation, so the final source
   produces additional missing-method sites; missing-api.log records the original
   five diagnostics. Do not count a negative/zero-test command as an accepted run.
2. Copy/adapt profile-probe and wasm-profile paths. Preserve their workloads,
   profiles and fixed Cargo.lock files. build-profiles.py baseline captures seven
   complete profiles/identities and raw allocation rows and validates WASM against
   native output. Wasmtime is in /tmp/interval-refactor/tools/bin/python in the
   original environment, not system Python. Record the actual tool version.
3. Apply csgrs-candidate.patch and alumina-interface-candidate.patch. These include
   the final lint-corrected source; initial-source retains the earlier name.
   Run the commands in owner-focused/final-owner-focused and final-owner-clippy
   logs using COMMANDS.json. That index distinguishes recorded argv from
   reconstructed reproduction recipes. Build final-candidate with the same locks.
4. Compare all seven RESULT, IDENTITY and RAW rows and all WASM transcript hashes.
   Compare complete file bytes, not only GNU size's aggregate dec column. The
   final candidate fails +880 native / +965 WASM. Do not replace these outcomes
   with timings or weaker quality/certainty/feature controls.
5. Restore only this experiment's paths in the isolated trees. Rebuild restored
   profiles and require their artifacts to match baseline hashes, run restored
   owner checks, and verify both authoritative repositories' existing changes.

The probe workloads and WASM replay are copied from the older frozen
machine-profile evidence without changing their operation bodies. Only dependency
paths and the selected Python interpreter are adapted. planned-* and the unused
legacy-machine-profile source record design preparation; they are not an executed
whole-profile dispatch test. final-source and SOURCE.json identify the actually
built final candidate. No binary, dependency cache or third-party archive is
redistributed in this evidence record.
