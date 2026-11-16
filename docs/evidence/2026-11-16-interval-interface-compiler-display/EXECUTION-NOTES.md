# Coordinated CI execution notes

The original CI worktree retains revision 955593aa9. Primary CSGRS fixes are
c45457094 (documentation spelling) and a1adc1068 (backend-specific test import);
no production arithmetic changed. Their focused validation records retain the
original failures and fixed descendants. Hyperreal all-target tests generate
tracked benchmarks.md edits in the CI checkout. These smoke-run reports were retained under generated-reports/hyperreal and
restored after both producing test commands terminated. They are not accepted
comparative performance data. The generated Pages site is retained separately. Records whose source-boundary hashes
changed must be reviewed for these generated-file differences.

The clean sibling qualification stack under /mnt/development/interval-coordinated-stack
uses separate checkouts. Firmware primary repair 9f07179 adds versions to 37
existing local path dependencies; the lockfile, resolved graph and policy are
unchanged. Its pinned policy audit, fmt, tests, Clippy, board checks and downstream
source-policy audit pass. Interface has a pending three-line fixed-size chunk
iteration repair; retain only after behavior and artifact comparisons.

Local setup preserves the workflow's validation command bodies, feature loops,
and corpora. Installed stable resolves to rustc 1.99.0; this is recorded local
compiler identity, not a claim about an independently refreshed hosted image.
Cargo incremental caches are disabled to control disk consumption. Parallel
build lanes use separate target directories, and all retained results record
their actual environment. Host checks do not establish macOS/Windows or HIL.

The workflow dependency-closure steps write four common root text filenames.
Hosted matrix jobs isolate these in separate checkouts. The local runner now
serializes those steps, copies outputs into each result directory, and removes
only these task-generated files. Four earlier successful commands were rerun
under that protection; both original and repeated logs are retained. The last
shared files before serialization are retained without toolchain attribution.
No assertion or command was removed.

`cargo test --all-targets` can execute harness-free timing loops (observed in
Hyperdynamics adaptive_taylor). Their concurrent numbers are validation smoke
output, not qualified comparative performance evidence. No runtime acceptance
or regression claim consumes them. Explicit benchmark campaigns remain pending
and must run without competing work. No geometric or implementation-completeness
claim follows from a passing script that validates evidence schemas or blockers.

Command timeout records distinguish an external watchdog from kernel exhaustion.
Single workspace test commands use their workflow job duration, excluding setup.
Multi-step job durations still require aggregate review; per-command ceilings
alone do not demonstrate compliance with a job's overall timeout.

Trunk retries preserve the original failing commands. Ambient NO_COLOR=1 first
failed its boolean parser; NO_COLOR=true then conflicted with workflow
TRUNK_COLOR=never. The passing demo retry removes only ambient NO_COLOR and
retains workflow TRUNK_COLOR. Interface uses NO_COLOR=true without TRUNK_COLOR.
No source or build-feature change was needed for those retries.

Firmware checkout repair 7e0d5a43d01706fe619234d8b174beb1ebe45dc6 pins CSGRS
a1adc106811c8b4f9bb892fabb80f73c870d85d2 in a sibling checkout. All fresh-layout
portable commands and dependency policy passed; zizmor1.32.0 --pedantic
--strict-collection reported zero findings in its default offline mode. The
source pin must be available remotely before publishing the dependent workflow.
No push has occurred.

Both packaged release checks passed (Rust1.95.0 baseline and stable1.99.0
on primary a1adc). The stable run kept unchanged source boundaries. Existing
package-list warnings and the already-open hypervoxel publication dependency
remain distinct from local packaged-consumer success. Interface baseline and
candidate native builds both emit the same pre-existing alumina-runtime
Atomic::fetch_update deprecation warning on stable; the iterator edit does not
introduce it. Firmware's declared1.88 compiler validation remains passing.

Hypercurve fuzz-driver compatibility is retained in16ef9cca5995: stable and1.95 full-bin strict Clippy, final formatting/spelling, identical raw optimized executable, seven-input replay and14 complete dispatch-vector assertions across both policies pass. See docs/research/fuzz-driver-chunk-compatibility.md. Initial diagnostic harness/extraction failures are preserved separately and corrected; no test assertion was loosened.

