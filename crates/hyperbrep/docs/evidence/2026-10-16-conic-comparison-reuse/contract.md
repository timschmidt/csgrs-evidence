# Per-call periodic conic comparison reuse: candidate contract

Qualified baseline: `f2039ae4e42d93df1493fad17965e345b8d5dbfb`, with the complete consumer record in
`../2026-10-16-upstream-native-integration/manifest.json`. The baseline has
159 preserved cost cases, 56 native diagnostic results, and the inherited
scalar failure and three current timing observations remain open.

Ownership: `hyperbrep::geometry::angular_parameter_lifts`; properties P1,
P3-P6, P8-P11, P17-P20, P27 and P35-P39. Establish the baseline from the
completed upstream-native integration before changing production code.

The domain remains a validated increasing, at-most-one-turn interval for a
native circle or ellipse whose angle changes by one radian per parameter unit,
in either orientation. The operation returns every equivalent
parameter in that interval, in order, with stored endpoints substituted on
certified equality and both endpoint identities retained for a complete period.
An unresolved comparison or scalar ceiling remains a typed failure. No finite
coordinate conversion, tolerance, approximation policy or additional admission
path is introduced.

The current helper repeats interval membership and endpoint comparisons. Reuse
the two already decided orderings within this helper call; after a periodic
lift, compute orderings for the lifted value. Do not reuse orderings across
different values, domains, operations, policies or source revisions. This is
local evaluation reuse, with no new persistent cache or invalidation protocol.
Preserve the certified integer-ceiling selection, source endpoint identity,
complete-period seam multiplicity and existing strict authority. Analyze the
structural endpoint shortcuts and nested strict scopes before applying a patch.

Source inspection: `ParameterDomain::contains` checks structural endpoint
equality before comparing both bounds, then the lifting helper repeats
membership and compares both endpoints again. Hyperlimit's explicit-policy
comparison uses `Real::certified_cmp_until`, whose first rule certifies the
same structural equality. Thus endpoint shortcuts can still be proved by that
cascade; this inspection is not runtime acceptance. The proposed local ordering
closure retains a strict scope. Unknowns still propagate in start/end order,
and a periodic lift gets its own fresh pair of comparisons. Within a successful
unlifted non-endpoint case, six ordering calls become two; actual cost remains
to be measured. Exact output endpoints and full-period multiplicity are unchanged
in the proposed construction. Existing context tests also preserve scope
restoration and shared solver budgets; scalar comparison work remains outside
those instrumented budget units.

The missing acceptance evidence is cost attribution, not a new successful
geometry case: the oblique correctness increment recorded partial-pcurve
allocation and timing increases, but did not isolate repeated comparisons.
First retain the baseline implementation, qualified source, executables,
features and deterministic receipts. Compare a focused complete pcurve corpus
before deciding whether the candidate merits full qualification. Rejected or
unfavorable measurements stay in the record.

If retained, preserve all 159 completed benchmark cases in all fifteen corpora,
the complete BREP/IO feature matrix, all 71 source-path WASM groups, all original
STEP artifacts and both continuation diagnostics. Existing independent exact
measure/point/source-parameter tests remain unchanged. Include both conic
families, reversed/restricted charts, +/-10^12 turns, complete-period endpoint
identities and 1e-12 gaps. Inspect exact receipts separately from timing; no
checksum-only claim of semantic equality. Do not run tests or builds while
measuring, or change guarded source midway through qualification.

Scalar quotient/coefficient work and overall heap/work/cancellation bounds
remain open. External watchdogs provide containment only. The inherited scalar
zero-factor failure, earlier performance exceptions and unshipped package/
binding boundaries remain visible. No dependency source repair is in scope.

Related upstream evidence is
`docs/evidence/2026-10-16-native-admission-recheck/progress-v1.md` and its
`review-v1/source-review.md`. Endpoint-proof reuse and metadata-first validation
appeared there in a previously rejected combination. That pending Hypercurve/
Hyperdrc work is distinct from this BREP helper and remains unadmitted. Do not
attribute its failures or prospective gains to this isolated candidate. Preserve
the old construction/memory regressions if a future proposal adds persistent
state; this experiment adds none.
