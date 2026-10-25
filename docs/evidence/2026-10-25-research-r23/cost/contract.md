# R23 cost and completion comparison

Highest-priority claim: newly certified exact containment and escaping points.
This is not a performance-only proposal. Existing completed decisions, exact
witness definitions, receipts and typed failure controls must remain unchanged;
newly completed queries are not timed against a baseline blocker as a speedup.
The bounds enclosure fast path remains conservative and unchanged.

Fourteen authored fixtures cover line and cubic enclosures, cubic tangency and
escape, rational enclosures, a monotone rational coordinate whose control hull
overshoots its endpoint, nonmonotone rational tangency/escape, selected trims,
irrational quartic escape, a valid trim beside a source pole, an unsupported
analytic parallel, periodic rational seams and an invalid whole source pole.
Each has both traversal directions and STRICT/APPROXIMATE_512, subject only to
recorded input-construction validity. The fixture source and independent
formulae are in main.rs. Candidate successful answers must match those oracles;
baseline failures remain failures, with completion and certainty reported.

Thirty alternating independent process pairs per fixture/policy/direction;
twenty sequential samples per process. Sample zero is a cold query after input
construction; the remaining nineteen reuse that source. Query time includes
the complete policy-scoped call and result production. Input construction is
outside. Witness comparison with independently derived coordinates, source
definition replay, exact serialization and result destruction are outside the
query timer and separately recorded. Allocation counts/requested bytes, live
result delta, query peak above starting live state and retained bytes after
result drop are measured by the same forwarding allocator in both variants.
Reallocation traffic counts full new requests. This is process allocator
traffic, not a hard heap guarantee. External timeout/address-space limits are
containment, not API resource guarantees.

Compare exact artifact bytes for all old completed controls and the same
typed-failure controls. Record all new completion cells and every adverse
cost. Use per-process cold samples and warm medians, paired geometric ratios,
and deterministic bootstrap intervals (seed 20261025), without interpreting
overlap as nonregression. No performance improvement will be claimed. Source
patches and inventories, locks, compiler, flags, native sections/file sizes and
binary SHA-256s are retained. The two manifests use identical registry versions
and checksums from the main workspace, and source paths are normalized through
identical remap flags. Each variant has its own target and compiler cache.

Do not run authoritative latency samples during owner/consumer compilation or
heavy correctness validation. Diagnostic pilot runs may locate fixture/harness
errors first but do not enter the paired result. Keep all such failures.
