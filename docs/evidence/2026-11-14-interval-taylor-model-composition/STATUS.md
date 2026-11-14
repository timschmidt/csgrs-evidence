# Certified Taylor model composition

Retained source `fde51f4dd49735ae324788befebda526eefab261` extends Hypersolve behind
`taylor-composition = ["taylor-polynomial"]`. No default, dependency version,
existing raw-map grammar, predicate order or acceptance threshold changes.
The full fifteen-phase goal remains active. Phase 11 extraction costs remain open.

## Implemented contract

`Arc<TaylorModel>::compose` and `TaylorPolynomialModel::compose` accept a retained
outer TaylorModel. Input/output binding counts are validated before empty success.
Every complete input image, including unused bindings, must be contained in the
outer model domain. A valid actual function whose conservative image fails this
containment requires a stronger input enclosure or wider outer certificate; no
proof of actual mathematical undefinedness is inferred from that rejection.

For f(x) in P(x)+R on the inner parameter domain, and g(y) in Q(y)+S throughout
the admitted outer domain, the existing polynomial engine encloses Q(f(x)) in
T(x)+U. Adding the entire certified outer residual gives g(f(x)) in T(x)+U+S.
No derivative of either retained source is regenerated. Exact outer coefficients
and centers build a shared flat polynomial graph; the existing engine retains
all truncated monomials and residual cross-products. Original parameters/center/
order stay fixed. Exact polynomial coefficients need not be the actual composite
Taylor jet at the original center. This distinction is documented explicitly.

Both original source certificates remain shared. `maps` exposes exact defining
maps, `model_map` exposes each retained outer certificate, and `polynomial_map`
identifies the graph indexed by multiplication evidence. Subdomain queries retain
all global residuals, use the proved outer-domain inclusion before natural map
evaluation, and preserve empty versus zero-dimensional unit products. Replay each
original definition/request and ordered map sequence; no serialized certificate,
flag or live cache substitutes for rebuilding proofs. Independent-base model
merging, automatic center/order/frame selection and universal resource closure
are not established by this feature.

One graph budget and native arithmetic budget cover construction, inclusion,
truncation, outer residual addition and final publication. Exhausted/cancelled
attempts leave the inputs unchanged and publish no model. Scalar payload/refinement,
in-scalar cancellation, vector capacities and total live-heap exclusions remain.
Structural counts are stage checks, not whole retained graph or heap reservations.

## Acceptance and validation

The original missing-consumer compiler failure is retained. Ten final focused
cases exercise reciprocal composition; exact coefficient and outer-residual
retention; higher-degree truncation; subsequent generated-model and polynomial
maps; nonlinear inner residuals/algebraic coefficients; binding/domain negatives;
empty/unit/zero-output products; small and final graph/native cutoffs; cancellation
and retry; mixed monomials in unsorted binding order; source sharing; fresh-process
replay; shifted outer centers outside the inner image; and zero-dispatch proof getters. Closed-form rational expectations and
positive-square bounds accompany source/model agreement. No prior test or assertion
is weakened. Both strict and approximate policies must certify coefficient equality
without consuming approximate certainty.

The final shifted-center follow-up changes only an acceptance test; production,
documentation and benchmark sources are unchanged from the measured source.
Minimal-feature tests pass all eight applicable cases, and final test Clippy and
formatting pass. The full Hypersolve/Hyperdynamics all-feature run passes 1,603 top-level tests in
75 groups, including the preceding eight-test version of the new corpus. Final
focused tests pass all ten new and ten existing polynomial tests after the last
edit. Strict all-feature/all-target Clippy, warning-denied docs, minimal/disabled
features, WASM and workspace formatting pass. Benchmark Clippy is rerun after its
final validation/preparation changes. Main's combined pending extraction passes
20 owner-focus and 117 Hyperdynamics tests with `hypersolve/taylor-composition`
explicitly enabled, strict Clippy, formatting and repository budget. No full
pre-push/release, sanitizer/fuzz, hosted OS, external solver or HIL claim follows.

Initial compiler errors in the test's predicate names and generated SymbolRef
construction, and an invalid center in a new zero-output fixture helper, were
corrected without relaxing expected results or domains. Initial artifact attribution
needed PIE relocation addends; a later parser namespace mistake wrote one diagnostic
JSON at the main repository root. Its verified contents were moved into this record
(the first cross-filesystem rename failed), and the final index/status/patch hashes
verify unchanged. An isolated source commit preceded that diagnostic refresh;
main integration and all combined checks completed afterward.

