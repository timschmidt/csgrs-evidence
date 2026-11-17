# Diagnostic attribution of trace allocation variation

Owning layer: Hyperreal dispatch-trace collection, P4/P10 and resource evidence.
The unchanged original residual-certainty resource binaries repeatedly vary by
one 632-byte allocation while preserving full report/trace output. Pointer-key
hash iteration followed by content-keyed B-tree insertion is a source-level
hypothesis, not established attribution. This diagnostic seeks actual allocation
call stacks from those binaries, without modifying their source or bytes.

Use a temporary host-glibc malloc interposer that logs only size-632 allocations,
with a recursion guard and bounded native backtrace. Preserve ASLR and the
original binary. First run one candidate active-trace control (case 0, STRICT,
rebuilt inputs, warm 1); compare complete OUTPUT/TRACE with an uninstrumented
invocation. Resolve image-relative addresses against the actual final ELF.
If useful, run at most 32 active and four passive invocations per original
fixed/current/candidate trace image, all on this exact configuration. Preserve
every output, stack, exit status and original image digest. No new mathematical
or resource-success claim follows from this instrumentation.

Allocation stacks under an interposer are diagnostic evidence, not unchanged
resource measurements or runtime data. Instrumentation may perturb allocations,
process state and timing. Do not subtract these events from earlier charges,
change a baseline/cap, count overlapping distributions as zero candidate cost,
or infer a universal attribution from a finite sample. A failed or ambiguous
stack lookup remains recorded. The report/trace output and independent original
fixture assertions must still agree.

Use a dedicated temporary directory, a 20-second per-process timeout and a
90-second maximum execution batch, with timeouts clamped to remaining time.
The existing owner builder (PID 3790860, start 46852177) owns the queue/watcher
hold. Check that it is still live and both parent/watcher remain stopped before
each diagnostic process; never acquire, release or reset that hold here. Stop
if its ownership changes. No concurrent source edits, new package checkout,
global ASLR setting, shared allocator or deployed binary changes are authorized
by this diagnostic. No accepted size or memory account changes.
