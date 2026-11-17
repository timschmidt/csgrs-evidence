# Trace materialization pilot

Owner Hyperreal dispatch_trace::collect_dispatch_counts; P4/P10/P36 and the
interval plan's complete-consumer trace/resource gates. Base scope candidate
ab81708aa8c44eb895043879162803a964f6ebc5. Current matched-launch evidence shows
48 failing wrapper-to-scope metrics in26accounts, all active trace. Snapshot
B-tree allocation variation was independently attributed earlier. This pilot
examines the actual current collector and supported content-equal/static-address-
distinct labels; it does not assume every prior failure has that cause.

Missing acceptance witness: exact content ordering/aggregation, nondestructive
snapshot and clearing take across empty, unique and heavily aliased label sets,
with collector materialization and cleanup cost reported separately from input
creation and counter recording. Preserve record hot-path identity, predicate
order, trace counts and rational counters. No geometry fixture or old cap changes.

Compare baseline and two isolated implementations if needed: batch vector sort/
coalesce/shrink, and sorted incremental vector aggregation/shrink. Keep every
outcome, including duplicate-label regressions. Neither source simplification
nor a favorable ordinary case permits a supported stress regression to disappear.
No source/account admission from this pilot. Existing complete-consumer caps,
fixed baseline and historical charges remain binding. A winner still requires
owner/downstream correctness, runtime, size, complete lifetime and distribution
qualification. No timing/performance claim is made by allocation observations.

Native x86_64/glibc, Rust1.95.0, dispatch-trace enabled. Identical harness and
counting allocator for each source. Immutable final images, common argv[0] and
same arguments/cwd/environment. Label setup intentionally creates bounded
process-lifetime static strings to exercise public static-label semantics;
report setup separately, never call the isolated collector a whole-process bound.
All reports must materialize and validate complete ordered outputs and exact
counts; no checksum-only equivalence. Existing duplicate-label regression stays.

Inputs: identity counts0,1,2,12,64,65,256,4096; distinct textual groups chosen
from1,17,identity_count/2,identity_count (deduplicate and clamp for each count).
Snapshot and take; cold and8warm materializations;3fresh repetitions. Each
recorded event count is1+(identity_index mod3). Outputs independently expected
from integer sums by textual group. Empty, nested recording and cross-layer/key
ordering also receive owner tests. Validate output cleanup and counter clearing;
retained trace table and deliberately static input storage remain explicit.

One3600-second pilot execution window,1200/build or owner check,60/control,
2000direct children maximum. All runner spawns, including Git/tool inspection,
are counted at one site; compiler descendants explicitly outside direct count.
No automatic retry/deadline reset. Sequential children; controls inherit a64MiBper-file limit and build/tool
children a1GiBper-file limit (which also covers compiler artifact files). Keep
completed data below256MiBcompressed/512MiBtotal and reserve2GiB for an active
raw log plus compressed copy:2.5GiBtemporary staging capacity,20GiBdevelopment
reserve;targets and images in RAM. Kill/join owned process groups on failure and retain logs. Keep
held queue1621335/start38218939 and terminal watcher3416600 unchanged. No archive
writes during any timed work. Independent offline verification capped300seconds.