## Completed work and costs

The new maintained benchmark compares prepared certificate reuse with fresh native
Taylor construction for the same exact function/domain/degree/endpoint-quality
contract. Both paths independently check exact coefficients and analytic extrema,
and their materialized ranges are asserted identical. Cases are
`1/(2+1/(1-x))` and `sqrt(2+x)` on [-1/16,1/16], order two, precision -64.
Allowed widths are 1/32 and 1/8 respectively. Complete outputs, proofs and
result destruction are included. Both inner and outer preparation are separate
measurements; reuse timing is not a claim about one-off cold construction.
Budgets are 1,000,000 structural entries, 100,000,000 graph work, 16,384 native
magnitude bits and 10^12 native work. All 24 final trial measurements complete.
Three CPU0/ASLR-disabled trials use one-second warmup, two-second measurement and
thirty samples, without concurrent builds/tests/profiles. Median microseconds:

| Workload | Minimum | Maximum |
| --- | ---: | ---: |
| taylor_composition_algebraic_sqrt/inner_preparation | 20.982 | 21.082 |
| taylor_composition_algebraic_sqrt/outer_preparation | 186.968 | 190.548 |
| taylor_composition_algebraic_sqrt/redifferentiate | 186.601 | 189.171 |
| taylor_composition_algebraic_sqrt/reuse | 147.599 | 148.425 |
| taylor_composition_nested_reciprocal/inner_preparation | 124.388 | 125.213 |
| taylor_composition_nested_reciprocal/outer_preparation | 120.176 | 120.371 |
| taylor_composition_nested_reciprocal/redifferentiate | 256.714 | 257.191 |
| taylor_composition_nested_reciprocal/reuse | 142.857 | 143.453 |

The allocation observer copies the entire maintained benchmark body and external
dependency versions match the workspace. Eight warmup operations precede 32 complete
construct/drop epochs; every epoch and retained-query drop returns to zero incremental
live heap. Source objects and caches already present before the epoch are excluded.
Nested reciprocal reuse allocates 48,155 bytes, retains 21,052 and peaks at 22,780,
versus fresh construction's 125,414 / 12,624 / 19,212. Algebraic square-root reuse
allocates 52,250 bytes, retains 19,956 and peaks at 21,828, versus 77,864 / 8,712 /
12,156 for fresh construction. Reuse reduces cumulative allocation on these fixtures
but retains more proof memory. All preparation/resource rows remain in the record.
This is not a universal speedup, cold-cache bound, total heap or source-memory claim.

For established `taylor-polynomial` feature builds, final control .text/.rodata,
allocated section addresses/sizes and sized-function unions match baseline exactly.
The only allocated-byte differences are 25 verified panic source-line locations and
the derived build ID; the final raw binary is 16 bytes smaller in non-code metadata.
Four final baseline/candidate/candidate/baseline sweeps complete all six existing
workloads with no adverse separation under the previously declared screen. This
is not simultaneous significance or a claim that timing noise is a source speedup.
With the optional composition feature enabled, the old cases preserve complete
ranges, allocation counts and graph/native work, with eight additional retained,
allocated and peak bytes per observed raw-map stage. The optional certificate handle
is a measured memory cost of the new capability, not hidden as an optimization.

A whole-binary-equality preflight after the final documentation wording change failed.
Earlier measurements and build metadata remain under before-wording records. Final
allocation observations reproduce byte for byte, and all new/established timing was
repeated against final-source artifacts. No earlier sample was discarded to obtain
a favorable result. Diagnostic parser failures and all initial results remain explicit.

## Integration and scope

Alternate-index application and exact reversal recover the original pending tree.
The main checkout now contains the source commit plus exactly the original 41 staged
extraction paths, SHA-256 676e5d602a1fbdcc3fc7ff0d15bfb62692ef03f69a5a62f957aa7c7b6697b359.
Interface's eight edits and Firmware's clean state are unchanged. All 32 prior frozen
stages verify. No push occurred. Archive only after every writer finishes; after
freezing, copy drivers to new mutable paths before reuse. Remaining independent-base
model arithmetic, automatic evolution/QR control, wider adoption, competitive
qualification, migrations, embedded work and coordinated release stay open.
