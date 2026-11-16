# Typed unsigned fraction ingress experiment

Target: accepted CSGRS 97713a610; Interface f5341f3; firmware b9ecf8d in isolated clean checkouts. Primary 41 staged and Interface 8 pending paths are protected by initial-state.json.

Owners: Hyperreal owns exact primitive fraction reduction; Hyperinterval owns ordered endpoint arithmetic; Interface retains nominal values, physical identity, validation errors, and canonical evidence. Properties P1, P4, P6, P10, P25, P27 and P36 apply. Phase 8 remains incomplete.

Domain: unsigned u64 numerator and NonZeroU64 denominator, exact nonnegative quotient. The new From conversion delegates to the existing private reducer without changing its zero/dyadic/GCD/trace order. Existing signed fallible fraction remains unchanged, including zero-denominator errors. The scalar API has no policy or resource budget; existing arbitrary-precision resource exclusions remain. No new cancellation or work-bound claim.

Missing witness: From<(u64, NonZeroU64)> is absent on this revision. Add a compile-failing test first. Compare canonical values to independent num::BigRational and quotient identities across full u64 boundaries. For the historical 0..=i64::MAX domain also require full dispatch equality to fraction; do not claim trace identity for the new high-u64 domain. Serialization must agree separately where enabled.

Consumer hypothesis: reapply the previously rejected nonempty/positive interval migration as an explicitly unaccepted candidate, replacing its unsigned radius factory with infallible typed scalar ingress. Preserve old fixtures/assertions, scalar order, malformed input guards, physical wrapper layout, and predicate sequence. Typed ingress may remove impossible Result transport; cost benefit is unproved.

Early gates: build and execute the complete native and WASM seven-profile probes before and after at identical paths/configuration. Exact output and byte-size regression rejects the combined candidate; a smaller isolated API is not automatically retained. If eligible, complete local/downstream correctness, strict/approximate dispatch, canonical replay, owner/runtime/allocation/monomorphized-size and successive-operation gates before retention. No cost claim from an incomplete workload.

No pushes or publication. Frozen prior evidence remains read-only. New source, logs, commands, outcomes, and unfavorable results are retained here until archival.
