# Supplied analytic STEP pcurves

The preceding goal turn made progress in commit `a9ee2a286`: repaired native
whole-circle image proofs and a model-scoped read-only validator. The worktree
was clean at this increment's outset. An upstream fetch still resolves to `362e157c1`; surrounding
crates remain concurrent upstream work.

Owner: `hyperbrep-io::step::advanced` for decoding, basis-aware unit conversion,
source parameters and representation selection; native HyperBRep owns image
proof and topology. Properties P1-P3, P6, P8-P9, P15-P20, P25-P27 and P35-P39
apply. The missing acceptance is selected spatial LINE/CIRCLE edges carrying
supplied planar/cylindrical PCURVE representations. The current mapper accepts
only supplied planar lines. Reproduce the missing cases before implementation.

Each alternate must agree in image and sense, regardless of master selection.
Preserve source identity and directed parameter maps; exact native geometry is
published only after full face/shell/model validation. Use the native complete
image check for the new circular and cylindrical tuples. Retain the existing
exact infinite-line certificate as the planar-line fast path, including its
source parameter and deterministic artifact contract. This is an internal
geometric specialization, not a compatibility adapter.

The new domain includes planar CIRCLE pcurves with AXIS2_PLACEMENT_2D, cylindrical
LINE pcurves for constant-height circles and axial lines, and all three master
selectors. Native construction keys retain candidate pcurves checked before
face construction. Independent authored geometry, alternate sense/radius/phase,
master selection, mixed units, reversed edges/bounds, partial/full circles,
repeated composition, exact source-map evaluation and typed failures are the
acceptance controls. Additional native geometry may remain in the immutable
model for the new supplied encodings; no saved-format compatibility is promised.

SEAM_CURVE must have two pcurves on the same surface at opposite parameter
bounds. Finite decimal angular endpoints cannot silently stand for symbolic
`tau`, including when a unit is named degree. Distinguish rejection of an
inexact seam from proof of a valid imported seam. Other analytic/spline and
trimmed pcurve representations retain explicit unsupported outcomes.

These format requirements follow [ISO 10303-42 geometry, sections 4.2.3 and
4.5.47-4.5.51](https://www.steptools.com/stds/smrl/data/resource_docs/geometric_and_topological_representation/sys/4_schema.htm).
The mapper derives source maps; the native validator supplies the complete
geometric proof. Independent fixture evaluations supplement that proof.

All prior exact successes, policies and full-resolution fixtures remain. Freeze
the existing benchmark executables before source edits; retain failed attempts
and adverse timings. Run affected native debug/release/minimal, strict lint/docs,
actual WASM, source composition/replay and preserved BREP/STEP benchmarks after
the final implementation. New workflows get separate absolute cost evidence.
External timeouts contain checks; scalar precision and collection limits are
not complete work/heap/cancellation bounds. Runtime fuzz, coverage, formal and
release/binding gates remain open. No whole work package closes and no push is
requested.

## Reproduced dependency exception

The new partial-arc source-map test cannot certify coordinates at one quarter
of a half circle: its angle is `atan(4/3) + pi/4`. The independent expected
coordinates are `(-1,7)/(5*sqrt(2))`. Whole-image import succeeds, but generic
strict point equality remains unresolved. Normalizing the importer’s angular
span with the existing exact scalar reducer did not resolve the comparison;
both rejected candidates and their failures are retained. Their changes to
direct-circle parameter expressions were removed.

The lowest sufficient owner is Hyperreal’s retained inverse-trigonometric
certificate. New scalar acceptance tests reproduce both the direct angle and
the original reconstructed interval on the current dependency. Upstream was
checked again and remains `362e157c1`. A narrowly scoped extension to odd
multiples of `pi/4`, retaining the bounded recognizer, exact orientation and
all existing quarter-turn proofs, is necessary to make these BREP source maps
consumable without approximate evaluation or duplicated importer identities.
This is the user-authorized exception for a demonstrated BREP blocker, not a
resumption of the unrelated parked scalar investigation. Relevant properties
are P2-P6, P8-P11 and P18-P20; affected scalar/predicate/curve/solver consumers
need requalification and preserved scalar cost probes alongside the BREP work.
