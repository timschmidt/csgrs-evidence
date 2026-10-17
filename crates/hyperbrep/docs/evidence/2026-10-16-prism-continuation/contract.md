# Prism continuation: proposed contract and baseline review

Baseline: `5495a63e07abee7c769969330975a4332d7c1cf4`. Upstream was fetched
again at the clean checkpoint and remains `73472622dd4034b8b8777cb2a116c4020f6bb328`.
The conic comparison reuse is committed and qualified; no prism change has been made.

Proposed owner: `hyperbrep::boolean_kernel::z_prism_boolean`, with the existing
certified profile extraction and native Hypercurve region Boolean. Properties
P1-P6, P8-P11, P17-P20, P24, P27 and P35-P39 apply. This is a BREP composition
extension; do not move the rule to a caller or duplicate planar Boolean code.

The other direct consumer is `oriented_cylinder_boolean`: parallel-axis
cylinders are mapped to a common orthonormal chart before calling this helper.
Cover that route with an off-axis through bore (outer radius 5, height 6;
cutter radius 2, center offset 1, interval [-20,20]). The expected remaining
volume is 126*pi and total area is 126*pi; the bore's cylindrical boundary is
inward and its cap circles are genuine holes. Preserve this workflow under
the supported exact similarities and reversed common axis. Coaxial cylinders
may take the earlier revolution/interval path, so they alone do not prove that
the changed caller is covered. Reproduce both routing cases before patching.

The merged-source oblique diagnostic retains the actual failure: radius-5,
height-6 cylinders minus the original 40-unit transverse cutters, with identity,
45-degree radical and 3/5-4/5 rational rotations. Directed subtraction and
clearing a retained half fail on incompatible axial slabs followed by a typed
general-graph blocker. Preserve the full original fixtures and failures.

For certified regular closed planar profiles A and B, and positive-length
closed axial intervals I and J with I contained in J, the regularized result
of (A x I) minus (B x J) is the regularized planar difference (A minus B) x I.
Prove interval containment with strict comparisons. Reuse the existing region
difference and extrusion; canonical empty remains empty. Equal endpoint slabs
remain supported. This condition is directed: it does not justify union or
subtraction in the opposite operand order, or a single-prism result for partial
axial overlap. Keep the existing fallback for other cases.

Before patching, reproduce the failures on the committed BREP baseline.
Independently verify the resulting half cylinders: volume 75*pi and area
55*pi + 60 for radius 5 and height 6; the original cylinder has volume 150*pi
and area 110*pi. Check exact point tables at both planar and circular boundaries
with 1e-12 offsets, opposite paired edge uses, full archive replay, subdivision,
repeated subtraction to canonical empty, and union with the complementary
intersection in both orders. Retain relative cutter rotations and transform
the complete source/result scenarios only within proved supported domains.

Add meaningful interval controls: one or both coincident axial ends, a tiny
strict containment margin, non-containing overlap, and disjoint/touching axial
intervals. Ensure unsupported cases are still typed rather than mislabeled as
empty or unchanged solids. Include invalid input/empty composition through the
validated public carriers without concealing errors. Preserve existing holes,
disconnected components and native profile provenance wherever already admitted.

In particular, for delta = 1e-12 and cutter top 6 - delta, a source point on the
cutter's planar side at height 6 - delta/2 remains material after subtraction.
The new containment shortcut must reject this case even though the two heights
are close. Establish the existing public fallback outcome on the target revision
before choosing its regression assertion; a typed unsupported result outside
the new domain must not be mislabeled as successful empty geometry. Also cover
an annular profile and disconnected profile components where the existing
carrier already certifies them, rather than specializing the rule to cylinders.

Do not infer general rotated-axis or curved-shell embedding support from this
Cartesian-product proof. Do not use volume and body counts alone as set proofs.
STEP export has its existing PLANE/CYLINDRICAL_SURFACE and pcurve contract; test
the actual newly supported downstream path and keep failures explicit. Keep all
old exact-output receipts, the entire oblique frontier and preceding continuation
corpus, and measure complete newly successful workflows separately from failed
baselines. No internal total-work, heap or cancellation bound is added here.

