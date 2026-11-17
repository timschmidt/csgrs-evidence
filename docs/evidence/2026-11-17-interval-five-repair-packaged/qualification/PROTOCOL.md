# Final five-repair extracted-package consumer

Phase 7/14 and P6/P8/P9/P19/P30/P36/P37: complete solver receipts must survive
actual package extraction and native/WASM consumers, with no stale Hyper source
or workspace dependency fallback. This qualifies distribution of candidate
4a04dd9744bfecb578963b42fa3bffef5b7062b5, not source admission.

Use a fresh detached RAM worktree at that exact revision. Package and verify
hyperreal, hyperinterval, hyperlattice-interval, hyperlattice, hyperlimit and
hypersolve together, with the existing fresh synthetic-registry cache helper
and its negative acceptance control. Preserve verified own-package archives,
VCS receipts and equality of every extracted source file to committed bytes.
External dependencies remain cached public crates.io sources. Record metadata
for each feature/target and reject any Hyper resolution outside extracted
packages or any source version mismatch.

Copy fixture.rs, operation.rs, lib.rs, main.rs and invoke.cjs unchanged from the
complete portable consumer. Only its Cargo manifest replaces workspace paths
with exact version requirements and explicit patches to extracted packages.
The root package name and release profile remain identical. Generate the lock
once offline; all subsequent builds use --locked. This explicit local-registry
qualification does not claim that these versions are published.

Eight final images: default, trace, added and trace+added on native and wasm32.
Run every original configuration: ordinary cases 0..3, added cases 0..6, both
policies, rebuilt/reused input, cold/eight-call-warm, passive/active as applicable.
All 528 configurations must pass all unchanged assertions. Preserve full output
and trace strings and compare with corresponding source-worktree executions;
WASM imports must be empty, output bounds/UTF-8/clear must pass. Record linear
capacities under the inherited 192 MiB ceiling; this is not retained heap/RSS.
If the source matrix is not terminal, preserve package results and defer their
comparison until it is; no success claim before comparison.

Use Rust 1.95.0, opt3/thin-LTO/one codegen unit, six jobs and offline resolution.
Final native and WASM measurements use the portable stage's declared metrics,
capacities and caps. Append each positive ordinary source-final -> package-final
change to that feature/target/metric's existing cumulative positive charges,
with the original c9f1f9ac denominator. Never subtract savings or reset earlier
charges. Added workloads retain absolute capacity/headroom checks only. Report
all failures; passing numerical checks does not admit any account.

Declare 7,200 seconds total including package verification and any dependency
wait; 1,200 seconds per package/build/lint command, 60 per native control and
600 per WASM matrix. Verification is separately bounded to 300 seconds. Preserve
raw failures. External timeout is not typed kernel exhaustion. Limit compressed
command/control logs to 512 MiB and total stage retention to 640 MiB before new
jobs; require 1 GiB staging space and the unchanged development-volume 20 GiB
guard. Worktree, Cargo homes, extracted packages, targets and images live in RAM.
No source edit, queued command mutation, unrelated process signal, watcher restart
or budget reset. The workflow parent remains held. The isolated RAM checkout
remains clean at its original revision. Run strict Clippy for all four features
on both targets and formatting before qualification. Cancellation/resource,
quiet runtime, firmware and complete coordinated validation remain separate.
