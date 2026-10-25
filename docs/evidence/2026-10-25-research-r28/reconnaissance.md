# R28 source reconnaissance, no implementation or admission

RationalBezier2::fit_exact_line_image_with_policy first accepts an already
retained exact line image, then allocates a weights-reference vector, proves
same nonzero weight sign, obtains affine controls, allocates a control-reference
vector, and performs endpoint/collinearity/segment membership checks.

A retained circle tag alone is inadequate. Existing
injectivity_certificates_own_their_domain_and_circle_chart constructs a collapsed
[1/2,1/2] restriction that still retains circular provenance, and a retraced
rational circle whose support equation does not establish injectivity.
BezierSubcurve2::certified_injective_image checks nondegenerate quadratic chart
recovery plus distinct endpoints before using circular injectivity. Arbitrary
retained-circle provenance is not such a chart. RationalBezier lineage retains
root injectivity separately from each active ParamRange.

The old line-fit API also treats mixed weight signs as Unsupported even for
some finite charts; replacing that failure with NotLine would change its result
contract. R28 explicitly requires unchanged fit/terminal/error semantics. Any
candidate must preserve that distinction and point fitting, while proving a
nonconstant connected finite circle image before avoiding generic preparation.
This read-only reconnaissance is not reproduction of the historical cost, an
acceptance test, or evidence of a useful shortcut. A private baseline allocation
and output-stage trace must precede code changes.
