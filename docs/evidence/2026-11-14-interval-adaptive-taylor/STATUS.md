# Bounded adaptive Taylor order and duration selection

Source eb8261c888bcb3fdbec0e6c1ad45c88b72fcf1ca adds opt-in Hyperdynamics
`adaptive-taylor`. This advances plan 10.7 and Phase 13's automatic selection among
validated enclosures. The full fifteen-phase goal remains active; this is not a
complete wrapping/QR controller or competitive external-solver qualification.

## Contract and ownership

`ExpressionField::adaptive_taylor(options).integrate(request,budget)` tries the
configured finite ascending orders on each original certified Picard proposal.
The first order whose full endpoint remainder contribution has absolute value within
every coordinate's exact nonnegative singleton limit supplies the next state. A
nonzero singleton remainder has zero width but still consumes the error allowance.
After all candidate orders fail quality, exact halving retries up to the configured
quality limit. Native Picard halvings/expansions remain separately bounded. Accepted
durations may double for the next proposal, capped by the original maximum and exact
remaining horizon. Order search restarts on each step; no minimum-runtime/order
optimality is claimed. Local truncation limits do not bound global trajectory error,
uncertain initial state, or equality with the exact reachable set.

Every original native search and its rejected proposals remain inspectable, alongside
ordered Taylor refinements, complete/partial proof statuses, magnitude enclosures and
quality decisions. Native or Taylor mathematical/resource failures stop with their
original cause, never masquerade as a quality miss or weaker Picard success. Prepared
programs are generated lazily once per distinct order within a run and retained by
index across refinements. The existing generator still prepares different orders
independently; cross-order derivative sharing is not claimed. Only accepted endpoints
advance the controller. Stopped prefixes remain separate from complete horizon output.
Source/options/request/policy, all history, coefficient identities, guards and complete
remainders are retained. Rebuilding source and replay inputs regenerates proof;
serialized flags or live caches are not proof authority.

Existing Picard, fixed-order Taylor, native evolution and fixed-order evolution code
remain byte-identical. The original taylor_flow.rs is an unchanged prefix with only a
feature-gated module appended. Hyperdynamics owns selection, native proof and exact
horizon bookkeeping. Hypersolve/Hyperinterval/Hyperlattice remain derivative/scalar/set
arithmetic authorities. One EnclosureBudget covers source preparation, search,
refinement, comparisons, record accounting and publication. Aggregate stage checks
include programs, controller/native attempt records, refinements and accepted indices;
retained partial history is explicit if a later check fails. These checks do not reserve
all nested proof graphs, exact scalar payload/refinement, vector capacity or total heap,
and do not interrupt scalar operations. These remain resource-contract gaps rather
than claims of whole-work closure. No fresh budget is silently substituted.

## Acceptance

The missing API was reproduced as baseline E 0599 before production edits. Ten final
focused tests pass: constant flow with independent exact endpoints and deliberate
nonzero singleton remainder rejection; order escalation and immutable program reuse;
quality-driven halvings followed by regrowth with exact time capping; independent
rational exponential bounds with uncertain initial conditions and generated endpoint
continuation; harmonic oscillator alternating-series bounds and signed remainders;
empty/unit/identity and invalid configuration/time; quality limit versus native step
limit and stopped prefix; original nonanalytic-time Taylor failure despite native
existence success; every graph-work cutoff below completion, exact final graph/native
limits, small structural limits, cancellation/retry; fresh-process original
source/request/selection replay; and zero-dispatch evidence getters. All coordinate
limits are checked, including a zero first coordinate and failing second coordinate.
Initial missing docs and test API compiler diagnostics are retained without weakening
any mathematical expectation, source, policy or cutoff.

The isolated owner run passes 116 tests in 15 groups. Strict all-feature/all-target
Clippy, warnings-denied docs, disabled features, WASM, formatting and repository budget
pass. Nine downstream physical-flow tests pass with the new feature enabled; its tenth
dispatch-gated case is not included in this command. Combined main passes 127 owner tests and 9 physical-flow tests, strict owner Clippy, formatting and repository budget; main-validation.json records exact commands. No full pre-push/workflow matrix, fuzz/coverage/sanitizer,
external solver, hosted-platform, hardware or release qualification is claimed.

## Completed-workload cost and admission tradeoff

