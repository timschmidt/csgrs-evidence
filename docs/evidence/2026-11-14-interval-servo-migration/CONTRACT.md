# Servo arithmetic admission

Target: firmware 953ed4b7e8059288abe5146cfd68400f0961587e, core
 dd3c246b4 (full identities/statuses in BASELINE.json). Phase 9 requires
position interval delegation and exact differential servo behavior.

Owner: Hyperinterval fixed midpoint, width and Minkowski subtraction;
Alumina owns position scale, observations, widened error carriers, service
ordering, fault latches and control policy. Properties P1, P5, P6, P18–P20,
P27 and P31–P33 apply. Arithmetic is fixed finite work, no allocation/global
state, and no scalar predicates or policy dispatch are introduced.

Domain: all ordered pairs of i64 Q31.32 position numerators, all i32 Q2.30
velocity numerators and target points. Preserve const constructors and endpoint
accessors, layout, lower-rounded midpoint, full u64 width, and typed invalid
order/arithmetic errors. Velocity errors widen to i64 before subtraction.
Position errors retain i128; the existing generic fixed family is sealed to
i32/i64 and must not narrow these proofs. No new fixed i128 multiplication
contract is inferred from an endpoint-only difference.

Missing witness on this revision: independent endpoint-grid midpoint/width,
full-width position/velocity error differences and output-as-input replay.
Existing tests cover only selected extremes. Add these witnesses before
implementation and run against baseline. Compare complete control reports and
fault/state transitions across isolated baseline/candidate consumers, then
qualify host timing, emitted text/binary, target build and no allocation.
Device cycle/stack/HIL and final firmware image gates remain unmeasured; host
results cannot close those obligations. Do not retain a measured cost regression
silently. Preserve all existing staged work and frozen evidence.

The initial candidate reproduces a 27% position accessor slowdown and +192
bytes native text. Inlining alone leaves a small slowdown; hull reconstruction
is worse. Before changing the owning core, reuse audit finds IntegerRange's
existing unsigned-distance midpoint algorithm. Share that arithmetic with fixed
midpoints through private Bounds machinery, preserving integer evaluation
order and all rounding modes. Fixed width uses exact abs_diff as integer width
already does. Half the maximal unsigned distance fits the signed endpoint;
lower plus that half lies in the ordered interval. Increment is at most one
and only for odd width, so remains representable. Missing acceptance: all
fixed scales/roundings at full-range signed extremes, empty and generated
midpoint outputs, compared with an independently widened rational expectation.
