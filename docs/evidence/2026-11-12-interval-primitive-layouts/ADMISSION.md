# Primitive layout experiment admission

Baseline CSGRS 6c2ebd9647bd2a171881acb265084851ab3b9351; all four managed
repositories clean. Phase 6 explicitly requires structure-of-arrays primitive
experiments and measurement before choosing layout/fact specializations.
Owner: Hyperlattice Cartesian storage; scalar arithmetic remains Hyperinterval.
P1, P5–P7, P18–P20, P31–P33. Required missing evidence: a complete-operation
comparison of current per-lane carriers with separate lower/upper arrays.

Admit fixed i32/i64 and qualified strict f32/f64 finite intervals, canonical
empty products, N=0 unit products, signed extrema, outward rounding and typed
failure. Prototype storage is private to an unpublished conformance package.
It must validate through existing scalar constructors, delegate every arithmetic
operation to existing scalar kernels, retain left-to-right evaluation and
publish only complete results. Empty intersection must not skip later lanes.
Conversions/replay preserve all endpoint bits and existing canonical formats.
No cached/serialized flag is proof, no SIMD/native-float arithmetic is substituted.

Compare round trips, addition/subtraction, hull/intersection, dot products and
finite chains. Include final canonical output materialization in consumer costs;
report retained-layout paths separately. Measure sizes, allocation, native code
footprint, and native/Wasm completed costs across dimensions. Preserve small
exact independent expectations and full-domain scalar failures. No production
layout replacement without all acceptance gates: borrowed lanes() is an existing
API/storage constraint, and rational/dyadic storage must not be generalized into
primitive arrays. This experiment does not claim phase completion.

The machine-profile review found current shared positive_product/quotient and
nominal/radius helpers would repeat sign/precondition checks. Their migration
still needs proof transport preserving call order; no machine-profile edit is
made in this checkpoint. The full 15-phase goal is unchanged.
