# G1 prerequisites: one retained quintic parameter

This probe establishes reusable planar capabilities and the current BREP
materialization boundary. **It does not complete G1 or WP02.** No production
geometry code changes in this increment.

The fixture selects the unique root of `32t^5 - 2t - 1` in `(0, 1)` and
evaluates a line from `(0, 0)` to `(2, 0)` at that parameter. Neither the
parameter nor the selected point exposes stored `Real` coordinates. Exact
point predicates certify a shared split contact, reversed traversal,
translation, 64 translation/inverse pairs and another split. Separate
zero-root and two-root intervals are rejected by the singleton constructor.

The same quintic is used as a spatial rational Bézier x coordinate, with
unit weights and Bernstein controls `[-5, -7, -9, -11, -13, 145] / 5`.
`Curve3::parameters_of(origin)` returns `UnrepresentableParameter` because its
selected parameter is not currently materialized. This is a recorded
capability limit, not a proof that no exact scalar representation could ever
be implemented.

[src/main.rs](src/main.rs) contains the complete assertions.
[commands.json](commands.json) records the final locked build, strict Clippy
and three CPU 0 smoke executions. All three JSON receipts agree. Each reports
seven instrumented refinements and zero instrumented promotions; those
counters do not cover every arithmetic or geometry operation. The resource
JSON files record process time and peak RSS through the previously controlled
[measurement helper](../2026-10-14-model-ownership/measure.c). These are smoke
measurements, not a matched benchmark or a memory-growth qualification.

The standalone package uses local crates at the recorded repository revision.
Its dependency identities are a subset of the workspace lockfile. An initial
unlocked standalone resolution selected newer cached dependency versions and
was stopped before execution; it is excluded from the evidence. The retained
lockfile was seeded from the workspace lockfile and verified after resolution.
To replay, copy this directory outside the workspace, adjust the local
dependency paths and measurement-helper paths, then run the commands with
`--offline --locked`. Retained `Cargo.toml` paths describe the measured host.

## Source findings and implementation consequences

- Hypercurve's `BezierAlgebraicParameter2::try_isolate` counts roots through
  the Sturm machinery before constructing its opaque singleton. Its public
  parameter and point interfaces preserve exact values without scalar views.
  Source-chart restrictions support selected splitting, reversal and
  similarity transforms. Private affine/projective parameter maps already
  compose charts over the original root, which should be reused rather than
  duplicated in BREP.
- Hypersolve's public `AlgebraicRootRepresentation` is an inspectable report.
  `validate_algebraic_root_representation` validates the local payload and a
  stored point witness when present; its documented contract relies on an
  upstream isolation report for uniqueness. Neither a serialized `Valid`
  flag nor a serialized distinct-root count can admit a BREP selected value.
  Archive loading must certify the singleton and rebuild shared identities.
- The interval conventions differ: Hypercurve's non-scalar singleton
  constructor excludes endpoint roots, while the relevant Hypersolve
  comparison contract treats positive-width intervals as `(lower, upper]`.
  Conversion and replay must preserve endpoint ownership explicitly.
- BREP currently requires `Real` in edge domains, split parameters and
  parameter correspondence; vertices store `Point3`. Pcurve evaluation
  extracts materialized coordinates, and archives contain coordinate arrays
  and native pcurve controls. All these boundaries must migrate together for
  a useful spatial retained-contact slice.
- Keep generic polynomial/selected-field arithmetic in Hypersolve, curve
  chart and pcurve evidence in Hypercurve, and spatial point/support relations,
  topology and model replay in BREP. A spatial selected point must retain its
  defining immutable geometry and parameter without holding its owning
  `Model`, avoiding model/geometry ownership cycles.

The representation has an established precedent: CGAL's algebraic kernel
retains a defining polynomial and isolating interval and supports comparison
without requiring a floating approximation. This supports the representation
choice; it does not establish our implementation's completeness for arbitrary
Hyperreal coefficient expressions. See the primary
[CGAL algebraic-kernel manual](https://doc.cgal.org/latest/Algebraic_kernel_d/index.html).

## Remaining gate

Implement an opaque retained parameter and spatial geometric point, preserve
the original support when restricting an edge, carry the selected parameter
through both incident pcurves, and validate the whole resulting BREP. Then
persist and reload the shared definition/selection graph, reject forged and
oversized evidence, classify the reloaded model and split it again. Include
independent-field comparisons, multiplicity and endpoint cases and measure
coefficient, allocation and retained-node growth. This probe neither creates
that BREP nor serializes a retained contact; it must not be reported as the
gate's completion.
