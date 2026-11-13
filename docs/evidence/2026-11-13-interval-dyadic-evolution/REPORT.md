# Bounded dyadic evolution admission

Source 61e867f5062ee692c6805e3113ffe9c2d6b3a920, parent
0166809643cbbf42a84addcf7fef43392d4e8618. Previous goal turn was progress:
source-bound Picard step verification. CONTRACT.md records owning layers,
properties, declared domain and the missing horizon/halving witness before edits.
The four source paths and their digests are in SOURCE_STATE.json; source.patch
reproduces the committed delta. This advances phase 12, not the entire plan.

## Completed increment

Hyperdynamics adds `ExpressionField::integrate` for exact singleton dyadic time
endpoints and uncertain initial boxes. A maximum-step option caps the first
proposal; each later proposal also stays within the last accepted duration.
Every proposal is capped by the exact remaining horizon. Native interval
arithmetic supplies all comparisons, midpoint halving, copying and candidate
operations; the accepted Picard verifier remains the sole step proof authority.
No scalar arithmetic, derivative rule or geometry kernel was duplicated.

For each duration, the initial box is an untrusted candidate. A failed self-map
may expand the hull of that box and its Picard image by the hull's symmetric
width. Expansion count is finite. Once exhausted, an exact halving restarts
from the initial box; failed contraction and eligible domain/regularity proofs
also may halve. Resource/cancellation/unavailable/invalid failures stop without
counter resets. Actual step and halving limits are typed; their mathematical
failure reasons remain separately retained in the attempted step reports.

Immutable reports retain exact source identity, request, search options, one
policy, every actual invocation and its candidate origin, segment/halving/
expansion indices, and accepted segment indices. Each next initial state is a
checked native copy of the preceding certified endpoint. Strict positive
progress and the final exact horizon comparison precede completion. The final
new integral contribution is checked by the existing Picard authority; a later
failed horizon comparison still prevents whole-horizon success. Stopped runs
expose only an explicitly scoped certified prefix, with no completed requested
endpoint. No report deserialization accepts success flags as proof.

A zero horizon is an explicit identity, with no ODE existence assertion.
Successful empty evolution validates times/options and reports the requested
end time; nonempty zero-dimensional unit evolution remains distinct. No exact
reachable-set equality or retained cross-segment correlation is claimed.
The shipped example now reaches exact time 5/8 in three certified segments,
retaining all seven attempted candidates under one mutable work budget.

## Validation

All fifteen final commands in checks-final.json pass after the last source edit:
480 combined dynamics/path tests; 18 minimal-feature field/evolution tests;
default-off build; all 21 tests on Rust 1.95, release, AddressSanitizer and the
isolated minimal package; strict all-feature/all-target Clippy; strict docs;
Wasm compilation; shipped example; two external release consumer builds;
workspace formatting and diff checks. Supplementary checks cover staged diffs,
repository retention budget and the stopped-outcome consumer. This is affected
validation, not the complete pre-push workflow matrix. Nothing was pushed, and
registry distribution/other platform delivery remain unqualified.

Seven new integration tests cover 49 exact uncertain constant-field horizons and
subsequent endpoint reuse; exact partial last steps; negative start times; native
minimum-exponent halving overflow; time-affine integrals; a zero affine flow
whose contraction factor one forces halving; nonconstant exponential flow with
an independent rational Taylor/geometric-tail enclosure; one- and four-segment
oscillator flows with rational alternating-series bounds; Riccati exact rational
solutions; pole and blowup stress; complete attempt/expansion provenance; explicit
step/halving limits; empty/unit/identity/invalid inputs; exact/one-unit-short
aggregate graph/scalar counters; cancellation/retry; and fresh-process replay of
all attempted proof stages. A final-budget failure is exercised after all three
segments are certified: its prefix reaches the requested time, but the report
withholds whole-horizon completion because the final comparison did not finish.

The initial oscillator fixture wrongly expected this ordinary proposal to need
halving. Its analytic fixture was kept and expanded to multiple segments; a
separate exact zero-flow affine case now forces halving by q=1. No existing test,
policy or assertion was weakened. Initial missing-doc and Clippy diagnostics,
format-path mistake, and failed fixture log remain archived. The full successful
pre-empty-time qualification is retained alongside qualification after the final
empty-time semantics edit. A saved control executable initially lacked execution
permission because copyfile preserved bytes only; its failed launch is retained,
permissions were restored, and measurements resumed without changing the binary.

## Completed cost and explicit stopped outcomes

The external evolution probe validates independent exact/analytic endpoint
controls before timing and checks deterministic completed endpoint equality on
every invocation. Eighteen completed integration/replay workloads include
constant uncertainty, time-affine, forced affine halving, oscillator, Riccati,
exponential, unit, empty and zero-horizon identity cases. Four stopped workloads
and 36 graph/scalar exhaustion cases are separate, not credited as completed
flow. CPU-0 release sampling uses eight warmups, 32 allocation epochs and 31
samples of eight invocations. Full retained reports and destruction are included;
integration includes input/options copies, replay also includes JSON source
validation and Jacobian construction. Initial source/input preparation and
preexisting field construction are excluded from integration as documented.

Completed medians span 0.179–126.633 microseconds and peak temporary memory is
26,780 bytes; all allocation epochs end at zero live-byte delta, including
stopped/exhausted attempts. Ordinary measured flows use at most nine attempts
and four accepted segments. These are focused completion measurements, not a
universal envelope or total memory/work guarantee.

The separately inspected stopped outcomes are explicit:
- Step limit one: two attempts, one certified segment, reached time 1/4.
- Halving limit two: three rejected self-map attempts, no segment.
- Pole at the initial state: three attempts retain native ContainsZero, then
  the actual configured halving limit two stops the run.
- Riccati toward its singular horizon: 149 attempts and 24 certified segments,
  stopping at the actual step limit 24 and time 2357295/4194304. This is a
  certified prefix, not a completion or a no-solution proof at that prefix end.
  The stopped stress workload peaks at 272,008 temporary bytes and has a
  2.357-millisecond median; its larger costs are retained separately.

The unchanged Picard consumer is compared against a saved parent at matched
paths/lockfile/compiler/policy in CBBC order. All allocation and graph/scalar
rows agree exactly. Fifteen completed timing ratios span 0.9786–1.1059, median
1.0027; eight rows are slower, and all samples are retained. Three mathematical
rejections and original resource trials remain separate. No speedup or
regression-free timing claim is made. The existing executable is 4,022,968 bytes
on both revisions, with an unchanged 2,037,790-byte sized function union and
identical .text/.rodata; relocation metadata differs. The distinct full-evolution
probe is 4,084,752 bytes, function union 2,065,448 bytes, measured absolutely
rather than presented as an incremental feature-size comparison.

## Remaining contract

Finite proposal/halving/step counts and shared counters do not bound all scalar
refinement, payload lifecycle, ingestion or heap bytes. Conservative domain and
candidate enclosure choices can stop before a mathematically possible horizon;
they never substitute partial success. Exact rational time endpoints, f64 RK
proposal support, stronger wrapping control, general end covers/thickening and
whole-resource closure remain required. The full fifteen-phase objective, the
legacy extraction retention gate and all earlier open obligations remain active.
The 40-path staged dynamics patch and Interface patch are byte-preserved;
Firmware and the isolated core remain clean. No claim of full phase-12 or
release completion is made by this record.
