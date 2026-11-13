# Provider-owned failures in the pending dynamics extraction

## Contract and source

Owner: Hyperdynamics metric/join protocols and scheduling; Hyperpath retains
geometry and its legacy error boundary. Properties P1, P4, P6, P8-P10, P19,
P27, P31-P37. Domain and acceptance are recorded before implementation in
CONTRACT.md. This is an isolated experiment, not retained production support.

Source base: csgrs 8ea26dac524dacdaaab6c255a54c355f8cb9de2f plus the exact
41-path staged extraction in pending-extraction.patch, SHA-256
3bebcf6370ec1ce7b72691a9699a01e3295b7a32063c4da0a52b0996b4686d48.
The main worktree and Interface's eight pending edits are preserved. No compiler,
linker, optimization-profile, dependency-version, fixture, or threshold change.

Candidate-source.json hashes all seventeen candidate files. Candidate.patch is
relative to the extraction index; provider_errors.rs is an added test, separately
included in the source snapshot. All previous immutable stages are read-only.
The detached experiment tree is /mnt/development/csgrs-dynamics-return.

## Distinct design

MetricSpan, MetricPath and JoinSpan choose an associated Error that can receive
DynamicsError without losing its kind or source cause. Mixed scheduling converts
join failures into the metric provider's error through an explicit From bound.
ClassifiedJoin retains its source-owned receipt and gains a defaulted error type.
Geometry adapters choose the unchanged legacy RouteCertificationError. Its enum,
variant order and both conversion implementations remain intact. Thirteen
whole-report identity maps disappear from deprecated metric/join forwarding
functions. Concrete axis-only APIs retain their native error conversions.

The private large-report builder follows the chosen error type. Mathematical
expressions, validation order, exact predicates and source queries are unchanged.
The jerk refinement branch compares the provider error with precisely the native
JerkProposalUncertified kind; every other failure propagates. This control-flow
arm was changed by hand. Documentation forbids treating unresolved failures as
retryable, consuming proofs, or making geometric decisions in that comparison.
The protocols are unpublished parts of the pending extraction, not retained APIs.
No inline attributes were added and actual deprecated forwarding functions stay.

## Correctness and failure evidence

The missing acceptance fixture first fails compilation because the original
protocols cannot express an associated provider error. The diagnostic and exact
command are retained. An initial candidate missed the private join helper's
return type; its failure log is retained, and the helper was corrected to
transport the provider error. No test or assertion was weakened.

Two new tests exercise both STRICT and APPROXIMATE_512. Non-Clone metric/join
errors retain original Arc cause identity and the nested Error::source chain.
The providers use different failure types. Native wrapped failures retain the
one-halving retry, selected corner feed, explicit zero-budget exhaustion,
receipt identities and subsequent schedule certification. Foreign failures are
not mistaken for a retryable native failure.

All four focused command groups pass: native fixture controls; three routing
unit tests including fresh-process full report/dispatch comparisons; the axis
migration integration test; all-target/all-feature owner Clippy with -D warnings.
The broader all-feature owner test log records 521 passing tests and no failures.
Its completed log survives, but the outer process exit status was not recovered
after context compaction; owner-test-observation.json states that limitation.

The standalone observer copies the real owner's workload function byte-for-byte.
Across all 194 completed cases, full Debug result rows and allocation/deallocation,
reallocation, bytes, peak and live-delta rows match baseline for both extraction
and candidate. Measurement includes completed output and destruction. External
lock versions/checksums agree across observer builds. This is a separate allocator
observer, not the owner timing executable, canonical serialization proof, or an
independent mathematical oracle. Preserved independent fixtures and legacy
report/dispatch tests provide additional correctness evidence.

## Emitted artifacts and instructions

Real owner benchmark builds use Rust 1.95.0 and the unchanged Cargo bench profile.
The fresh baseline and original extraction hashes exactly reproduce the prior
record. Complete emitted sized-function address unions merge aliases/overlaps;
six unsized functions are reported separately. These are measured artifacts,
not universal code-size bounds for arbitrary downstream monomorphizations.

