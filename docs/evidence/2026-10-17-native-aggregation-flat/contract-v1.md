# Flat native report ownership

Target main: 5a22614321cfcc2d1a4c2f4ed2920bb0fdd8e671; production baseline is
unchanged from E64's e515480e3f0f19a371c745b60d453ab322094db6. Owning layer:
HyperDRC PcbRegion report-source ownership; consumers are BoardModel copper
aggregation, reporting and Hypercircuit DRC. Properties P4, P17-P20, P25-P27,
P29 and P35-P39. The E64 native domain, strict semantics, failure distinctions,
authored source order, diagnostic history and version 21-to-22 migration remain
unchanged. No exact-track ingress, cache proposal or Hypervoxel change.

E64 reproduced excessive retained report payload: its complete 16/64/256-step
unit-square compositions retained 100996/772804/9358276 requested Rust bytes.
Recursive aggregate owners fill every ancestor's projection cache. Flatten
already-owned authored source lists, without deduplicating sources, changing
native geometry or projecting coordinates during aggregation. Singleton and
invalid-input behavior remain covered by the unchanged native corpus.

Before implementing, add a standalone integration-test allocator growth guard
and run it against the unchanged rejected E64 prototype. A fourfold increase
from 16 to 64 repeated finite square compositions may retain at most sixfold
requested allocation payload after complete report materialization. Each case
independently checks exact area one, center inside and N authored polygons.
This is a workload-specific growth regression, not a universal memory bound.
Use the identical test against the new source snapshot, and repeat the original
16/64/256 complete external probes. Preserve failures and unfavorable results.

Run all 39 source-failure tests, 13 native semantic tests, unchanged archived
12 review tests (three known unadmitted ingress failures), original full-board
worker-CPU 120 s, neck body-wall 60 s and Gerber 120 s gates, full native suite,
fmt, warning-denied Clippy/docs, downstream Hypercircuit default/all-feature
consumers and complete authored report comparisons. Compare report bytes and
parsed claims separately; only the declared readiness version may differ.
Compile before binding frozen CLI executables, run library tests from writable
scratch, and preserve distinct rustdoc summary groups. Use fresh source/target
roots; do not reopen E64 artifacts. Code remains unapplied until qualified.

Retain the existing 16 GiB root/64 GiB Disk B net storage limits, 8 GiB child
address-space limit, two build jobs, 1800 s commands (60 s resource probes),
64 MiB logs and host/filesystem reserves. No internal work, retained-byte or
cancellation bound is claimed. Public distribution remains blocked; local
source qualification does not establish release. No push. Only current_work
may change in the ledger, and unrelated checkpoint_v4.py stays untouched.
