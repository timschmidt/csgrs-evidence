# Retained procedural solid revolutions

`builder::revolve_path` and `builder::revolve_path_region` now construct connected
solids from retained procedural profiles, including Boolean-selected endpoints.
The new `builder::revolve_curve_region` consumes material, holes, disconnected
components and empty regions. Native line/circle carriers keep their existing
construction path and exact measurements.

The original full quadratic parallel cap and its Boolean-clipped cap both failed
with `UnsupportedRevolutionProfile` on base `5d2e9d45aa85126b86b687bca4dd4ea1e2746377`.
They now complete without changing their geometry or materializing selected
coordinates. Source charts, roots, meridians and circular orbits remain exact.
The ordinary builder independently replays the complete one-turn product-shell
proof, including multiplicity-one face coverage and cavity containment.

## Qualification

Nine shared public BRep groups, one internal duplicate/gap rejection and one public IO boundary group extend the corpus. BRep/IO release suites pass 718 all-feature and 710 minimal-feature tests. Both affected all-target strict Clippy configurations, warning-denied rustdoc, fuzz-target compilation and formatting pass. Source-path consumers execute 23 preserved groups on the baseline and 33 on the candidate; actual zero-import WASM executes all 33 candidate groups. This is the affected boundary corpus, not a rerun of the entire prior 253-group WASM inventory. All 654 historical native archives re-encode byte-identically; 159 STEP files import 173 bodies and replay. The 829-file historical inventory has 420 distinct contents; text controls are inventory-only. All 49 fresh baseline/candidate native pairs are byte-identical. 22 new solid archive files (13 distinct contents) repeat deterministically and cold-replay. No scalar encoding or schema migration is introduced.

The independent exact samples, near-coincidence checks and topology arguments
are described in [independent-oracles.md](independent-oracles.md) and
[construction-proof.md](construction-proof.md). This is a mathematical argument
connected to executable checks, not a formal program-verification result.
[contract.md](contract.md) and [outcome-coverage.json](outcome-coverage.json)
separate success, unsupported geometry, invalid input and exhaustion.

Three alternating pairs cover 12 preserved completed workflows and three absolute processes cover two new construction/replay workflows, each with a first call and three repeated fresh-input calls. All 21 processes pass their assertions. The 24 matched phase ratios range 0.819853 to 1.030648; 0 exceed the 10% review marker and 3 increase allocation calls or requested bytes. All adverse samples, RSS and binary/artifact sizes are retained. Instrumented shared-host samples establish neither a general speedup nor internal work/heap bounds. The complete new selected-cap recipe takes 9.150s on its first call and 8.868s per repeated call, with 9.456/9.460 GB of cumulative requested allocation respectively. Peak process RSS across all trials is 23.57 MiB. Requested allocation is traffic, not simultaneous live memory. This expensive recipe and the 1158.4s repeated archive comparison remain explicit resource follow-ups; no cause or optimization is established.

[consumer-costs.json](consumer-costs.json) retains every trial;
[costs.md](costs.md), [cost-summary.json](cost-summary.json), and the
[resource review](adverse-cost-review.md) describe scope and unfavorable observations. First calls and repeated reconstructed inputs are
separate; immutable global caches can already be warm from earlier cases.

## Scope and continuation

Only complete-turn shells from simple, strictly positive-radius profiles with replayable scalar charts and a common similarity-projectable meridian plane are added. Exact procedural metrics can remain unavailable. General curved solid Booleans, partial/axis-touching revolutions, independent selected angular/axial fields, arbitrary affine transport, procedural STEP, whole-operation work/heap/coefficient/cancellation bounds, runtime fuzz/ASan/lexicase, formal coverage, MSRV, installed distributions and production binding gates remain open. All 28 work packages remain open/in-progress. Full pre-push qualification remains required; the consumed eaa0 one-time exception does not authorize publishing this increment.

See [next-domains.md](next-domains.md) and the
[support matrix](../../SUPPORT_MATRIX.md). Optional measurement failure does not
invalidate the admitted procedural shell. The existing STEP surface blocker is
explicitly tested and does not alter native geometry.

## Reproduction

Recreate the base revision, decompress and apply
[qualified-source.patch.gz](qualified-source.patch.gz), and verify the hashes in
[candidate-source.json](candidate-source.json). The final additions after this
source freeze are documentation and evidence only. The external consumer and
archive projects retain exact source-root paths and locks; remap the baseline
and candidate roots when replaying on another machine, replacing the longest
source root first. These local paths do not
establish installed-package delivery.

[validation.json](validation.json) records commands, feature sets, exits, source
patches, elapsed times and log hashes, including failed development attempts.
[attempt-review.md](attempt-review.md) explains those attempts.
[raw-data.tar.gz](raw-data.tar.gz) preserves raw logs, scripts, locks, fixtures,
old/new archives and samples; [raw-data-index.json](raw-data-index.json) verifies
every member. Frozen binaries/build caches are excluded; hashes and sizes remain.
The final [manifest.json](manifest.json) identifies all evidence files.
