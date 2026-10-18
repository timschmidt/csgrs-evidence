# Explicit acceptance-workflow migration

The newly proposed test demanded automatic certified equality for x*(1/x).
On unchanged 0fa83aea7, that query is Unknown at -128 for ConstOffset, Ln,
LnAffine, LnProduct, Log10, Log2, Pow10, Pow2, SinPi and TanPi. The original
test source and complete failing runs remain retained, including the unchanged
mathematical values, scales, equality assertion and precision. Those automatic
completion gaps remain open and are not credited to the lazy-access repair.

The replacement acceptance workflow explicitly calls the existing bounded
exact_rational_normal_form API on the same product and requires Some(1).
The unchanged baseline already proves that result for all 21 materialized
classes. This changes the queried API and therefore the acceptance workload;
it is not evidence that the original automatic-equality workflow is fixed.
It does not accept Unknown or weaken the mathematical claim: every admitted
reciprocal pipeline must produce an exact rational proof of one. The remaining
fixtures, scales, serialization, domain, normal-form, tower, sign, interval,
and strict downstream assertions remain unchanged. No performance comparison
may combine the two workloads. No preexisting repository test is removed.

This migration bounds the lazy-payload patch to restoring an already supported
explicit proof pipeline. The broader goal still includes automatic completion,
all previously recorded invalid-ingress defects, and the original full cases.
