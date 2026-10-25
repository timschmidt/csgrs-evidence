# Point-kernel review and second bounded variant

The handoff's Real::eval_poly midpoint call already reaches Hyperreal's
Rational::eval_polynomial for exact rational arrays longer than five values.
At the target revision it uses homogeneous integer Horner, skips zero terms,
trims leading zeros and returns an unreduced exact ratio: sign/zero queries
need no final GCD. Source anchors: hyperreal/src/real/arithmetic/linear_algebra.rs
and rational/arithmetic/aggregate_products.rs. There is no normalized rational
Horner-at-every-step bottleneck at this call site.

Candidate v1's private point kernel passes 6,336 independent rational point
comparisons (192 polynomials x 3 signed scales x 11 points, plus replay) but
duplicates that scalar-owned arithmetic. Loaded-host pilot timings, which are
not admission evidence, are 60.4 ms / 12.75 s versus baseline 64.7 ms / 11.23 s
for the two captured helpers. No benefit is established by these two runs.

Variant v2 removes the private point kernel and leaves Real::eval_poly calls
unchanged. It tests only fixed filter-coefficient preparation and per-bracket
reuse between Horner and Bernstein. The Bernstein power table is unchanged.
The v1 source and all oracle/check outputs remain archived; its implementation-
specific point tests are not silently repurposed to validate a missing kernel.
The unchanged 1,152-polynomial differential oracle and shared midpoint/fallback/
captured-leaf tests remain mandatory. There is no primary worktree edit.
