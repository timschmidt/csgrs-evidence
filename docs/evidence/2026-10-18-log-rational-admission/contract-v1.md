# E90: rational logarithm range enforcement

Target: 7f3d813e91d96e76245dfa7342bff88007f7505a. Owner: Hyperreal
approximation kernels shared by native Computable and Real import and evaluation.
Properties P1, P3-P6, P18-P19, P26 and P35-P39 apply.

Reproduce the current PrescaledLnRational and BinaryScaledLnRational coarse
approximations before editing production. Their stored residual r represents
ln(1+r), with an additional shift*ln(2) in the binary-scaled form. Valid finite
r > -1 must retain that meaning through cold/warm evaluation, interchange and
following arithmetic. A serialized tag is not proof that |r| is small. Invalid
r <= -1 must retain the existing typed import rejection. Do not reject valid
large or near-minus-one residuals, change their stored graphs or conceal a
failed evaluation behind a successful zero.

Acceptance: independently derived exact logarithm bounds, directed MPFR
enclosures across small and large positive/negative residuals, zero, both
half-range boundaries, close-to-minus-one values, dyadic and non-dyadic
rationals, and binary shifts including i32 endpoints at supported precisions.
Exercise native and Real JSON/CBOR, owned/borrowed Values and collections,
coarse/fine/coarse queries, wire preservation, following arithmetic and the
existing invalid-domain tests. Preserve original 192000-bit coefficient tests.
Run default/all-feature release scalar tests/doctests, debug library, strict
all-target Clippy/docs/fmt, affected predicate/curve/modeling consumers and the
compiler floor. Retain matched ordinary-import and native rational-log costs,
allocation/retained/peak memory and binary sizes, including unfavorable results.
This is a correctness extension, not a speedup claim.

General expression domains, other private kernel ranges, native fallible
evaluation/cancellation, full internal resource bounds, the isolated evaluator
prototype and full release/binding acceptance remain open. No Hypervoxel work
or push. The full properties plan remains the objective.

Bulky artifacts remain on Disk B/csgrs. The user authorized: "Use as much of
Disk B as needed." No retained-artifact quota applies there; the runner keeps
1 GiB of physical free-space headroom. Original accounting baselines remain:
root initial free 75,664,232,448 bytes with 16 GiB net; Disk B initial free
373,218,291,712 bytes; /tmp initial free 67,482,746,880 bytes with 58 GiB net.
Cumulative logs remain 200 MiB, child address space 8 GiB, Cargo jobs 2;
focused runs 60 seconds and compile/full suites 1800 seconds. External
containment does not establish internal bounded execution. Preserve all
attempts, executed helpers and prior evidence; hash every physical path
independently. Do not reset baselines or weaken workloads.