The maintained benchmark compares fresh fixed-order 3 preparation/integration with
bounded automatic orders 0..3, maximum step 1/4, horizon 1/2 and local remainder limits
1/1024. Constant flow x'=2,x(0)=0 and exponential x'=x,x(0)=1 retain the same exact source,
initial state, horizon and endpoint enclosures. The exponential endpoint must also
have width<=1/512 and include independently bounded exp(1/2). Both strategies check
every complete local remainder, materialize proofs/endpoints and destroy results.
The fixed strategy does not perform automatic choice; the new strategy additionally
retains rejected-order proof history. Benchmark-only independent oracle/quality checks
are included in timing/allocation loops; separate retained-resource epochs omit them.
Three CPU 0/ASLR-disabled trials,16 warmups and 1000 operations per mode, mean µs/op:

| Fixture | Fixed order 3 | Automatic orders 0..3 |
| --- | ---: | ---: |
| constant | 143.465–144.054 | 150.057–151.028 |
| exponential | 304.510–306.189 | 644.752–645.664 |

The automatic method is slower on both fixtures. This opt-in cost is explicitly
accepted for the higher-priority new automatic order/halving/regrowth and certified
quality capability; it is not a speedup or performance-only refactor. Predictable
first-satisfactory order selection pays for unsuccessful lower orders. Existing fixed
programs remain available. No external competitive ranking is inferred.

The observer copies the entire maintained benchmark with matching workspace package
versions. Thirty-two warm operations per fixture/mode return to zero incremental live
heap. Allocated bytes per operation, including checks: constant fixed/adaptive
74692/63230; exponential 114580/238880. Peak incremental bytes: constant 28912/29800;
exponential 35632/79632. Separate retained-result epochs give:

| Fixture/method | Retained bytes | Graph units | Scalar units |
| --- | ---: | ---: | ---: |
| constant fixed 3 | 25664 | 1582 | 1605906 |
| constant adaptive | 29408 | 949 | 668132 |
| exponential fixed 3 | 31600 | 2054 | 3088363 |
| exponential adaptive | 75600 | 4265 | 5767196 |

Preparation is included; common original field objects/caches, allocator/platform
overhead and whole-process memory are excluded. Counts are fixture measurements,
not a universal resource bound. Default existing benchmark executable shrinks 32 bytes
(6462560 to 6462528); all allocated ELF sections have identical bytes/addresses/sizes
except the build-ID note. Its 3256 demangled symbol groups, size and address multisets
are unchanged. Enabled control shrinks 72 raw bytes, keeps identical .text length but
moves 21 symbol groups; all symbol size multisets remain unchanged. The new benchmark
is 3471984 bytes. These artifacts are controls, not claims of zero cost for linked
applications that actually use the new API.

Initial sequential controls show adverse confidence-bound separation on default
Picard/preparation/reachability and enabled Picard. Original samples remain; default
allocated-code identity does not justify silently deleting observations. A follow-up
same-executable-path campaign removes argv/path-layout differences, with hashes checked
before each copy and no concurrent builds/tests/profiles. The follow-up removes adverse separation for preparation, reachability and enabled
Picard, but default Picard remains separated: baseline 29.708–29.739µs versus
default 29.950–29.975µs (about 0.8%). This observation is retained as an additional
explicitly accepted cost/uncertainty for the new capability; no default no-regression
claim is made. Allocated section identity apart from build ID is stronger code evidence
than timing attribution, but does not erase these samples. No hardware cause is proved
and no threshold is loosened. The two campaigns are preserved in full; no further
repetition is used to select favorable observations.

## Integration and remaining scope

Alternate-index application and exact reversal recover the original pending tree.
All 41 staged extraction paths and their logical changes remain; only blob IDs and hunk
offsets change. Interface's eight edits and Firmware's clean state are preserved. All 35
previous frozen stages verify unchanged. Final snapshots, archive metadata and registry
record exact revisions/digests. No push occurred.

Automatic frame/QR evolution, independent-noise retention, cross-order preparation
sharing, broader/externally competitive portfolio qualification, remaining interval
migrations/adoption, Phase 11 measured extraction regressions, embedded flash/whole-call
stack/cycles/HIL, outstanding Interface Clippy issues and coordinated release remain
open. Local truncation control does not establish the full plan's final state.
