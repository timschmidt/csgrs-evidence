# Exact spline STEP exchange admission

Target revision: `23618f7ff9cafe8d5befae2bd95e7099db8530f5`; upstream
`7ed43501755fd64a01f54c3078d12229cbc0129d`. `baseline.json` and
`baseline-step.log` reproduce the full retained-profile workflow's first
rejection, `UnsupportedCurve(RationalBezier)`, with frozen source and binary
identity. No later exchange handoff is claimed executed by that observation.

Owners: HyperBRep owns immutable native spline inspection, plane projection,
extrusion parameter location and complete edge/surface image admission.
HyperBRep IO owns STEP entities, exact numeric encoding, units, source maps,
format limits and publication only after native model validation. Hypercurve
continues to own parameter-space curves, paths, winding and area. No IO fitting,
scalar identity code, tolerance, sampled chord or secondary geometry kernel.
Properties P1, P8–P20, P25–P27, P30, P35–P39 and docs/admission.md apply.

Domain: rational Bezier and finite, nonperiodic, positive-weight clamped NURBS;
line/circle paths remain admitted. Exact finite-decimal STEP data only on
writing; unsupported scalar encodings fail typed. Spline vertices must locate
uniquely at representable source parameters; ambiguous preimages are not
resolved by taking the first root. Planar caps and planar spline generators
transverse to an extrusion direction are the initial complete solid domain.
Nonunit vectors and nonunit spline domains retain their actual charts.
Whole-image validation, including trims and direction, is mandatory. Unknown
closure/self-intersection hints cannot certify geometry. Unsupported carriers
and charts, invalid records, unresolved predicates and resource exhaustion
remain distinct outcomes. No general AP214 or spline-solid coverage claim.

Missing acceptance: original mixed parabola/retained chord through exact
export, independent parse/import, validation, cold archive replay, volume and
point classification, slab intersection/difference/restoration and empty
composition. Retain its holes, disconnected components, reversed and affine
variants. Add independent authored STEP records and negative controls for
weights, knots/multiplicities, degree, logical flags, off-curve vertices,
ambiguous trims, sense, units, nonunit charts and supplied representations.
Preserve the existing complete success/frontier corpus and deterministic
old-family exchange bytes. Check small explicit import/write limits and
recovery, including bounds before expanded knot-vector allocation. Limits
are not claims of bounded scalar arithmetic or total native kernel memory.

Validation must exercise public consumers on native and actual WASM, focused
native geometry and IO tests, affected downstream checks, Clippy and docs.
Measure complete exchange costs and preserve prior full comparison receipts;
old rejection timings are not a speedup baseline for successful work. Guard
sources during checks and do not overlap task builds/tests with measurements.
All attempts and adverse measurements remain in evidence. Full pre-push
workflow validation is required before any push; this increment plans none.
General selected-root integration, authoring-history exchange, other spline
surfaces, arbitrary pcurves, nonlinear offsets and the remaining roadmap
packages stay open.

## Reproduced continuation handoff

`spline-build-3.log` localizes the next failure to the original disconnected
profile with a hole, after import, native validation, replay, volume and point
classification succeed. Difference reports incompatible slabs on a disjoint
component pair. `sets::solid_bounds` asks `certified_face_bounds` for each
selected solid in a multi-solid model; that enclosure excluded Extrusion.
Extend this existing native bound proof to finite trimmed extrusions: each
Cartesian coordinate is affine in V, and every vertical line through the
finite trim reaches its boundary. Boundary curve enclosures therefore bound
the complete face. Reuse the existing strictly-less AABB separation test;
touching bounds do not prove disjointness. P8/P17–P20/P25/P39; the full
multi-component STEP continuation remains the failing acceptance test.

## Endpoint knot multiplicity review

Before retaining the exchange path, reproduce the native clamped-knot validator's
endpoint boundary cases: degree 1/2 vectors with one extra equal endpoint knot,
for both curves and both surface axes. The existing loop checks interior runs
but appears to miss runs extending across a clamped endpoint. HyperBRep owns
this native constructor/archive invariant; the reader must not publish and the
writer must not encode an invalid spline as admitted geometry. P6/P16/P25/P35.
A missing negative native/STEP test will first establish the behavior on the
current frozen candidate. Any repair must preserve all valid knots, source
charts, full fixtures and native/IO continuations. This is a potential finding
until reproduced, not a correctness claim from inspection alone.
