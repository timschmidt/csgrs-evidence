# Native curve range consumer: final design and evidence boundaries

This records the final design at c6c43e095b245e753b53237aa4eda3b9dc0737f8.
It is an implementation review, not a substitute for executed acceptance tests.
SOURCE.json identifies the patch; CAPABILITIES.json separates demonstrated
coverage from the wider curve-closure target. STATUS.md is generated only after
the main-checkout verification succeeds.

## Ownership and contract

Hypercurve owns the native RationalBezier2 source and local parameter chart.
The existing Bernstein conversion owns the exact homogeneous power basis.
Hypersolve owns expression validation, symbolic differentiation and source-domain
C1 evidence. Hyperinterval owns outward dyadic arithmetic. Existing Aabb2
comparisons own native broad-phase decisions. The adapter introduces no region,
incidence, topology or scalar arithmetic authority.

The relevant contracts are typed uncertainty/failure (P14/P16), source identity
and evidence (P15/P19), generated output consumed as later input (P18), and
explicit resource/failure behavior (P20). The broader P17–P20 closure contract
remains a target; this range consumer does not complete Boolean, offset or
corner-operation closure.

Inputs are already-admitted native rational Bézier spans with their exact
homogeneous controls, including generated spans and algebraic coefficients.
The query is an empty set or a finite dyadic subset of the native local unit
chart. The public optional feature does not change default dependencies or
existing native evaluator bodies. The initial missing-API test and subsequent
failure logs remain in this record; final witnesses are mapped in CAPABILITIES.

## Exact construction and consumption

Preparation uses the existing exact power-basis conversion, then encodes X/W
and Y/W in a validated expression program. The existing Jacobian compiler adds
local-parameter derivatives. Every successful query retains the native source,
parameter domain, precision, coordinate ranges, derivative ranges and original
regularity evidence. A denominator enclosure containing zero is a typed refusal
to certify; it is not a proof of a source pole. Restriction and retry can succeed.

Native projection converts ordered dyadic endpoints exactly to rational Real
values. It returns an Aabb2 borrowing its source range evidence. Empty domains
produce no finite box. Existing overlap checks may exclude disjoint boxes;
touching or overlapping boxes remain candidates. These bounds are neither an
exact hull nor an intersection certificate. C1 does not imply immersion,
injectivity or a nonzero tangent.

Generated native subdivision and reversal are consumed with independent
chain-rule expectations. Fresh-process tests reconstruct native controls and
regenerate evidence; no serialized certificate flags are trusted. This is not
a new interchange format or proof of general algebraic-selector replay.

## Cache and resource behavior

An already-present native homogeneous basis is borrowed. Otherwise preparation
owns its conversion and never fills the original basis cache. This is essential:
the original candidate changed native degree-above-256 point dispatch merely by
filling that cache. Its failing probe is retained, and fixed-count/whole-trace
witnesses cover both STRICT and APPROXIMATE_512 in fresh processes. Cold, warm
and failed preparation cases preserve the native cache behavior.

Checked entry arithmetic precedes graph/conversion allocation. Preparation
reserves 6*n*n + 6*n structural work even when the native basis is cached;
emitted nodes, validation, differentiation and report/projection work are also
charged. Nested interval operations share the supplied dyadic budget. Failed
attempts do not cache undecidability or prevent a larger-budget retry.

These limits do not bound total scalar refinement, coefficient growth, scalar
payload cloning/destruction, allocator overhead or all heap bytes. Cancellation
cannot interrupt a native scalar operation or basis conversion; it is checked
around conversion and before publication. These exclusions are explicit limits
of the demonstrated resource contract, not claims of full computational closure.

## Cost comparison and qualification scope

The actual example and benchmark consume range evidence through native Aabb2
comparisons. Independent preparation for each of sixteen cells is compared with
one preparation shared across those same cells. Both paths materialize the same
coordinate/derivative evidence and retained reports, project bounds, run native
comparisons and destroy the reports. Source construction is common and excluded;
scalar caches are warm. Graph definitions, domains and numerical outputs are
checked for equality before timing, and timed iterations compare outputs.

The allocator probe uses the repository's locked dependency versions and five
identical observations per row. The earlier probe's dependency drift and
superseded measurements are preserved. Requested-byte figures exclude allocator
overhead and common source storage; they are not process-memory bounds.

Thirty paired timing samples per fixture alternate order on one pinned CPU.
Unrelated host activity is uncontrolled. The recorded speedups apply to these
three completed portfolios, not arbitrary curves or existing modeling operation
performance. QUALIFICATION.json records the completed local checks and explicitly
excludes full stable testing, full pre-push qualification and phase completion.
