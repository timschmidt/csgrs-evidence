# Q30 arithmetic delegation qualification

Disposition: retained software migration. Full fifteen-phase goal remains active;
Phase 9 hardware qualification and wider servo interval migration remain open.
Previous goal turn: progress (exact clock arithmetic migration).

## Source and preserved contract

- CSGRS 441c925b559005b81074f9fc45d9b47adb3298b4: native checked fixed sum/difference/negation; explicit checked
  narrowing; private reconstruction and exact storage conversion reuse order
  already proved by the caller. Public ingress still checks endpoint order,
  scale validation remains mandatory, and overflow/empty outcomes stay explicit.
- Alumina Firmware 953ed4b7e8059288abe5146cfd68400f0961587e: Q30Interval delegates its non-const ratio,
  midpoint, arithmetic and square operations to FixedInterval<i32,30>. Pair
  storage (8 bytes, alignment 4), public names, const constructors/accessors,
  constants and the FocError surface are preserved. Nominal Q30 point arithmetic
  and widened servo error carriers remain unchanged.
- Clarke's private beta-product helper retains i64 differences through shared
  fixed multiplication and narrows only after outward rounding. Alpha's division,
  balance validation, rounded Park composition, and current/servo/control policy
  remain in the domain layer. The generated difference's singleton hull is exactly
  its already-ordered closed interval; public input validation is not bypassed.
- Interface 27086866147cb5db9fb22e6cccc4581a6fea5a02: exactly two Cargo.lock dependency entries, for
  alumina-clock and alumina-foc, now name Hyperinterval. The missing lock updates
  were reproduced with --locked before repair; actual main client tests and WASM
  checking pass with --locked afterwards. None of the existing eight pending
  changes was committed or overwritten.

The positive fixed quotient kernel introduced in the clock stage is unchanged.
The complete caller audit for private ordered reconstruction is recorded in
CONTRACT.md. Exact narrowing follows the original lower/upper error order;
primitive operations make no Hyperreal decisions or cache calls. The trace test
requires zero scalar dispatch and zero rational reductions. STRICT and
APPROXIMATE_512 do not choose alternate primitive paths or discard receipts.

For Q30's nonempty i32/F30 input, only endpoint overflow and a zero-containing
quotient denominator can be returned by delegated arithmetic. They retain Range
and DivideByZero. Other kernel errors and empty results contradict constructor/
operation invariants and are asserted as such, never converted to false success,
empty output, zero values or an unrelated Range classification.

## Executed software qualification

- Hyperinterval: 216 all-feature tests/doctests on Rust 1.95, 39 fixed/serde
  tests/doctests on Rust 1.88, strict all-target Clippy, warning-denied docs and
  formatting. Main checkout repeats the all-feature suite after transfer.
- Firmware: 168 tests on both Rust 1.88 and 1.95, including all 83 original FOC,
  two new Q30 contract tests, seven clock and 76 simulator tests. Strict 1.88
  owner/clock/simulator Clippy and formatting pass; production checkout repeats
  tests and Clippy after transfer.
- Maintained transform conformance: seven tests on both compilers, including
  independent exact expectations, original widened/overflow/rounding cases,
  successful output chains and no-allocation success/error paths. Strict
  conformance Clippy passes. Maintained Q30 scalar conformance: all three tests
  pass. Fixed-only Hyperlattice tests and strict Clippy pass.
- Interface: 86 tests and wasm32 checking in an isolated client checkout and in
  the actual managed worktree with --locked after the two dependency updates.
  Rust 1.95 Clippy still reports the same baseline large_enum_variant in
  network.rs and nonminimal_bool in worker.rs, reproduced in the prior stage
  and unchanged here. No diagnostic was suppressed; this is not a passing gate.
- Rust 1.88 thumbv7em-none-eabihf checks pass for clock and FOC. Feature-tree
  inspection shows fixed-only Hyperinterval for FOC and integer-only for clock;
  no std, heap, arbitrary precision, serialization or mutable global state enters
  these kernel dependencies.

