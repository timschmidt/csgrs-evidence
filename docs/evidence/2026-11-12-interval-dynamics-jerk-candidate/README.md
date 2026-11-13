# Exact metric-span and jerk extraction candidate — not accepted

This extends the pending axis candidate recorded at CSGRS ledger commit
26be8eeb7eb214cbf62440269a3eb11b4ad9c85a. It is NOT an accepted refactor or a
completed Phase 11. The original axis record and adverse evidence remain
immutable at evidence commit 865da1ad11b25edc855307a42fab454f504a84ad,
`docs/evidence/2026-11-12-interval-dynamics-axis-candidate`.
`CANDIDATE.json` binds the complete pending source and Interface patches to
explicit base commits. Production changes remain uncommitted. No push ran.

## Contract and implementation

ADMISSION.md records owner, properties, domain, and missing acceptance witness.
`baseline-missing.log` reproduces the unavailable geometry-independent metric
API before implementation. Hyperdynamics now defines MetricSpan, the conservative
Affine/General structural classification, constant-jerk replay and two-phase
monotonic transitions. Hyperpath retains exact geometry and implements the
metric adapter for FeedPathElement without materializing or approximating paths.
The algorithm's lazy source queries and repeated construction/replay queries
are unchanged. General means no affine specialization is asserted.

The moved jerk body is byte-identical after only its imports/error rename,
generic source argument, lazy metric method call and the repository formatter;
source-equivalence.json records the exact hash. Shared input checks retain
PredicateOutcome certainty, stage, and refinement requirements on valid,
invalid, and unknown signs. Existing internal schedulers retain their old
flattened error boundary. Affine projection's existing positive-limit check
uses the same authority; no sign or predicate call is added or reordered.
All 26 legacy errors round-trip through explicit exhaustive mappings.
Deprecated concrete Hyperpath entry points and report aliases remain for a
coordinated minor release. Interface directly imports jerk operations and
reports while preserving its original Route error boundary.

The trait supplies exact metric input, not proof of arbitrary geometry validity.
No new cumulative resource, cancellation, general ODE, or geometric closure
claim is made. Feed/lookahead ownership and general function/reachability
extraction remain open. Existing qualified/undecided report semantics remain.

## Correctness evidence

The original jerk module and four original guards are frozen test-only
references. Fresh processes compare complete Debug reports and every dispatch
counter across 43 fixtures under STRICT and APPROXIMATE_512, for original,
direct, and compatibility paths. Fixtures include rational seeds, mixed line,
explicit arc, cubic PH and quintic PH paths, empty/shape errors, invalid limits,
unresolved signs, and rejected phase proposals. Mixed reports include violated
candidates; this is not a claim all authored schedules are feasible. Six final
raw transcripts and their common per-policy digests are retained. The fixed
first-fixture counts are 35 structural sign queries, 5,287 total dispatch events,
and zero GCDs. The separate 56-fixture axis differential retains its previous
fixed counts after shared-check reuse.

Four new lower-layer tests independently check exact phase-time/acceleration
identities, integrated lengths, continuity and cap rejection, lazy source query
precedence, failed-source retry, and input-check decision metadata. The original
hard Hyperpath tests and properties remain intact. Final owner suites pass 453
tests; Interface passes 201 tests/doctests including the maintained 41,795-byte
planner transcript, SHA-256
df893df83e90e6b53452e18586ffcaa2524a021631a395d4a6523be16263669c.
This preserves the application encoding, separately from report equality.

All ten final-checks.py commands pass: strict owner Clippy, docs, stable Wasm
compilation, all owner benchmark smoke cases, successive_operations, Interface
tests and strict Clippy, both formatting checks, and diff validation. The full
owner test command has its own final log. Earlier compilation failures and
intermediate checks are retained, not substituted for final results. ASan was
not rerun in this step; the earlier axis sanitizer evidence has its earlier scope.
The source retention-budget check passes. No full pre-push CI matrix or hosted
platform validation is claimed.

successive_operations completes 200 certified manifold rows, with identical
structural and allocation columns to the original baseline. Its complete normal
dependency graph is unchanged and contains neither Hyperpath nor Hyperdynamics.
Those elapsed times are not a controlled performance comparison.

## Adverse cost evidence

Owner benchmarks execute the original baseline binary (SHA 0ecc889e...820d,
explicit full hash in owner-binary-sizes.json) and the combined candidate after
all builds stop, pinned to CPU 0, without governor control. The baseline checkout
is still the earlier dependency-only control; it was NOT rebuilt for this
comparison. Its preserved original binary is the original baseline, as verified
by full hash. All 194 owning cases complete, 0.1s warmup, 0.2s requested
measurement, ten samples. The broad mean-ratio median is 0.9989, range
0.8632–1.3062. Broad jerk improvements do not survive as a general claim.

Four targeted runs (candidate/baseline/baseline/candidate) retain raw samples
for ten cases at 0.2s warmup, 0.5s requested measurement, twenty samples.
For 256-record parsing the baseline means are 171.817/171.347 us versus candidate
182.085/186.832 us (mean ratio 1.075). Several other parser regressions remain;
single-phase jerk is approximately equal, multi-phase replay averages 1.014,
and lookahead 1.024 with drift. These observations do not establish a global
no-regression envelope.

The owning executable grows 13,308,824 -> 13,379,488 bytes (+70,664); text grows
10,667,638 -> 10,719,894 (+52,256). Full symbols and normalized symbol deltas are
retained. New scalar/solver instances contribute substantial growth. A narrow
selection of report/geometry Debug/Clone/drop symbols shrinks 6,788 -> 6,705
bytes, but it excludes the broader instantiation growth and cannot establish
the required monomorphized-code gate. No favorable subset waives the executable
or timing failure. Exact compiler/dependency locks and CPU data are retained.

## Next work

The combined extraction cannot be accepted under the refactor contract.
Investigate cross-crate instantiation and code-generation boundaries with
isolated, measured candidates while completing the planned metric/join ownership
boundary. Preserve predicate order, complete output/trace comparisons, original
hard cases, and all adverse controls. Do not change unrelated parser algorithms,
compiler policy, fixtures, or gates to mask a failed extraction. Feed/lookahead,
join evidence, general enclosed functions and the remaining interval-plan
obligations remain open. Prior blockers remain in the main progress ledger.
