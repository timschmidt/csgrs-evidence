# Current dynamics cost investigation

This directory will be immutable after archive. Copy it to a new writable stage
and replace every stage/worktree/target/artifact/runtime path before running
writers. Never run these drivers inside a frozen record. Source base is CSGRS
b3dcd2d3b; BASELINE.json captures the authoritative repositories and exact pending
patch hashes. Create a detached worktree at that commit for the following steps.

1. Build `build.py baseline` and `build-observer.py baseline` with the original
   worktree. Both drivers retain commands, lockfiles, logs and artifact hashes.
2. Apply `pending-extraction.patch --index`; build both extraction controls.
3. Apply `provider-control.patch` without staging and copy `provider_errors.rs`
   into crates/hyperdynamics/tests; build both provider-control artifacts.
4. Run compare-controls.py and emitted-functions.py. They compare full 194-row
   results/allocation observations, external dependencies, complete sized-function
   address unions and earlier artifact hashes. Six unsized functions are disclosed.
5. Run measure.py without concurrent builds, profiles or tests. It runs all 194
   cases in baseline/extraction/provider/provider/extraction/baseline order with
   pinned CPU0, disabled process ASLR, the same executable path, busy warmup,
   unchanged Criterion sample settings and raw retained samples. Its adverse
   screen is not a simultaneous significance test or a regression tolerance.
6. Run repeat.py after the broad sweep to repeat the six previously published
   adverse cases fixed in repeat-selection.json, at 1-second warmup, 2-second
   measurement and 30 samples. This is not full-workload confirmation.
   After all timing finishes, run profile-all.py. Four independent instrumentation
   workers execute all 194 cases for every variant, 32 warmed completed/drop
   callbacks each. Raw Callgrind profiles are losslessly compressed, decoded
   hashes retained, and self-instruction attribution sums checked against totals.
   Instrumented elapsed times are never reported as performance measurements.
7. Revert only the provider patch, remove its copied fixture and verify the exact
   extraction index, then run restore-checks.py. Preserve the independent legacy
   two-policy report/dispatch and axis witnesses. Finally restore the isolated
   tree to its recorded clean baseline; do not modify the authoritative index.
8. Verify all 24 preceding frozen records and authoritative repository states,
   record limitations and disposition, then archive once all writers finish.

No experiment may weaken the 194 workloads, existing assertions, cost gates,
policies, error behavior or deprecated API notices. Results do not qualify the
whole 15-phase program, downstream costs or successive_operations by themselves.