Before changing dispatch, record the existing outcomes for planar prisms whose
axial intervals differ. The general graph may already complete those cases;
the proposed Cartesian-product path could change their topology representation.
Retain all old receipts and investigate every difference. Any intentional
representation/artifact migration needs explicit old/new records and independent
set, topology, source-evidence and continuation checks. Keep the original
semantic assertions. Do not silently relax checksum comparisons or add a
compatibility path solely to reproduce an old layout. The greenfield scope
permits documented format/API migrations while preserving exact meaning and
required evidence.

Source review found an important downstream condition: `extrude_curve_region`
creates `Surface::extrusion` sides, while the current advanced STEP writer
matches only Plane and Cylinder. Reproduce the actual surface tags and export
outcomes before choosing the implementation. A newly successful Boolean with
a typed export blocker is not a complete STEP workflow. More importantly, do
not redirect an already successful planar graph result into an unexportable
representation. If that happens, add the necessary exact representation or
interchange support in the owning BREP/IO layer, with explicit parameter maps,
independent round trips and a documented migration. Do not hide the regression
with a compatibility dispatch or weaken the old export assertions.

## Reproduced baseline and prerequisite

`baseline-frontier.json` records 24 public diagnostic cases on the pinned
revision: 18 typed unsupported outcomes and six native results. Four planar
results currently encode to STEP. Their exact JSON/STEP bytes are retained in
`baseline-artifacts`; process success is not semantic admission. All original
oversized cylinder differences/clears fail in identity, diagonal and rational
rotations. Covering annulus and off-axis/coaxial bore differences also fail.
The cylinder's non-covering, touching and strictly separated controls currently
fail typed as well; do not claim that the proposed containment rule covers them.

The same-height cylinder difference returns the expected diagnostic volume
75*pi, but its rational Bézier edges block area measurement and STEP encoding.
The same-height planar result also has extrusion sides and fails STEP encoding.
By contrast, the covering planar box, strip and ring cuts currently retain plane
faces and encode successfully. The exact 1e-12 upper-gap box result also encodes
successfully and must remain consumable.

Source review identifies the first owning boundary: `extrude_curve_region`
passes circular region boundaries through `persistent_planar_curves`, which
promotes them to rational Bézier fragments. Authored extrusion paths already
have a circular-preserving conversion and `spatial_extrusion_curve` can construct
the corresponding native circle. Share that extrusion conversion for region
and path input, preserving native circular identity before it is discarded.
The planar-face conversion has a different consumer and remains separate.
This is an intentional representation migration, not a performance-only change:
keep all old artifacts, explain changed geometry tags/parameter charts, and
validate independent measures, point tables, topology, replay and continuation.

Then provide the exact analytic extrusion support needed by interchange before
extending slab dispatch. Its domain is proved linear profiles and native circles
extruded along the circle's normal; unrelated splines and oblique circle
extrusions retain typed blockers. Any public analytic inspection or parameter-map
API belongs in BREP; STEP encoding belongs in BREP IO. Retain complete affine UV
maps, including offsets and orientation, and distinguish source-chart identity
from encoding. Reversed circular profiles and inward bore faces must not acquire
the outward cylinder orientation by default. No fitting or sampled recognition
is permitted. Add missing acceptance tests before each source change.

The first candidate (sharing only the extrusion conversion) does not fix the
new regression: `circular-preservation-1.log` still reports unsupported area,
and the corresponding diagnostic retains rational Bézier cap edges. The unified
region already stores the circular image as rational quadratic spans. Therefore
recover the existing certified `native_contours_fast_path` view of each material
component before constructing its native boundary. This is Hypercurve's borrowed
line/arc view of the same region, not a new Boolean engine or sampled recognition.
Retain the original component as the authoritative region certificate. A missing
native view allows the existing exact spline construction; an undecided or invalid
query remains explicit. Check the wider supported corpus and resource behavior
for any regression introduced by this additional proof query.

