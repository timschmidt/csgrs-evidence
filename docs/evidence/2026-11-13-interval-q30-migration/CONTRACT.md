# Q30 production delegation

Previous turn: progress, retained clock migration. Full fifteen-phase goal active.
Owner: Hyperinterval fixed arithmetic; Alumina retains Q30 domain wrapper,
const constructors/accessors, original error/rounding sequence, validated
rotation/current/servo policy and all widened carriers. P1/P5/P6/P18-P20/P31-P33,
plan 9.1-9.4 and admission/refactor cost gates apply.

Missing acceptance: production Q30Interval still implements its own interval
arithmetic on cb92f80. Delegate the existing non-const ratio, midpoint, checked
sum/difference/negation/product/quotient/square operations to FixedInterval<i32,30>.
Preserve pair storage and all const API/constant/layout behavior. Fixed input is
nonempty and ordered by Q30 construction; fixed scale 30 is valid for i32.
Only Overflow and ContainsZero can arise in admitted arithmetic, mapped to the
existing Range and DivideByZero. Other kernel failures or empty output violate
these proven invariants and must not be mislabeled as successful/empty geometry
or a false classification. No generic unknown failure is silently mapped to Range.

Before edits capture actual baseline owner/simulator tests, unchanged maintained
FOC oracle and full output rows. Compare final old/new complete arithmetic,
transform chains, allocations, native code/monomorph size and timing. Repeat
current/servo/clock downstream tests and no_std ARM/WASM checks. Native timing
cannot stand in for MCU cycles, stack or HIL. Do not retain a material hot-path
regression without the explicit acceptance required by the plan.

Cost attribution: direct wrapping preserves rows but slows the completed chain.
Inlining adapters helps without resolving it. Emitted fixed add/sub uses
full i128 sums and narrowing machinery even for i32. Reuse each primitive's
checked add/sub/neg at the owning fixed layer, preserving lower/upper operation
and error order, exact empty semantics and checked reconstruction. No widened
product, rational conversion or transform sequence is changed. Existing
exhaustive byte, fixed lattice, full-width GMP and FOC oracles must all pass.

The i128 narrowing helper's comparisons preserve exact endpoint range checks
and their order, removing intermediate Result packing. Private reconstruction
uses order already established by every caller's extrema/monotonicity proof;
public ingress and scale validation remain checked. The caller audit includes
ratio/rescale, integer ingress, radii, arithmetic extrema, reciprocal monotonicity,
signed integer division, principal root, square, powers and affine images.

The final unresolved Rust 1.95 Clarke cost motivates delegating its existing
private widened beta-product helper to FixedInterval<i64,30> before checked i32
conversion. Preserve the wide difference, exact coefficient interval and single
outward rounding. Any intermediate i64 result overflow also precludes i32 output,
so it keeps the same Range error. Do not migrate/reorder balance, alpha's exact
integer division, rotation policy or rounded Park composition. Corpus includes
full-i32 differences and original widened cancellation/overflow witnesses.
