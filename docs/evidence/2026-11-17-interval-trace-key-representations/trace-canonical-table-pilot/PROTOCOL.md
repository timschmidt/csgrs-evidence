# Canonical trace recording-table pilot

Owner Hyperreal trace recording/report materialization, P4/P10/P36, interval
plan's complete-consumer cost and trace gates. Predecessor pilot rejected batch
and incremental output collectors; its supported4096identity/1text case proves
batch expansion, while incremental aggregation raises traffic and reallocations.
All earlier experiments, charges, failures and caps remain preserved.

Candidate: merge textual labels in the existing live HashMap using content hash
and equality, retaining the pointer-equality fast path, existing DispatchHasher,
unified thread-local state and inactive-recording guard. Materialize directly
from the now-unique live entries and sort by text. No new table/cache, cached
hash field, public API, predicate-order change or retained interning registry.
No algorithm/type changes to arithmetic, policies, certificates or geometry.
The existing hash writer is deliberately unchanged for this first candidate;
content hashing may increase event-recording time and requires measurement.

Base4f41bd58415d936968e1955dbd431f0cb5e988f0 is scopeab81708aa plus the independent
trace regression now retained in primary3fa808111. Existing owner tests and the
entire276-case collector harness must pass, including empty/unique/aliased labels,
ordered snapshots, clearing take and concurrency. Reuse immutable baseline
control logs/image from trace-materialization-pilot with hash verification. Source
harness Rust and allocator are copied byte-for-byte; build a new isolated image.
Use identical argv[0], arguments, original cwd and recorded environment overrides.
Record counter-creation and collector/cleanup metrics separately. No complete
lifetime, runtime or admission claim from collector-only observations. Before any
retention, measure whole recording/materialization/reset lifetimes, active/passive
event-recording time, affected full geometry chains, original cumulative charges,
owner/downstream checks and native/WASM/package images. No gate is waived.

A1800-second source/functional pilot,1200per build/owner check,60percontrol,
500direct children, all direct spawns counted at one site. No automatic retry or
deadline reset. Same per-file limits as preceding pilot:64MiBcontrol/1GiBbuild;
256MiBcompleted compressed/512MiBcompleted total,2GiBactive raw+compressed reserve,
20GiBdevelopment and2.5GiBtemporary free before each child. Targets/images RAM.
Keep queue1621335/start38218939 held and watcher3416600terminal. No archive writes
while validation executes. Original source test branch restored after successful
execution; candidate committed only as an isolated unadmitted experiment.
Independent offline verification capped300seconds. All later resource/timing
qualification needs its own declared envelope; this pilot is not a substitute.
