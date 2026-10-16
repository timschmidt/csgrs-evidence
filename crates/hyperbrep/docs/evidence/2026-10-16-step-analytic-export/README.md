# Exact selected analytic STEP export

Qualified on `0ab4bb9af` plus this increment, containing upstream `362e157c1`.
The final checkpoint fetched `72cd216cc`; merging/requalifying it is a separate
step. This evidence must not be attributed to that later source revision.

The [contract](contract.md), [manifest](manifest.json) and
[source hashes](final-source.json) bind the API, domain, every attempt and cost
observations. All 20 final scoped qualification/measurement commands passed on
identical source snapshots: BREP/IO debug and release **424 tests each**, minimal
release **416**, strict all-target Clippy in both feature configurations,
warning-denied docs, five examples, fuzz-target compilation, formatting and
**30 zero-import WASM groups**. These configurations overlap; no release or
complete workspace qualification is inferred.

Native borrowed circle/cylinder views feed `write_advanced`. The output keeps
explicit vertex/edge/use/wire/face identities, face sense, holes, closed circles,
shared seams and repeated occurrences. Reports retain exact curve intervals and
linear surface chart maps. Independent graph/formula checks cover native and
imported models, partial/reversed arcs, supplied pcurves, oblique/radical frames,
split/reflection, units, 1e-12 separation, archive replay and Boolean/empty
continuation. OCCT independently reads seven exported examples with expected
topology and floating-point volume/area; that is interoperability, not exactness.

`StepBody` replaces `FacetedBody` without an alias. Faceted output remains a
distinct encoding. Native pcurves/history and unused geometry require the native
archive; other carriers, voids and unavailable decimal encodings fail typed.
Output limits and solver scopes do not bound all scalar work, memory or cancellation.

## Preserved and new costs

Both complete campaigns remain: [first](benchmark-v1/commands.json) and
[final](benchmark-v2/commands.json), **54 processes each**, covering **115 cases**.
Required output receipts and fixture facts agree throughout. The first shared
header design increased faceted allocations; [its source](header-v1.rs.txt) and
adverse costs remain. Selecting one static prefix restores all measured prior
allocation requests and requested-byte totals. Final case-median timing ratios
are descriptive shared-host observations, not a general speedup or statistical
release-performance admission.

| Corpus | Cases | Median ratio | Maximum ratio |
| --- | ---: | ---: | ---: |
| advanced | 6 | 0.980832 | 0.987752 |
| faceted | 7 | 0.991259 | 1.014882 |
| kernel | 64 | 1.003644 | 1.038793 |
| arc | 12 | 1.004613 | 1.079718 |
| closed_edges | 5 | 0.986673 | 0.990418 |
| circles | 6 | 0.976929 | 0.985315 |
| export | 6 | 1.001917 | 1.010845 |
| pcurves | 6 | 0.989758 | 1.000577 |
| edge_images | 3 | 0.987749 | 0.990003 |

Three [final new-domain trials](new-export-costs-v2/summary.json) retain eight
separate costs. Six export-only workloads check/materialize every output against
an untimed independent graph/reimport preflight. `edit_roundtrip` includes the
three-frame edit/export/graph/replay matrix. Rejection is a distinct outcome.
All new-workflow receipts match the [first version](new-export-costs/summary.json).

| Workflow | Outcome | Median µs | Allocation requests | Requested bytes |
| --- | --- | ---: | ---: | ---: |
| analytic_export/native_cylinder | certified | 124.763 | 1438.000 | 41453.000 |
| analytic_export/32_bodies | certified | 3743.160 | 44508.000 | 1328187.000 |
| analytic_export/closed_imported | certified | 58.463 | 641.000 | 17996.000 |
| analytic_export/partial_imported | certified | 95.988 | 994.000 | 33636.000 |
| analytic_export/radical_imported | certified | 148.599 | 1495.000 | 51508.000 |
| analytic_export/planar_hole | certified | 236.126 | 2451.000 | 85112.000 |
| analytic_export/edit_roundtrip | certified | 75098.496 | 499615.050 | 32328348.800 |
| analytic_export/reject_third | unsupported representation | 10.825 | 107.000 | 4745.000 |

## Preserved failures and open gates

Missing API/compiler findings, the corrected test expressions and duplicate
module finding remain in the [attempt ledger](attempts.json). The
[temporary-disk linker failure](environment-notes.md) and
[incorrect independent area expectation](oracle-correction.md) retain their
original logs and inputs. No geometry, fixture or tolerance was weakened.

The [native scaling frontier](scaling-frontier.md) preserves the complete failed
uniform-scale/export workflow. Unit tests construct exact physical dimensions
directly; that does not establish scaling closure. Pcurves/history are not an
archive in this encoding. General seams, other analytic/spline/void/assembly
exchange, complete provenance/resource bounds, runtime fuzz/ASan/lexicase,
coverage, formal proof and published-package/binding/MSRV gates remain open.
All **28 work packages remain open**. No push was performed.
