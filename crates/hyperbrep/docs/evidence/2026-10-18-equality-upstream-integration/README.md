# Upstream equality integration on brep

This integration joins BRep commit `fbcc75e770c817ac896a6895e59235a98de4b1e2`
with upstream `540074a8c05ccc676d7c70b8f0093f98804b81d9` (18 incoming commits).
[Parents](merge-parents.json), [conflict resolution](merge-resolution.json) and the
[contract](contract.md) retain the exact scope. Both performance histories remain;
the root ledger preserves every upstream non-BRep byte. No BRep or IO production
Rust changed during integration.

Merged 18 upstream commits through 540074a8c, preserving both performance histories and all non-BRep ledger bytes. Hyperreal shares sufficient exact rational equality facts; Point2 consumes them and keeps its original symbolic/difference fallback. Native BRep and IO production source remains byte-identical to fbcc75e77. The merged source passes seven scalar equality tests, one new scalar doctest, three public point contracts, fourteen internal point tests, ten new debug groups, 625 all-feature and 617 minimal BRep/IO release tests, 96+4+62 affected curve tests, warning-denied all-target Clippy/rustdoc, nine examples, fuzz-target compilation and formatting. Source-path native consumers preserve the 7, 9 and 14 acceptance groups plus eight full original workflows; zero-import WASM preserves 7+9+14+138 groups. All earlier continuation controls remain. All 289 preceding artifacts remain byte-identical; the 78 recent artifacts also agree across two fresh processes. Original 24 prism and 81 continuation outcomes and seven retained-profile recipes remain unchanged; the latter retain two completions and five unsupported outcomes. The previous eight quintic OCCT observations are reused only for identical file bytes; the original twenty prism reader cases are rerun.

## Guidance retained for future development

Hyperreal owns sufficient exact equality facts. `Some(true)` and `Some(false)`
certify their rational claims; `None` is inconclusive. Hypercurve keeps the
original difference/zero-proof fallback for pairs without a sufficient fact.
A false `Point2::eq` result may still reflect a missing symbolic proof; geometry
must consume the appropriate certified predicate to establish inequality.

Cache and comparison tests permit stronger exact proofs after warming while
rejecting contradictions or lost certified facts. Preserve original inputs and
failed evidence, rather than demanding a permanently inconclusive history. A
newly completed workflow still needs independent semantic and continuation
acceptance. Do not restore the rejected full-rational Point2 comparison or the
parked scalar experiments merely because a newer fact API exists.

The [upstream admission](../../../../../docs/evidence/2026-10-18-point-equality-facts/README.md)
retains its direct-scalar adverse observations and package/binding scope. This
branch keeps BRep ownership, supporting-crate boundaries and concurrent-thread
responsibility from the development plan. Future merges should happen at coherent
checkpoints with fixed source during qualification and measurement.

## Harness recovery

The first older-artifact replay stopped at a missing saved component source file.
Its source/manifest/lock copies had been omitted when preparing the harness. The
[recovery record](harness-recovery.json) preserves that failure and restores the
exact preceding bytes. Eight original and four prior axial workflows had already
passed on the same checked source; those results were reused. The remaining
component, original-path and continuation checks then ran, followed by the
complete 211-file comparison. No production code, fixture content, policy or
acceptance assertion changed.

## Evidence

- [All commands and source epochs](attempts.json), [qualification](qualification-summary.json),
  and [native/WASM consumers](consumers.json).
- [289 preserved artifacts](artifact-preservation.json), [repeated recent artifacts](artifacts.json),
  [earlier continuation](continuation-admission.json), and [original profile frontier](original-profiles.json).
- [Complete matched consumer costs](costs.md), [raw samples](consumer-costs.json),
  and [resource review](resource-review.json). The preceding 192-case benchmark
  catalogue is not claimed as rerun for this merge.
- [Source reconstruction](source-reconstruction.json), [manifest](manifest.json),
  and [audit](audit.json). Copied helpers are not credited as executed checks;
  command and trial records name what actually ran.

Three alternating pairs of each complete six-group native, nine-group spline and seven-group measurement consumer preserve every outcome, assertion and iteration count (22 groups; 18 processes). Observed time ratios range 0.773215–1.036326, with median 0.986173; 0 exceed the 10% review marker and 0 increase allocation requests. All slower and adverse rows remain. This is a finite downstream comparison on a shared host, not a rerun of the preceding 192-case catalogue, a general speedup, statistical significance or an internal resource bound.

BRep source-path qualification only. Upstream package/MSRV/binding records retain their own revision and domain; they do not qualify this BRep feature surface. Full distribution, MSRV, production binding, coverage/formal, fuzz/ASan/lexicase, operation-wide resource and pre-push gates remain open. No production BRep redesign, lower-layer regression repair or push. All 28 work packages remain open/in-progress; protected stashes remain untouched.

The [staged whitespace record](staged-whitespace.json) retains seven EOF blank-line
observations from exact raw Cargo logs. The full staged whitespace check exits 2
and is not reported as passing. The separate check of all staged files except
raw `.log` files passes; no source, test, fixture or documentation whitespace
finding remains. Raw command output is preserved without editing.
