# Next shell proof: required before partial-depth admission

The retained native axial lines now pass both operand partition and selection
for the original three thin-layer/interior cuts. `UnsupportedSolidShell` remains
the correct result until the stitched boundary earns an embedding proof.
Keep this as a prerequisite commit; do not replace those full workflows with
the two easier touching/disjoint successes or report general prism closure.

The existing generic shell proof admits straight planar faces only. Its fallback
signed-volume fan uses vertices, so merely allowing a curved shell through that
gate would also give the wrong measure. Generic point classification similarly
expects planar carriers. All three consumers need a coherent extension, and
cold archives must recompute the same proof without trusting operation history.

Two approaches were examined, neither implemented or admitted here:

1. General face-pair embedding using complete retained intersections. Share
   geometry/trim proofs with Boolean partitioning, but preserve isolated contacts
   as well as positive-length intervals. `NoCurveInterior` does not establish
   no contact. Reject face-interior overlap, unshared geometric contacts and
   non-manifold vertex links. Coincident cylinder parameterizations need an
   exact transition proof; carrier coincidence alone does not identify charts.
   This approach also needs curved divergence integration and ray classification.
2. A piecewise prismatic certificate reconstructed from the boundary. In a
   common exact frame, collect all axial event levels; certify the complete
   side-face image in each open band and its oriented planar boundary. Hypercurve
   owns the normalized material regions. At each level, upward caps must exactly
   cover material lost above and downward caps material gained above, without
   overlap or missing areas. Compare all lateral images with multiplicity and
   orientation, check contacts at transition levels against shared topology,
   and reject non-manifold vertex links. Only then may volume integrate exact
   section areas and point classification use the same retained sections.
   Equality of volumes, a sampled cross-section, or a union of overlapping slab
   bodies cannot replace those complete boundary checks.

Prefer the reusable native proof with the smallest coherent supported domain.
Preserve the original radius-5, height-6 cylinder and partial slabs, exact
1e-12 end layers, reverse difference and transformed controls. Add independent
invalid overlap, missing-wall, wrong-orientation, duplicate-image, tangent and
vertex-link controls before enabling a new shell family. Continue through exact
measurement, native replay, STEP where encodable, further cuts, reconstruction,
empty recovery, resource/cost evidence and actual WASM execution. These are
implementation obligations, not results established by this design note.

## Concrete prospective axial certificate

This is a proposed implementation, not an admitted algorithm. Start with plane
and circular-cylinder faces sharing one exact axial direction. Require planes
to be either parallel or perpendicular to that direction and cylinder axes to
be parallel. Preserve arbitrary exact origins, angular phases, reversals and
supported similarity transforms. Do not infer this structure from sampled
points. Return a typed unsupported or unresolved result outside the proven
domain and preserve the existing admission routes.

The suggested native home is `topology/validation/axial_shell.rs`, with an
immutable derived certificate alongside the existing topology certificates.
Use the existing `topology/measure.rs` and `topology/query.rs` dispatch for
consumption. Boolean stitching remains in the shared Boolean pipeline; STEP
continues to serialize the admitted faces. Hypercurve owns the filled section
regions, arrangements, winding and any missing reusable oriented-cover query.
Do not implement another planar arrangement kernel inside BREP.

The initial internal certificate should retain one frame, strictly sorted exact
height events, one normalized `CurveRegion2` per open band, and complete
side/cap coverage witnesses tied to the current face, edge, parameter and chart
identities. Reuse equal immutable regions only with certified equivalence.
Cold archive admission recomputes or independently validates those witnesses;
it must not trust a serialized Boolean history or a positive proof flag.

1. Prove every lateral boundary is axial or at constant height, and every
   lateral face has complete coverage by those boundaries in its authored
   chart. A cylinder's native whole-image proofs and periodic chart machinery
   are prerequisites. Collect every exact boundary event and reject zero-width
   bands, missed events, unsupported selected coordinates and unresolved order
   without substituting an epsilon. Closed circular edges and seam uses need
   explicit event/identity handling even when only one endpoint vertex exists.
2. Establish invariant lateral images over each whole open band before using
   a section representative. Axis-aligned chart boundaries can supply this
   certificate; a midpoint section alone cannot. Project retained line/circle
   images into the common plane without fitting new circles to endpoints.
   Orient the cross-section tangent consistently with `axis × outward_normal`.
