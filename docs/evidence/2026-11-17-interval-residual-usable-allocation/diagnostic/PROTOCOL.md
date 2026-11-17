# Allocator usable-byte attribution: bounded diagnostic

Owner: Hypersolve residual-certification admission harness, with the host
allocator below its counting allocator. Properties P8/P9 certainty and the
admission resource protocol remain unchanged. This diagnostic addresses a
missing explanation of usable-byte variation on the same completed workload;
it does not change production code or an acceptance test.

Use the original SHA-verified fixed/current/candidate no-feature release images
from residual-certainty-admission/resource-builds.json. The fixed and current
images are byte-identical. Case 24, STRICT, passive trace, rebuild, cold,
pattern 165 is the prospective target. Existing diagnostic observations have
2910 allocations and 193309 requested bytes throughout, with variable usable
traffic. Original failures, denominators and positive charges remain binding.

Read each ELF's one-byte allocation::ENABLED symbol via its actual symbol
table, relocated against the main executable by dl_iterate_phdr. Never write
that byte. A process-local LD_PRELOAD library records malloc/realloc/free only
while this original measurement flag is true. It delegates to glibc's original
allocator and records original usable sizes. Its own logging is guarded against
recursion. No global allocator, ASLR or system configuration is changed.

Preserve original stdout and diagnostic stderr in chronological order on one
descriptor. Independently reconstruct allocation/deallocation/reallocation
counts, requested allocation traffic and all three usable-byte tuples for the
operation, output-drop and input-drop epochs. Any missing events or mismatch
prevents a complete-attribution claim. Requested free sizes of allocations
created before an epoch are not inferred from usable sizes. Initial flag state,
one-byte symbol and writable ELF segment must be verified. Preserve failures.

Pilot at most 12 processes, then at most 24 plain and 24 instrumented runs per
revision (156 total including pilots). Each subprocess has a 30-second timeout;
the whole diagnostic driver has a 15-minute deadline. No timing claim. Plain
and instrumented runs must have identical complete OUTPUT/TRACE records on
each revision and across the unchanged completed contract. Instrumentation may
perturb allocation layout: observed costs cannot be subtracted from original
measurements or substituted for uninstrumented admission results. Same-request
usable variation is empirical, not a universal allocator rounding formula.

Compile with cc -shared -fPIC -O2 -Wall -Wextra -Werror; record compiler and
glibc versions and binary/source digests. Initial tracing has no stack capture.
A separately recorded extension is required before adding selected stack
capture. Output is bounded to 64 MiB per process and 512 MiB total. Use tmpfs
for live data; preserve the development-volume 20 GiB guard. Hold only the
existing quiet watcher after verifying its PID/start and the stopped workflow
parent; restore the same watcher after completion, without resetting its
finite horizon. Do not interrupt unrelated workloads.

No memory cap revision, accepted account, production retention, runtime waiver,
or universal resource guarantee follows from this diagnostic. The wider
interval refactor and residual-certainty repair remain unaccepted until all
their unchanged gates and any separately justified exception pass.