| Artifact | ELF bytes | Sized-function union | .text bytes |
| --- | ---: | ---: | ---: |
| Baseline | 13,312,600 | 8,044,187 | 8,118,103 |
| Original extraction | 13,304,584 | 8,036,358 | 8,110,279 |
| Provider errors | 13,302,416 | 8,035,134 | 8,109,047 |

Candidate ELF SHA-256:
1ada97d16773bc31ac31a9c8d80a68b84b4a1db9e57f33efdad739a20b89befd.
Its ELF shrinks 10,184 bytes and function union shrinks 9,053 versus baseline.

Twenty-one Callgrind observations cover seven named cases and three variants,
32 warmed completed-result/drop callbacks per epoch. Four controls retain exact
instruction totals. Candidate symmetric jerk uses 928 fewer instructions per
epoch and mixed jerk 800 fewer; corner lookahead uses 4,160 more (+130/call).
Function attribution confirms elimination of extraction's extra jerk memcpy
instructions. Attribution also changes with inlining; function names alone do
not define work equivalence. Instruction totals are not hardware cycles or
wall-clock performance. Profiles use the observer, not Criterion timing binary.

## Runtime qualification

Six real-owner sweeps use baseline/extraction/candidate/candidate/extraction/
baseline order, CPU0 affinity, per-process ASLR disablement, a fixed executable
path and two-second busy warmup. Criterion uses 0.1-second warmup, 0.2-second
measurement and ten samples; all 194 cases complete in every sweep. Raw samples,
bootstrap estimates, commands, artifact hashes and frequency observations remain.
No compilation or instruction profiling runs during the timing campaign.

Screening flags a case when both candidate lower mean-confidence bounds exceed
both baseline upper bounds. This is not a family-wise significance claim or an
acceptance tolerance. The extraction flags 64 cases; provider errors flag 67.
All 67 candidate cases receive longer candidate/baseline/baseline/candidate
repeats with one-second warmup, two-second measurement and thirty samples.
Confirmation completed: all 67 cases ran successfully in all four repeats.
Sixty-one retain separated adverse confidence intervals; six do not. The six
nonconfirmations are preserved alongside every adverse case. These are repeated
per-case observations, not a simultaneous family-wise confidence statement.

Broad candidate/baseline mean ratios include 1.0236 for the 256-record parser,
1.0384 for exact trace import, 0.9738 for symmetric jerk and 0.9794 for mixed jerk.
Neither favorable scheduling cases nor the broad median clear adverse cases.
No full downstream, successive_operations, sanitizer, fuzz, coverage, WASM,
packaging or pre-push qualification is claimed for this rejected candidate.


## Disposition and restoration

Rejected for owner-runtime regression. Longer candidate/baseline mean ratios are
1.0933 for axis-aligned line offset, 1.0890 for quadratic hodograph, 1.0672 for
rectangular-pad clearance, 1.0517 for additive-bead scheduling, 1.0416 for exact
trace import and 1.0219 for the 256-record parser. Lower code size, removed report
copies and favorable jerk timings do not satisfy the unchanged full owner gate.
No unrelated parser arithmetic or compiler policy is changed to mask this result.
The instruction observations do not establish a unique hardware cause.

After the final candidate source edit, focused tests and Clippy pass; formatting
passes at closeout. Six fresh candidate transcripts contain 92 report/trace lines
each and match legacy/direct/compatibility modes within both policies. Their
hashes also equal the prior original-extraction record. The exact original
extraction is restored; its three routing tests, axis migration test and workspace
formatting pass. Six additional restored transcripts match both the candidate and
prior record. The isolated tree is then restored clean at its baseline HEAD.

All ten prior immutable evidence digests pass. FINAL-REPOSITORIES.json verifies
that main's 41-path index, Interface's eight edits and clean firmware exactly
retain their starting HEADs, statuses and staged/unstaged patch digests. No source
change from this experiment is retained in those repositories. No push ran.
Phase 11 and every remaining obligation of the fifteen-phase goal stay open.
The provider-error design and its test are archived for future explicitly
qualified combinations; this record does not grant them production acceptance.
