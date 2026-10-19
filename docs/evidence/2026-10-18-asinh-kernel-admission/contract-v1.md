# E89: asinh kernel range enforcement

Target: 59b1df88378b34954db82824ae883cc18a112043. Owner: Hyperreal
approximation kernels, shared by native Computable and Real imports.
Properties P1, P3-P6, P18-P19, P26 and P35-P39 apply.

Reproduce the current PrescaledAsinh/AsinhRational admission and coarse
approximation at arguments +/-4 before editing production. These encode defined
real asinh values. Native constructors normally choose the small series only
below 1/2; the wire tag itself is not that range proof. The kernel must justify
its approximation and coarse-zero shortcut from the actual argument, and
reduce out-of-series inputs through an existing native identity. Do not reject
a mathematically valid input, silently replace its stored graph, or publish a
partial result as complete. Exact quantized intervals must enclose the intended
asinh value independently of cold/warm/coarse/fine request ordering.

Acceptance: independent exact coarse bounds and directed MPFR enclosures,
both signs, zero, dyadic/non-dyadic rationals, shared constants and arithmetic
expressions, each series-range sample boundary, coarse and fine precisions,
JSON/CBOR/owned and borrowed Value/collection ingress, preserved wire graphs,
following arithmetic and predicate consumers. Keep original 192000-bit
wide-coefficient tests. Scalar default/all-feature release, debug library,
doctests, strict Clippy/docs/fmt, affected predicate/curve/modeling consumers
and compiler floor remain required. Retain matched costs of unchanged native
small workloads and ordinary imports, allocations and binary size. This is a
correctness extension, not a speedup claim. Retain unfavorable attempts.

General expression-domain validation, fallible native evaluation/cancellation,
full internal work/heap limits, all other private-kernel ranges, the isolated
fallible-evaluation prototype and full release/binding gates remain open.
No claim that this kernel repair discharges them. No Hypervoxel work or push.

All new bulky artifacts stay here on Disk B/csgrs. Closed previous artifacts
remain read-only. Preserve all attempts and executed helpers. Hash each
physical path independently. Baselines are unchanged: root initial free
75,664,232,448 bytes and 16 GiB net; Disk B initial free 373,218,291,712 bytes
and the user's approved 149 GiB net; /tmp initial free 67,482,746,880 bytes and
58 GiB net. Cumulative logs 200 MiB; child address space 8 GiB; Cargo jobs 2;
focused runs 60 seconds and compile/full suites 1800 seconds. These are
external containment, not a claim of internal bounded execution. Do not reset
baselines, delete evidence, or weaken workloads to fit. Prepare the complete
validation matrix before any necessary additional storage request.
