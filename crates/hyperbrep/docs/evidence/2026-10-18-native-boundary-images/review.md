# Native boundary image and continuation review

Hypercurve owns complete planar image and traversal proofs. The new immutable
`CurveNativeSegment2` view contains a private native segment and a borrow of the
original `Curve2`; callers cannot forge the view or mistake its chart for the
source chart. Native lines and arcs retain their defining traversal. Single
Bezier spans reuse the existing line/circle recognition after an injectivity
certificate. Retained source ranges additionally prove containment in the unit
chart. The existing private fragment invariant keeps source endpoints in
increasing order; reversal toggles traversal without swapping those bounds.
Thus the added lower-start and upper-end comparisons cover the whole range.
Selected-fiber recognition already owns its range and monotonicity
proof; chord carriers define their entire segment. Missing evidence produces a
typed blocker, including the nonmonotone degree-four trim and exterior x=t²
restriction. No sampling, endpoint-only recognition, new cache, scalar formula
or tolerance is introduced. Strict local proof does not upgrade inherited
construction fidelity.

BREP consumes this proof before persistent construction. Planar paths still
undergo complete simplicity, contact, nesting and winding checks. Region
extrusion retains its original normalized component; the generated native
spatial carriers use their own parameter charts. The mixed parabola and chord
retains the parabolic boundary, rather than approximating it by a line.

Cold native validation derives an exact prism certificate containing cap paths.
The world-Z query now consumes that certificate when native line/arc projection
is unsupported. The original native projection remains first for path-backed
profiles, preserving previous deterministic outputs. Horizontal cap frames,
vertical extrusion and the complete admitted shell remain required. Selected
coordinates, unsupported geometry and unresolved decisions remain typed; a
fallback without a valid prism certificate preserves its former blocker.

For an admitted common profile R, regularized union/difference of R × I and
R × J reduces to the corresponding finite interval sets. The new continuation
requires Hypercurve to prove an empty symmetric difference of the complete
filled profiles, including holes. It runs only after the existing prism and
intersection-graph routes fail with incompatible slabs. Positive gaps remain
two selected solids; touching/overlapping intervals merge; subtraction may
leave two finite components. Every output is built by the existing region
extruder and validates. Equal bounds or equal outer contours are insufficient.
This establishes neither unequal-profile stepped shells nor general curved
surface intersections.

The full original seven diagnostic recipes remain, including the four selected
parabola Boolean/affine failures and the nonlinear analytic parallel cap. The
new complete regressions independently integrate 4-x² over [-2,2], account for
a unit-area hole and separate equal component, and scale by the absolute affine
determinant. They check opposite edge uses, exact near-boundary classification,
cold byte-stable geometry replay, repeated Boolean composition, thin remnants,
touching unions, invalid self-intersection and a distinct-hole rejection.

Native archive replay establishes the resulting exact geometry and regenerated
admission facts. It does not establish persistence of the original authoring
boundary graph, an original-to-native parameter map, or end-to-end qualification
of an earlier approximate construction. Those delivery obligations remain open.
The public view preserves original evidence while borrowed; the region
constructor retains it in its live certificate. Broader retained selected-root
integrals, analytic parallel spatial carriers, STEP support for polynomial
boundary curves/sides and operation-wide work/heap/cancellation accounting require their own
complete admissions. No current coverage, formal proof, shipped-binding,
registry/MSRV or full pre-push claim follows from this increment.

The external STEP attempt reaches `UnsupportedCurve(RationalBezier)` on body
0, edge 0. It establishes an edge-family blocker; later surface/export
requirements are not tested by that rejection. All 14 new native/WASM groups
execute successfully, with zero WASM imports. These are source-path consumers,
not evidence of a published package or JavaScript binding.
