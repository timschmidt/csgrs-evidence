# Dyadic zero grid admission

Baseline 6bd212482843261c9d514fdff3fe9b5b5bd2deac; all four managed trees clean.
Prior turn progressed through exact authored affine-source support. Owner:
Hyperinterval dyadic grid selection/alignment, P1-P7/P18-P20/P35-P37, plan
Phase 3 resources and Phase 6 composition. The current canonical zero exponent
forces unnecessary huge alignment with compact nonzero data at i32 extremes.

Admit all finite dyadic intervals, empty and zero, full signed exponent range,
all existing add/sub, order-image, hull/intersection, relations and regrid paths.
Use a nonzero operand's grid when the other is exactly zero. A zero mantissa
is exactly representable on every grid and has zero magnitude bits regardless
of shift. Never treat a merely zero-containing interval as zero. Nonzero and
empty paths retain arithmetic/predicate and reservation ordering; actual mixed
zero work/size reservations intentionally shrink with avoided alignment.
Reserve before copying even zero; exhaustion stays typed and failed attempts
must not poison a fresh budget. No zero division/precondition rules change.

Missing witness: zero combined with 1*2^i32::MIN or 1*2^i32::MAX must complete
under a mantissa-sized budget; truly distinct nonzero exponent gaps must still
exhaust. Cover every affected operation both orders, negative/crossing ranges,
canonical zero grids, full mantissas, every insufficient work budget and retry,
unchanged nonzero output/serialization/accounting, fresh replay, downstream
zero-centered affine sources and Krawczyk-style zero accumulators. Measure
ordinary nonzero costs and zero completed costs separately, allocations and
footprint; an old exhausted attempt is not a matched successful benchmark.
This is a resource-completion fix, not a claim of whole-phase completion.
