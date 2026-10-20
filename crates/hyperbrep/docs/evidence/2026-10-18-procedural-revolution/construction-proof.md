# Retained product-shell admission

This is an argument for the implemented finite domain, not a formal verification
of the program or a general curved-shell certificate.

Let M be the exact regularized material region in radial/axial coordinates
(r,z), bounded by a certified simple loop, with a strictly positive conservative
lower bound for r. The map F(r,z,theta)=(r cos(theta),r sin(theta),z) is injective
modulo a single full angular period and has a continuous inverse on r>0.
Consequently the image of the compact boundary times the angular circle is
embedded. In a smooth boundary chart its oriented normal is a positive multiple
of (z',-r') in the meridian plane: counterclockwise profile traversal gives the
outward orientation. Reversing the face/wire orientation gives an inward cavity.
Corners do not require an elementary volume integral.

Hypercurve owns complete profile simplicity, source regularity, retained
selected-point comparisons and winding. HyperBRep's ordinary face admission
owns complete edge/pcurve/surface image correspondence and wire closure,
simplicity and orientation. The new shell validator then:

1. Groups revolution faces by source surface in deterministic arena order;
   requires the declared face orientation, no face holes and common exact axis.
2. Reconstructs a positive meridian ray and proves each entire retained affine
   plane frame lies in that meridian plane, including the frame origin.
3. Proves each admitted line-family pcurve boundary is its rectangular envelope,
   retaining selected coordinates and permitting extra collinear split vertices.
4. Orders exact angular/profile boundaries, requires one full angular period and
   the entire retained profile domain, and uses the existing rectangle sweep to
   certify multiplicity one everywhere. Counts or total extents alone cannot
   establish this. A regression keeps the face count but duplicates one angular
   face and leaves a gap; the certificate must reject it.
5. Projects each complete profile through the existing exact similarity proof,
   follows increasing spatial parameters independently of stored source traversal,
   assembles one nonbranching closed profile through retained point comparisons,
   and rechecks counterclockwise simplicity and strictly positive radial bounds.
6. Uses the ordinary shared-edge incidence and shell connectivity checks.
   Cavity boundaries must be disjoint, strictly nested, and pairwise nonnested;
   their selected starting points remain retained during classification.

The convenience builder authors four angular cells with shared vertices and
edges. It does not serialize a trusted constructor tag. The same ordinary
validator admits cold archives and edited models. Native line/arc paths keep
existing carriers, including through the unified region's private native fast
path. No archive schema change or compatibility reader is added.

Restrictions remain explicit: a common meridian plane and exact similarity
projection, strictly positive radial enclosure, complete profile-domain coverage
and a single authored full turn. General shell admission, surface intersections,
nontrivial curved Booleans, differential rank-two regularity, fillets, shelling,
procedural STEP encoding and independent total heap/work/cancellation bounds
remain open. Conservative radial bounds can still reject a profile whose actual
image is positive; no broader positive-radius decision algorithm is claimed.
