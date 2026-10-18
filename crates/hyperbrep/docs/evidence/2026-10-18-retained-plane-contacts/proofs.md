# Finite admission witnesses

These arguments define the independent expectations exercised by the shared
tests. The final qualification record identifies which source passed them.

For a native rational curve with positive weights, a plane equation along the
curve is `f(t)=N(t)/W(t)`. Its Bernstein numerator coefficients are
`w_i * n·(P_i-O)`. Positive weights prove `W>0` on the unit interval. Therefore
the complete zeros of `N` are exactly the finite contacts, and at a zero
`N'=W*f'`. Hypercurve owns root isolation and derivative queries; BRep supplies
the spatial equation. The selected parameter evaluates the original spatial
curve, preserving correlation among coordinates. No coordinate is independently
approximated or used to reconstruct a selector.

The cubic numerator `2t^3-1` has exactly one root in `(3/4,4/5)` and a positive
derivative there. Its nonunit NURBS chart maps that interval to `(17/4,22/5)`.
Positive, unequal weights change the rational image but preserve the authored
numerator test. The degree-five polynomial `32t^5-2t-1` has one positive root
in `(1/2,3/4)`. Complete root tests also use three rational roots `1/4,1/2,3/4`,
the odd repeated root of `(2t-1)^3`, repeated and simple endpoints of
`-3t^2(1-t)`, and two distinct positive roots of
`(t^2-1/8)(t^2-1/2)` whose spatial images are the same origin. A zero first
derivative does not establish that the curve fails to cross the plane.

NURBS spans solve their complete local equations and map roots into the
original knot chart. Contacts at one shared parameter are deduplicated; separate
visits to one spatial point remain separate. Identically zero spans contribute
closed ranges, adjacent ranges merge, and ranges own their endpoint contacts.
Transported closed overlap endpoints must also have usable original-source
point images on the plane. A degree-one planar NURBS with a full-multiplicity
joint can end its left span at `(0,1)` and begin the right at `(1,1)`. The owner
reports `Boundary` for its ambiguous global-knot point; a left-span coincidence
with `x=0` must not publish a closed range hiding that ambiguity. The owner's
whole-overlap proof covers the interior; endpoint checks supplement that proof
when transporting its chart. Both directions retain the typed blocker, the
unambiguous `x=3/2` contact and the finite left subcurve's exact containment.

The degree-one fixture has exactly ranges `[2,3]`, `[11,13]` and isolated
parameter `6`. A C0 joint with a repeated root on one incident span keeps that
classification even when the other span has a nonzero first derivative.

For a planar image `O+u*x(t)+v*y(t)`, a target plane reduces to
`a*x+b*y+c=0`. Source bounds supply a finite line covering every possible
contact. Extending one bound coordinate by an exact unit places its endpoints
strictly outside the conservative source enclosure; this is not a coincidence
tolerance. Hypercurve retains all isolated contacts, overlaps and collapsed
parameter components. Its span-chart conversion maps local overlap endpoints
to the authored curve before BRep maps them to the spatial chart. A missing
transverse certificate is never treated as a zero derivative. Native spline
joints explicitly query both consumed sides.

Proof queries restrict the planar source to the spatial curve's actual interval
without changing that source chart. The signed-weight fixture has
`W=2t^3-1`, so its whole unit domain has a pole and cannot yield an empty or
contained success. Its subrange `[0,1/2]` is finite. On that range the selected
`x=1/2` contact, bounds, endpoint inverse query and archive replay must succeed
in both traversal directions. A collapsed planar span contributes every source
parameter in its range, not one arbitrary representative. Trimmed NURBS tests
independently derive the transported isolated parameter `23/66` and overlap
ranges `[0,1/22]` and `[169/198,1]`.

A contained planar image materializes a pcurve only when projection of its
frame admits an exact owner similarity. The returned source interval is not
rebased; an explicit signed affine map relates it to spatial parameters. For
plane origin `(5,-3,0)` and axes `(0,2,0)`, `(-2,0,0)`, the independent inverse
is `U=(y+3)/2`, `V=(5-x)/2`. Reversed, exterior and restricted source charts
must preserve these coordinates. A retained projection with source `t=-1+3s`,
restricted to spatial `[1/4,3/4]`, retains source `[-1/4,5/4]`; reversal gives
`t=2-3s`. An anisotropic parameter-plane transform remains the owner's typed
`InvalidSimilarityTransform`, never a fitted or approximate pcurve.

Axis clearance uses two independent planes through the revolution axis. Being
on the first plane does not prove being on the axis. Quadratic and selected
cubic examples distinguish positive radial clearance from an actual common
selected zero. A coincident double-cone generator clipped to the upper cone's
apex is a finite boundary contact, not an isolated root of its identically zero
supporting equation.

Coefficient-only boundary mapping may reuse an already supplied represented
parameter after proving it equals a retained contact. The quartic equation
`(2t^2-1)(t^2+1)` selects its positive real root without a scalar view;
`observed=sqrt(1/2)` is valid, while `observed=0` must fail. This exact equality
check never invents a nearest-root scalar conversion.

The original full nonlinear parallel cap is split at an actual plane contact.
The new vertex must equal the retained contact, both incident edge uses must
remain opposite, and cold replay must preserve the solid. A slab cut yields two
outer pieces and one middle piece with independently specified inside/outside
samples. Reunion, both directed set differences, self-subtraction and empty
recovery follow. Affine-frame and `1e-12`/`1e-1000` controls test exact separation.
Native archives repeat deterministically; this is separate from set equality.
STEP tests distinguish a representable unsplit cube from selected-vertex
encoding failure, and verify attributed errors and native recovery after replay.
The selected cube reports `UnmaterializedPoint`; the cap fixture reports
`NonRational` for an unencodable represented coefficient. These existing IO
diagnostics remain distinct.

Strict/approximate/strict ambient scopes preserve certified local query meaning.
Instrumented zero-work exhaustion is tested with subsequent recovery. External
timeouts contain checks; neither these tests nor the existing work counters
bound all degree-dependent work, coefficient growth, retained heap or cancellation.