The unchanged Hyperdrc KiCad CPU gate fails at138.533148521seconds in the full suite and137.649903398seconds in same-binary focused replay. This reproduces the existing accepted-tree blocker documented in the progress ledger. Explicit remaining binary, integration and doc target commands subsequently passed with unchanged source boundaries; no full DRC pass is claimed.

Seventeen remaining spatial workflow commands are queued after all known long qualification lanes, preserving command bodies. Native job budgets subtract completed native-check duration; directed selection plus sanitizer campaigns share225minutes of executed workload. Setup and local queue wait are excluded. A20GiB free-space preflight stops new launches for review without silently qualifying omitted commands. No comparative speed claim follows merely from these workflow probes.

Interface UI qualification extends the original three-loop candidate with a
reproduced display overflow repair, fixed-size hex iteration and equivalent
length assertions accepted by strict Clippy. The final five-file patch is
interface-ui-final-candidate.patch (SHA256
956d997ad4f162c20470927c55b806a0c9cf31c8dad2fabf4c467c7f7d6957ea).
It remains uncommitted pending the complete admission evidence. Stable and
Rust1.95 workspace tests and strict native/WASM Clippy pass. An initial1.95
float_cmp failure is retained; the final regression compares exact bit patterns.
The optimized final UI suite passes109tests. New midpoint correctness is
limited to the declared display-coordinate domain; exact source geometry is
unchanged. The same pre-existing firmware Atomic::fetch_update deprecation
warning occurs in baseline and candidate native builds; it is not suppressed.

The rejected slice-view alternative and all intermediate artifact variants are
retained separately. Three original partition workloads pass on both variants;
construction-loop trace vectors agree with zero scalar events. Ten terminal CLI
cases replay identically, including all original invalid-input errors. The
normal-build fixed-goal control equivalence is supplemented by a separate root
UI lib-test equivalence record; dependency test modules are excluded by Cargo.
This does not reset or claim equivalence for the existing core lib-test account.

Final artifact qualification is running via interface-ui-final-qualify.py.
interface-ui-final-comparison.py will check emitted code, allocated sections,
final native/WASM assets, exact canonical fixture bytes and proposed per-target
caps. Hosted Brotli headroom is not a flash measurement. No size allowance or
new cumulative account is yet accepted. Comparative CPU/RSS evidence remains
queued after all long qualification and supplemental compiler lanes.

The waiting quiet orchestrator was intentionally replanned while it had no
children and none of its18commands had started. Original commands and budgets
are unchanged; final UI artifacts and final MSRV checks are required before
measurement. Plan updates are atomic and reloaded only while waiting, then the
executed plan is frozen. Seven additional strict-Clippy combinations are queued
and included in the same dependency gate. A successful benchmark invocation
will establish completed samples, not automatic performance acceptance.

Hypercurve full release tests and both Hypertri256-configuration powersets now
pass. Hyperspatial stable native validation passes; its MSRV/coverage and later
representation/directed work remain in progress. Completed debug-cache cleanup
was guarded against active and queued target users; source, release binaries,
raw evidence,91 frozen stages and46 cumulative accounts remain intact. Stage92
is mutable and has not been archived. There is no full-workflow, phase or goal
completion claim.

Final Interface native/WASM artifacts and validation have completed. Relative
to the fixed-goal-equivalent control, desktop/file and code grow64B, fixture
file/code shrink16B, rawWASM grows18B, finalWASM grows17B, gzip grows26B, and
Brotli shrinks326B. Final UI lib-test file grows2624B and code2480B. The two
canonical fixture modes remain byte-identical. Hosted Brotli headroom is688115B.
Pre-bits and final production artifacts match byte-for-byte.

The first complete section comparison exited2: every artifact-level/code cap
passed, but the supplemental percentage caps rejected RELRO padding (+16B in
the fixture and+1472B in the UI test binary). This failed result is retained.
Independent ELF inspection verifies NOBITS padding ending at a4096-byte RELRO
boundary. interface-ui-padding-budget-revision.json explicitly revises only
those padding caps, requires total padding<=4095B, and preserves all other
caps. The revised size-only review passes. This is not performance/memory
acceptance or a new cumulative account; no padding increase is hidden or netted
against another section. Runtime memory assessment remains pending.

