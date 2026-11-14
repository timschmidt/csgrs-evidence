# Surface interval ranges: admission before implementation

Baseline: b0fde90b4d9eb51c51723fb6e24a9b6ab6938962. The complete interval-refactor
goal remains active. This stage addresses its native surface parameter-box and
range/Jacobian consumer requirement; it does not replace the remaining tasks.
BASELINE.json records all managed repository states before source edits. Main's
41 staged extraction paths and Interface's pending changes are preserved through
an isolated worktree. All 44 earlier evidence stages remain frozen.

## Owners, properties and input domain

Hypersolve owns compilation of its existing BivariatePolynomial coefficient
grids into a shared-denominator expression program, then differentiation and
regularity evidence. Reuse its existing budgeted Builder, validators and
evaluator; do not add another domain-local copy of a polynomial graph compiler.
The existing sparse Taylor-model compiler has centered multi-index semantics
and must not be merged or reordered as part of this addition.

HyperBrep owns the native immutable Surface, its UV chart, generated subdivisions
and source association. Reuse its tensor_coefficients conversion, native selected
ParameterRange comparisons and spatial Aabb consumption. Hyperlattice owns the
Cartesian interval box; Hyperinterval owns outward arithmetic. Surface ranges
do not establish face membership, contact completeness or solid topology.

Relevant properties: P4 cache semantics; P6/P14/P16 typed failures; P15/P19 source
and evidence preservation; P18 generated output consumed as input; P20 resource
accounting, cancellation and retry. HyperBrep WP04 and the evaluation portion of
its support matrix are affected; broader intersections/arrangements stay open.

The first native domain is an admitted positive-weight rational Bézier tensor,
with arbitrary finite control-net dimensions and exact native coefficients.
Queries are canonical empty Cartesian sets or finite dyadic boxes contained in
the actual native UV domain. Generated subdivision and transformed native
sources must be accepted. Broader NURBS, implicit and analytic chart adapters
remain explicit implementation gaps, not mathematical completeness limits.

## Missing acceptance witnesses

Before implementing, reproduce absent public APIs with executable tests:

- Hypersolve: a ragged bivariate numerator with asymmetric u/v terms, a shared
  nonconstant denominator, exact independent values and derivatives; empty and
  zero polynomials; denominator guards; invalid symbols; bounded work and retry.
- HyperBrep: S(u,v)=(u,2v,uv) on a non-square parameter box, with independent
  exact coordinate and both-partial ranges, then existing spatial box exclusion.

Extend the corpus before qualification: nonuniform weights; algebraic native
subdivision and chain rules; constant/rank-one images without an immersion claim;
empty/outside boxes; denominator overestimation and subbox retry; source-preserving
transforms and cold replay; cache/policy and precision transitions; cancellation,
small budgets and successful retries. New functionality needs an actual example
and completed shared-versus-independent preparation workloads, not merely a
constructor or evaluation demonstration.

## Constraints and retention gates

Do not populate the original homogeneous-control cache during preparation.
Reuse an existing cache or construct an owned temporary native carrier so the
existing conversion authority can be used without changing evaluator bodies.
Measure the copy/conversion cost and test complete native traces with cold,
warm and failed preparation. Preserve exact source and domain in every report.

Graph entries/work, interval precision/work and cancellation have separate
limits. Reserve checked control-grid/conversion work before allocations.
Scalar refinement, coefficient growth, scalar payload cloning/destruction,
uninterrupted native conversion and total heap must remain explicit exclusions
unless this stage actually supplies those bounds. Resource exhaustion is not a
missing-algorithm result or proof of a pole.

After the final edit, run affected Hypersolve and HyperBrep checks, downstream
consumption, strict lint/docs, feature-disabled checks, WASM and archived-package
consumer validation. Compare the same completed workload, including preparation,
all coordinate/partial evidence, projection, native comparison and destruction.
Preserve failures and adverse measurements. Keep default dependencies and
existing predicate order unchanged. Update the existing linked HyperBrep support
and implementation records; do not create a competing project status ledger.
