# Reproduction and scope

Use Rust 1.95.0 and a clean checkout of baseline184faefa1 at the path recorded in
commands, or consistently rewrite the local paths. `prepare.py` applies only the
ownership witness and adds the original observer. `baseline.py` reproduces the
expected failure, captures exact outputs and builds the external allocation probe.
The complete baseline command records, environment choices and source paths are
retained. The external probe has its own retained Cargo.lock; both source variants
use that same lock and source path.

`candidate.py` measures the baseline, applies the historical candidate and its
new files, snapshots it, runs its original focused tests and builds/measures the
candidate. Its historical source input is in evidence commit
3b6b05b722c87740871f81dbe7e6d7a9b75c15c1, record
`docs/evidence/2026-11-15-interval-adaptive-stage-ownership`.
Alternatively, apply the complete current `candidate.patch` to the clean baseline;
it contains all twelve candidate paths including fixtures and observers.
Do not apply both the old and current patches.

`measure-allocation.py` executes the recorded final binary hash for all36tuples.
`compare.py` checks both exact observer blocks and all288matched allocation pairs.
The allocator module is reused unchanged from the earlier controller campaign,
retained here for independent reproduction. There is no approximate scalar probe,
allocation-count relaxation or assumed cleanup plateau.

`restore.py` records the rejection, restores the original source, runs the original
order/controller tests plus formatting, and verifies the rebuilt external binary
hash. It checks its actual source and run records; follow the individual commands
when reproducing outside this original local orchestration. Scripts preserve
existing logs and should run in a fresh evidence directory, not overwrite this
frozen archive. Final binaries reside outside the archive; hashes and reproducible
source/configuration are retained instead of duplicate binary payloads.

The new noise-controller candidate and live coordinated-CI root job are separate
work. Their mutable results are not frozen or claimed complete by this record.
All earlier evidence roots and the54size accounts are preserved.
