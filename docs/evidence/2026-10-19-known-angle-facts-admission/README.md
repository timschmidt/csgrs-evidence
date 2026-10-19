# E96: retained known-angle arctangent facts

Native sine/cosine now reuse the exact atan arguments normalized to pi/6,
pi/4 and pi/3, including signs, integer periods and half-pi complements.
The original 72-case replay certifies every case, up from 68. The expanded
matrix certifies all 480 function rows, resolving 384 native square identities
while preserving the 96 existing Real proofs and every definite sign.

The [review](review-v1.json) records the mathematical argument, checks,
measured costs, unfavorable results and remaining limits. The
[contract](contract-v1.md) predates implementation; its
[consumer addendum](consumer-scope-addendum-v2.md) preserves the working
candidate rejected for changing Real serialization. All 532 captured public
Real outputs retain identical JSON and CBOR in the final candidate.

New native derived outputs intentionally use existing algebraic wire forms.
The source angle graphs stay unchanged, and 48 prior derived graphs remain
consumable. The [checkpoint](checkpoint-v1.json) pins implementation and
evidence. This admission does not establish topology, analytic fidelity,
exhaustive/formal correctness, complete distribution or the full properties
plan. Historical missing evidence was not reaudited or recovered.
