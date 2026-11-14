# Validated trajectory Taylor enclosures: admission record

Source commit: `bc2f1d00c0f97c6d3aa7b14036c6fe4298742ee7`, parent
`e0734617c9f460309c5896f68a5d10181fb783c2`. The source snapshot, final binary patch
and eight file digests are in SOURCE_FINAL.json and final-source/. CONTRACT.md
records the preimplementation owner, properties, input domain and missing witness.
DERIVATION.md gives the normalized Lie-coefficient and integral remainder argument.
This increment extends Phase 13; the full fifteen-phase goal remains active.

## Contract and implementation

Hyperdynamics owns the trajectory construction. Hypersolve remains authoritative
for demanded symbolic derivatives and analytic source-domain certification.
The opt-in `taylor-flow` feature prepares coefficients through order n+1 using
`a1=F`, `a(k+1)=(partial_t a(k)+sum F_i partial_x_i a(k))/(k+1)`.
Source and derivative guard outputs are retained, integer division is exact,
and stages share flat program storage. No scalar or Hypersolve production code
changes. Existing Picard and evolution entry points retain their behavior.

Certification first proves existence and uniqueness on a proposed Picard tube,
then checks time/state analyticity through the existing FieldTaylorModel authority.
It evaluates initial coefficients at the uncertain initial box and the next
coefficient over the entire certified time/tube product. Every term and the
complete integral remainder contribute before intersection with independent
Picard endpoint/tube bounds. Order zero still includes the first-order remainder.
An unexpected empty intersection fails explicitly. Publication follows the final
budget/cancellation check. Reports retain source identity, stages, Picard proof,
analytic proof, coefficient ranges and contributions. Reports are private proofs;
replay uses source definitions, order and proposal, never serialized success flags.

The domain is finite validated expression fields with forward singleton dyadic
times and dyadic initial boxes, subject to the sufficient analytic-domain checks
and explicit budgets. Empty initial products remain distinct from zero-dimensional
unit products and invalid times. Cartesian endpoints discard correlations; no
pointwise correlation preservation is claimed. There is no adaptive step/order
controller, QR wrapping control, universal smooth-flow decision procedure or
whole-horizon Taylor controller in this increment. Per-stage graph limits are
not a total retained graph/heap bound. Existing scalar payload/refinement and
within-scalar cancellation exclusions remain. High orders can exhaust honestly.

## Acceptance and final validation

Eleven new tests exercise independent rational exponential-tail and oscillator
series bounds, exact time-polynomial/triangular solutions, Riccati values,
nonautonomous joint Lie coefficients, generated endpoint reuse, rational clocks
and exact state charts, order zero, empty/unit/invalid cases, source singularities,
Picard rejection, a time-nonanalytic source that Picard alone accepts, order and
one-unit-short resource boundaries, cancellation/retry, zero getter dispatch,
and fresh-process full report/work replay with malformed sources rejected.

The isolated final revision passes 79 tests across 13 test/doc groups, with no
failed, ignored or filtered tests. Strict all-feature/all-target Clippy,
warning-denied rustdoc, minimal taylor-flow, disabled-feature and WASM feature
builds, and workspace formatting pass (qualification.json). Final benchmark
Clippy and formatting pass after benchmark refinements. Package file listing
includes the production module; this is not a package/release build proof.
Main's combined extension-plus-pending-extraction state passes 90 tests across
16 groups, strict Clippy, formatting and repository budget (4,187 files,
143,342,245 bytes before this ledger update). See main-validation.json and logs.
No new successive_operations timing, full pre-push workflow, sanitizer/fuzz,
release or platform-wide qualification is claimed. No push occurred.

## Existing consumer controls

Three old-feature consumers are byte-for-byte identical against the same-path
baseline: old-native-cost (4,022,992 bytes), model-cost (3,919,264 bytes), and
affine-cost (3,968,560 bytes). Full allocated sections and canonical sized function
layouts also agree. See control-builds.json, candidate-control-artifact-comparison.json
and candidate-inspected-controls.json. Baseline restoration and final source
restoration are recorded. Feature-gated child code and later comments/bench changes
cannot enter these feature sets. This is exact identity for these compiled
controls, not proof of cost invariance for arbitrary platforms or all-features
consumers. No old-path timing improvement is asserted.

## Completed benchmark contract and costs

