# Rational constant admission before materialization

Base 4f14251e3097726a267e3840c13a9c84fbfe0517. Previous turn was progress:
owned ExpressionField images/Jacobians and independent isolated core commit.
Owning layers: Hyperreal immutable rational representation; Hyperinterval exact
rational-to-dyadic conversion; Hypersolve and Hyperdynamics consume that conversion.
P1-P6, P19-P20, P36-P37. Missing witness: a rational constant larger than the
configured native scalar budget must be rejected before coefficient-sized copies,
GCD/canonicalization, scaled arithmetic or result materialization.

Current source calls Real::certified_dyadic_interval before native conversion
checks. Even round_rational calls canonicalizing numerator()/denominator() before
its first reservation. Reproduce allocation on the current revision before edits.
Add a borrowed, potentially unreduced ratio view at its owning layer; preserve
existing canonical getters. Reuse native round_rational/scaled_quotient. Add a
native from_rational conversion and route structurally rational Real constants
through it. Preserve exact outward grid bounds, signs and all symbolic behavior.
Retain original precision admission for from_real's symbolic path. This changes
resource handling and avoids unbudgeted rational materialization; it is not a
behavior-preserving refactor or a general computable-real resource bound.

Cover positive/negative/zero, grid and nongrid fractions, large input magnitudes,
lazy unreduced values, exact consumed-work boundaries, tiny budgets, retry,
precision extremes, independent integer/GMP expectations, native further use,
expression/field images and fresh replay. Track graph/scalar budget differences,
dispatch traces, allocation and completed-workload costs; do not weaken existing
assertions. Preserve the separately staged dynamics/Interface changes. General
symbolic refinement, ingress/serde, payload lifecycle and heap bounds remain open.
