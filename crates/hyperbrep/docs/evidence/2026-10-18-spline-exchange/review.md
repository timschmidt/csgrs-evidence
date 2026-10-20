# Ownership and proof review

HyperBRep exposes borrowed rational Bezier and NURBS coefficient views; private
persistence variants remain private. `planar_pcurve` uses the existing whole
curve/plane intersection and materialization path. Extrusion point location
first proves a transverse control plane, including oblique directions, then
uses complete native generator location. It retains all selected parameters;
it is explicitly a point-location result, not a whole-edge certificate.

IO decodes spline records through the native NURBS constructor. Unique vertex
preimages and source sense determine an exact trimmed directed curve and its
affine source interval map. A candidate UV line on an extrusion still passes
the existing native whole-image validator. Plane cap curves use the shared
native projection and Hypercurve path area; prior native segment loops retain
their original Contour2 path. No edge is replaced by its endpoint chord.

The full retained-profile test exposed a separate native enclosure omission in
multi-solid difference. The existing finite-face boundary enclosure now admits
extrusion surfaces because coordinates are affine along V. It still uses
strict AABB separation. Touching enclosures do not prove disjointness, and the
existing full-profile XOR proof remains required for interval composition.

IO retains finite nonperiodic knot charts and positive weights. It checks
expanded knot count against degree/control count and an explicit cumulative
allowance before reservation. Complex instances share the writer's existing
entity/byte accounting. Exact scalar preflight owns finite-decimal encoding;
no float, fitting or implicit normalization is introduced. Import limits do
not establish an operation-wide native time, expression-growth or heap bound.

STEP source identity and parameter maps survive selected representation import.
Unselected records and geometry hints remain in the source exchange. Native
archives establish exact geometry replay, not preservation of the full STEP
file, an authoring graph, or all schema propositions about an untrimmed carrier.
Logical closure is checked; self-intersection, form and knot-type attributes
are retained hints, never substitutes for native trim/topology proof.

Independent authored inputs, malformed controls, source UV lines, exact unit
changes, native replay and continued Booleans complement writer/reader round
trips. Native and IO use the same acceptance bodies in the separate native and
WASM consumer. External floating-point readers are interoperability checks,
never the authority for exact equality or near-contact classifications.

The broader release suites reproduced one obsolete expectation in the original
Bezier extrusion writer fixture. Its original controls and unit extrusion are
retained in a positive chart/entity test, then closed with the original endpoint
chord into a complete solid. Exact volume 2/3, import, cold replay and interior/
boundary/exterior classification are mandatory. The original unsupported oblique
circle and ellipse fixtures retain their typed rejection/retry assertions. This
is the intended capability extension, not a relaxed acceptance of failure.

The endpoint-run review was reproduced on the candidate: the degree-one native
constructor accepted `[0,0,1,1,1]` with three controls. The new independent STEP
control was rejected later as a vertex-incidence error, so this observation does
not show an invalid body was published. `endpoint-native-reproduction-1.log` and
`endpoint-io-reproduction-1.log` retain both outcomes. The common clamped-knot
validator now rejects runs extending into the interior at either endpoint before
constructing a curve or either surface axis. Degree-one/two controls, both ends,
both surface axes, a valid interior-knot retry, and source-entity-specific STEP
failures exercise this invariant. No duplicate format-only geometric rule was
introduced. Valid input knots and all previous complete workflows must remain.
