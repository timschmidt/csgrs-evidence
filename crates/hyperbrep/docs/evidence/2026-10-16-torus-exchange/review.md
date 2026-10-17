# Ownership and proof review

The new public surface is `Surface::toroidal_geometry()` and its borrowed
`TorusGeometry` frame/radii. It exposes existing authoritative geometry without
adding a carrier, changing topology or inventing an approximation policy.
`hyperbrep-io` owns Part 42 support entities, length/angle units, source parameter
maps and finite-decimal encoding. Native BREP owns whole-image admission, seams,
contact provenance, subdivision and archive replay. The scalar dependency
exception is justified by the reproduced repeated-subdivision failure below.

## Exact angle certificate

For a rational or pure quadratic tangent `t`, the existing principal inverse
angle normal form can use `s = sqrt(t²/(1+t²))` only when that positive root is
exactly rational. With `epsilon = sign(t)` (zero also admits the displayed zero
identity), `atan(t) = epsilon*(pi/2 - acos(s))`. This follows from the principal
branch `atan(t) in (-pi/2, pi/2)`; the test does not infer a sign from `t²`.
The old special case `sqrt(35)/35` belongs to this same domain.
The shared quadratic projection rejects negative square-root radicands before
returning a pure surd. Consequently the represented `t²` is nonnegative and
`1+t²` cannot be zero; the new rational division does not assume an unchecked
denominator or reinterpret an invalid square root as a real tangent.

Different rational arguments `a,b` can share one acos basis only when both are
nonnegative and the exact equation `a²+b²=1` holds. Then both angles lie in the
first quadrant and `acos(a)+acos(b)=pi/2`. Squared equality without the two signs
would be unsound; negative-quadrant and nearby-rational controls exercise that
boundary. Replayed expressions with cancelling pi factors use the existing
bounded Laurent projection, admitting only rational coefficients, pi and these
recognized inverse-angle atoms. Other forms retain the original unavailable
certificate result. Existing recognition budgets remain; this is not a proof
of total time, coefficient-size or retained-heap bounds.

The minimized serialized pair in
`hyperreal/tests/fixtures/torus-subdivision-angles.json` comes from this project's
own second native subdivision. Baseline and intermediate failures, source maps
and overlays preserve its provenance. No reference implementation or external
fixture was copied. The geometric test retains the original full rational band,
then performs four native split/reload cycles with independent exact volume.

## Native facts retained through composition

- A planar cut keeps its already validated affine preimage alongside the
  canonical edge root. All incident affine pcurves consume that representative;
  the canonical edge domain and selected contact remain intact. Extending the
  representation choice to all surfaces broke a preserved sphere/torus replay
  and was rejected. The existing nonplanar path is retained.
- An affine split parameter is replaced only when the scalar owner returns its
  exact rational normal form. This removes redundant quotients such as the
  midpoint of an irrational interval. Unrepresented or nonrational parameters
  are retained. No approximate coordinate or caller-side tolerance is used.
- Matching circle domains, centers, radii, direction, authored frames and phase
  prove the complete parameterized circle map. The new shortcut accepts only
  positive exact equalities; otherwise the old rotated-frame proofs still run.
- If ordinary periodic lifting is undecided or exhausted, equal endpoint sine
  and cosine certify congruence modulo tau. The already validated at-most-one-
  turn domain limits the possible preimages; the native lift function retains
  both seam endpoints. Other failures and unavailable certificates are unchanged.
  Reversed circle/ellipse arcs, distant 100-turn phases, tangencies and exact
  `1/10^12` perturbations are covered.

The attempted BREP multiplier cascade is rejected. Its second-subdivision phase
still failed; the scalar normal form is the sufficient shared owner. Removing
every native fact after that repair also failed. The retained combination is
therefore smaller than the attempted cascade and is checked through independent
native, archive and STEP consumers, not only the scalar minimized case.

## STEP admission

Both torus coordinates use the document's plane-angle unit; neither uses the
length unit. The writer emits exact placement, major/minor radii and identity
angular maps in radians. A reflected native frame is already normalized by the
native geometry authority. The reader distinguishes invalid nonpositive radii
from unsupported positive horn/spindle surfaces.

The reader constructs latitude/meridian UV candidates from native circle
incidence and orientation. A loop retains its continuous periodic lift, then
translates by an exact period into the finite native chart if possible. Endpoint
extrema suffice because these pcurves are affine lines. The native whole-image
validator still checks every candidate against its spatial edge; endpoint
agreement alone is not admission. Opposite 0/tau seam bounds retain distinct
coordinates and must belong to the same angular axis and support surface.
Supplied pcurves retain independently scaled/offset source maps for both axes.
Other traces and loops requiring additional periodic subdivision fail typed.

`ImportLimits` failure followed by recovery is covered. A zero solver
`WorkBudget` can validly complete these analytic paths without consuming a
refinement or promotion. Neither fact establishes a total-work or heap bound.

## Qualification scope

The full benchmark campaign completes all 105 processes but its original
no-migration gate rejects five changed archive receipts. A separate reproduction
captures all 173 result archives behind those rows using each side's original
acceptance helpers, measured dependency versions and compiler feature/profile
configuration. Reconstructed receipts match all three timed trials. 113 archive
pairs are byte-identical; 60 change only 238 affine pcurve start-coordinate
scalar expressions. Every changed scalar passes direct strict equality; the
comparison's conditional sine/cosine proof is never needed. Every non-scalar
field agrees, and both versions of every changed complete archive revalidate
and serialize identically on the candidate.

For example, a general Computable expression for pi/6 becomes a Pi-class value
with exact coefficient 1/6. The retained contact and rational split facts choose
equivalent scalar representatives without changing topology, carriers, domains
or correspondence structure. This is an explicit canonical-expression migration
for the exact feature extension, not an unchanged-byte performance optimization.
The [five-row decision](approved-receipt-migrations.json), full old/new archives,
raw failed gate and every unfavorable cost remain. The other 162 benchmark
receipts and the separately retained 54 STEP/prism artifacts are unchanged.

Two original rationally rotated sector diagnostics improve from undecided to
native construction/replay. Their separate full-size native probe proves
independent measures and points through further split, recut, clear and empty
recovery. The torus volume assertion uses equality after exact division by a
strictly positive pi when the direct expression is undecided. Its direct
predicate limitation remains; the comparison consumes a new exact proof of the
same equation, not an approximate value.

The growth probe uses an independent initial analytic area and then nine exact
component equalities per subdivision. Equal face counts and pairwise equal
areas imply equal sums; induction preserves the initial analytic total across
all four cycles. This is stronger than a total-only check because compensating
face errors cannot pass. The aggregate scalar comparison remains unknown in
those cycles. The original failed probes, the unsuccessful pi normalization,
all component receipts and the diagnostic serialized measure pairs are retained.
This mathematical test argument does not claim a new public aggregate-scalar
certificate or general resource bound.

The final manifest must bind the exact source, retained failed prototypes,
focused and downstream checks, original benchmark receipts, new absolute
workflow costs, reconstructed dependency comparison and raw adverse samples.
Exact measures and point classifications are independent semantic checks;
checksums establish determinism separately. OCCT checks interoperability using
floating-point geometry and do not certify exact source fidelity. WASM source
execution does not close package, MSRV or actual language-binding delivery.
All 28 work packages and unexecuted broader admission gates remain open.
