# Measurement-independent prism admission

Target revision: `85412a30fb5fa93454faaabddb2511990c627c6c` on `brep`.

Ownership: Hypercurve proves the orientation of a simple closed planar path
from its existing complete carrier-pair topology and winding decisions.
HyperBRep owns spatial extrusion, cap/side incidence, shell orientation,
classification, native persistence, and optional geometric measurement. IO
continues to own STEP encoding and decoding. Properties P9, P12–P20, P25–P27,
P30 and P35–P39 apply; WP12 explicitly forbids making validity depend on a
closed-form volume.

Reproduced missing acceptance: a simple degree-five positive rational Bezier
with controls (0,0),(1,-1),(2,-1),(3,-1),(4,-1),(5,0), weights
1,2,3,4,5,1, and the three closing lines through (5,2),(0,2), admits a strict
CurveRegion2. Both area queries return `Ok(None)` and extrusion to z=3
returns `Build(Geometry(UnsupportedMeasurement))`. See baseline-quintic-1.log.
The earlier cubic diagnostic already has a represented integral and succeeds;
that entire input remains a regression, not a claimed new capability. The
initial network and consumer-compilation attempts are retained. Cargo created
the diagnostic lockfile during the failed first offline check; no production
source changed.

Input domain: compact simple closed profiles in the already supported native
line, conic, positive rational Bezier and clamped NURBS spatial families, with
strictly ordered extrusion heights, disconnected material components and
strictly nested disjoint holes. The new winding fallback requires certified
injective carriers, complete pair replay, a single unpinched closed chain, and
no overlaps or internal splits. Unsupported or unresolved proof remains typed.
No endpoint polygon, numerical quadrature, or coordinate rounding establishes
orientation or volume. No new cache or global root projection is introduced.

The output is a validated exact body, consumable by classification, supported
affine transforms, split/replay, existing prism compositions and exact finite-
decimal STEP exchange. A missing metric stays `UnsupportedMeasurement` on a
measurement query; existing closed-form answers are preserved. Archive replay
must independently re-prove wire orientation, cap pairing, shell orientation
and containment; no serialized trusted flag or fabricated positive volume.
Inward, pinched, self-intersecting, open, and off-support cases remain rejected.

Acceptance will cover the original cubic and the quintic, reversal, affine
images, holes/components, near-boundary exact probes, cold native and STEP
replay, empty identities and supported continued modeling. Original retained
parabola Boolean recipes remain unchanged diagnostics: this increment does
not claim to admit selected non-native spatial endpoints or supply their
integrals.

Resource contract: reuse the existing exact arrangement and predicate policies;
no new total-work, retained-heap, or cancellation guarantee is claimed. The
existing internal limits remain incomplete. Checks use external timeout and
record every failed attempt, source snapshots, native/WASM outcomes, allocation
counts and binary sizes. Compare frozen supported workloads before retaining
the change. No approximation policy or fixture reduction is allowed.

Additional reproduced gates: full-new-acceptance-1.log rejects independent
quintic STEP at loop #72 with native `UnsupportedIntersection`. The direct
native incidence regression in baseline-high-degree-incidence-1.log fails
for a contained cubic before reaching the quintic. Native plane intersection
currently dispatches only linear/quadratic Bernstein numerators. Extend its
identically-zero numerator proof to all admitted degrees, sharing it with
`Surface::planar_pcurve`; nonzero higher-degree equations remain unsupported.
The STEP loop adapter also requires an area merely to select outer/hole role.
It will consume Hypercurve's proved simple-loop orientation when no integral
is represented, preserving its native line/arc path and final BREP validation.

Current scope is absent represented integrals (`Ok(None)`). Predicate errors
while attempting an available integral are still propagated. Deferring all
metric evaluation and certified interval integration remain open WP12 work.

Review of the public path front doors found one remaining BREP-owned gate:
`normalize_planar_path` requires an area integral before orienting a simple
profile. Extend the same degree-five acceptance to `extrude_path`,
`extrude_path_region`, `extrude_path_regions` and `planar_face`, including
reversal, holes/components, cold replay, affine images and an outside-hole
negative. Reproduce the failure before changing that normalization, then
consume the shared Hypercurve orientation proof only when the integral is
absent. The first broad qualification remains evidence for its earlier source
epoch; the final affected checks must follow this additional implementation.
`baseline-path-front-doors-1.log` reproduces two failing acceptance groups with
`UnsupportedPlanarProfile`; the other three groups pass on that same revision.