The second candidate restores initial native circular edges, exact measures,
classification and archive replay. The new regression then fails after a circular
edge is split and its model is archived/reloaded: the exact volume comparison is
undecided. The live split model passes those same checks; see
`circular-preservation-3.log` and `circular-preservation-4.log`. The stronger test
keeps the original expected volume and strict comparison, and separately names
the live split and replay stages.

Prism revalidation currently reconstructs a planar path and later recomputes
volume from that path's area. The serialized spatial circular carriers still
retain their exact angular intervals. Rebuild the transient prism area certificate
from the existing `Curve3::analytic_area_vector` integrals where the cap boundary
has native conics and represented parameters. Project the signed area vector
into the certified cap frame with `(u cross v) / |u cross v|^2`; this yields the
same profile-coordinate area. Retain exact path integration for other carriers.
This belongs to BREP prism validation and measurement, with the shared geometry
integral as the formula owner. Do not serialize an unchecked area or skip any
cap, shell, edge-use, winding or nesting validation. All retained metric facts
must be derived anew from the admitted geometry during replay.

The intermediate native release run passes 497 tests, with no failures or
ignored tests. This does not admit the unfinished STEP or slab extension.
`baseline-extrusion-export-1.log` reproduces the missing extrusion export.
The writer candidate passes its three exact chart tests (shifted and reversed
circle domains, signed axial units, oblique line extrusion, and typed rejected
families), but `extrusion-export-3.log` reproduces a downstream import failure:
the half-cylinder's PLANE/CYLINDRICAL_SURFACE shell is rejected as unsupported.
The independent STEP graph interpretation succeeds before that failure.

The next owner is BREP prism validation. Reuse its cap pairing and translation
topology proof for cylindrical lateral faces. For each such face, require a
validated rectangular cylindrical parameter region, an axis parallel to the
common cap translation and cap normals, and axial bounds exactly equal to the
two cap planes. Reuse the existing cylinder rectangle proof rather than adding
an importer-only admission shortcut. Keep all edge image, wire, shell ownership,
orientation and nesting validation. Unsupported tilted or nonrectangular
cylindrical sides must not become an admitted prism merely because their corner
vertices resemble one. Preserve the emitted failure artifact and add malformed
orientation/support controls and replay/continuation acceptance.

The first slab candidate returns native geometry, but the expanded exact
continuation test finds an undecided equality against the independently derived
half-cylinder volume (`prism-workflows-1.log`). Keep that failure and the complete
original rotated cutters. Do not replace exact equality by a float tolerance.
The region certificate and a separately derived metric certificate may use
different exact representations; investigate the retained cap intervals before
changing scalar or curve code.

The two-semicircle annulus constructor also exposes a pre-existing BREP
orientation problem (`prism-exchange-holes-1.log`): its chord vertices are
coplanar, so the polygon fan volume is zero despite a positive analytic prism
volume. Keep the two-semicircle fixture, rather than replacing it with quarter
arcs. The owning boundary is BREP shell orientation. A certified curved prism
can derive its signed volume from the cap integral and oriented extrusion
determinant; this is not the volume of a chord mesh. Reuse the prism certificate
and native geometry integral. Inward, mismatched-support and malformed shells
must still be rejected; retain the ordinary planar and non-prism validation
paths. Check hole orientation, replay, split edges and exact measurements under
reflection, and measure the cost of any extra certificate reconstruction.

The native cap integral resolves the diagonal cutter's volume. The next failure
is the rational 3/5-4/5 cutter (`prism-workflows-2.log`): independently retained
arcs contain `atan(3/4)` and `atan(4/3)`, whose exact complementary identity is
not retained by the scalar layer. This also affects the sum of native side
areas. The minimized scalar regression is
`rational_atan_reciprocals_retain_exact_half_turn_and_trig`; its strict equality
must pass for positive and negative reciprocal rational pairs, while retaining
exact sine/cosine images. Existing quadratic-surd reciprocal normalization is
the scalar-owned rule to extend. Do not add a BREP-only atan identity or change
the original rational rotation to a special-angle fixture.