The maintained benchmark compares complete endpoint proofs for x'=x, x(0)=1,
on [0,1/4], with width <=1/8192 and independent exact rational exponential-tail
checks. Both paths retain all necessary reports and include destruction. Original
field construction is outside both repeated-query timings. Taylor preparation is
outside the flow query and separately measured. This is one linear-IVP accuracy
fixture; it does not qualify an entire solver portfolio or an optimal baseline.

One order-three Taylor step completes. The Picard baseline uses 1,024 steps of
2^-12, a positive-linear candidate hull(X0,X0/(1-h)), and native outward regridding
to exponent -64 between steps. It explicitly checks endpoint inclusion in each
carried box, which is retained as the next report's initial box. Field proof and
proposal/transport arithmetic each have their own explicit horizon budget.
The 512-step variant completes the flow but misses the width requirement and is
reported UNDERRESOLVED, never timed as a conforming workload. The final Picard
endpoint is slightly narrower than Taylor; both meet the stated threshold.

Three complete Criterion trials used CPU 0, ASLR disabled, one-second warmup,
two-second measurement and 30 samples, without concurrent builds/tests. Median
ranges in microseconds are Picard1024 10,790.448–10,816.059, Taylor3 92.078–92.600,
and Taylor preparation 22.069–22.417. Raw samples, estimates and command results
are retained. These are scoped observations, not a universal speedup claim.

| Warm incremental epoch | Allocations | Allocated bytes | Retained bytes | Peak bytes | After drop |
| --- | ---: | ---: | ---: | ---: | ---: |
| Taylor3 query | 1,028 | 29,823 | 5,408 | 9,248 | 0 |
| Picard1024 horizon | 123,902 | 4,897,984 | 1,371,464 | 1,372,688 | 0 |
| Taylor order-three preparation | 213 | 30,296 | 9,520 | 10,320 | 0 |

The observer uses eight warmups and 32 construction/drop callbacks. Its operation
and validation body matches the maintained benchmark, and core dependency versions
and feature sets match (observer-body-equivalence.json and
observer-dependency-equivalence.json). The retained supplement agrees with the
allocation rows. Preparation uses graph work 634 and scalar work 0; Taylor query
uses graph work 654 and scalar work 1,048,685. Preexisting source/field and prepared
program storage are outside the query allocation epoch; preparation storage is
shown separately. These warm observations establish neither zero cold-cache growth
nor a total heap bound. Artifacts and hashes are in new-cost-builds.json and
final-retained-artifact.json; executable files live outside this evidence stage.

## Failed attempts and refinements retained

The first missing API fixture failed as expected; its draft Rational assignment
errors were fixed and the missing API reproduced. Initial implementation used an
unsupported Real conversion from usize; exact conversion through u128 fixed it.
A draft resource fixture lacked a trait import. Warning-denied docs exposed an
unescaped interval bracket link, fixed as code text. The first copied allocation
observer misplaced inner documentation comments, fixed without changing operations.
The observer initially enabled different dependency defaults; final flags and
lockfile now match the maintained benchmark and explicit equivalence checks pass.

An unrounded long Picard draft exhausted at step 1,259 with
Rejected(Field(Lattice(Scalar(SizeExhausted)))) under the declared 16,384-bit native
limit. This is not successful geometry or a timing observation. The failure,
diagnostic and source snapshots are preserved. Explicit outward transport with
inclusion validation addresses denominator growth; the limit was not enlarged.
The earlier regridded 2,048-step displacement-candidate benchmark is retained as
an intermediate. The final tighter positive-linear candidate admits 1,024 steps;
512 remains underresolved. No failed fixture was relabeled as completed.

## Integration and preservation

An alternate-index preflight merged exactly the feature, dev dependency and bench
manifest additions with the pending extraction. Applying these additions to the
pristine manifest reproduces the qualified manifest. Reversing only this increment
recovers the entire original pending index tree. See integration-preflight.json,
integration-manifest-resolution.json and INTEGRATION.json. Main retains exactly
41 staged extraction paths, binary patch SHA-256
`fa7cae17b5b413c0e34601c118c4c4f42c1e37053ef544739e0ae161337a417f`.
Interface's eight edits, Firmware's clean state and the clean isolated worktree
are checked in FINAL_REPOSITORY_STATES.json. All 26 prior frozen stages pass final
digest verification. This stage is to be frozen at archival; post-freeze digest,
committed-blob and ledger checks are recorded outside it.

Phase 11's measured provider cost regressions remain unresolved. Interface strict
Clippy findings, firmware flash/stack and MCU/HIL qualification, remaining Phase
7–13 implementation/adoption and Phase 14 release obligations remain open. This
new opt-in trajectory verifier does not discharge those independent obligations.
