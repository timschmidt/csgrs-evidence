# Partial-depth axial shells and continued modeling

Baseline `4b2f8b6cfe1db33bb0a616f1b80d4e1f862bed0a` on `brep`, incorporating
upstream `be2a0c37b`. The four original blocked partial-depth cases now complete
native shell admission and remain usable through cold replay, exact STEP and
continued modeling. The original full-size inputs and thin `1e-12` layers remain.

The [prospective contract](contract.md) and [proof review](review.md) describe
whole-band native wall structure, per-loop winding, exact cap transitions,
shared contact ownership and connected vertex links. The immutable region/height
witness owns volume and point classification. Geometry retains complete cylinder
chart maps; Boolean ownership consumes the original UV witness and exact trim
membership. Distant periodic seams retain their authored charts. Hypercurve
remains the sole filled-region authority; supporting runtime code is unchanged.

Native line/circle extrusion walls now use plane/cylinder carriers, with explicit
chart and orientation maps. Exact promotion before affine transport preserves
the original prism shear domain. `CoincidentOwnershipAmbiguous` replaces the
former planar-only error name. These are authorized greenfield representation
and API changes, with no compatibility adapter. [Migration review](migration-review.md)
accounts for every changed preceding artifact and cost receipt. Exact semantic
checks remain separate from deterministic serialization.

## Executed evidence

[Qualification](qualification-summary.json) binds 600 all-feature and 592
minimal-feature native/IO release tests, 33 focused debug tests, both all-target
warning-denied Clippy configurations, external consumer lint, warning-denied
documentation, nine STEP examples, fuzz-target compilation and formatting.
The actual warning-denied WASM build runs 138 groups with zero imports,
preserving all 127 preceding groups. Counts overlap across configurations.

Eight source-path external workflows cover upper/lower thin layers, an interior
notch and the reversed covering-box difference, each under rational rotation
and reflection. Independently derived volume/area, opposite paired edge incidence,
exact event-side/near-meridian points, deterministic cold replay, repeated
subtraction, plug reconstruction, transverse cuts, complete removal and recovery
must all pass. STEP import repeats the continuation and cross-model Booleans.
Scale and two single-face cylinder seams at +/-100 turns add native controls.
Optional OCCT reads are floating-point interoperability observations; exact thin
layers are not replaced by that reader's topology tolerance. All eight new
rotated/reflected outputs are valid in this reader. One original unrotated lower
thin-layer export reports invalid wires/faces: its three exact STEP vertices at
height `1e-9` mm are absent from the imported shape, whose reported vertex
tolerance is `1e-7` mm. Measures still agree. The [reader comparison](occt-thin-comparison.json)
retains this limitation; no exact geometry is healed or weakened to match it.

All 24 original prism inputs now return native results; one existing diagonal
result still rejects an unencodable STEP vertex. All 81 preceding native
outcomes remain in the [diagnostic inventory](continuation-frontier.json).
These diagnostic counts alone do not prove semantic admission. Original complete
axial, region/component and general-path consumers retain their expectations,
including the two existing unsupported round-cap measurements. Of the preceding final consumer
artifacts, 171 remain byte-identical and 16 deliberately
migrate; both revisions and their hashes remain in [the inventory](artifact-comparison.json).
The eight new workflows materialize sixteen [native/STEP outputs](new-artifacts.json).
The separate benchmark [STEP capture](step-receipt-capture.json) reproduces both
changed exchange receipts. Its two identity exports are unchanged; its two
reflected exports change only six cylinder-axis signs and one exactly coplanar
plane origin. Every other byte, including spatial trims and topology, is
unchanged. The [exact entity review](step-receipt-equivalence.json) checks these
carrier equivalences, and all eight old/new files pass the independent reader.

[All attempts](attempts.json) retain initial compile failures, reflected/coincident
continuation failures, the original shear regression, the distant closed-seam
partition failure, representation assertions and the duplicate-module lint.
The supplemental capture's initial missing-fixture project-assembly failure is
also retained, with its original source recipe and project-input hashes.
The original hard fixtures, strict validators and independent expectations were
preserved while fixing these causes. Every recorded source snapshot is
[reconstructible](source-reconstruction.json), including failed candidates.

## Complete-work costs

The [cost campaign](costs.md) runs all 184 preceding cases across 21 full corpora
in three alternating paired fresh processes, plus eight new complete-work rows
in three candidate processes: 129 processes total. All original iterations,
assertions, policies, full 256-arc inputs and output materialization remain.
6 receipt changes belong to the explicit representation migration;
per-revision determinism and independent semantics are checked separately.
All adverse timing, allocation requests, peak process RSS and executable sizes
remain. Successful new workflows have absolute cost, never a speed ratio against
their former error. Shared-host observations do not establish general speedup,
all-cohort performance admission or internal work/heap/cancellation bounds.
Three rows exceed the 10% review marker: butt-region exchanges regress by 13.3%
and 15.3%, and the NURBS-boundary path-extrusion probe rises from 0.690851 to
1.211483 ms (1.753610x). Every candidate sample of that probe is slower than
every baseline sample. Construction/admission/certificate-storage cost needs
separate isolation. The eight new complete workflows take about 2.1-3.1 seconds
and request 0.75-1.13 GB cumulatively; the eight-row process peaks at
23,572-24,036 KiB RSS. These are complete acceptance-workflow costs, not
single-Boolean latency or retained-heap bounds.

## Reproduction and remaining work

[check.py](check.py) holds runtime, dependency and test/input sources fixed around
each externally contained command. Start from the pinned baseline plus the
recorded overlay and verify the snapshot before replaying a command. Historical
source-path projects and optional reader installations require the retained
manifests/locks and their recorded local paths; these are development consumers,
not shipped packages. Frozen baseline executables were verified against the
preceding qualified source before implementation edits.

Drivers are [qualification](final-review/qualify.py),
[complete consumers](final-review/finish_checks.py),
[matched harness builds](final-review/build_benchmarks.py),
[measurement](final-review/benchmark.py) and [audit](final-review/audit.py).
The [manifest](manifest.json) binds sources, recipes, artifacts, ledgers and
costs. [Final audit](audit.json) checks reconstruction, protected stashes,
unchanged supporting runtime and unchanged non-BREP shared-ledger bytes.

This proof covers the declared axial plane/cylinder shell structure. General
curved embedding, separate void-shell arrangements, arbitrary affine analytic
images and broader Boolean/STEP closure remain open. Source-qualification
delivery, internal resources, package/MSRV/bindings, coverage, runtime fuzzing,
formal proofs and the complete pre-push matrix remain separate obligations.
Inherited scalar zero-factor failures remain upstream-owned. All 28 work
packages remain open/in progress; no push or release qualification is claimed.
