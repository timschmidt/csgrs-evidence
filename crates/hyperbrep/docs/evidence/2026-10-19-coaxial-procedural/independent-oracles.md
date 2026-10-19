# Independent exact expectations

The original quadratic cap is kept unchanged, including its quadratic straight
closing curves. Its source is `B(t)=(4t,4t(1-t))`. The unit left parallel is
`C(t)=(4t-(1-2t)/sqrt(1+(1-2t)^2), 4t(1-t)+1/sqrt(1+(1-2t)^2))` for `0<=t<=1`.
Its abscissa is strictly increasing, its endpoints are `(-1/sqrt(2),1/sqrt(2))`
and `(4+1/sqrt(2),1/sqrt(2))`, its top stays in `0<z<=2`, and its bottom is `z=-2`.
Shifting the radial coordinate by three proves the tested `z=0` interior samples
and positive axis clearance without calling a second Boolean wrapper. The
original selected cap is its exact intersection with `0<=x<=1`, hence has
`3<=r<=4` after the shift. The second radial cuts keep the strict subintervals
`[4,6]` or `[13/4,15/4]`. Exact inside/boundary/outside rows follow from interval
membership. `z=5/2` is above either cap and `z=-2` is its bottom boundary.

The overlapping annular tool has radial interval `[4,6]` and height `[-3,3]`.
Union includes both its top/bottom and the original cap's side lobes. XOR has
four connected volume interiors: two side lobes and the tool above/below the
cap. They may meet at boundary circles; no positive-volume overlap remains.
Classification rows supplement component counts. Directed differences certify
reconstruction and commutativity, separately from archive determinism.

The arc profile is the disk `(r-3)^2+z^2<=1`; at `z=0` its radial interior is
`2<r<4`. The quadratic NURBS with controls `(4,0),(5,1),(4,2)`, unit weights and
knots `000111` has `r=4+2t-2t^2`, `z=2t`. At `z=1` its outer radius is `9/2`.
The selected contacts at `r=17/4` have the independent exact values
`z=1 +/- sqrt(1/2)`. Both contact orders and both selected roots must replay and
coincide with these points. Cold BRep archives must re-encode byte-for-byte.

The contained rectangle `9/2<=r<=11/2, -1<=z<=0` gives one cavity; subtraction
and contained XOR have the same exact set. Tests distinguish points separated
by `1/10^12`, refill from cold archives, and consume the empty identities.
A common rational oblique similarity of scale two, with and without reflection,
preserves these expectations. Counteroriented axes and an axial origin shift
are exercised before that common transform. A transverse axis shift of
`1/10^12` is not admitted as coaxial and must retain its fallback error.

The owner supporting-line regression intersects independent cube/fifth roots
on orthogonal supports and checks both retained coordinate parameters. Separate
represented supports intersect at `(2,0)` outside both finite witnesses. Endpoint
reversal and support swapping preserve the point; parallel/coincident and
zero-length supports fail typed. A near-parallel exact line pair intersects at
abscissa `10^12` rather than being tolerance-merged. Nested replay has exact
abscissa `depth+1` at depths 1,2,4,8 and consumes `3+4*depth` records for its one
pcurve; one fewer record must exhaust before scalar decoding.

All set identities still share the production kernel and therefore supplement,
rather than replace, these independently derived values. Exact assertions,
ordinary topology admission, retained-carrier assertions, byte comparisons and
actual WASM execution establish different parts of the finite contract.

Reproducibility has a separate regression: 32 independent cold admissions each
of the original polygon and NURBS solid archive must recover the identical
exact curve sequence and re-encode the same bytes. Three additional fresh
native processes run the unchanged full overlapping union/XOR, native-profile,
and transformed-axis recipes and compare all 11 output files. These sequence
and byte checks do not substitute for the independent set-membership rows.
