# Disposition

Review commit f7008cc03579580c5a917580098574ac77b5d0e2. Production candidate rejected and removed: local derive
stack reservation grows by 16 bytes in the actual flow_noise executable and
both coefficient probes. Binary size caps pass for the measured native set;
that does not waive the stack gate. The proposed trace test also remains
unqualified and is removed, with its failing output preserved.

Current baseline/candidate standalone controls: 448 identical coefficient rows,
36 identical wrapping rows excluding elapsed time. Allocation benefit: one
200-byte allocation avoided per construction; peak/live heap unchanged.
Complete coefficient timing improves around 1% in four ABBA blocks under both
policies; this is not the unexecuted broader runtime qualification.

Restored result: 1676 passing tests/doctests, 84 reported suites, no failures or
ignored tests. Strict all-feature/all-target owner/downstream Clippy and
workspace format check pass. All 42 restored final native artifact hashes are
identical to baseline. The candidate test run is recorded separately as failed.
No production changes, added tests, enlarged/consumed size allowance, push or
publication are retained. Full plan remains active. Next: pending path-dynamics
extraction and its current owner timing blockers.

All 82 prior frozen stages verified unchanged; primary 41 staged paths and
Interface 8 pending paths unchanged. Sources/scripts prepared but not executed
are explicitly identified in REPRODUCE.md. WASM and successive_operations
candidate builds do not establish unperformed paired runtime qualification.
