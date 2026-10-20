# Axial-shell admission review

The owner is HyperBRep. Geometry proves complete native carrier/chart maps;
topology admits embedded shells and retains their witnesses; classification and
measurement consume those same witnesses. Hypercurve alone owns filled planar
regions. HyperBRep IO exercises native construction, strict STEP exchange and
continued modeling through its existing public APIs. Supporting-crate runtime
code is unchanged in this increment.

## Complete shell proof

An eligible shell uses planes and cylinders with parallel axes. Cylinder axes
may have opposite signs and different origins/phases. Plane normals are either
parallel or perpendicular to the common axis. Every boundary is a native line
or circle; its complete image must be horizontal or axial. Side pcurves are
orthogonal line boundaries. The complete chart has width at most one turn,
although its authored origin can be arbitrarily many turns away.

All vertex heights are events. These complete edge and chart restrictions
establish constant section topology throughout each open height interval;
a midpoint is used only after that proof. Pairwise section intersections must
be shared axial edge identities, with no positive overlap. Directed edge
identities assemble the loops. Each simple disjoint loop separately proves a
winding transition from zero to one or one to zero; aggregate positive area
cannot hide incorrectly oriented or duplicate components. The resulting
`CurveRegion2` is the material region for that band.

At each event, upward caps must cover exactly the lower region minus the upper;
downward caps cover the converse. Positive cap overlap is rejected before union.
Distinct vertex IDs cannot conceal coincident points. Horizontal-edge contacts
and axial-edge intersections must belong to the same actual vertices; interior
contacts cannot be excused by endpoint proximity. Each vertex link is one
connected degree-two cycle, including separate endpoint germs of a closed edge.
These checks complement the existing closed-shell and face-validity rules.

The immutable certificate retains the frame, exact heights, regions and areas.
Volume is the sum of band area times height, scaled by the absolute frame
determinant. Point classification solves the frame exactly and consumes the
same regions. At an event, equal classifications on the two sides persist;
a change is boundary. Transfer and supported transforms preserve this proof;
edits invalidate it and cold deserialization reconstructs it from geometry.
No serialized flag or positive volume grants admission.

## Why the finite section checks cover the whole boundary

These are the mathematical obligations implemented by the finite checks, not a
machine-checked proof. They assume the existing native carrier, complete edge
image, face simplicity and exact Hypercurve contracts.

1. Between consecutive vertex heights, every admitted side boundary is an axial
   or horizontal native image. Its orthogonal chart has no intervening event.
   Each active lateral patch is therefore a fixed line/circle interval times
   the open height interval. Proving section contacts and oriented multiplicity
   once proves them throughout that band; it is not an inference from samples
   of an otherwise unrestricted curved patch.
2. Let `R_i` be the certified section region and `F` the retained invertible
   frame. The candidate material is the regularized union of
   `F(R_i × [h_i, h_(i+1)])`. This is a proof witness for the existing BREP,
   not an alternative public solid carrier or a substitute for boundary checks.
   Its horizontal boundary at an event consists exactly of the two directed
   region differences. The cap comparison proves that the published horizontal
   faces cover that boundary with the correct material side and no duplicated
   positive area.
3. A lateral boundary cannot cross a cap interior unnoticed: a continuing or
   ending lateral section lies on the corresponding region boundary, whereas
   the cap interior lies in the directed region difference. Coincident cap
   boundaries and event-edge contacts are checked with actual topology IDs.
   Closed opposite edge incidence and one circular vertex link then exclude
   unglued contacts, doubled sheets and pinched transition vertices. Thus the
   supplied boundary is the admitted material boundary in this declared domain.

The same decomposition justifies band volume and point classification. At an
exact event, equal inside/outside classifications on both adjacent regions give
that result; differing classifications, or a section boundary, give boundary.
Transforming the retained frame preserves this argument when the geometry's
separate transform contract also admits the image. The volume scale is the
absolute frame determinant. No elementary volume identity is used to establish
embedding.

## Composition and representation

Coincident cylinders have a complete affine chart transition: angular sign and
phase, axial sign and origin displacement. Strict equality of radii and axial
lines establishes the carrier; no sampled fit is used. The original spatial
curve and source pcurve persist, while only the target chart changes. Existing
periodic lifting and endpoint-contact transfer remain responsible for the
actual trim. Point membership likewise uses the authored chart bounds.

Cylinder selection retains the known interior UV witness, maps it directly to
the coincident carrier, and proves opposite trim membership before selecting
material ownership. It does not discard that evidence and reconstruct an
unrelated inverse-trigonometric parameter. Speculative unresolved reuse falls
back to the existing classifier, never to false. Conflicting material sides
remain a typed `CoincidentOwnershipAmbiguous` error.

Only complete collinear line intervals may coalesce; exact gaps remain. Partial
circular traces deduplicate only after complete anchored parameter-map equality.
Complementary arcs with identical endpoints remain different images. Overlapping
cylinder iso traces are split into disjoint intervals with both pcurves retained.
Meridian support cuts extend a native constant-angle line through the face's
height bounds and then clip to its actual trim. This is a partition of the
existing material; original source intersection incidences remain in the graph.
It permits finite latitude cuts to attach on a single full-period cylinder face.

Native line/circle extrusion walls now publish planes/cylinders with explicit
chart and orientation maps. Rational profiles retain generic extrusion surfaces.
This deliberately changes native archive and STEP representations, and the
public error variant above replaces the former planar-only name. Greenfield
API and saved-model breaks are authorized; there is no compatibility adapter.
Every changed old artifact/receipt is inventoried with its predecessor, and
semantic checks remain separate from deterministic serialization.

The wider tests found that this representation change initially lost existing
axial shear support. Before non-similarity transport of a certified prism,
cylindrical walls now promote exactly to extrusion surfaces over their actual
angular trim bounds. This preserves the complete equation and pcurve map; no
fitting or sampling is involved. The original shear test additionally requires
cold replay, exact volume and interior classification under shear/reflection.
General non-prismatic analytic affine images still fail explicitly.

## Acceptance and limits

The original radius-five, height-six fixtures are retained, including upper and
lower `1e-12` layers, an interior notch and the reversed covering-box difference.
Their volume, area, near-meridian and event-side classifications are independently
derived. Eight rotated/reflected native/STEP workflows continue through repeated
subtraction, plug reconstruction, transverse cuts, cold replay, complete removal
and recovery. Scale and distant periodic-seam workflows are additional controls.
Invalid controls exercise missing/duplicate/reversed walls, per-loop winding,
unshared contacts and disconnected vertex links. See the final qualification,
artifact migration and cost records for actual observed outcomes.

The proof does not cover general non-axial surfaces, arbitrary curved trims,
separate void shells, every affine analytic image or all Boolean combinations.
Existing source-qualification delivery remains open. Work over faces, heights,
contacts and candidate traces includes quadratic enumeration and exact scalar
costs; finite chart-lift enumeration is not a total-work, heap, expression-growth
or cancellation bound. External timeouts contain development probes only.
Optional OCCT is a floating-point interchange reader. Thin exact layers below
its topology tolerance are reported without replacing native geometry or
claiming that its validity result is an exact oracle.

All unfavorable measurements and failed candidates remain evidence. This
feature's completed exact domain is the retention rationale, not an optimization
claim. Package/MSRV/JS delivery, broader resources, coverage, runtime fuzzing,
formal proof and the full pre-push matrix remain open. All 28 work packages
remain open or in progress.
