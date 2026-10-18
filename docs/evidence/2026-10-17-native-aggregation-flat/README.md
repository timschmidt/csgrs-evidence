# Native PCB aggregation with flat report ownership

Retained in source commit `c59767b8c1bc705263bf9ce075ef9f5c7982c51f`. HyperDRC now aggregates checked
native regions without requiring finite report coordinates, preserves source
diagnostic history, and keeps authored report sources as a flat list. Empty
results, holes, overlaps, quadratic regions and coordinates outside finite
report range remain usable by supported native operations. Report projection
stays separately fallible and does not publish an incomplete prefix.

The new allocation-growth regression fails on the unchanged E64 prototype and
passes on the repair. Complete 16/64/256-step square compositions retain
21,712/53,584/181,072 requested Rust bytes after report materialization, compared
with 100,996/772,804/9,358,276 in the rejected prototype. Exact area, membership
and authored polygon counts are checked. Dropping the aggregate returns every
completed probe to the same 7,756-byte live level. These are allocation-payload
measurements, not RSS or a general internal memory bound. The old baseline
retains less at 64 steps (26,928 bytes) but exhausts the external 60-second limit
at 256 steps; that failure remains preserved.

All 1,670 native production tests pass, as do the original full-board resource
gates, formatting, warning-denied Clippy and docs. Hypercircuit passes 105
default and 348 all-feature tests, including recomputation of all six Easyduino
report snapshots, plus its all-target/all-feature Clippy check. Both affected
packages pass all-target Rust 1.95 checks with all features and without default
features. A fresh main-checkout build passes the 39 source-failure tests, 13
native semantic tests and the memory regression after exact source integration.
The separate archived review corpus remains 9 passed/3 failed: those failures
require the unadmitted exact KiCad ingress and are not replaced or weakened.

Twelve complete CLI reports are deterministic within each version. Candidate
bytes and complete parsed reports differ only by the explicit readiness version
21-to-22 migration. The six fixture files change only their 960 check-version
fields. The first all-feature run exposed one additional manufacturing ZIP
fixture mismatch (347 passed/1 failed). Its 22 members were decoded and audited:
20 are byte-identical; the embedded report changes only 160 version fields and
the manifest changes only three independently verified derived digests. Exact
ZIP metadata and CRC updates were independently reconstructed. The complete
348-test run then passes using the same binaries and assertions, including
bundle reimport, size limits, malicious paths and signing. The source snapshot
stays unchanged; the new fixture was qualified as a hashed read-only overlay
before main integration. The initial failure and corrected compact-JSON audit
guard are preserved. Raw ordinary report timings include slightly slower candidate samples;
no general speedup is claimed. Cold/warm nested-source checks independently
verify exact area, membership, authored order, duplicate reports and view
mutation isolation. Every executed command and its output is retained.

This admits the scoped source repair, not the original 35-edit bundle, exact
KiCad ingress, or the separate cache proposal. Hypervoxel remains deferred and
public distribution through its unavailable dependency remains blocked. The
complete properties plan and release qualification remain open. Historical
artifact preservation remains unqualified: E63 last observed 921,794 missing
paths; this checkpoint verifies newly closed artifacts without re-auditing
that history. Only current_work changes in the ledger. No push occurred.
