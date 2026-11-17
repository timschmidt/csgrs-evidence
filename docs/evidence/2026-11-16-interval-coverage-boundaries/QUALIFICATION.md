# Qualified interval boundary witnesses

The retained change adds three tests and extends one existing test in
`trigonometry.rs`, `fractional_power.rs` and `tangent.rs`. All previous assertions
remain. Production source, manifests, dependency locks, build options and APIs
are unchanged. Qualified snapshot: 6b54e0538456c2b574d5ee49fb318c09309caf94.
The original baseline is b8bcc1155498d018330cd00e7f987696bc4f85bd;
the cumulative program baseline remains c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb.
This advances the phases 3/5 conformance and section 14 coverage obligations;
it does not complete those phases or the full plan.

## Acceptance witnesses

Directed MPFR bounds and exact GMP floors construct adjacent dyadic sources on
both sides of pi/6 and pi/3, at 64, 256 and 512 fractional bits. Twelve source/function
pairs independently verify sine/cosine output immediately below or above 1/2 on
the 2^-8 grid. The existing independent oracle checks both tight endpoints.
One-unit-short work budgets must fail without publishing a range; a fresh budget
with the exact completed debit must reproduce the complete result and reach
zero remaining work. Generated enclosures enter subsequent squaring. The new
corpus executes 132 previously unexercised native refinement retries.

Canonical empty dyadic tangent/cotangent and rational-power inputs retain
Complete coverage through subsequent exponential composition without work.
A zero exponent denominator still returns ContainsZero when paired with empty.
Nonempty zero powers retain the exact or explicitly outward coarse-grid image.

A compact base 2^(i32::MAX) with exponent 2^33 distinguishes declared size
exhaustion from an unrepresentable signed quotient shift. The exact positive
shift is 2^64-2^33; a limit below its reservation returns SizeExhausted, while an
adequate declared allowance returns Overflow. No giant integer is materialized.
The reciprocal power returns [0,1] on grid 0, using at most 128 reserved bits and
154,105 declared work units; exact-debit retry succeeds. These counters are not
whole-heap or CPU bounds.

The initial added reciprocal fixture incorrectly assumed 100,000 units suffice.
Normalization alone reserves 84,388 units before endpoint work. Its original
failure logs remain, and the same small-budget input now explicitly checks
WorkExhausted before completion under the already maintained power-test allowance.
No production charge or existing limit changed. Initial new-test integer-literal
inference failure also remains. Neither is presented as a production repair.

## Executed checks

The final source passes full Hyperinterval test/doctest suites on Rust 1.95 and
stable, strict all-target/all-feature Clippy on both, strict owner documentation
and workspace formatting. Rust 1.88 passes the three affected suites with only
`dyadic`, and strict all-target Clippy for that configuration. Raw report totals
are 250/249 on 1.95/stable and 17 on 1.88; nested fresh-process report interleaving makes
these unsuitable as deduplicated unique-test counts. Source-qualified final
coverage runs all library/integration tests, with 39 test objects. No downstream
production path or feature is changed; no new downstream runtime claim is made.

Uninstrumented configured-release versions of all three extended suites pass.
The final compact-power test is additionally run with captured output to record
its actual work debit. Production trig_cost is not timed under competing load;
its final executable reproduces the baseline hash exactly. No comparative
performance or full-current-revision workflow qualification is inferred.

## Coverage and tool diagnostics

The same explicit 28 production source paths (27 with instrumented code;
lib.rs contributes no records), Rust 1.95 x86_64 configuration and all-feature
library/integration suite give:

| Metric | Original | Final |
| --- | ---: | ---: |
| Covered lines | 4688/4740 (98.90%) | 4695/4740 (99.05%) |
| Covered regions | 9320/9891 (94.23%) | 9333/9891 (94.36%) |
| Executed grouped functions | 494/494 | 494/494 |

No file denominator is reduced and no file's covered count declines. Separate
unit-test source modules are excluded explicitly; branches were not instrumented.
Forty-five lines remain uncovered, including defensive and other unexercised
paths. This is not 100% coverage, all-platform coverage or a universal proof.

LLVM 22 emits 26 zero-hash mismatch warnings, all naming external Rug records.
Baseline, intermediate and final diagnostic attribution agrees. Normal and
diagnostic production report tables reproduce exactly. Warnings and full raw
output remain; an initial whole-stdout equality assertion was corrected because
`--dump` adds diagnostic prefixes, not because a metric differed. The unrelated
older LLVM 23 diagnostic crash is not repeated or treated as this tool's result.

## Final artifact allowance

All four fixed/current controls are byte-identical at the same absolute source
path, lock, compiler and release configuration. The final test growth is:

| Test executable | File | All executable code | Named code |
| --- | ---: | ---: | ---: |
| trigonometry | 9696 B | 6656 B | 6591 B |
| tangent | 1696 B | 1408 B | 1444 B |
| fractional_power | 12976 B | 9600 B | 9523 B |

Each target is below its predeclared 32 KiB file / 16 KiB code caps AND 2 percent,
incrementally and cumulatively. The production benchmark is byte-identical;
this is a host-test allowance with no firmware or flash change. Three new
artifact accounts preserve every field of the 54 prior accounts and the fixed
baseline. Intermediate and failed runs remain separate from final qualification.

The coverage JSON exports are retained losslessly compressed with plaintext
digests. To inspect or replay analysis, decompress copies in a new directory;
do not mutate this frozen record. Source snapshots, exact patches, compiler
commands, locks, object hashes, raw profiles' command manifests, warnings,
failed attempts and final reports are retained. Regenerable build trees and
binaries remain outside the archive. All 15 phases, wider migration, whole-resource
closure, release/HIL and coordinated CI gates remain open. No push occurred.
