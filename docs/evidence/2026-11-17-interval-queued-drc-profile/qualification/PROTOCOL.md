# Diagnostic profile of the held CI DRC failure

HyperDRC owns the complete KiCad smoke workload and its unchanged 120-second
worker-CPU assertion. The two frozen target-955593aa replays failed at
189.525596316 and 188.118210819 worker seconds. Their stage logs identify
layer-sanity as a major cost. No cause is inferred from external contention.
The earlier 63-sample profile used source 71377cb5 and cannot establish the
current target's hot paths. Reproduce on the exact existing image before
choosing any source change. No code, fixture, spatial index or predicate order
is changed in this diagnostic.

Use the original SHA-256-verified hyperdrc-1844e5fbe37d2531 test image, target
955593aa9e25727c8e8cfbd0ab1e599d6a09dd53. Require the complex fixtures; preserve
the exact test filter, one test thread, complete test output and original CPU
assertion. The existing debugger sampler interrupts the test worker every two
seconds and records up to 31 stack frames. Counts overlap, are not exclusive
CPU-time shares and cannot establish a speedup. Debugger overhead and external
work preclude acceptance timing claims.

One diagnostic invocation, 600-second outer bound, 20 seconds per debugger
command and ten-second debugger cleanup. No unbounded retry. Keep raw debugger
output and every sample, including failures. Verify image/source/fixture hashes
and the frozen queue before and after. Original queue commands, outcomes and
cumulative workload budgets remain unchanged; the completed observer is not
restarted. The workflow parent remains held. This separate diagnostic cannot
qualify a replay or remove either original failure.

Use only the existing local debugger installation. Signal only the diagnostic's
owned inferior after PID/start-time validation, and clean up its debugger.
Do not interrupt unrelated routing, rendering or enclosure work. Store this
small diagnostic in temporary storage while preserving development-volume
20 GiB headroom. Subsequent source work requires an owning-layer contract and
a failing/missing acceptance witness, then normal local/downstream gates.
