# Current Hyperinterval conformance coverage

Owner Hyperinterval; P1/P3/P6/P19/P20/P35-P39 and plan section14.5.
Measure the current all-feature production-source denominator before edits.
Use fresh Rust1.95 coverage profiles and include all library/integration tests.
Report production versus test-only source explicitly; do not hide uncovered
production paths or infer branch/universal correctness from line coverage.
For any test addition, identify the uncovered behavior, exact admitted input
domain and independent expected result before writing it. Keep all existing
assertions and full-width hard cases. No production refactor is planned merely
to improve coverage. Discovered correctness failures need their own reproduced
witness and lowest-owner repair. Preserve all primary pending patches and frozen
evidence. Test-only additions must leave production source unchanged, pass normal
and release tests, strict Clippy and applicable feature boundaries. Full coverage
and all other phase requirements remain open until measured evidence proves them.

Baseline: 4,658/4,740 production lines; 493/494 functions; no branch counters.
Raw reports include two test-only modules, excluded only from the explicit
production subtotal. LLVM -dump identifies all16 mismatches as Rug OptRational
parts with hash0; none names Hyperinterval. Keep this diagnostic and all raw data.

Missing witnesses to add before edits: rational owned-endpoint extraction and
reconstruction; positive empty product/quotient with invalid counterparts; empty
fixed rescaling/reflection with invalid scale/zero denominator precedence; integer
empty product; finite affine proposal empty after input validation; empty and
finite extended trig results consumed by subsequent functions; empty/singleton
split reflection/hull/exponential; and distinct public error diagnostics with
retained scalar Error::source. These use exact set identities and zero/one special
values independent of another implementation. Do not add tests to force execution
of unreachable internal invariants or special platform qualification failures.
The initial new witnesses pass on current production code. Additional uncovered
strict-float affine-empty and reversed disjoint comparisons need both f32/f64
witnesses: exact adjacent representable endpoints stay distinct, touching stays
non-disjoint, and valid affine empty remains empty while nonfinite input fails.