3. Construct the normalized section through Hypercurve, then compare its
   complete oriented boundary with all source lateral contributions. Require
   multiplicity one on material and zero outside. A nonzero-winding union by
   itself could hide duplicated walls or reversed material. Retain all contact,
   source-parameter and boundary-role evidence; account for holes and separate
   material components explicitly.
4. At event height `h`, let `L` and `U` be the lower and upper band regions,
   taking the exterior band as empty. Upward cap material must equal the
   regularized difference `L \\ U`; downward material must equal `U \\ L`.
   Prove full oriented coverage and multiplicity, including subdivisions.
   Overlap `L ∩ U` is internal material and must not acquire an exterior cap.
   Validate boundary-only contacts separately from these regularized sets.
5. Check the complete geometric contacts against shared native topology,
   including transition-level isolated contacts and tangencies. Require
   opposite paired edge uses and a single appropriate vertex-link cycle;
   disconnected umbrellas, unshared coincident points and pinched contacts
   cannot be accepted merely because every edge has two incident faces.
   A regular closed set can still have a non-manifold boundary.
6. Only after that proof, compute volume as
   `Σ area(section_i) * (h[i+1] - h[i])` in an orthonormal exact frame.
   Retain the frame/Jacobian explicitly if a broader frame is later supported.
   Point classification uses the same sections inside bands and proven
   one-sided material/cap relationships at events. Extend any unsupported
   cylinder-face area consumer coherently; never reuse the planar vertex-fan
   formula for curved exterior walls. Inward void shells require their own
   orientation/containment proof, not a silent extension of the initial domain.

First acceptance keeps the original upper/lower `1e-12` layers, central notch,
reversed covering difference, exact expected volumes, points on both sides of
every event and meridian, rotated/reflected copies and cold STEP/native
continuations. Independent malformed controls must include overlapping and
duplicated walls with distinct topology IDs, missing caps, wrong orientations,
point/edge-only pinches, closed-edge seams and unshared coincident contacts.
Do not discard the original sizes when reducing a failure. Shape equality and
artifact determinism remain separate assertions.

## Feasibility and performance research