This is the necessary dependency exception to the BREP-only work scope: the
current BREP continuation cannot prove its independent metric expectations
without the missing scalar identity. Fetching upstream again found
`3b69af324a9642d1f71b9cc38de58b59a236f740`, which adds evidence and ledger records
but no production correction. Merge `90a5c258eb2387d6a2f84fcf1e6ed420da1c4622`
preserves BREP's ledger and both upstream additions. The new upstream report
withdraws qualification for nested FUSE build views; those observations must
not be presented as passed gates. The BREP target resolves to a physical tmpfs
directory; record bounded file-identity checks and actual build inputs before
retaining new evidence. Historical observations and failures remain unchanged.

The reciprocal rule restores unsplit rational-cut measurements. The next strict
failure is split-archive replay at circular-wire radius equality (wire.rs:685),
not JSON decoding or endpoint admission. `prism-replay-radius-trace-1.log`
records the retained expression; `failed-rational-split.json` is the unchanged
49,602-byte failing prototype. The minimized scalar test independently tabulates
sine/cosine values for half-atan angles from Pythagorean triples and fails before
the next change (`baseline-half-atan-1.log`). Keep that fixture and every prior
failure. Do not assume all generic trigonometric expressions are covered.

Extend the scalar-owned inverse-trig reduction only for half a retained
principal rational atan with rational hypot. Its half-angle cosine is the
positive square root of (1+cos(theta))/2, and its sine uses
sin(theta)/(2*cos(theta/2)), avoiding cancellation in 1-cos(theta). The existing
signed reciprocal recognizer already checks the principal branch. Reject other
branches, multipliers and nonrational hypots from this shortcut. This returns
quadratic exact values that survive independent JSON scalar replay and radius
composition; it is not a BREP-only formula or a trusted serialized proof flag.
The identities and branch requirements are consistent with NIST DLMF
[trigonometric identities](https://dlmf.nist.gov/4.21) and
[principal inverse trigonometric values](https://dlmf.nist.gov/4.23#ii).
Previously emitted unadmitted prototype artifacts remain available unchanged.
Their computable expression representation is not an admitted release format.

`half-atan-4.log` passes all 45 inverse-tangent tests. The original twelve
covering-cut combinations now complete their independently checked split,
replay, similarity, restore, recut and empty-result sequences. Five STEP tests
also pass, including the four byte-preserved planar fixtures and a complete
inward two-semicircle annular shell rejected as `InwardSolidShell`.

The expanded bore continuation still fails (`prism-workflows-7.log`): a
replayed coaxial hole in a reflected/permuted frame cannot be recut. The original
cylinder pair is admitted by the common-axis cylinder route, but its valid
prism output no longer has a primitive-cylinder certificate. This is a BREP
P17–P20 closure gap. Keep the moved fixture and all exact expectations.

The next extension belongs to BREP's certified geometry views and Boolean
routing. Expose a private frame view only for an already validated right prism
or an unsubtracted native cylinder with no cavity shells. Prove each profile
basis direction perpendicular to the extrusion. After the existing world-Z
route reports an unsupported operand, permit a common orthonormal chart only
when both certified axes are exactly parallel. Reuse the existing planar-region
Boolean and extrusion implementations in that chart, and transform the complete
result back. No sampled recognition, additional planar kernel, cached success
flag or rounded axis test is permitted. Nonparallel, oblique and missing
certificates remain outside this shortcut; every undecided proof remains typed.
The original routes stay preferred, and all prior fixtures remain unchanged.

The common-axis extension passes all ten prism/STEP workflow tests, including
12 bore/cutter/frame combinations (`prism-workflows-8.log`). The negative
frame controls then reproduce an older BREP admission error: a circular
extrusion sheared by x+=z, whose positive-volume material includes
(-1/2,0,1/10), still exposes a world-Z product profile. A valid skew prism is
not that product; see `baseline-prism-frame-controls-1.log`. The new right-prism
view correctly declines it, but the pre-existing world-Z view did not.

Fix the invariant in `certified_z_prism_profile`: every shell edge connecting
different cap levels must have equal x and y at both endpoints. Existing full
edge-image and prism-shell admission remain required. This test rejects the
sheared fixture before a cap is promoted into an unrelated 3D product, without
assuming the first stored prism axis is the only possible axis (a box has
multiple valid prism frames). Keep strictly nonparallel and 10^-12 angular
perturbation controls. Do not use a tolerance, discard the skew fixture, or
replace uncertainty by a decided negative. Re-run all preserved corpus and
cost checks for the additional strict comparisons.

The first complete qualification batch retains four failed commands, all caused
by an incorrect new test expectation. The malformed STEP outer-bound orientation
is rejected by the importer as `Invalid("declared outer bound has inner
orientation")`, before reaching the builder error that the new assertion
expected. Correct that assertion to the actual contract; retain the independent
changed-radius rejection and successful retries. No production check is removed.
`initial-qualification-summary.json` records 446 passing native tests before the
debug/release failures and 438 before the minimal-feature failure. Later IO test
binaries were not executed by those stopped Cargo commands. The WASM trap names
the same test helper. Final native runs use `--no-fail-fast` to retain all results.

The evidence runner must reread its attempt ledger after a child driver returns,
so appending an enclosing command cannot discard the child's completed records.
Final qualification also includes the predicate, curve and solver library tests
affected by the necessary scalar identities. The scalar eligibility check uses
the existing rational square-extraction size domain and an exact perfect-root
test; it does not factor an ineligible hypotenuse merely to choose a shortcut.
This adds no internal whole-operation work, memory or cancellation guarantee.

## Final-source qualification and representation review

The guarded source `2b480f89eb7560001b45e8952327a73179a3306953c200bfc82f6b0197523d92` passes the complete native/feature qualification and all 83 WASM groups. The original 81-slot continuation diagnostic now reports 74 native results, five undecided and two numeric resource-exhaustion outcomes. Every prior native result/body count is preserved. The two torus `Numeric(Exhausted)` results are resource exhaustion, not unsupported geometry; the post-run classifier records that distinction. All 24 prism cases and 14 optional OCCT samples have completed. These diagnostics remain separate from the independent exact acceptance assertions.

The cost campaign retains changed circle-document and supplied-pcurve receipts. Before approving them, compare all four complete old/new archives using pinned old BREP and scalar sources, the unchanged fixtures, and the measured receipt hashes/sizes. Require an exact account of changed scalar values and unchanged non-scalar topology/source-map structure; retain both archives and any failed proof attempts. The additional post-campaign probe has independently hashed sources and commands because it is introduced after the original qualification snapshot. It does not mutate qualified product, fixture or benchmark inputs. The seven native-prism artifact changes are recorded separately in `representation-migrations.json`, including the empty saved selection tables and their provenance limitation.

The completed [archive proof](receipt-archive-equality.json) accounts for all
115 changed scalar fields across four complete archives. Nineteen comparisons
decide directly; 96 remain generically undecided but have exact equality proofs
from equal sine/cosine images and membership in the same half-open period.
Every premise is checked under strict policy. This is a separate mathematical
proof, not a claim that generic scalar equality now decides those expressions.
All non-scalar fields agree. Both old and new archives pass untrusted replay
validation and the independent cylinder expectations. The old side uses the
pinned old BREP, IO and numerical/geometry dependency sources.

Two analysis failures remain recorded. The first probe did not compile because
its equality checker consumed values before reusing them; the corrected probe
clones those values. The first artifact-binding check then rejected an empty
`hyperbrep/default` feature marker absent from the measured benchmarks. New
external probe projects disable that default explicitly; the feature-equality
gate is unchanged. Repeated emission and comparison produce byte-identical
archives and the same complete proof. The earlier inputs, binaries, artifacts,
proofs and failed command logs remain preserved.

The final [artifact binding](receipt-artifact-binding.json) matches the measured
sizes and hashes for all four archives and their unchanged STEP inputs, with
matching geometry feature configurations. The [receipt review](receipt-review.json)
individually accounts for eight old case receipts and one fixture-fact record.
All 96 timed processes succeeded before the campaign's unreviewed-migration
assertion failed; that failure remains intact. Separate review discharges only
these explicit representation migrations, without rerunning or selecting among
the timing samples. The 19 adverse timing rows and 60 allocation increases are
retained and do not become performance successes through this review.
