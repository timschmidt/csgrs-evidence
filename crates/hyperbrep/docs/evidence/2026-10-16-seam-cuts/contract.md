# Seam-aligned analytic Boolean cuts

Baseline: `e8c1b6e14daf0a93350bb421dfe76b8bbc684787` on `brep`, incorporating
upstream `72cd216cc`. Owner: HyperBRep retained face intersections, partitioning,
selection, complete boundary identity stitching and native shell validation.
P1–P6, P8–P9, P15–P20, P24–P27 and P35–P39 apply. Surrounding implementations
remain concurrent upstream work; no dependency repair is presumed.

Reproduce all three complete workflows from `original-frontier.rs.txt` on the
current revision before editing production code. The exact torus has major
radius 5 and minor radius 2; the cone has radii 5 and 2 and height 6. Retain the
original 40-unit-wide cutters. The seam-aligned torus axial/longitudinal halves
currently reach one-use nonmanifold candidate edges; the cone longitudinal half
lacks an interior witness. These are validated inputs with failed operations,
not invalid user geometry or successful empties.

Require strict completed intersection, directed subtraction and meaningful
continued use for the admitted cases. Independent half-volume expectations are
20*pi^2 for either torus half and 39*pi for the cone half. Check exact areas,
inside/boundary/outside and near-boundary samples, orientation/reflection/scale,
operand order, fresh untrusted archive validation, topology incidence and output
composition. Include the already admitted oblique and transverse-band workflows
without replacing the failed full-size seam cases. Record any additional typed
frontier explicitly rather than loosening a success assertion.

Repair the native geometric/topological proof owner. A trace on an existing
face boundary must retain complete support, parameter and shared-edge identity;
endpoints or sampled chords alone are insufficient. A face interior witness
must be proven interior to its actual trimmed region, including holes and
thin regions. Do not perturb the seam, rotate the failed fixture away from it,
introduce epsilon welding, or bypass manifold/solid validation.

Freeze all eleven previously qualified benchmark executables before production
changes (123 prior cases plus nine similarity workloads). After final edits,
run BREP/IO debug/release/minimal tests, strict all-target Clippy, docs/examples,
fuzz-target compilation, real source-path WASM consumers and affected independent
STEP readers. Preserve full previous output/certainty/provenance receipts with
alternating native cost trials; new completed workflows have separately named
absolute costs, never a speedup against a failing baseline. Keep all failed and
unfavorable observations. Internal scalar/total-work/heap/cancellation bounds,
full runtime fuzz/ASan/lexicase, formal, coverage, packaging/MSRV/binding and all
28 work-package gates remain open unless their own full evidence proves them.

The expanded public similarity test reproduced an undecided exact area equality
for the longitudinal torus half at scale 1/1000. The complete output and expected
formula are retained in `similarity-matrix-1.log`. BREP owns its surface integral:
keep the two analytic Green-integral coefficients separate before applying the
major/minor radius products through Hyperreal's native product-sum primitive.
This extends the owning code to torus face measurement (P2/P5/P7/P17/P20); no
scalar rewrite or comparison-policy relaxation is authorized by this finding.

Closed-set clipping intentionally adds positive-length cap-boundary incidences
to face-pair graphs previously reporting only interior traces. The two original
cylinder/cone tests still require exactly four interior quarter circles and all
their former angular/image assertions. They now also independently require the
eight omitted cap-boundary quarter circles at radii/heights (3,0) and (2,2).
This is a geometric evidence extension, not a performance-only artifact claim.

The separated-integral/product-sum prototype is rejected: `similarity-matrix-2`
regressed the original area checks. The failure is the magnitude operation:
small scaled signed areas exceed `abs()`'s cheap sign probe, adding opaque
`sqrt(area^2)` expressions before summation. Preserve the original integral;
use the existing scalar-owned `compact_pi_laurent` and a strict Hyperlimit sign
proof at the BREP magnitude boundary. An unavailable proof retains the former
exact absolute-value representation, without guessing or weakening policy.

