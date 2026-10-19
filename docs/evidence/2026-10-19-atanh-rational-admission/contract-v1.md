# E92: rational atanh range enforcement

Target: 38bf8a3130d40ddd7842e3e841a392205256f137. Owner: Hyperreal's
rational approximation kernel, shared by Computable and Real interchange and
evaluation. P1, P3-P6, P18-P19, P26 and P35-P39 apply.

The current revision reproduced eight false coarse enclosures for imported
AtanhRational(+/-31/32), among 32 completed cases. The exact source/library,
independent analytic contradiction and cold/warm difference are retained in
the observation. Every finite rational -1<r<1 represents atanh(r), including
non-tiny and near-endpoint values. A stored kernel tag is not a range proof.
Rejecting these previously accepted valid values is not a repair. Preserve
the stored graph, following arithmetic and existing typed rejection at/outside
-1 and 1, including zero-scaled wrappers and collections.

Prove the tiny-series range before both the coarse-zero shortcut and the
recurrence. Reuse native rational atanh/logarithm reduction outside that
range. The fallback must not recreate the same inadmissible kernel. Keep
cancellation cleanup/recovery, while disclosing that native approximation
still lacks a general typed cancellation and total-work contract.

Acceptance: independently derived exact logarithm bounds and directed MPFR
enclosures for zero, signs, dyadic/non-dyadic values, either side of the tiny
range, moderate values, 512-bit tiny and near-endpoint inputs. Exercise cold
and warm coarse/fine/coarse queries, cancellation/recovery, native/Real
JSON/CBOR, owned/borrowed Values and collections, wire preservation, sign and
following arithmetic. Keep original large-coefficient tests and the admitted
atan boundary regression corpus. Numerical enclosures establish no topology
or analytic-source fidelity; unchanged modeling tests have separate contracts.

After the final edit run focused tests, default/all-feature release scalar
suites and doctests, debug units, strict all-target Clippy, warning-denied
docs/fmt, affected predicate/curve/modeling consumers, and Rust 1.95 checks.
Retain the unchanged 17-row ordinary corpus at 100000 iterations and five
alternating pairs. Add matched successful native atanh rows for +/-1/16 and
+/-1/8: public Computable, native imported rational, public Real; precisions
0,-32,-128; cold construction/evaluation and warm evaluation; 72 rows total,
10000 iterations and five alternating pairs. Every result must enclose an
independent directed MPFR oracle. Retain allocations, bytes, retained/peak
memory, binary sizes and every unfavorable row. Former incorrect outcomes
are reported as corrected behavior, not successful-workload speedups.

General domains, other kernels, fallible native evaluation/cancellation,
internal work/heap/expression bounds, the isolated evaluator, formal and
exhaustive coverage, full CI and shipped release/binding acceptance remain
open. Hypervoxel is excluded. No push; the full properties plan remains open.

New artifacts use the user-selected volume's csgrs directory, with no retained
artifact quota and a 1 GiB physical free guard. Preserve the original root,
Disk B, /tmp and cumulative log accounting. Logs: 200 MiB; child address space:
8 GiB; Cargo jobs: 2; focused runs: 60 seconds; compile/full checks: 1800 seconds.
External containment is not an internal bounded-execution claim. Preserve all
attempts and executed helpers, and hash every physical path independently.
