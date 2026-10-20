# Public normalized-region extrusion review

The external consumer first fails with `E0425` on the merged baseline because
`builder::extrude_curve_region` is absent. The new public builder enters the
existing strict curve scope, calls the existing native region constructor and
returns its validated model and solid selection. The private constructor and
its existing Boolean callers are unchanged. No new planar arrangement,
circle recognizer, geometric approximation or surface-integration algorithm
is introduced.

For represented planar material M and z0 < z1, the intended solid is
M × [z0,z1]. Hypercurve proves normalized material components and hole
ownership. The constructor first borrows each component's certified native
line/arc view, or uses its existing persistent-curve fallback. The complete
original component and certified area remain the planar support proof. Native
model admission checks complete boundary images, incidence, orientation and
closure before publication. Empty material still passes height validation.

For the admitted normal line/circle sides, volume is area(M)*(z1-z0), and
boundary area is 2*area(M)+perimeter(M)*(z1-z0). Holes subtract filled area and
add boundary perimeter. The stroke oracle derives length 5 from the independent
3-4-5 input and expects volumes 30 or 30+3*pi and areas 62 or 50+8*pi. The nested
polygon oracle has filled area 36-16+4+1=25 and total perimeter 24+16+8+4=52,
giving volume 75 and boundary area 206 at height 3. These formulas are checked
separately from archive/STEP checksums and oriented topology.

Both directions of the original butt/round stroke now complete the unchanged
exact measure, 1/10^12 classification, translation, cold replay, STEP import,
Boolean and empty-recovery assertions through the new input route. Native
circle side carriers are inspected explicitly, including when boundary paths
expose rational quadratic spans. Tests permit native subdivision choices;
no fixed facet or segment count substitutes for the represented set.

Native controls exercise winding-derived holes, a nested island, a disconnected
component, reversed authoring, island removal/reunion, canonical empty input,
invalid equal/reversed heights, caller certainty receipts and exhausted-budget
recovery. A model can contain unselected solids; selected-body volume and
whole-model measures are checked distinctly. An enclosing provisional receipt
remains qualified after a local strict builder call. This is not a claim that
serializing a bare model preserves an earlier approximate construction's intent;
full source-qualification delivery remains a separate project obligation.

The initial native test compilation used an unavailable LineSeg2-to-Segment2
conversion and passed an owned vector to a slice API. The compiler failures
and source snapshot remain. The correction spells Segment2::Line and borrows
the contour array; no geometry, policy or acceptance assertion changed. All
eight focused native/IO tests then pass. The final full-feature/minimal,
lint/docs, examples, source-path WASM, preserved-corpus and cost checks are
recorded separately after the final source edit.

The earlier general-path consumer remains an independent control. Its two
round-cap area failures do not become successes merely because a different
declared input preserves native circle evidence. General rational extrusion
integration, unsupported persistent families, operation-wide resource bounds,
published packages, host bindings and full work-package admission remain open.