The unchanged similarity matrix then reproduced four unsupported cone/plane
pairs against the rotated cutter's far face (`rotated-cone-probe-1.log`). Their
axis-aligned boxes overlap even though the finite cone patches are strictly
separated from that plane. BREP owns finite face bounds; Hyperlimit already owns
the exact plane/AABB classifier. Use that existing strict proof only when the
infinite carrier pair is unsupported; touching or undecided boxes must retain
the existing carrier outcome. This is a completion fix for the same transformed
full-size input, not a new predicate implementation or a narrowed fixture.

The reflection branch of the unchanged similarity matrix next exposed unmatched
circle edges (`similarity-matrix-5`). Extend native selected-edge matching by
reusing the existing full circle image proof (center/radii, angular span, start
radial vector and signed tangent) across translated equal-length parameter
charts. Preserve both direct and reversed trials for closed edges, whose two
endpoint predicates can both be true. Same endpoints or support alone remain
insufficient. This proof already belongs to BREP topology image validation.

The proposed circle matcher did not fix the reflected failure and is removed.
`reflected-stages-1` localizes it earlier: zero retained traces, hence no planar
cap. Reflection preserves authored torus charts at negative angular values;
carrier intersections use canonical positive angles. The two images are equal
modulo whole periods. Lift native iso pcurves into each actual face chart before
closed-set clipping, retain the lifted pcurve alongside spatial parameters and
boundary contacts, and bound chart enumeration independently of the integer
period offset. No scalar-period predicate or curve representation is duplicated.

The second reflected stage reproduction now retains sixteen traces and selects
the annular cap, yet still rejects unmatched circle edges. Reconsider the full
circle-parameterization matcher in combination with chart lifting: the lifted
cap and reflected original edges traverse equivalent circles in opposite frames
and translated angular domains. Keep the failed standalone attempt; qualification
must establish the complete combined workflow, including wrong-arc rejections.

`similarity-matrix-9` and `area-probe-1` reproduce a later failure after an
edge split, archive replay, reflected scale 1/1000 and another replay of the
sqrt(2)-scaled axial torus cut. All eight torus patches retain exact area
identities; the annular planar cap alone loses a decidable area identity.
Extend the same BREP signed-area magnitude boundary to planar/cylindrical
parameter areas, retaining the native integral and strict policy. The original
complete matrix and per-face diagnostic remain the acceptance inputs.

The broader planar magnitude change is rejected (`similarity-matrix-10`):
strict signs are available but do not resolve the cap expression.
`area-probe-5/6` separates the metric (already the exact rational 1/500000)
from the boundary integrals (both strict signs decided, but neither integral
recognized by the bounded Laurent compactor). Reflection reconstructs circular
pcurves from unsimplified projected coordinates, multiplying those expressions
again in the new native circle's radius. Test native scalar compaction of the
reflected pcurve coordinates at BREP chart transport, without approximating,
raising scalar recognition limits, or modifying Hypercurve's integral.

The reflection-only compaction is rejected (`similarity-matrix-11`).
`area-probe-7` identifies the reconstruction boundary: archive writing replaces
planar pcurve endpoints by projections of the emitted spatial vertices, using
a duplicate plane-projection formula. These individually compactable exact
coordinates expand again when replay reconstructs native circle radii.
Unify persistence with BREP's native plane-point projection, and compact each
returned coordinate with the existing bounded scalar reducer before storage.
This owns the proof/representation at the geometry boundary shared by runtime
projection and archive writing (P2/P5/P17/P19/P27). Reflection compaction is
removed; do not retain a failed unrelated change.

`similarity-matrix-13` reaches cone replay after the same repeated workflow;
`cone-replay-probe-1/2` isolates use 8, a circle on the cone. The axial chart
transport computes a general line-supported planar similarity from differences
of already-transformed endpoint expressions. A mathematically zero vertical
difference of a horizontal iso line remains expanded inside a denominator,
producing a 42 KB pcurve record and an undecided image proof after replay.
Compact the two exact line-direction components before forming this chart
map, using the same native scalar primitive. Keep the general-line formula,
source transport, correspondence and complete image validator unchanged.
Temporary stage diagnostics are removed after the reproduction.