All seven phase4 strict-Clippy records passed. The existing core test-binary
account uses Rust1.95; stable1.99 diagnostic measurements cannot substitute for
its fixed-baseline cumulative accounting. interface-core-budget-qualify.py now
owns the qualification checkout temporarily and builds matched fixed-goal,
previous-retained and candidate controls under1.95. It will restore the exact
final patch and run strict core checks, then a queued comparison applies the
unchanged existing account caps. Primary source is untouched by these controls.
The cost plan was extended before any samples to include the three core cases
under1.95, keeping the original six cases, paired method and30-minute budget.
The quiet lane waits for restoration and the resulting comparison record.

Hypercurve source-closure workflow step hypercurve.quality.base.07 passed in2641.36s with unchanged source boundaries; the queued root examples step is now active. No universal closure or complete phase claim follows.

Rust1.95 core fixed/previous/candidate controls and selected workloads completed. Final source restoration and strict core Clippy pass. Candidate file/text are48B below previous-retained and352/176B above fixed-goal control. Initial section comparison exited2 only on incremental RELRO padding(+48B); cumulative padding is360B below fixed. The explicit core padding revision preserves the4095B final ceiling and all existing file/text caps. Revised size review passes; no account or retention is accepted.

Interface snapshot0db15b4a749692cac610496ec4f1c1f8bdd73ee0 is preserved under refs/interval-unaccepted/interface-compiler-display-20261116. Active HEAD, index and five-file candidate patch are unchanged. Two unchanged-binary required-fixture KiCad replays are queued for the quiet lane; prior failures and the120s CPU gate remain intact.

Targeted rational Horner review confirms the current helper bodies are identical, but prior borrowed/owned carrier experiments also recorded adverse rational-point timing. This is not a clean size-only opportunity or a completed migration. No renewed production experiment is selected from the bounded-size permission alone.

Spatial coverage and Hypertri coverage passed their original gates. Spatial warning attribution and the separate LLVM --dump crash are detailed in spatial-coverage-profile-review.md. Both normal exports reproduce owner summaries; all833 zero-hash warning records have positive-count counterparts across133 names, and all nine native family reports reproduce. No source, test, threshold or denominator changed; no100% coverage claim. Root examples finished; root/adversarial and spatial MSRV/representation workloads remain active or queued.

The complete spatial representation matrix passed in2784.9146seconds with unchanged source boundaries, below its3600second budget. workflow-status-audit.json reconciles all424 extracted CSGRS steps and records latest-attempt aggregate times without treating partial totals as hosted wall-clock qualification. The original audit script initially failed on string-valued numeric job limits; conversion now handles those extracted values. Earlier records lacking before/after source hashes remain explicitly unqualified at that boundary; no current hash is substituted for missing historical evidence.

The prepared certainty benchmark was moved ahead of the later quiet lane after the spatial matrix completed. The sole remaining compute group (root default tests) is temporarily SIGSTOPed using its recorded PID/starttime, with its original21600second deadline still running. The1800second comparison budget is unchanged; the controller resumes in finally and an independent1850second failsafe prevents an orphaned stop. The remaining20quiet commands and their budgets are unchanged, and they now depend on the comparator result. See certainty-isolation-scheduling.json. This is process scheduling, not pausing the goal or relaxing test deadlines.

The direct certainty repair completed64isolatedinvocations and is rejected: sphere cell+4.316%, voxelgrid+1.031%, both paired95%intervals above1. Shared-ranked-helper variant9b37cb replaced branchy metadata merges with emittedcmova, retained the344Blocal frame, and passed full owner/downstream release tests,strictClippy,fmt and27complete dispatch snapshots. Its separate64-invocation campaign also rejects retention: sphere cell+2.705%,batch+1.087%. Full rank final-artifact/dynamic-stack drivers were prepared but not run after that rejection. All raw samples and unaccepted refs remain. Both isolated sourcecheckouts are restored clean. The rootgroup resumed after each351secondcomparison (about702.65secondstotal), retains its original21600seconddeadline and has advancingCPU. No process remains paused.
