# R28 contract and missing gates (no code change)

Owner: Hypercurve's exact line-image fitting and retained circular-image
authority. Relevant properties P1-P4, P8-P11, P14-P20 and P35/P36. The proposed
domain is a proved finite connected active rational circle image with positive
radius and a nonconstant image certificate. Mere support provenance is not that
certificate. Preserve the existing exact line accelerator, predicate policy,
certainty, fit/terminal/error outcomes, and exact continuation.

The current line fitter first accepts a retained exact segment, then prepares
weight references, proves a common nonzero sign, prepares affine control
references and checks the control polygon. Before implementation, reproduce
the claimed cost at the actual two-circle/board output stage and retain exact
before/after allocation and outcome rows. A historical percentage is not current
evidence. Candidate work must be isolated from the R15 timing campaign.

Missing acceptance matrix: native and degree-elevated circles; ordinary and
selected restrictions; reversal and similarity; all-negative and mixed weights;
collapsed restrictions carrying circle provenance; retraced lines and circles;
poles/singular charts and unproved active intervals; unrelated line, point and
noncircular curves. A nonlinear capability must not suppress point fitting on
a collapsed image. Existing injectivity may prove nonconstancy only when its
active-domain and nonempty-range obligations actually hold.

One API distinction found during reconnaissance matters to the oracle:
`fit_control_polygon_line_image` returns NotLine when its endpoints coincide,
including an actual constant point, because its Fit result contains a nonzero
LineSeg2. The separate point-image fitter must still accept that constant.
Therefore NotLine is not by itself a certificate of a nonlinear image, despite
the enum comment describing an off-segment control. Do not build the proposed
tri-state capability by treating every existing NotLine as nonlinearity.

Mixed weight signs currently produce Unsupported before generic point checks.
The performance-only experiment must preserve that result; a separate capability
extension would need its own declared contract. Count avoided preparation and
materialization and measure complete output workflows, with protected easy
controls under the literal latency rule. No global fit cache or new public
support abstraction is required by this experiment.

Current reproduction (trace-1792951455172203708): all 16 existing benchmark
fixture/policy invocations complete with their original count checks. Native
and degree-elevated circle runs each make 202 line-fit calls: all are
RationalQuadraticBezier2, with 180 inside output coalescing and 18 elsewhere
in the output stage. All decide NotLine; no general rational reference vectors
or affine/weight cache materializations occur there. Capsules also make 96
general rational calls outside the output stage, allocating both reference
vectors each time. Accordingly, a general-rational-only shortcut would miss
the reproduced two-circle output cost. The candidate must cover the actual
quadratic rational fitter as well, sharing the narrow circle proof.

These are route counts and instrumented timings, not native cost percentages
or a new exact oracle. Existing benchmark count agreement is not proof of
set equality. No production candidate has been implemented yet.
