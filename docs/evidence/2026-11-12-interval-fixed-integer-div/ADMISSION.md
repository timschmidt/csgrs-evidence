# Fixed exact-integer divisor admission

Baseline 434b6e09a1b8edae9df7764254eb07442342dc0c; all four managed repos
clean. Owner Hyperinterval fixed arithmetic, consumer Hyperlattice's FOC
conformance client. P1, P5–P7, P18–P20, P31–P33; plan fixed specialization.
Add div_integer(i64): tight outward enclosure of self / integer. The divisor
is an exact mathematical integer, not a fixed numerator; it need not fit as a
point of the source family. All valid i32/i64 scales and i64 divisors, empty
sets, signed extremes and zero divisor. Zero is rejected even for empty;
negative divisors reverse order. MIN / -1 reports Overflow when needed.
Use widened i128 normalization and the existing quotient_bounds/from_wide; no
new directed-rounding helper or changes to existing arithmetic/dispatch.
Missing witness: this method cannot compile; at maximal fractional scales,
even nonzero integer division cannot be expressed through checked_div with a
point denominator. Constant bounded arithmetic, no allocation, typed errors.
The new FOC client may consume the operation only with unchanged full outputs
and errors. Preserve original Clarke and Park hard cases. Reproduce baseline
cost on the target revision, compare completed contracts and binary sizes.
Measure each change separately before considering additional specializations.
No production migration/full-phase completion or push is authorized by a green
focused probe; remaining performance/size/consumer gates stay open.

Candidate 1 measurements improve Clarke but do not remove the native gap.
Candidate 2 reuses existing FixedInterval::affine for 2*a and checked_sub for
-b-c instead of an interval matrix with singleton integer coefficients. For
Q30 i32 inputs, these intermediate raw numerators fit i64 (magnitude <2^34);
no intermediate rounding occurs. Balance validation stays first. No existing
scalar helper or matrix kernel is changed. The same complete FOC corpus and
paired measurements gate this client substitution; old hard cases remain.

Candidate 2 improves Clarke and chain costs further. Disassembly still has an
out-of-line div_integer call for constant 3. Candidate 3 adds a normal inline
hint to the new small scalar entry point so constant divisors can specialize;
no existing method, predicate order or arithmetic body is changed. Record
time and binary size before keeping or rejecting the hint.

Candidate 3 reduces footprint and improves the complete chain. Remaining
Clarke disassembly calls the client narrow adapter twice, materializing
intermediate result carriers. Candidate 4 applies a normal inline hint only
to that client adapter; preserve its exact body and all typed errors.

Candidate 4 rejected: both compiler .text sections are byte-identical to
candidate 3 for shared-probe and cost. Keep candidate 3; remove the extra hint.
