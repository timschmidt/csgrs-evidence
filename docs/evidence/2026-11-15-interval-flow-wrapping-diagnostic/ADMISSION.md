# Initial wrapping-control diagnosis

Goal remains all docs/INTERVAL_REFACTOR_PLAN.md. Previous turn was progress:
retained16-IVP comparison and stricter analytic/timing validation. Current accepted
source6b848e7a5 and protected main41/Interface8 verified. Prior78 stages frozen.
No production edit yet; no subagents/push/publication.

Phase13/section10.7 requires wrapping-control representations and finite
composition. Existing FlowNoiseState/certify_noise_step already preserve shared
affine parameters, so first measure that actual capability on the newly qualified
two-rate box case. Do not invent another manual propagation API or repeat the
previously rejected automatic-horizon/sensitivity/matrix variants.

Owners: Hyperdynamics owns source-bound ODE step orchestration; Hypersolve owns
Taylor/affine/noise arithmetic and retention. P1/P5/P6/P8-P10/P17-P20/P27/P36/P37.
Diagnostic uses exactly the accepted two-rate inputs, horizon[0,1/4], step cap1/64,
order3 and initial radius2^-10. Original native candidates are untrusted proposals
for each existing certify_noise_step, which must certify them against the actual
retained affine state's full enclosure. Never intersect away parameter combinations.
Two retained columns; all omissions and flow remainders stay charged. Track
complete vs rejected endpoint, source time, widths, work, and cost separately.
No performance/completeness claim from this exploratory consumer alone.

Before any production change, identify a concrete missing/failing acceptance
witness from this diagnosis and extend this admission with domain, proof,
resource/dispatch and downstream obligations. Do not silently change existing
output or failure semantics in a behavior-preserving refactor.

## Proposed derivative scheduling change, before production edit

Profile: 465,881,247 whole-process instructions, 104,373,541 inclusive in
Taylor derive (22.40%). This does not attribute all derivative cost to clones.
Actual source repeats ExpressionNode::clone on both scheduling and ready visits.
Scheduling reads only inputs; constants have no children and named variables
need no owned name. Real::clone clones rational storage and SymbolRef::clone
clones its name. Missing cost witness: named/rational source scheduling should
not copy payloads it never consumes. Capture the existing public coefficient
result, budget/failure boundaries, allocation and dispatch behavior before edit.

Owner Hypersolve expression_program/taylor.rs, P1/P4/P5/P6/P8-P10/P18-P20/P36/P37.
Domain remains every currently admitted CoefficientRequest/source, all existing
operators, exact scalar families, aliases, guards and invalid/exhausted/cancelled
requests. Move the clone past the scheduling branch; retain the ready clone,
original left/right order, every check_entries/charge, memo lookup, zero test,
partial rule and graph insertion. No new helper, cache, representation or API.
There is no predicate on the removed clone; nevertheless compare both-policy
trace controls, serialization and budget/failure results. Physical temporary
allocation may decrease; logical graph resource accounting stays identical.
Existing algebraic/refinement/payload resource exclusions remain unchanged.

One structural candidate only, no layout/inlining tuning. Capture all existing
Hypersolve and Hyperdynamics/Hyperlattice-interval release examples/benches with
unique source-path keys. Reject raw size or code-size regressions. If those
pass, run owning and downstream correctness, dispatch, full benchmark controls
including successive_operations, and completed noise-chain/native comparison.
Existing coefficient generated/binomial/guard/resource tests remain intact;
add a named/rational alias trace/budget witness if candidate survives size gate.

## Retained qualification scope after clone rejection

No production change remains. Missing acceptance witness: full continuous
16-step manual noise chains for the accepted point/box two-rate IVPs, not only
final endpoints or the existing nilpotent shear/oscillator tests. Add this in
Hyperdynamics' existing flow-noise witnesses. Native integration supplies only
untrusted candidates; every noise step re-certifies its actual incoming outer
state and preserves its source/proof identity. Check every continuous segment
and generated endpoint against independent exp(-t), exp(-8t) rational bounds.
The positive initial intervals make both coordinates monotone, so endpoint
extrema bound the entire segment; do not sample time. Hull every certified tube
and check the full horizon, exact piece count, original width contract and tighter
per-lane noise targets. Both nonzero Taylor residuals and fresh residual inputs
must remain represented. Reuse the existing adaptive test's rational exp-series
oracle by moving it unchanged to test support, with its mathematical input-domain
assertion; preserve all existing assertions. This is qualification, not an
automatic controller or new mathematical capability. No timing claim follows.
