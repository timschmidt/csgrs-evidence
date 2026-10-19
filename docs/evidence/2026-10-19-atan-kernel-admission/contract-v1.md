# E91: imported arctangent range enforcement

Target: fd32065ac1f6c3073bae1f7a50c769a12c147524. Owner: Hyperreal
approximation and native angle-reduction machinery, shared by Computable and
Real. P1, P3-P6, P18-P19, P26 and P35-P39 apply.

Every finite real x is in the domain of atan(x). An imported PrescaledAtan
must preserve that meaning at coarse and fine precisions without assuming
its child satisfies the Taylor series range. The exact current library and
all 2672 source pins match the previously reproduced native JSON atan(2)
60-second timeout; the staged-source receipt maps exactly to this commit.
The original reproduction and its twelve completed controls remain retained.
No production change preceded that reproduction or this revision binding.

Repair the invariant in the shared evaluator. Prove |x| <= 1/2 before using
the small Taylor recurrence. The existing p >= 1 zero approximation is valid
for every finite real argument because |atan(x)| < pi/2 < 2. Use exact native
rational reduction where available; a general fallback must make strict
progress even when a valid coarse or working sample lies on a boundary.
Reuse native half-angle machinery rather than a duplicate adapter kernel.
Preserve stored wire graphs and following arithmetic. The operation is
numerically certified on valid finite children; this does not prove an
arbitrary imported child's domain or any topological/fidelity claim.

Acceptance includes independently directed MPFR enclosures for signed tiny,
half-range boundary, moderate and large rational and symbolic children,
including zero and 512-bit magnitudes. Exercise every admissible working
sample near each half-range boundary, cold/warm coarse-fine-coarse sequences,
cancellation followed by recovery, native/Real JSON/CBOR, owned/borrowed
Values and collections, wire preservation, sign and following arithmetic.
Keep existing large-coefficient and inverse-angle tests. Preserve all failing
attempts and original full-scale fixtures.

After the final edit run focused tests, default/all-feature release scalar
suites and doctests, debug units, strict all-target Clippy, warning-denied
docs/fmt, affected predicate/curve/modeling consumers, and compiler-floor
checks. Retain matched ordinary-import and native atan cold/warm costs with
allocations, allocated/retained/peak bytes, output assertions and binary
sizes, including unfavorable results. Completion of a former timeout is
reported as an expanded capability, never as a matched successful speedup.

General graph domains, other private kernels, typed native evaluation and
cancellation, internal work/heap/expression limits, the isolated evaluator,
formal/exhaustive/coverage targets, full CI and shipped release/binding
validation remain open. No Hypervoxel work or push; the full properties plan
remains the objective.

New artifacts use the user-authorized volume's csgrs directory. Existing
closed evidence remains in its original locations. No new volume quota is
imposed; preserve 1 GiB physical free headroom on both artifact volumes.
Do not reset the existing root, Disk B, /tmp or cumulative log baselines.
Logs remain 200 MiB total, child address space 8 GiB, Cargo jobs 2, focused
runs 60 seconds, and compile/full suites 1800 seconds. External containment
is not an internal bounded-execution claim. Hash each physical path separately.