With the direction compaction, cone replay validates and reaches exact area
comparison (`similarity-matrix-14`). Apply the already-established torus signed
area magnitude proof to the cone's existing Green integral as well; preserve
the integral and independent frustum area formula. This is the same small
analytic signed-area boundary, now reached by the previously blocked workflow.

The final matrix branch preserves a second resource failure: a reflected
sqrt(2)-scaled cone cut emits 70,631,627 archive bytes and is correctly refused
by the unchanged 16 MiB default admission limit (`similarity-matrix-15/16`,
original-result replay). Compact the derived axial map coefficients and offsets
as well as its direction, before composing them with retained source geometry.
Do not increase archive limits or weaken replay/area assertions.

`cone-size-probe-1` corrects the resource localization: it is the swapped
operand order, at the first replay, and 70,144,691 bytes are spatial line
carriers (ordinary operand order emits 45,695 bytes). Three clipped planar
lines store expanded endpoint expressions up to 16.9 MB each, while their
already-validated incident vertices are compact. Extra axial coefficient/offset
compaction reduces bytes slightly but does not repair this and is rejected.
Use the existing scalar compactor at the shared native `Curve3::line`
construction boundary, before subsequent line restrictions multiply derived
endpoints. This preserves the complete affine image and unit parameterization,
without endpoint-based identification of any nonlinear carrier. Keep the full
swapped input and default archive cap as the resource regression.

The first focused plane-bound test used an aborted exact rational coordinate
as a proxy for an undecided predicate. `extended-release-1` shows that this is
not an undecided input: the native structural classifier can still certify the
rational separation. The BREP helper consumes that valid proof. Correct this
test fixture to a signed offset from the midpoint of a 2048-bit pi enclosure,
and assert that the native predicate actually reports Unknown before checking
that the helper leaves the face pair unrejected. Retain the original failed
test/log; no production predicate or cancellation policy is changed.

Final source review found a conservative-failure gap in periodic chart lifting:
when a periodic face's parameter bounds are undecided, falling back to the
unshifted trace can let later clipping certify the wrong chart as empty.
Nonperiodic and non-iso inputs should retain their former path; periodic iso
inputs must propagate the bounds blocker. Complete the currently running
qualification without changing its source, then repair that branch and rerun
the final checks. A missing chart proof is never evidence of disjointness.

The first complete qualification passes all 18 commands (443 debug/release,
435 minimal tests; 43 WASM groups). It is preserved as a pre-review snapshot,
not final-source qualification. The periodic-bounds guard is then repaired;
nonperiodic paths bypass lifting, and undecided periodic bounds propagate
their typed blocker. A full-circle boundary test reuses the admitted two-vertex,
three-edge cylinder in both edge directions. `closed-boundary-1` already
passes, so no speculative closed-edge implementation change is made. Extend
the final native/WASM/cost corpus with that already-satisfied composition.

The first complete 66-process cost campaign preserves 131 receipts but stops
at a changed radical-cylinder archive checksum. The pinned baseline and final
candidate are reproduced separately: 32 circular-pcurve endpoint scalars have
different expression encodings, every one proves equal under strict native
predicates, every non-scalar field is identical, and both full archives validate
(`receipt-migration.json`). This is the already-declared canonical-expression
migration, not a performance-only byte-preservation claim. Retain the failed
comparison and both complete archives; admit only this exact case/hash pair.

The same campaign records five spline rows above the 10% timing budget, with
candidate/baseline ratios 1.135–1.241. The new complete-boundary probe materializes
nonlinear pcurves before discovering that its domain is native lines. BREP owns
that optional proof: inspect the retained mapping's native representation first
and skip the probe when materialization cannot produce a native line. Leave
ordinary splitting and complete image validation intact. Preserve all five full
fixtures/iterations and repeat the complete checks/corpora after this change;
do not drop the adverse first campaign or claim improvement without measurement.
