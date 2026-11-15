# Cost scope

The same external consumer source and dependency versions build once against
unchanged main a7ea9382f and once against the isolated candidate. Cargo.lock is
retained. This consumer resolved num-bigint 0.4.8 and serde 1.0.229; workspace
qualification uses its own unchanged lockfile (num-bigint 0.4.6/serde 1.0.228).
The public mul symbol and all owned output endpoints are materialized. Each
sample completes 65,536 products; result destruction is included. Setup and
serialization are outside timing. Serialized first results, remaining work,
allocation event count and total requested allocation bytes match between builds
for each of five cases. The allocator is reused from Hyperlattice conformance.
This measures allocation requests, not retained/peak heap or allocator RSS.

There are 24 alternating whole-process samples per backend and case, with 4096
warmup products each. Results are unpinned on a shared Linux host; raw times and
host/compiler metadata are retained. Median ratios are observations, not a
statistical proof or universal no-regression claim. Native size and mul symbol
size are recorded. The candidate adds normalization support and is not a
behavior-preserving or performance-only refactor; the measured overhead is
retained for this exactness/completeness gain. No firmware hot path is changed.
No MCU-cycle, WASM runtime/cost, peak-memory or whole-application cost claim.
