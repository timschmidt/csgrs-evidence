# Shared-input borrowed-key attribution diagnostic

The borrowed-key source d2848f1a083f8fe25ef8ea98a62cd7ad7c2feaf0 preserves276full
outputs and reduces requested/usable materialization bytes, but three original
accounts fail allocation/free counts by one. Retain these failed results and
all prior charges. Hypothesis: pointer-keyed iteration changes with input
addresses across processes, affecting BTreeMap node occupancy/counts. This
experiment distinguishes that mechanism from report-key representation costs.
No runtime, whole-process memory or admission claim; it does not replace source
crate controls, full geometry or the original failures.

Compile both production prefixes (byte-identical through the test-module marker)
as separate public modules in one diagnostic consumer. Copy the unchanged
allocator monitor. Append only an accessor returning the live map's actual key
addresses/lengths/counts in iteration order. No collector, record or hasher edit.
The original owner source tests remain in the earlier pilot, not transplanted:
the diagnostic excludes test modules, whose Rational calls require their original
crate and TLS. Public diagnostic APIs are instrumentation only, not proposed
source changes. Preserve full prefix sources, instrumentation and compiled image.

For each of the original276controls, run both source orders in separate fresh
processes:552direct consumer children. Both modules receive exactly the same
layer/operation/path addresses, label order and event counts. Check and retain
both full identity-table iteration vectors and full report vectors. All outputs
also match independent integer count sums and text. Observe original recording,
materialization and cleanup metrics; validation/instrumentation vectors and
input creation outside those epochs. Static input allocations remain bounded
and intentionally process-lifetime. Compare original metrics/caps separately
within each shared-input pair; do not merge these with original launch results.
Warm/cold and snapshot/take behavior, scope cleanup and report ownership unchanged.

One1200-second producer window,700directchildren counted at one spawn site;
600per build/check,60percontrol. Compiler descendants outside direct count.
No automatic retry/deadline reset. 1GiBbuild/64MiBcontrol file limits,
128MiBcompressed/256MiBcompleted stage,2GiBactive raw+compressed reserve;
2.5GiBtmp and20GiBdevelopment free before every child; target/image RAM.
Queue1621335/start38218939 held, watcher3416600 absent. Strict harness Clippy and
format; no production checkout mutation. Separate300-second independent offline
verification. No archiving during validation. Earlier stage deadlines/caps fixed.


Correction following the preserved initial Clippy failure (zero controls): the
relocated trace module has a crate-private refinement hook normally called by
scalar code. Clippy correctly rejects it as unused in this diagnostic. Append
a public diagnostic forwarding function so the original hook remains reachable;
no warning suppression, production-body edit or measured call is added. Preserve
the initial consumer/build/check logs and three direct commands in the original
stage. This manually reviewed correction retains that original1200-second wall
deadline and700-child aggregate ceiling; no geometric control is retried.
