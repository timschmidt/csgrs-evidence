# Selected revolution contract

The baseline is `8c88793eb38c5d95661062ce716339b5b7652dc9`. The contract was
recorded before production edits in `contract-before-edit.json`. Production
changes belong to HyperBRep geometry, construction, topology validation and
persistence. Hypercurve and Hypersolve retain planar contacts, selected roots,
correlated point fields and parameter authority. No lower-layer implementation
is copied into the BRep carrier.

## API and domain

`Curve3::rotation(origin, axis_origin, axis, angle_start, angle_end)` retains a
`GeometricPoint3` and an authored unit axis. The finite, increasing angular
interval spans at most one turn. The origin must be certified off the axis;
zero radius, invalid axes and unavailable proofs retain typed outcomes.
`Curve3Kind::Rotation` identifies this family even for an authored origin.
`rotation_geometry()` borrows its origin, axis and exact angular chart.

The image uses Rodrigues rotation with chart `theta = s*t+b`, where `s` is
exactly +1 or -1. Authored angular evaluation retains the origin's source;
reversal, restriction, subdivision, certified similarities, reflection, bounds,
closed full-period edges and native replay consume the carrier. An independent
selected angular parameter is `UnsupportedSelectedEvaluation`. Derivatives at
positive integer orders require stored origin coordinates; retained origins
without them return `UnrepresentablePoint`. General affine transport and inverse
parameter/intersection queries remain explicit frontiers.

`builder::revolution_patch` now accepts supported selected meridian endpoints.
Its input axis is authored and unit length; its scalar angular interval is
strictly increasing and shorter than one turn. Complete profile-axis clearance
is required over the whole retained interval. The result is one validated face
in an open shell, with two retained latitude orbits, two native rotated meridians
and exact coordinate pcurve correspondence. It is not a solid or a certificate
of global embedding. Full-turn surfaces still require periodic subdivision.

## Admission and composition

Ordinary face admission checks complete boundary images and selected endpoint
correspondence. Coordinate revolution faces also repeat complete axis clearance,
including when loaded from an archive or built without the convenience helper.
One retained regression bypasses that helper and detects an interior crossing.
Crossings and tangencies are not admitted merely because endpoints are off-axis.

Tests feed the result into reversal, reflected similarity, a selected meridian
split, a latitude split, repeated cold replay and public certainty inspection.
A standalone full-period orbit is split and reflected after cold replay.
Independent coordinate, derivative and gap oracles complement shared-kernel
consistency checks. No new approximate terminal or tolerance is introduced.
STRICT -> APPROXIMATE_512 -> STRICT remains certified for these exact fixtures;
this does not claim certification of arbitrary approximate source construction.

## Persistence, resources and delivery

Schema 10 gains the additive `Rotation` curve record and an explicit
`Coordinates` or `CurveImage` origin. The latter retains the source curve and
parameter graph. The decoder reconstructs through normal carrier and topology
admission; no radius, image or clearance certificate is trusted from JSON.
Record accounting charges the curve, origin and nested source definitions
before scalar decoding. Forged images, directions, axes and coordinate maps
fail typed. Existing archived records retain their recipes; no compatibility
reader or approximation adapter is introduced.

`ArchiveLimits` and `OperationContext` remain separate mechanisms. A two-record
standalone orbit succeeds at two records and fails at one before even malformed
scalar decoding. Zero shared work budget fails and later admission recovers.
Neither syntax/record limits nor these tests bound total scalar work, coefficient
growth, retained heap or cancellation latency. Those are open obligations.
No new cache is added; immutable curve bounds reuse the existing cache contract.

The source-path native and zero-import WASM consumers exercise real production
entry points. They do not establish installed package availability, MSRV,
production binding delivery, STEP support for this new family, formal coverage,
or runtime fuzz/ASan/lexicase qualification. All work packages remain incomplete.
