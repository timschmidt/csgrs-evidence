# Named scalar certificate admission: reproduced failures

This checkpoint records failures on dbe99e3cc and preserves the acceptance
fixtures. It does not change production code or admit an importer repair.

The 176-case public-recipe census covers all 21 named classes and an opaque
control. Among the results, 103 materialized payloads match the class recipe,
9 differ structurally, 8 are lazy, and 56 use the opaque carrier. All recorded
named JSON/CBOR round trips (120 values) preserve bytes and signs. The 56
opaque results are classified only. This is a finite census,
not a universal equivalence proof.

The nine differing payloads are legitimate inverse-product and cached-root
representations. Removing both class tags before asking the existing native
reducers proves one equivalence; eight remain Unknown at refinement -64.
Rejecting graph differences or interpreting Unknown as inequality would lose
supported public values. Those proposed import gates are rejected.

The malformed/counterexample matrix has 36 tuples at scales zero and one.
It records 142 format acceptances and no rejections. Two JSON fact queries,
Ln(0) and LnAffine(base=0), abort isolated children with stack overflow before
their CBOR branches run. These are retained failures, not successful checks.
Other cases assert false positivity, nonzero status or irrationality, including
Sqrt(4) and Exp(0). A Pi class with a positive payload of 2 also contradicts
its claimed value, so sign agreement cannot validate payload consistency.

One case requires preserving a valid value: ConstProduct(pi_power=0,
exp_power=q) means exp(q). The current reconstruction introduces an extra pi;
for q=1 its interval represents pi*e, while adding one produces e+1. Restore
the zero-exponent identity in the owning scalar helper rather than rejecting
this valid parameter tuple.

The retained acceptance-baseline-v2.rs has two failing tests: 35 invalid
certificate forms at scales 0, 1 and -3 through both import formats, and four
independent zero-power value checks. Both formats are always evaluated, and
all value cases are collected before asserting. The original weaker baseline
driver is retained too. These tests are evidence of missing behavior and are
not installed as passing main-suite regressions.

All 109 command records and their outputs were verified. The five nonzero
commands are the original/repeated scalar aborts and the two expected failing
acceptance runs. No resource stop occurred. Compiler invocations use -D warnings;
no new full-suite, Clippy, release, distribution or performance result is claimed.
All 2,662 pinned source paths remain unchanged. Raw protocols, sources and logs
are archived on Disk B; exact locations and hashes are in external-evidence-v1.json.
Each physical path is hashed independently, and compiled probes remain retained.
Root/Disk B/tmp limits remain 16/72/40 GiB and cumulative logs 96 MiB.

Next: establish named-parameter claims before lazy reconstruction, repair the
zero-exponent identity, and provide native equality evidence for valid payload
variants. An unproved equality must stay distinct from malformed input. Full
graph admission, strict workloads and shipped distribution remain open.
Hypervoxel remains excluded; the complete properties plan remains active.
