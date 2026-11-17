# Borrowed report-key completed-workload runtime screen

Owner Hyperreal trace recording/materialization, P4/P10/P36, and the interval
plan's priority ordering and completed-consumer performance gate. Missing witness:
runtime cost of d2848f1a083f8fe25ef8ea98a62cd7ad7c2feaf0 (borrowed report keys)
versus4f41bd58415d936968e1955dbd431f0cb5e988f0. Local276output controls, byte
accounts and552shared-input paired diagnostics pass, while three original
cross-process allocation-count failures remain recorded. No source changes here.
Canonical live-table hashing is already rejected; it is not tested again.

Build one identical standalone consumer against each immutable source using
Rust1.95release/locked/offline, no allocator instrumentation. Each fresh process
completes ceil(1048576/n) rounds, each recording n labels, collecting snapshot or
take, checking every field/count against independently prepared expectations,
serializing every returned row into a reused string, dropping the report,
resetting counters and checking emptiness. Setup creates n independent static
label addresses with groups distinct text values; these bounded input strings
live until process exit. Recording scopes close each round. Include first-round
allocation and all round operations in process CPU/wall timing; input creation,
final printing/string destruction and retained TLS teardown outside. This is a
completed report workload, not whole-process memory or geometry qualification.
No precision policy is consulted by the tracing API; both geometry policies are
still required for downstream qualification.

Active domains: n1/12/65/256/4096, groups unique values from{1,min(17,n),n},
label bytes5/256, snapshot/take:48domains. Passive controls: n1/4096 with one
text group, both lengths and both collectors:8domains. Twelve paired repetitions
per domain, alternating source order:1344processes. Same argv0,working directory,
environment and lowest initially allowed CPU for both source images. Full final
reports must match independent exact strings; every earlier round is validated
inside the consumer. Retain every timing sample, clock resolution and wall time.
No outlier removal, speedup claims from timer-scale observations, or automatic
runtime-growth allowance. A material reproducible regression blocks retention;
a pass still requires owning benchmarks, successive_operations, full consumer
lifetimes/stack, cumulative accounts and native/WASM/package images.

One2400-second producer window,1600directchildren counted at one Popen site;
600seconds/build/check,60seconds/consumer. Compiler descendants explicitly
outside direct count. No automatic retry/deadline reset. Build file1GiB and
consumer64MiB limits;128MiBcompleted compressed/256MiBtotal stage,2GiBactive
raw+compressed reserve,2.5GiBtmp and20GiBdevelopment free before every child.
Source/targets/images RAM. Queue1621335/start38218939 held, watcher3416600 absent.
No archive writes while timing. Strict harness Clippy, formatting and source
hash checks for each image. Restore control branch on success. Offline verifier
has a separate300-second bound. Prior failures/charges/caps remain unchanged.
