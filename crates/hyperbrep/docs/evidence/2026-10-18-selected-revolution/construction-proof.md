# Retained rotation and selected revolution proof obligations

For an exact point P, an authored point C on a unit axis a, and angle theta,
write d=P-C, h=a dot d, r=d-a*h. The implemented image is
C+a*h+r*cos(theta)+(a cross r)*sin(theta). The matrix columns and translation
reuse the existing BRep rotation primitives. Applying that affine matrix to
GeometricPoint3 retains its selected source and parameter; it does not replace
P with independently rounded or reconstructed coordinates.

The vectors a cross e_i span the plane perpendicular to the nonzero unit axis.
One certified nonzero value (a cross e_i) dot (P-C) proves r is nonzero.
All three certified zeros prove a singular orbit. Unknown is retained unless
another linear form establishes separation. A unit axis, nonzero radius and an
angular chart with derivative +1 or -1 prove a regular circular orbit with period
tau. The closed-edge validator also requires the exact domain span tau; endpoint
coincidence alone never admits a closed spline or constant curve.

A rotation's angular chart is theta=s*t+b, s in {-1,+1}. Reversal on [l,h]
changes it to -s*t+(s*(l+h)+b); restriction retains s and b. For a similarity
with linear part Q, scale lambda>0, and orientation sigma, the transported axis
is sigma*Q*a/lambda. This axial-vector transformation preserves handedness under
reflection. Surface revolution charts use the ordinary transformed axis and
reflect their u coordinate; complete image comparison accounts for the
opposite-axis/opposite-angle equivalence.

Conservative bounds share the established full-revolution bounding routine.
Axial extrema are linear extrema over the point's exact enclosing box; the
maximum squared radial distance is a convex quadratic and is bounded by its
maximum over box vertices. A coordinate's radial extent is at most
radius*sqrt(1-a_i^2). Partial orbits deliberately retain full-orbit enclosures.
These bounds are not authoritative point coordinates or a global embedding
certificate.

The boundary pcurves are exact lines. Equality of their orthogonal endpoint
coordinate proves constancy along the whole line. Existing endpoint
correspondence checks prove the directed interval mapping. A constant v
boundary is compared to the complete retained orbit of profile(v); a constant
u boundary is compared to the complete rotated profile or its reversed chart.
No sampled image test or serialized certificate flag substitutes for these
identities. The ordinary face builder performs the same checks on cold import.

Complete axis clearance of the selected profile reduces to intersection with
two independent planes through the axis. Hypercurve owns complete finite planar
contacts and selected-point predicates. Isolated first-plane contacts are
checked on the second plane; a profile contained in the first plane is tested
against the second. Incomplete/unsupported contact representations remain typed
failures. Both convenience construction and coordinate-revolution face admission
require this full interval proof. The regression that bypasses the convenience
constructor was observed to admit an interior axis crossing before the common
face check was added.

These obligations establish the finite carrier, its boundary images and axis
clearance. They do not establish rank-two regularity for every possible spatial
profile, global surface injectivity, shell embedding, a manifold solid, general
curved arrangements, STEP representation, or CAD completion. Selected angular
parameters, general affine transforms, retained vector derivatives, inverse
rotation parameter queries and general rotation intersections remain explicit
frontiers. Existing total-work, memory, coefficient-growth and cancellation
limitations are not closed by syntax admission or finite tests.
