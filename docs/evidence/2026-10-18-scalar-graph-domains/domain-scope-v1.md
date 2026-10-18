# First repair: demonstrably undefined native graph nodes

Current-revision diagnostic v2 reproduced acceptance and downstream panic for
Sqrt(-1) and AsinRational(2), and a certified zero for 0 * Inverse(0), through
both JSON and CBOR. These are native Computable domain violations, independent
of Real's named-class consistency problem.

The first production patch belongs to Node deserialization. Validate exact
rational operands of partial functions before publishing a Node. Nested
children are decoded first, so a zero multiplier or outer Real scale cannot
hide a rejected child. The check examines only existing rational leaves or
rational-valued variant parameters. It must not force refinement, build a
normal form, or reject a valid opaque operand because its domain is not
cheaply proven. Reuse exact_rational and exact rational comparisons.

Check inverse/cotangent zero, negative square/nth roots, nonpositive logarithm
inputs, inverse-trigonometric/hyperbolic domains, zero IntegralAtan denominator,
and the open unit interval of a rational normal-quantile input. The negative
acos rational variant stores an absolute argument. All current native nodes,
valid constructor round trips and the full original representation corpus stay.

This is a known-domain rejection step, not a proof that arbitrary imported
expression graphs are well-defined. Non-leaf domain obligations, series-range
invariants, quantile seed validation and named Class/payload consistency remain
open. The diagnostic's named-class counterexamples are retained as failures;
this step does not reclassify them as acceptable or complete boundary admission.
Resource limits and source scope remain those of contract-v1.md. No public
signature, valid wire layout or serialized output changes are intended.
