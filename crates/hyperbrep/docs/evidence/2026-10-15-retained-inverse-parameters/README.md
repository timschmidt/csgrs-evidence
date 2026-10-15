# Retained spatial inverse parameters

This increment changes `Curve3::parameters_of` to return opaque `Parameter`
values. An exact selected root survives even when `try_real()` is unavailable.
It removes the inverse-query blocker recorded by the
[earlier prerequisite probe](../2026-10-15-retained-parameter-feasibility/README.md).
It does not complete G1: spatial evaluation, selected edge-domain splits,
dual-pcurve agreement and selected graph archive/reload still need work.

## Construction and ownership

`Parameter` retains Hypercurve's admitted `BezierParameter2`; no raw solver
report flags become trusted certificates. Represented values compare through
strict Hyperlimit predicates, and selected roots reuse Hypercurve's fallible
comparison. The new public `BezierParameter2::affine_image` exposes its existing
strict affine transport without duplicating polynomial or selected-field
arithmetic. The original selector and chart relation remain in their current
owner. Parameters contain no model back-reference.

A rational Bézier inverse query first obtains certified candidates from a
varying planar projection. A represented candidate keeps the original 3D
evaluation check. For a selected candidate, the remaining coordinate is either
certified constant or evaluated in a second projection at the **same** selected
root. Exact point coincidence must succeed before the parameter is returned.
The second projected carrier is constructed at most once per query, when needed.
NURBS span roots use the same existing affine transport into authored knot
charts, with mathematical comparison for seam deduplication.

All existing callers are migrated directly. Consumers that still require a
stored scalar return `UnrepresentableParameter`; they do not discard a contact.
The inverse helpers move into `geometry/location.rs` while spatial evaluation,
support geometry and generic solvers retain their existing ownership.

## Correctness evidence

Eight BREP integration tests cover:

- the root of `32t^5 - 2t - 1` in each spatial-axis projection, independent
  repeated queries, cloning and a reversed carrier;
- a nonconstant third coordinate on polynomial and nonuniform positive-weight
  rational curves, including separations of `1` and `1e-1000`;
- two distinct nonmaterialized preimages of one point;
- two NURBS spans over `[2,5]` and `[5,9]`, authored-chart order and a shared seam;
- a partly constant NURBS preimage remaining a typed blocker;
- zero-budget denial followed by a successful retry;
- strict parameter comparison inside an ambient provisional scope;
- an unavailable selected cut reported by face splitting while the source
  model remains unchanged.

Three Hypercurve integration tests cover 64 decreasing affine chart/inverse
pairs, zero and unresolved scales under provisional evaluation, and preservation
of an already learned scalar witness. Existing parameter-module tests run with
the corrected nonempty `bezier_parameter::` filter. Debug and release BREP
regressions pass. Exact commands and test counts are in [commands.json](commands.json)
and [manifest.json](manifest.json).

The three [negative controls](controls.json) each fail a focused assertion:
forcing root materialization, ignoring a failed third-coordinate proof, and
discarding the authored chart offset. Their patches and logs are retained and
the production source is restored before qualification.

The first upstream test filter selected zero tests and receives no validation
credit. An initial offline all-feature Clippy check needed an uncached locked
optional dependency; an approved network retry populated the cache. The final
checks run offline. These setup results remain in [setup](setup/commands.json).

## Cost evidence and reproduction

The unchanged 66-case kernel harness runs three alternating baseline/candidate
pairs on CPU 0. Every receipt retains its label, order, iterations, unit and
checksum. [comparison.json](comparison.json) records all timings, binary sizes
and whole-process RSS. The baseline executable is the prior operation-context
binary, bound to its recorded SHA-256; the intervening `678c8072e` commit changed
only documentation and probe evidence.

The median of case median ratios is `0.97391`; the largest is `1.05369`
(`spline_kernel/nurbs_planar_face_build_exact_area`). Binary size grows by
18,096 bytes and median peak process RSS changes from 21,712 to 21,784 KiB.
The sampled case medians remain within the repository's 10% cohort budget;
the lower overall ratio is not a claimed algorithmic speedup.

The new four-row `retained_parameters` benchmark measures the new query
capabilities with exact assertions inside each iteration. Its baseline cannot
return those parameters, so these are feature costs, not matched speedups.
The existing work-budget harness also passes its four rows after its result
assertion is migrated to the new API. [feature-cost.json](feature-cost.json)
retains all three runs of each harness. The unchanged kernel harness is the
cross-revision comparison.

The [qualification driver](qualification.py) records each command and runs
the receipt checker. It expects the archived baseline binary and the small
`wait4` launcher described by the
[measurement record](../2026-10-14-model-ownership/measurement.json).
Adjust scratch paths and CPU affinity for another host; rebuild the baseline
at its pinned revision when its binary is unavailable. The
[control driver](controls.py) applies one deliberate mutation at a time and
restores the source in a `finally` block. Run it only in an isolated clean
checkout. Both drivers require fresh output directories.

These measurements are descriptive, not statistical significance, allocation
counts or asymptotic-growth evidence. WASM and fuzz targets compile; this
increment does not run WASM, an external geometry oracle, a new fuzz/lexicase or
ASan campaign, or full-workspace/pre-push validation. Every work-package
completion gate remains open.
