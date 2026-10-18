# Native PCB aggregation without finite report prerequisites

Target: E63 integrated main, e515480e3f0f19a371c745b60d453ab322094db6. Owning layer: HyperDRC's PCB
region owner and shared region aggregation, used by BoardModel::all_copper and
BoardModel::copper_layers. Properties P4, P6, P9, P17-P20, P25-P26 and P35-P39.

Domain: valid native filled regions already accepted by PcbRegion, including
canonical empty, linear/circular/quadratic contours, holes, overlaps,
disconnected material and exact values outside finite report range. Aggregate
the represented regularized union under STRICT, validate every selected source
before identity shortcuts, and retain source diagnostic history. Metadata and
authored report order remain PCB-owned; numerical certainty, native topology
and finite report fidelity are separate. Invalid and exhausted inputs remain
typed errors; failed report projection cannot invalidate native geometry or
publish a successful prefix. Source owners must remain alive and mutation must
invalidate their derived state. No caller tolerances or second geometry kernel.

Reproduce the unchanged archived 12-test KiCad aggregation corpus and the 39
current track-failure tests on this revision. Add a separate native-constructor
corpus with analytic area/membership, subtraction-to-empty and subsequent
composition, report failure/recovery, source history, ownership, concurrency,
strict/approximate/strict and exhausted-budget recovery. The three archived
cases requiring unadmitted exact KiCad ingress stay unchanged and visible;
they are not replaced by the new native tests. Do not reintroduce track ingress,
cache proposals, fixtures, policy changes or the rejected 35-file bundle.

Evaluate only the five native aggregation files from E36, fixing its known
clone lint before qualification. Use separate fresh Cargo targets for baseline
and candidate snapshots. Run the original full-board 120-second worker-CPU,
neck 60-second check-body wall and Gerber 120-second gates unchanged on complete
fixtures. Before retention, run the full HyperDRC release suite, Clippy with
warnings denied, docs, affected Hypercircuit consumers and report-byte checks.
The native API is Rust-owned; no binding ABI change is proposed. Any changed
report/readiness artifact requires explicit review/migration. Public distribution
through unavailable dependencies remains blocked, and is not qualified by a
local build. No speedup claim without matched measurements.

External containment retains E63's 16 GiB root net filesystem allowance and
64 GiB Disk B allowance, two build jobs, 8 GiB child address space, 1800 seconds
per command, 64 MiB logs and memory/filesystem reserves. No internal expression,
retained-byte, total-work or cancellation bound is claimed for this repair.
Preserve failed attempts and artifacts; close new roots independently. Only
current_work may change in the ledger. Hypervoxel is deferred. No push.
