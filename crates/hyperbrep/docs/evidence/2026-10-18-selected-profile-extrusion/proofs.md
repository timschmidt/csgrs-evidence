# Proof ownership and limits

`Curve2::native_image()` proves an oriented complete image. It borrows stored
native geometry or first reuses the existing strict line/arc image proof. For
one retained Bezier restriction, the shared Hypercurve helper performs exact
affine parameter substitution. Quadratic algebraic endpoints replay their
polynomial and isolator through the existing selected-root view. Rational
sources reuse the existing denominator-root exclusion in the substituted chart.
There is no new approximation, endpoint chord, persistent memo or scalar-field
conversion. The original source, selected parameters and root caches remain
available through the borrowed source. A native chart can differ from the
source chart; the API does not claim parameter-by-parameter equality across
those charts, simplicity, or certification of earlier approximate intent.

The original parabola is `x=4t-2`, `y=x²`. Its selected endpoints satisfy
`8t²-8t+1=0` and have exact views `(2±sqrt(2))/4`. Substitution gives the full
quadratic controls `(-sqrt(2),2),(0,-2),(sqrt(2),2)`. Tests compare those complete
coefficients and independent interior evaluations, in both directions. A
separate nonmonotone quartic keeps its degree and parameterized polynomial;
endpoint agreement alone would miss its traversal. A weighted cubic compares
independent homogeneous numerators and denominator, including reversal. An
unavailable cubic-algebraic endpoint remains a typed blocker with its original
root evidence intact.

Hypercurve also owns area integration of a represented native restriction.
The difference area is the integral of `2-x²` from `-sqrt(2)` to `sqrt(2)`,
namely `8sqrt(2)/3`. The XOR area follows from `A+B-2(A intersection B)`:
`22/3+16sqrt(2)/3`. The planar affine map has determinant -6; the independent
3D map has determinant -12. These identities, exact classifications and
near-boundary offsets are semantic checks independent of archive checksums.

HyperBRep consumes the exact image for lifting. Existing whole-wire, cap,
shell, incidence and orientation validation remains mandatory. Its native
archive retains the resulting exact geometry and replays validity; it does
not yet persist the complete planar authoring/selection graph. Native image
proof and complete source-history persistence are different obligations.

For certified product solids `A×I` and `B×J`, an empty regularized planar
intersection implies their regularized difference is `A×I`. A union may retain
both closed solids only after each operand has one planar material component
and the exact planar union has two. Empty intersection alone does not exclude
a shared face requiring stitching. This additional continuation is attempted
only after the existing optimized and intersection-graph paths fail with the
documented slab incompatibility. Common-profile interval operations keep their
existing rule. Shared-face, positive-gap and tiny-positive-overlap controls
have separate exact expectations; no bounds or tolerance substitute for the
complete planar proofs.

HyperBRep IO retains `NonRational` for the fixture's irrational STEP Cartesian
vertices. No successful STEP artifact is claimed for these profiles. Existing
finite-decimal exchanges remain separate preserved contracts. Runtime WASM
checks execute source-path consumers with zero imports; they do not establish
published JavaScript bindings, registry installation or MSRV delivery.

The new image introduces no persistent cache. Tests inspect selected-root
intervals and scalar caches before/after strict–approximate–strict requests,
reversal and queries. BRep tests include deliberately small outer budgets and
full-budget recovery; an already sufficient strict proof is allowed to finish
without refinement. Existing context counters do not bound coefficient bits,
all allocation, total recursive work or cancellation. Process timeouts provide
external containment, not an internal resource guarantee.