Primary references checked on 2026-10-17: CGAL's
[regularized planar operations manual](https://doc.cgal.org/latest/Boolean_set_operations_2/index.html)
supports general curve boundaries and distinguishes boundary contact from
interior intersection. Its arrangement representation and aggregated operations
suggest reusing a prepared region across bands, but it also notes that repeated
operations can be preferable for some intersection/output complexity ratios.
This is a candidate to measure in Hypercurve, not a blanket batching speed claim.

The [Nef manual](https://doc.cgal.org/latest/Nef_3/index.html) explains why
manifold boundary representations are not closed under all Boolean operations.
The [combinatorial manifoldness documentation](https://doc.cgal.org/latest/PMP_Mesh_repair/group__PMP__combinatorial__repair__grp.html)
tracks separate incident face umbrellas around a vertex. These motivate the
transition-contact and vertex-link obligations above; neither reference proves
this proposed curved certificate. No polygonal conversion or CGAL production
dependency is proposed.

The axial construction and its formulas above are engineering/mathematical
inferences for this repository. Prototype and reject forged certificates before
enabling them. Reuse existing retained images and common-axis checks before
refinement. Measure complete repeated cuts and replay, including region
construction, coverage, query and output materialization. Track band/cell counts,
scalar growth, allocation requests and retained state; those counters alone are
not total-work or heap-byte bounds. Introduce missing resource controls in their
owners, preserve typed exhaustion and recovery, and externally contain probes
until their stronger bounds exist. Keep the current 180 preserved benchmark
contracts and the four new complete workflows as the next baseline.

## Existing APIs inspected for that implementation

These are source-level availability findings on the current frozen revision,
not executed prototypes of the proposed certificate:

- `hypercurve/src/bezier_region.rs` already exposes
  `CurveRegion2::try_from_native_boundary_contours(contours, FillRule::NonZero)`
  with signed winding summed across all contours. Use this shared authority
  where appropriate, then separately prove the required source-wall orientation
  and multiplicity. `arrange_unordered_segments` uses parity between assembled
  walks; passing `NonZero` there does not make it an interchangeable global
  winding certificate. `try_from_native_contours` takes already-known material
  and hole roles, so do not supply guessed roles as a proof.
- `filled_side_is_left`, `loop_roles`, `material_components` and
  `native_contours_fast_path` expose admitted region views. The native view is
  optional. Its absence must not trigger fitting circles to promoted rational
  paths. Keep native source curves and the complete region proof, as the public
  normalized-region extrusion increment already does.
- `hypercurve/src/curve_region_boolean.rs` exposes `boolean_regions`, which
  shares preparation across union, intersection, first-minus-second and XOR.
  It does not return reverse difference for free. Compare the existing calls
  before proposing a new shared selector API; any needed implementation belongs
  in Hypercurve. `intersect_region` supplies contacts, positive-length overlaps
  and blockers. `is_complete` must hold before absence is a proof. Its carrier
  indices and parameters refer to prepared operands, not necessarily original
  BREP authoring charts: retain and validate that correspondence explicitly.
  Execute these public operations inside the existing strict BREP operation
  scope; do not assume an implicit principal policy is always strict.
- `topology/validation/periodic_rectangles.rs::rebase` preserves authored charts
  while splitting at a canonical seam. It rejects widths over one turn rather
  than collapsing multiplicity. `rectangular_cover.rs::exactly_covers` proves
  multiplicity one over already ordered exact coordinate indices, using an
  event sweep and interval tree without a Cartesian grid allocation. Reuse
  these native owners for proven rectangular band cells; an arbitrary trim
  cannot acquire rectangular authority merely from its bounding box.
- Existing derived solid certificates and their ownership/invalidation live in
  `topology/mod.rs`, including `CertifiedPrismProfile::CurveRegion`. A proposed
  axial certificate must participate in builder admission, immutable-model
  storage, append/transform remapping and invalidation. Face/edge witnesses
  cannot be copied across changed topology IDs without a proved mapping.
  Recompute after edits until such a transfer is independently justified.
- `certified_z_prism_profile` currently rejects intermediate vertex heights
  before exposing a single region over a slab. Preserve its meaning when
  adding a piecewise family: a top cap is not the profile of every band.
  A uniform-prism shortcut may consume an axial certificate only after proving
  that all nonempty bands have the same complete region over one contiguous
  interval. Mere common-axis membership does not justify that promotion.

Any missing public oriented-cover or chart-correspondence evidence needs a
reproduced BREP consumer and a narrowly owned supporting-crate change. Check
upstream before overlapping that work; do not import private Hypercurve state,
duplicate its arrangement semantics or take over unrelated dependency repairs.

## Independent expectations for the first complete consumers

These formulas specify future tests; the corresponding result shells still
fail admission on this revision. Take the original radius-5, height-6 cylinder,
the tool's positive-x half-plane coverage and `δ = 1/10^12`.

| Original difference | Exact volume | Exact surface area |
| --- | --- | --- |
| Tool ending at `6 - δ` | `75π + 25πδ/2` | `(80 + 5δ)π + 60 - 10δ` |
| Tool starting at `δ` | `75π + 25πδ/2` | `(80 + 5δ)π + 60 - 10δ` |
| Interior tool from `2` to `4` | `125π` | `125π + 20` |
| Box `[0,20] × [-20,20] × [-20,20]` minus cylinder | `32000 - 75π` | `6340 + 55π` |

For overlap length `h`, the intersection is a half cylinder with volume
`25πh/2` and area `(5h + 25)π + 10h`. For a one-ended difference, subtract
`5πh` of barrel area and add `10h` of meridian wall; the removed original
half-cap and new ledge have equal area. An interior notch adds two ledges,
totaling `25π`, instead. For the reversed covering difference, the original
box area is `6400`; remove its `10 × 6` opening and add `55π` of cavity wall
and caps. These are independent material-boundary calculations, not a sum
read back from the candidate's own faces.

At an event height, independently test a point's two one-sided region
locations. After complete shell admission, a point strictly inside both
adjacent regions is inside; one strictly outside both is outside; the
remaining closed-boundary cases are boundary. Treat the external band as
empty. Test negative-x material at an internal ledge height as inside, the
meridian/ledge corner as boundary, and positive-x points displaced by `δ/2`
to either side as different locations. This prevents promoting an entire
horizontal event plane to boundary. Require the same decisions after cold
native replay and supported transforms, then continued cutting, reconstruction
and empty recovery.

`face_area` already integrates a cylinder's exact parameter-boundary area with
its constant radius Jacobian in `topology/measure.rs`. Reproduce its behavior
on the selected result faces before extending it; do not assume a missing
measurement merely because solid admission was missing. The existing generic
volume fallback is still a planar vertex fan, so the new curved volume proof
and its query dispatch remain necessary.
