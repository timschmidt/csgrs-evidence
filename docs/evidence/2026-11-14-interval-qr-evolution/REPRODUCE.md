# Reproduce in fresh writable worktrees and evidence directories

Do not run archived scripts in this frozen directory. Copy them into a new stage,
update their explicit repository/target/output paths and use fresh detached
worktrees. No script requires a push. Preserve any local pending changes.

1. Check out SOURCE.json's parent for baseline and source commit for candidate.
   candidate.patch is the exact source difference. The isolated candidate excludes
   the pending41-path extraction. To reproduce combined checks, apply
   pending-after.patch to a separate source-commit checkout; preserve it as pending.
2. Use Rust1.95.0 and the recorded workspace Cargo.lock. qualify-final.py lists all
   eight isolated commands and environment. validate-main.py lists the five
   combined-checkout commands. Build WASM with wasm32-unknown-unknown installed.
3. Run all owner tests, especially the12 qr_evolution cases. Fresh-process replay
   is performed by child executions of the test binary. tests/support/flow_oracles.rs
   supplies the independent rational alternating-series expectations shared with
   the benchmark; old coarse-oracle failures are retained for comparison.
4. build-cost.py gives baseline/default/enabled/new bench build commands with
   common source-prefix remapping and explicit features. The original new build
   had two fixtures; build-third-fixture.py builds the final third fixture, and
   final-artifacts.json identifies the measured binaries. Build each once and
   copy to unique artifact paths. Verify hashes before each run.
5. Run each old control with --test and compare its complete COMPLETED records,
   not only checksums. Run the final new benchmark with --test: both branches must
   finish and the same full input/horizon/oracle/width assertions must hold.
6. After compilers/profilers stop, measure.py runs the old controls in order
   base/default/enabled/enabled/default/base at one executable pathname, CPU0,
   setarch x86_64 -R. It preserves Criterion samples. It then runs the maintained
   new benchmark for three100-operation trials after four warmups using
   QR_EVOLUTION_ITERATIONS=100. Defaults select deterministic original policies.
7. prepare-observer.py derives the allocation driver from the complete maintained
   benchmark and shared oracle. It appends the retained CountingGuard/AllocationStats
   allocator from the earlier Interface record, preserving its epoch semantics.
   The archive already contains the generated observer source, so that earlier
   stage is not needed to rebuild. Copy the retained observer Cargo.lock after
   preparation (the preparer initially seeds workspace Cargo.lock).
   Build --locked --release with its manifest, then run QR_EVOLUTION_ALLOC=1.
   There are16 complete operations after four warmups, separate held-output
   retention epochs, and after-drop checks. Keep binaries outside evidence.
8. prepare-cold-warm.py derives the separate fresh-process driver from the final
   benchmark. Its manifest/lock/source are retained under cold-warm/. Build locked
   release and copy to a unique stable path. measure-cold-warm.py runs36 processes:
   three trials x three fixtures x two modes x cold or warm. Cold has no warmup and
   one operation; warm has four warmups and100 operations. Each process constructs
   fresh original source/chart data before its timer. Construction, output checks
   and destruction inside fixed()/selected() remain timed. Loader startup is not.
9. inspect-final-artifacts.py records allocated ELF sections/addresses/hashes,
   .text, raw bytes and demangled symbol sizes. Default equality excludes only
   build ID and does not erase the24-byte raw-size increase.
10. review.py checks affected old source authority and qualification records.
    Its first pathspec version failed and is retained; use the final corrected
    full-path-list filter. Source commit and checked patches identify exact inputs.

Final qualification, main-validation, timing-runs and cold-warm-runs JSON record
commands, return codes, wall times and settings. timing-summary.json uses per-trial
median sample time for each Criterion control and median of the three batch
ns/op values for each new fixture/mode; all raw samples are retained. Allocation
logs distinguish counts, bytes, reallocations, live peaks and retained payloads.
Cold/warm driver layout differs from the maintained bench: comparisons between
cold and warm are within its one binary, not across drivers.

FINAL-REPOSITORIES.json captures the code/integration checkpoint before archiving
and ledger registration. SOURCE/INTEGRATION and the pending patches prove the
41-path preservation; exact reversal reconstructs the old index. Later archive
and ledger commit identifiers are stored outside the frozen stage and registered
in the main evidence manifest. verify-prior-stages.py must write only into a new
mutable location; never regenerate output inside any frozen stage.
