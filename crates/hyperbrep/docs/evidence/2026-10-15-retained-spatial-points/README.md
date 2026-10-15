# Retained spatial point qualification — 2026-10-15

Baseline: `7bc780d89` on `brep`. This increment adds exact selected point
evaluation and composition; **WP02 and G1 remain incomplete**. The
[manifest](manifest.json) binds sources, tools, commands, executables and
artifact hashes. No whole-plan completion or optimization is claimed.

## Implemented contract

`Curve3::point_at(&Parameter)` now returns `GeometricPoint3`. Authored scalar
parameters store exact coordinates. Selected line, rational Bézier and finite
NURBS images retain an immutable source curve and one parameter. Comparison
and bounds reuse Hypercurve's planar selected-image authority; both projections
use that same selector. Mathematical comparison is fallible, and two different
parameters may name one spatial point.

XY/XZ preparations are independent, shared and success-cached. A coordinate
comparison failure is retryable. Source geometry owns no point/model back
reference. Affine transforms certify invertibility, transform source controls
and keep the selector, without accumulating a transform-wrapper chain. Scalar
coefficient algorithms use the unchanged private native evaluator; no public
compatibility API is retained. Selected angular conic evaluation has its own
typed unsupported result.

The [migration audit](migration-audit.json) checks 13 internal files for
call-name/format-only changes and verifies the native evaluator body against
the baseline. It also verifies the six kernel benchmark call-site migrations:
two setup helpers access stored coordinates and four timed callers use an
authored `Parameter` prepared outside timing. The benchmark is not
byte-identical, but its fixtures, iterations, assertions and checksums are
unchanged. The complete [harness patch](kernel-harness.patch) is retained.

## Correctness and boundaries

The [final native log](final-tests.log) records 240 core tests, 35 integration
tests and four doctests. The [default log](final-default-tests.log) records
233 core, 34 integration and four doctests. Counts overlap across configurations.
All 12 new public point tests also pass in
[release mode](final-release-regressions.log). They cover:

- the selected quintic root without a stored scalar, authored views and exact
  three-coordinate order;
- independently constructed images and a `1e-1000` separation only in Z;
- distinct selected parameters reaching one point, positive nonuniform weights
  and NURBS parameters in an authored `[2,5]` knot chart;
- conservative bounds including a constant planar projection;
- 64 shear/reflection/nonuniform-scale transform/inverse pairs;
- domain errors, unsupported selected angular parameters and singular transforms;
- zero instrumented solver work for shared identity, strict authority under
  ambient provisional evaluation, and eight concurrent query readers;
- a genuinely unresolved coordinate comparison followed by successful retry
  after stronger exact scalar evidence, including cloned-point reuse.

An internal test verifies that projection preparation is lazy and a prepared
selected point keeps its source alive only until its final owner is dropped.
This is a lifetime check, not a global retained-memory bound.

Four [negative controls](controls.json) fail their focused assertions: requiring
materialization, omitting Z from coincidence, discarding the transform selector,
and substituting Y for the upper Z bound. [The runner](controls.py) restores
the source after every mutation and checks assertion failures, not merely a
nonzero compiler exit.

All-target/all-feature [Clippy](final-clippy.log), warning-denied
[rustdoc](docs.log), [WASM library compilation](wasm.log),
[fuzz-bin Clippy](fuzz-clippy.log), workspace/fuzz formatting and four release
benchmark builds pass. [Commands](commands.json) record every exit code.
Both full test configurations, release regressions, Clippy and formatting were
repeated after the last selected-point ambient-policy assertion; product and
benchmark source stayed unchanged.

A preliminary zero-budget coincidence probe succeeded with zero instrumented
work. It is **not** credited as a resource-denial regression. The actual cold
failure/stronger-evidence retry case is retained instead. The first Clippy pass
requested a let-chain simplification, which was fixed. An initial migration
audit selected `Pcurve::point_at`; the corrected full `Point3` return signature
checks `Curve3` and passes.

## Measured cost

All 66 kernel receipts agree across three alternating process pairs pinned to
CPU 0. [Comparison data](comparison.json) retains every row and sample. The
median of case median ratios is **1.00352**; the largest is **1.07127**
(`boolean_kernel/disjoint_sphere_union_remap_validate`). All cohorts remain
within the 10% budget. The executable grows **25,232 bytes**; median process
peak RSS is **21,468 → 21,736 KiB**. No statistical or allocation-count claim
follows from these samples.

The new seven-row point harness has 1,000 iterations per row and includes its
exact assertions. Cold-carrier scenarios reuse a prepared root; they do not
time root isolation. The four existing parameter and four migrated work-budget
rows also preserve their receipts in three processes each.
[Feature costs](feature-cost.json) and all raw logs are retained. There is no
previous selected-point implementation for a speedup comparison.

## Remaining gate and replay

Selected vertices and edge domains, complete 3D edge splitting, both pcurve
correspondences, surface/contact point images and selected graph persistence
remain open. Bounds do not promise a requested width. Derivatives/subdivision
still require represented parameters. Work budgets cover only existing
instrumented refinements/promotions; worker propagation and complete
scalar/geometry/memory/time accounting remain open.

No independent external oracle, new fuzz/lexicase/ASan campaign, WASM execution,
full-workspace/pre-push qualification or whole-plan completion is claimed.

[Qualification](qualification.py), [final recheck](recheck.py),
[migration audit](migration-audit.py), [collection](collect.py) and mutation
scripts retain the actual local commands. Their `/tmp` destinations intentionally
reject reuse; use fresh destinations to replay. The baseline executable hash
is checked before measurement. Resource collection uses the same small C
`wait4` launcher as the previous increment, avoiding a Python-parent RSS floor.
