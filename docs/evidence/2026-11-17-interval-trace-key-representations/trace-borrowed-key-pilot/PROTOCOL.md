# Borrowed report-key pilot

Owner Hyperreal dispatch trace materialization, P4/P10/P36 and the interval
plan's completed-consumer cost gates. Baseline4f41bd58415d936968e1955dbd431f0cb5e988f0
has an independently reproduced collector cost of632bytes per additional leaf
node; trace-only changes in insertion shape affect downstream memory accounting.
The existing ordered/content-equal snapshot and clearing take witnesses pass.
Missing acceptance witness: retain that full contract with a smaller temporary
aggregation structure and unchanged event-recording code. The earlier batch,
incremental and canonical recording candidates remain isolated, with their
observations/failures preserved; no accounting credit or waiver follows.

Candidate: retain BTreeMap report aggregation, but borrow each live key through
an ordered content view instead of copying its three static string handles.
Ord compares the same layer/operation/path fields in the same order. Identity
key equality/hash, recording guard, hasher, TLS, rational counters, public output
and public signatures stay byte-identical. Snapshot reads the table; take reads
then clears with a Drop guard, preserving drain's clearing on unwinding and
retained live-table capacity. No per-event text hashing, additional table/cache,
new dependency, predicate-order change, geometry or policy change. The returned
owned vector still contains static strings, not references into the live table.
Review the guard lifetime and returned ownership explicitly before retention.

Reuse the original276-case consumer and control logs/image with exact hashes,
including4096address identities sharing one textual label and all unique labels,
empty inputs, snapshots/takes, cold/eightwarm calls and three fresh repetitions.
All complete outputs must match independent integer counts/labels/order. Observe
recording/materialization/cleanup separately with unchanged allocator monitor.
Run nine owner tests, strict owner all-feature/all-target Clippy, harness Clippy
and format. Collector-only observations do not qualify full lifetime, stack,
geometry, runtime, native/WASM/package images or cumulative release costs.
No positive charge from earlier work is removed. Admission remains separate.

One1800-second producer window,500directchildren counted at one Popen site;
1200seconds/build/owner check and60seconds/control. No automatic retry or reset.
Compiler descendants explicitly excluded. Same64MiBcontrol/1GiBbuild per-file
limits,256MiBcompleted compressed/512MiBtotal,2GiBactive raw+compressed reserve,
20GiBdevelopment and2.5GiBtemporary free before every child. Targets/images RAM.
Queue1621335/start38218939 remains stopped, watcher3416600 absent. No archive
writes during validation. Commit only isolated experiment, restore control tree
on success. Independent offline verification capped300seconds. No gate changed.
