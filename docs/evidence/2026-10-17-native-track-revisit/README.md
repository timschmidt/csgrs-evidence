# Exact KiCad ingress after flat native aggregation

The isolated importer remains **rejected**. Current revision `7abc7128c00ad1b4bbb10ddd24dc968c39dfdd8a` reproduces
all ten archived exact-stroke failures and three of twelve archived aggregation
failures, while its existing 39 source-failure tests pass. A fresh worktree changes
only the production track importer, retains the committed flat aggregation, and
adds the unchanged archived tests. The reviewed 39-test migration preserves all
six extreme fixtures and replaces their obsolete finite-adapter rejection with
exact area, bounds, membership, strict-receipt and native-handoff assertions.
All 75 focused candidate tests pass.

The unchanged original full-board and copper-neck gates both fail. Their exact
assertion diagnostics and process timing observations are in
[the review](review-v1.json); process elapsed time is not substituted for the
full-board worker-CPU or neck body-wall assertion. Gerber passes. No cache
proposal is included. No production file changes, readiness migration, importer
admission, or weaker gate is retained. The earlier aggregation repair remains
admitted and the original 35-edit bundle remains rejected.

A separate [point-equality probe contract](point-equality-probe-contract-v1.md)
measures current public `Point2` equality against independently derived integer
labels. Coordinates include exact decimals, non-dyadic rationals, subrange and
superrange values, large coefficients, shared handles and symbolic translation.
The repeated 65,536-comparison traversal reports:

| Input | Requested Rust allocations | Requested bytes |
| --- | ---: | ---: |
| integer | 5952 | 238080 |
| shared | 5952 | 238080 |
| same-x | 6048 | 241920 |
| decimal | 187646 | 10515616 |
| non-dyadic | 181584 | 10168704 |
| subrange | 1090336 | 121791232 |
| superrange | 189706 | 21869184 |
| large-coefficients | 1161938 | 777259872 |
| symbolic | 1103760 | 76680576 |

Construction and output formatting are outside each measured loop. First-pass
and repeated-pass observations, timings, live payload and peak payload are all
retained. These instrumented observations identify work to investigate; they do
not qualify an optimization, establish an internal bound, or count native GMP
allocations or allocator overhead. Point equality source is unchanged. A future
experiment can compare already known rational coordinates through the existing
scalar equality implementation, while retaining the symbolic proof fallback.

The [raw archive](raw-evidence-v1.tar.gz) preserves helpers, source proposals,
all command records and observations. [Its member index](archive-members-v1.json.gz)
hashes every archived byte stream and names larger physical artifacts retained
outside the archive. Every new physical path is hashed separately; older
history is not claimed recovered. The last historical audit observed 921,794
missing paths. Only `current_work` changes in the execution ledger. Hypervoxel
is excluded, public distribution and the full plan remain open, and no push
occurred.
