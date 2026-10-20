# Differential ownership and exactness

The clean b5988e6c0 baseline constructs the complete 3x3 interior circle but
rejects both regular pcurve and spatial derivatives. The baseline success
probe is retained unchanged; its candidate copy changes only the new Parameter
argument and manifest destination.

Hypercurve owns GraphDifferential and CoordinateJet. For F(x,y)=0 with Fy != 0,
let delta(P)=Fy*Px-Fx*Py. Along the branch, dP/dx=delta(P)/Fy. For N/W, the
first numerator is A1=delta(N)*W-N*delta(W), with denominator W^2*Fy. At order
k>=1, Ak has denominator W^(k+1)*Fy^(2k-1), and

    A(k+1) = delta(Ak)*W*Fy
             - Ak*((k+1)*delta(W)*Fy+(2k-1)*W*delta(Fy)).

The implementation advances those factors, so denominator degrees grow linearly
in order rather than being doubled at each quotient differentiation. This is an
algebraic recurrence argument, not a timing claim or formal verification result.
The original map guards were admitted over the whole source rectangle. Selected
point evaluation and every new denominator are checked in that same joint field.
No common factor is cancelled to authorize evaluation at an original pole.

Each vector is a rational image of the selected source point, with shared
coordinates, original relation and fiber selector. Public coordinate images and
rational forms reuse the existing point-query/replay owner. Native selected
Bezier tangent images also expose their common parameter expression to that
owner, including the span's derivative scale. Selected parallel vectors retain
velocity, acceleration, distance and the certified speed-ratio sign: zero-RHS
linear signs are supported; radical magnitude queries remain typed blockers.

At a smooth vertical event, (Fy,-Fx) is nonzero. The certified open projection
slab has no Fy zero, so its selected sample fixes the sign of Fy throughout the
incident branch. That sign orients the tangent toward increasing source x. The
rational-image Jacobian transports it without division by Fy. A zero image
differential or zero gradient is an unsupported limit, never a zero tangent.
A finite derivative can exist at a singular event; this increment does not
claim to compute that limit or prove all such derivatives unbounded.

BRep GeometricVector3 stores represented coordinates, a planar joint vector
and frame, or a native derivative recipe with the original curve/parameter/order.
Construction checks both native coordinate projections before publication;
linear queries project the original 3D controls once and use the same selected
parameter. Affine transport composes an exact linear action, excluding translation.
The source is not replaced by independent coordinate roots. These immutable
recipes do not add a cache or a native archive tag. Cold model replay rebuilds
curve authority and re-runs differential proofs; replaying a coordinate-image
point certifies its value, not an independently serialized tangent claim.

Curve3::derivative_at now accepts &Parameter and returns GeometricVector3.
try_coordinates() is explicit and optional. CurveDerivative3::vector() is removed;
all local and STEP consumers are migrated directly. Hypercurve branch reversal
preserves source coordinates, whereas BRep reverses its public chart. That chart
may be negated (selected endpoints) or reflected around represented endpoint
sum. Tests initially assumed a unit reflection and failed out of domain; the
corrected tests transport through the public exact chart and independently
assert derivative scale and reversed tangent sign. Parameter::affine_image is
public and always enters the strict BRep context.

No trimmed faces or closed curved Boolean results are claimed. General vector
products, selected surface normals/partials and singular branch germs remain
separate next dependencies. Solver controls and the jet-vector reservation are
not total work, coefficient-bit, live-heap, stack or cancellation bounds.

A supplementary immutable native/WASM consumer exercises the final 2D similarity
field and the path that absorbs that similarity into a subsequent rational map.
Its independent center-fiber first/second/third derivatives verify translation,
rotation, scale and composition order through spatial lift and cold replay. The
production freeze is unchanged; its separate source manifest and recipe are
retained with the evidence. One early compile overlapped an API edit and saw
older private-method metadata; it is diagnostic only. All qualification claims
use the final immutable source snapshot.
