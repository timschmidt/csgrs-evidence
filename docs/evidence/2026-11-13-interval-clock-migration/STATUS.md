# Clock arithmetic migration qualification

Disposition: retained software migration; the full fifteen-phase goal remains
active. Phase 9 hardware and other firmware migrations remain incomplete.
Previous goal turn: progress (whole-horizon coordinate evolution).

## Retained contract and source

Hyperinterval owns primitive integer scaling, range intersection, explicit
midpoint/radius, and signed i128 quotient bounds. Its fixed-point operations
share the positive-denominator quotient kernel. Checked integer sum preserves
its addition order and uses the order already proved by monotonicity. Public
input validation, overflow, zero-denominator and empty semantics remain explicit.
The signed quotient corrections use wrapping operations only where the proved
quotient/remainder relation excludes wrapping; full-width GMP and independent
integer inequalities check both signs and extreme denominators.

Alumina-clock delegates transient range arithmetic while retaining its exact
scaled affine parameters, causal/boot/freshness/deadline policy, domain errors,
wire formats, and stored layout. Generated estimates remain usable by inverse
mapping and further prediction; midpoint is an explicit representative, never
an authority replacing the admitted bounds. The production dependency disables
default features and enables only integer. Device heartbeat source is unchanged;
the estimator is consumed by Interface and simulation, not the device heartbeat
implementation itself.

Source commits:
- CSGRS: c7108d084810f175232ab087749d95edaca10f0d
- Alumina Firmware: cb92f80c08ba13cb732dd2a3a4ad63ccdee5e1cd

Missing quotient/scaling APIs were reproduced before implementation. Early
compiler failures and slower candidates are retained as rejected investigation,
not passing evidence. CONTRACT.md records the owner/property/domain obligations
and cost-driven changes. No prior assertions, fixtures or policies were weakened.

## Executed checks

- Hyperinterval all features: 213 unit/integration/doc tests; Rust 1.88
  integer/fixed/serde: 53 tests. Final source passes strict all-target Clippy,
  docs with warnings denied, and formatting. Production checkout repeats the
  complete all-feature test set after transfer.
- New exact oracles cover exhaustive byte ratios and scalar images, full-width
  GMP bounds, signed minima, both denominator signs, zero/overflow outcomes,
  all twelve primitive endpoint types, affine replay and full-width range sums.
  The explicit trace witness records zero Real dispatch and zero rational work.
  These policy-free exact primitive paths do not consume STRICT or
  APPROXIMATE_512; neither policy introduces a different result or receipt.
- Firmware: 7 clock and 76 simulator tests, strict owner/simulator all-target
  Clippy and formatting. Production checkout repeats tests and Clippy after
  transfer to the stable sibling dependency path.
- Maintained Q30 differential client: all three tests pass, including 20,736
  boundary combinations, 100,000 deterministic random cases and 81 ratios.
- Interface client: all 86 tests; wasm32 compilation. It uses the unchanged
  client source at ff668ca in an isolated checkout with consistent candidate
  dependency paths; the unrelated eight main Interface edits were preserved.
- Rust 1.88 clock builds for thumbv7em-none-eabihf and wasm32-unknown-unknown.
  Feature-tree inspection confirms integer-only Hyperinterval, with no std,
  allocation or arbitrary-precision dependency. Host allocation probes measure
  zero allocations/reallocations/bytes over 24 complete clock workloads.

Interface Clippy 1.95 reports existing large_enum_variant (network.rs) and
nonminimal_bool (worker.rs) diagnostics. The exact same two diagnostics were
reproduced on the unchanged main Interface source/dependencies with --locked.
An attempted Rust 1.88 Interface Clippy is inapplicable: Interface declares
Rust 1.95. Those failures are not presented as passing checks. No unrelated
Interface edit was made to suppress them.

## Exact outputs and cost

The standalone observer compares 481 complete rows byte-for-byte: estimator
state/reports, encoded heartbeats, uncertainty boundaries, errors, boot/rate/
sequence/order/RTT/flag/inconsistent probes, and forward/inverse estimates.
Analytic clocks independently verify inclusion. All retained rows match the
pristine firmware bdee397 baseline; layout remains 208 bytes, alignment 16.
Existing five clock tests are unchanged; two new permanent regressions cover
fractional affine offsets and rejected-sample state with a successful retry.

Initial candidate: about 10% slower; ordinary inline hints did not resolve it.
Forced inlining, removal of an outlined Option map, scalar multiplication,
quotient/remainder correction and proof-backed sum construction remove that
measured regression. Intermediate raw runs and assembly are retained. No
unsupported global optimization claim is made from those discarded candidates.

Final pinned host comparison, Rust 1.88 opt-level s/fat LTO/one codegen unit,
overflow checks enabled: 24 alternating baseline/candidate pairs, each with
30 samples of 6,144 completed observe/predict/estimate/inverse pipelines,
following explicit warmup. Median paired candidate/baseline ratio 1.000469;
bootstrap 95% interval [0.999465, 1.001691]. This does not resolve a runtime
change or establish a speedup. Raw rows, warmup, artifact hashes, environment
and samples remain available. Host frequency/noise is uncontrolled; no claim
about target MCU cycle counts follows from these samples.

Clock probe .text: 267,196 -> 267,148 bytes; binary 428,016 -> 423,712 bytes.
Fixed control .text: 240,028 -> 239,740 bytes. Six alternating fixed baseline/
candidate runs preserve all operation counts and checksums; measured median
ns/shared operation: add 14.624 -> 14.275; subtract 14.432 -> 14.305;
multiply 19.552 -> 18.530; divide 72.275 -> 63.768; square 17.314 -> 15.963.
These are local matched controls, not firmware/HIL or cross-platform claims.
The final fixed rebuild is byte-identical to the measured artifact.

## Open work and repository integrity

No hardware cycles, stack maxima, register-pressure campaign, HIL traces,
final MCU firmware image, WASM code-size comparison, full workflow matrix,
root successive_operations, whole-application benchmark, sanitizer or coverage
campaign is claimed. The native microbenchmark includes complete output and
its success assertions, but does not replace those open integration gates.
No push occurred; the complete pre-push checks have not been executed.

The pre-existing 41 staged CSGRS extraction paths and eight unstaged Interface
paths retain their original binary-patch SHA-256 values. Firmware is clean at
its retained source commit. The isolated core checkout is clean at its retained
source commit; the firmware/client test worktrees retain their recorded test
paths. All twenty prior frozen evidence stages were checked without mutation.
