# Whole-curve image validation before supplied STEP pcurves

The previous goal turn made progress: merge `3e8b07825` integrates upstream
`362e157c1`, qualifies BREP consumers and records concurrent ownership. This
increment stays inside BREP and its IO acceptance boundary.

## Contract and reproduced frontier

Owner: HyperBRep topology image validation and its model-scoped builder API.
Properties: P1–P3, P6, P8–P9, P16–P20, P25–P27, P35–P39. The input is a staged
exact spatial edge, a directed pcurve, an explicit correspondence and a native
support surface. A successful check must prove agreement over the whole trim
interval under strict predicates. A point or tangent sample alone is not that
proof. Invalid correspondence, unsupported geometry, unresolved predicates and
numeric errors remain typed. No topology, cache or inherited proof flag may be
published by this read-only check.

Before adding curved supplied STEP representations, inspection found that the
cylinder, sphere and cone circle checks use a center and tangent at one
parameter while generic endpoint agreement is skipped. This does not alone
determine the radial direction or circle plane. New deterministic controls will
test reversed radial frames and tilted circle planes against the current
implementation before repair. Existing full BREP and IO composition fixtures
remain unchanged.

STEP consumes the native proof; its mapper must not implement a second image
kernel. A model-scoped builder query will make the same native check available
before a candidate pcurve is assigned to a face. Key ownership and unsupported
combinations must remain explicit. This is a prerequisite for the planned
supplied-pcurve import, not a claim that that import already exists.

## Research and feasibility

STEP surface curves require the spatial curve and supplied pcurves to agree in
point set and sense; the selected master determines parameterization. A pcurve
uses its basis surface's parameter coordinates. A seam has two pcurves on the
same surface at opposite parameter bounds. Thus decimal approximations to a
cylinder's full angular period cannot be silently treated as exact `tau` under
the existing exact unit contract. Supplied representations must be checked,
with disagreement retained as a typed failure. These requirements were checked
against [ISO 10303-42 geometry schema, sections 4.5.47–4.5.51](https://www.steptools.com/stds/smrl/data/resource_docs/geometric_and_topological_representation/sys/4_schema.htm).

The planned native certificate compares enough exact circle data to establish
the complete affine angular correspondence, including radial phase, plane,
orientation and rate. The failure fixture and source inspection, rather than
the format specification, establish the need for the kernel change.

## Evidence and limits

The baseline executables were built before this increment on the same source
as `3e8b07825`. Their hashes, source identity and build configuration are frozen
in `baseline-binaries.json`; original build evidence remains in the preceding
integration directory. Source-bound checks retain every attempt. After repair,
run affected native/minimal/WASM, persistence/composition, lint/docs and complete
preserved BREP benchmark checks. Keep adverse measurements and earlier open
timing gates.

Existing precision/solver allowances do not establish total-work, retained-byte
or elapsed-time bounds. External timeouts contain these tests. No general CAD,
STEP, release/binding, formal-verification or whole-plan gate closes here.
