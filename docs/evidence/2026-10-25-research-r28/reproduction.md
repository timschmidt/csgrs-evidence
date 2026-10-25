# R28 reproduced routes before a production prototype

Frozen base: current primary HEAD plus retained research changes and R15 under
final combined validation. The exact source inventory/patch and untracked source
complement are in this record. Each private target belongs to one checkout.

All sixteen existing batch-benchmark fixture/policy invocations complete their
original checks. Native and elevated circles each make 202 line-fit requests:
all use RationalQuadraticBezier2; 180 are inside output coalescing and another
18 inside output construction. All decide NotLine. These requests create no
general-rational weight/control-reference vectors. Thus a RationalBezier2-only
shortcut would miss the measured output route. Capsules also make 96 general
rational circular requests outside output construction; each prepares both
reference vectors. Point-touch rectangles make no line-fit request in this run.

The complete instrumented Nano pipeline finishes with 268 DRC findings and six
release blockers, one completed pipeline and zero typed terminations. This does
not certify release readiness. Across that run, 31,351 native circular fit
requests occur outside output construction, 1,012 in output construction and
1,350 in coalescing. All decide NotLine. Another 5,363 general rational circular
requests occur outside output construction and prepare both reference vectors.
There are 734 weight-cache and 608 affine-control-cache materializations over
the whole run, outside output construction; these are not all attributable to
line fitting. Over a million cheap quadratic line-fit calls are protected easy
controls, not circular requests that the proposed guard can remove.

Instrumentation writes one line per fit, distorts stage timing, and ran beside
primary validation. Do not use these timings as native percentages or speedup
evidence. Existing benchmark boundary-count checks are also not a substitute
for an independent exact-output oracle. Both instrumented binaries are frozen
with digests, and the recorded source hashes remain unchanged.

The first five new independent acceptance tests pass on the unchanged fitter.
They cover the exact stereographic unit-circle formula, signed homogeneous
scales, degree elevation, rational and algebraic active restrictions, reversal,
source drop, point-fit preservation on collapsed provenance, retraced line and
circle images, finite mixed-sign weights, a common-zero singular chart,
similarity and exact line-offset continuation. Expanded baseline gates add
actual native arc producers at radius 2^-100 and strict/qualified/strict behavior
of an unresolved collapsed image. All seven expanded baseline tests pass, and the identical test source also
passes with the private prototype. The unresolved collapsed image stays
Certified Uncertain(RealSign), Approximate512Consumed NotLine, then Certified
Uncertain(RealSign), in both native and general rational forms.

The proposed narrow proof needs the existing weight/finiteness premise,
positive-radius retained circular authority and certified distinct endpoints.
Coordinate comparison can prove distinctness without expanding a squared
Euclidean distance. A declined proof must retain the original generic path.
The generic NotLine outcome itself is not a nonlinearity certificate: it also
covers coincident endpoints, including a point. A private production prototype now covers both rational fitters. It uses
strict coordinate comparisons for endpoint distinctness and retains the
original generic fallback. Native matched costs, whole-workflow exact output
comparison and full admission remain open; primary has no R28 code change.
