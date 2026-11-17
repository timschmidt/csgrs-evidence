# Uninstrumented residual-certainty consumers

Owning layer: Hypersolve certification and diagnostic reports, P8/P9/P19,
phase 7 of the interval plan. Candidate aad7409a repairs the independently
reproduced approximate-to-exact summary promotion. The missing witness here
is consumption of complete reports through uninstrumented native and
wasm32-unknown-unknown binaries on all existing resource corpus configurations.
This extends qualification, not the mathematical support domain.

Copy the existing fixture and operation/validation code byte for byte. Keep
all 113 cases and 196 policy configurations, including invalid inputs, strict
unknowns, empty inputs, selected rows and the 128-row stress case. Measure the
24 corrected cases only on the candidate; false certificates on old revisions
are not completed added functionality. Exercise reused/rebuilt inputs,
cold/eight-call warmup, absent/passive/active tracing. Validate all complete
reports, including queries, generation and required owned output. Return full
report and trace strings; checksum-only equality is insufficient.

Use fixed c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb, current
4192d8c726d3333a31cb7eddc30cc0d464d61411 and candidate
aad7409a5928e309812d9a5cc361d46313685266 at the same isolated checkout path,
Rust 1.95.0, identical lock, opt-level 3, thin LTO and one codegen unit.
Build both feature sets for native and WASM. A candidate pilot precedes
boundary builds. Require strict Clippy and formatting for both targets.
Compare complete ordinary report/trace strings across revisions and targets;
record any mismatch without normalizing it away. Exclude instrumentation from
these consumers. WASM must have zero imports; exported output is copied before
explicit buffer cleanup. Record linear-memory pages before/after cleanup,
without claiming this observes live allocator payload or returns pages to host.

Prospective final-artifact incremental AND cumulative positive caps:

| Metric | Incremental | Cumulative |
| --- | --- | --- |
| Native file/allocated sections | 8 KiB AND 0.5% | 16 KiB AND 1% |
| Native executable/named code | 4 KiB AND 0.5% | 8 KiB AND 1% |
| WASM file | 8 KiB AND 0.5% | 16 KiB AND 1% |
| WASM code section | 4 KiB AND 0.5% | 8 KiB AND 1% |

Use current values as incremental relative denominators and fixed values as
cumulative denominators. Preserve inherited positive charges from fixed;
never net savings across boundaries, metrics, targets or configurations.
Native image capacity 16 MiB/reserve 2 MiB; WASM image capacity 8 MiB/reserve
1 MiB. These are declared fixture deployment capacities, not firmware budgets.
WASM linear-memory completion envelope 256 MiB with 64 MiB observed reserve;
memory-page observations do not establish an internal allocation bound or
qualify a memory-growth exception. Native resource caps remain separately open.

Build/run containment is external: 1,800 seconds per build, 60 per native case,
600 per WASM matrix, 21,600 total. No containment event is relabeled as typed
solver exhaustion. Preserve failures. Coordinate only the existing queue and
its watcher; keep its frozen commands, finite horizon and cumulative budgets.
No runtime evidence comes from these runs under external host load.
Owner artifacts, public package replay, complete consumer capacity,
cancellation/retry and composition with f65589b remain separate obligations.
No primary source or accepted resource account is changed by this protocol.
