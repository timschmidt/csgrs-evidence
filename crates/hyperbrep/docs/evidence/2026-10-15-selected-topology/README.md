# Selected topology qualification — 2026-10-15

Baseline: `6f18d5152` on `brep`. This extends WP02; **WP02/G1 remains open**.
The [manifest](manifest.json) binds commands, source hashes, controls and
executable identities. No whole-plan completion is claimed.

## Implemented contract

Vertices retain `GeometricPoint3`; canonical edge trims use `ParameterRange`
with increasing `Parameter` endpoints. Authored carrier coefficients and knot
domains remain `Real`. Edge splitting retains one spatial source, partitions
every incident use and transports each selected cut through its affine pcurve
relation. Selected restrictions keep their source chart; native scalar pieces
use the existing scalar remapping formula. Native coefficient consumers now
request stored views explicitly and fail typed when unavailable.

Exact subdivision inherits the validated source boundary's image, simplicity,
orientation, nesting and solid proofs. Builder publication still checks
connectivity, ownership and actual affine endpoint mappings. Arbitrary
replacements invalidate inherited certificates. Bounds include retained-point
enclosures. Transforms share the transformed arena source when available;
the lookup allocates only when a selected vertex needs it.

Hypercurve's new `Curve2::parameter_endpoints` exposes traversal order without
evaluating points. Its increasing source interval need not have the same order
as traversal. This distinction was required by a failing reflection regression.
Pcurve reflection delegates retained/rational geometry to Hypercurve's exact
similarity and reversal operations. Native line/circle paths stay direct.

## Correctness and limits

[Final all-feature tests](final-tests.log) pass 240 core tests, 45 integration
tests and four doctests. [Default tests](final-default-tests.log) pass 233 core,
44 integration and four doctests; these totals overlap. All ten new topology
tests pass in [release mode](final-release-regressions.log). Cases include:

- a nonmaterializable quintic cut shared by two incident uses and one vertex;
- exact endpoint mapping, endpoint image agreement and inverse mapping;
- repeated subdivision, repeated-endpoint rejection and retained source models;
- rational Bézier and NURBS profile sheets with authored non-unit knot charts;
- shear, scale, reflection/inverse and another split after reflection;
- native and selected rational pcurves on a curved planar boundary;
- cuboid/cylinder classification and volume from retained solid certificates;
- builder endpoint rejection, invalid affine coefficients and proof invalidation;
- no-op edits, explicit selected archive rejection and unsupported conic angles.

Four [negative controls](controls.json) fail their focused tests: wrong spatial
vertex, forced scalar cut, ignored directed source chart and trusted affine
endpoints. [The runner](controls.py) restores source bytes after each mutation
and requires a runtime test failure, not a compiler failure. The last mutant
restores the old endpoint shortcut and admits a wrong affine map; the retained
implementation validates the actual coefficients.

Strict [Clippy](final-clippy.log), warning-denied [rustdoc](docs.log),
[WASM library compilation](wasm.log), [fuzz-bin Clippy](fuzz-clippy.log), workspace
and fuzz formatting, and all five benchmark builds pass. [Commands](commands.json)
record all 34 successful checks/processes. A [Clippy setup finding](setup-failure.json)
requested removal of a redundant `Ok(...?)`; it was fixed before resuming.
Both test configurations, release regressions, Clippy and formatting were run
again after restoring the controls and adding the final curved-pcurve case.
Production and benchmark source did not change after the final timed runs.

The format-8 archive cannot yet encode selected roots, spatial images and
restricted pcurve graphs. It fails explicitly; it never writes a rounded
substitute. Selected angular conics, arbitrary selected surface/contact
validation, general Boolean transfer and reload/split/classify composition
remain open. No complete resource-accounting, asymptotic-growth, external-oracle,
new fuzz/ASan/lexicase campaign, WASM-execution or full-workspace/pre-push claim
follows from this increment.

## Measured cost and rejected prototype

All 66 kernel receipts agree in three alternating process pairs pinned to CPU 0.
The median of case median ratios is **1.011410**; the largest is **1.058066**,
within the 10% cohort budget. The executable grows **67,040 bytes** and median
peak process RSS changes from **21,472 to 21,808 KiB**.
[Comparison data](comparison.json) retains every row and sample. These are
descriptive measurements, not allocation counts or statistical guarantees.
The [kernel harness patch](kernel-harness.patch) contains direct API caller
migration; fixture labels, iterations, assertions and checksums are preserved.

The [first prototype](prototype/comparison.json) exceeded the budget in three
editing cohorts (largest ratio 1.136303).
Routing stored scalars through root-map preparation and comparing old maps
before recomputing native split coefficients was rejected. The final native
path evaluates the original scalar formulas directly; selected chart transport
still reuses Hypercurve. The prototype's [native replay patch](prototype/native-replay-from-final.patch)
recovers both original library file hashes and preserves all other native
library/kernel sources listed in its [source record](prototype/native-source-sha256.json).
Use it only in an isolated checkout. Prototype feature benchmarks are not
credited; this comparison concerns the existing 66-case kernel harness.

The four new topology rows run 200 iterations with exact assertions. Three-run
median costs, with prepared roots/source models outside timing, are:

| Scenario | Median per iteration |
| --- | ---: |
| Authored shared-edge split and query/mapping checks | 148.213 µs |
| Selected shared-edge split and query/mapping checks | 161.454 µs |
| Selected model followed by sixteen exact splits and checks | 1931.441 µs |
| Selected reflection/inverse pair and checks | 337.269 µs |

All point, parameter and budget control receipts also agree in three processes.
See [feature costs](feature-cost.json). No previous selected topology
implementation supplies a speedup baseline.

## Replay

[Qualification](qualification.py), [resume](resume.py), [final recheck](recheck.py),
[controls](controls.py) and [collection](collect.py) retain the executed commands.
Fresh qualification accepts current source; the resume script records the
actual local recovery after the style-only Clippy finding. Existing `/tmp`
destinations intentionally reject reuse; choose fresh paths for a new run.
The baseline executable hash is checked before measurement. The small `wait4`
resource launcher is retained with the earlier ownership evidence.
