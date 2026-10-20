# Exact witnesses and scope

The owner and required continuation were declared in [contract.md](contract.md).
This record describes executable invariants and finite tests. It is not a formal
verification result or proof of all input families.

A planar spatial source is P(s)=o+u*x(t)+v*y(t), with t=a+(b-a)*s. A selected
s retains its defining root and isolation evidence. `Parameter::affine_image`
transports that evidence into the original planar chart. Hypercurve constructs
the planar point; the spatial point retains it, its source and the original s.
No independent x, y or z scalar is required. An injective spatial frame does
not assert that the curve is injective, finite throughout its domain, or a solid.

A spatial linear form d.P-r becomes (d.u)*x+(d.v)*y+(d.o-r). The new
`CurvePointAffineForm2` owns one original point and exact coefficients. Shared
sources subtract coefficients before elimination. Native algebraic points use
their selected rational evaluator. Analytic parallels use the existing source
field, denominator sign and positive normal-speed square root. Similarity
images pull the form back through their retained transform. Unlike forms reuse
existing correlated point predicates through exact similarity images. Other
retained point families delegate to the existing linear-form predicate; their
entire infinite domains are not newly certified by this finite corpus.

For a parallel represented as (X/W,Y/W)+(H_x*d_t-H_y*d_n,
H_x*d_n+H_y*d_t)/sqrt(S)+translation, S=H_x^2+H_y^2, the form has numerator
A*sqrt(S)+W*B and denominator W*sqrt(S). Here
A=a*X+b*Y+(a*tx+b*ty-r)*W and
B=H_x*(a*d_t+b*d_n)+H_y*(b*d_t-a*d_n).
The existing radical-sign predicate keeps the positive speed sheet; signs of
W and pre-squared terms are retained. Axis queries use the same proof and
borrow their original coordinate polynomial. Source singularities and poles
retain the owning query's typed failure. Conservative boxes are only enclosures.

The independent selected polynomial oracle is 2t^3=1, 3/4<t<7/8, P=(t,t^3).
In frame o=(5,-2,7), u=(2,1,-1), v=(1,3,2), X=11/2+2t and Z=8-t.
Thus X+2Z=43/2 and X-Y+Z=14. A separately authored spatial cubic supplies the
same full polynomial, and independently rebuilt roots test non-shared evidence.
Owner checks cover exact cancellation, a 1e-1000 nonzero perturbation, symbolic
pi and sqrt(2) coefficients, independent transforms, constant forms and policy
reuse. An actual diagonal contact of a quadratic left parallel satisfies
x+y=3; the opposite normal sheet is strictly below it, and +/-1e-12 stays distinct.

Cold edge replay first checks retained endpoint correspondence. For a selected
planar trim it then compares the complete source, plane frame and inverse
unit-chart map. Equal underlying parallel definitions can have different trim
ranges; the checked endpoint map supplies the actual restriction. The proof
must succeed before admission, and a forged pcurve distance is rejected as
`EdgeUseSupportMismatch`. No trusted flag or sampled endpoint substitutes for it.

Consecutive, equally directed parallel pieces can share a simpler proof image
only when their supports and adjoining parameters agree and Hypercurve proves
the joined range injective. Missing regularity/injectivity evidence keeps the
pieces. Interior cusps stay split. All original topology records remain in the
model. A nodal source proves why a unit-chart injectivity fact must not be
borrowed for an exterior range with a self-contact.

A complete prism certificate with horizontal u,v and vertical extrusion e
proves R x [min(o.z,o.z+e.z),max(o.z,o.z+e.z)]. The selected-vertex Boolean path
uses that certificate and its complete profile, without demanding scalar
vertex coordinates. The original nonlinear cap is split twice at independent
selected roots, cold-replayed, transformed and consumed by repeated slab
intersection, difference, reunion, two-sided set equality and empty identities.
Independent point locations and exact 1e-12 offsets check material semantics;
two opposite edge uses check shell incidence. Missing closed-form metrics do
not invalidate the exact solid.

A rational source with W=2t^3-1 has a pole at the selected query. Definition
storage and native replay succeed, while selected point evaluation and bounds
fail typed. Finite endpoints and a subsequent finite curve still work. Budget
checks separately require cold root isolation to exhaust at zero work and
recover afterward. Weak-reference tests check that dropping the last selected
spatial point releases its source. These tests do not establish heap-byte,
coefficient-growth, total-work or cancellation bounds.