The first unqualified candidate needed an explicit endpoint type on from_ratio.
An initial constant-only assert tripped Clippy; the replacement checks the const
membership array for both extreme endpoints and zero, preserving and extending
its assertion. Failed attempts remain in the record. No existing test or fixture
was dropped, weakened or changed to excuse a numerical discrepancy.

## Output, allocation, timing and footprint evidence

Every retained build matches all 9,488 baseline rows byte-for-byte, including
full-width arithmetic, errors, ratio extremes, layout, and 165 transform fixtures
with all five actions. Core additive tests use exact widened-integer independent
expectations over both endpoint widths and six scales; checked reconstruction,
round-trip conversion, invalid scale, empty behavior and later arithmetic are
covered. Existing independent scalar/transform oracles remain in force.

Early candidates regress the chain and/or Rust 1.95 Clarke. They are rejected and
retained only as investigation evidence. Forced adapter/small-wrapper inlining,
native checked additive operations, direct guarded narrowing, order-preserving
reconstruction and the widened beta product remove those measured regressions.
The final matched host experiment has 24 alternating baseline/candidate pairs
per compiler, each containing twenty samples of 512 completed calls per action,
with explicit warmup and full output/digest checks. Every timed allocation and
allocated-byte count is zero. All operation counts and checksums agree.

Final median candidate/baseline ratios (Rust 1.88 / 1.95):
Clarke 0.9086 / 0.9724; Park 0.8239 / 0.8633; inverse Park 0.8157 / 0.8596;
inverse Clarke 0.8772 / 0.9378; chain 0.8720 / 0.8954. All recorded paired-median
bootstrap 95% intervals are below one. These are pinned shared-host observations
for the declared completed workloads, not universal or MCU timing claims.
Native profile is opt-level s, fat LTO, one codegen unit and overflow checks.

Matched native probe .text: 235,644 -> 235,180 (1.88) and
231,040 -> 230,352 (1.95). Executable bytes: 369,928 -> 369,928 and
372,944 -> 372,360. Emitted owner/consumer symbol unions shrink 6,949 -> 6,508
and 6,515 -> 5,841 bytes; the precise filter and raw nm output are retained.
This is scoped emitted-code evidence, not a full final-firmware size result.

The fixed control preserves all counts and checksums in six alternating runs;
its .text shrinks 239,740 -> 239,212 bytes. Median ns/shared operation:
add 14.275 -> 12.465, subtract 14.307 -> 12.685, multiply 18.531 -> 16.066,
divide 63.884 -> 62.670, square 15.962 -> 15.086. Its baseline artifact is
identified by the previously qualified clock-stage hash and is not rebuilt
against the now-migrated firmware implementation.

The actual no-allocator WASM consumer has zero imports. Both baseline and final
pass the independent Python exact-integer oracle: 1,660 complete transform calls
and 405 range checks (335 successful, 70 typed range failures). At the unchanged
one-million-fuel per-call cap, maximum observed fuel decreases 20,481 -> 16,555.
Artifact bytes decrease 40,082 -> 35,451. The exact engine/toolchain/artifact
hashes are recorded. This is emulator execution evidence, not device HIL.

## Integrity and remaining work

The 41 pre-existing staged CSGRS extraction paths retain their original binary
patch SHA-256. Interface's eight pending edits retain every original byte after
removing the two separately committed dependency entries; the explicit before
snapshots and preservation check establish this even though the relative patch
hash changes with the new lockfile baseline. Firmware is clean at its source
commit. The isolated core tree is clean at its retained source commit; other
isolated test trees keep their recorded dependency-path setup. All 21 preceding
frozen stages were verified without mutation.

No MCU cycle/stack/register-pressure measurement, HIL trace, final MCU firmware
image, whole-application cost, root successive_operations, full workflow matrix,
new sanitizer or coverage campaign is claimed. No push occurred. These open
qualification gates, wider servo interval integration, the Phase 11 cost blocker
and coordinated release remain required before full-goal completion.
