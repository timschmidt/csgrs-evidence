# Servo interval migration qualification — 2026-11-14

Retained CSGRS b30763aa5a4bf5895f62462cb900eb3730e0f49b and Firmware
558df6d6ebf4dbca5377abf64b775c9e072aa013. The full 15-phase goal is active.
Phase 9 hardware qualification is not complete.

Hyperinterval shares the existing integer unsigned-distance midpoint kernel
with fixed intervals. Ordered bounds prove both rounded midpoint sums fit;
wrapping addition implements those exact, proved representable sums without
redundant overflow branches. Fixed width uses exact unsigned distance. Empty,
rounding, serialization, public validation and feature boundaries are unchanged.
Integer rounding evaluates the same tests in the same order. Scalar dispatch
and rational reduction counters remain zero in the maintained trace tests.

ServoPositionInterval keeps const construction/accessors and 16-byte pair
storage, delegating midpoint/width to FixedInterval<i64,32>. The hull of exact
endpoint singletons reconstructs its already-ordered interval. Velocity error
construction widens Q30 endpoints before shared i64/F30 subtraction. Errors
retain their existing i64 carrier. Position errors retain i128 and their exact
full-width differences; no generic i64 demotion is introduced. Controller
admission, fault latching, ordering, configuration and protocol are unchanged.

## Passing checks

- Independent new servo witnesses pass before and after implementation: all
  ordered endpoint-grid widths, lower midpoints, full-width position/velocity
  errors, generated-result replay, const surface and layout.
- Hyperinterval 219 all-feature tests/doctests on Rust 1.95; MSRV fixed/integer/
  serde matrix 56 tests/doctests plus the subsequently added integer midpoint
  witness separately on Rust 1.88. Tests cover all 96 valid fixed scales, all
  three rounding modes, empties, and all 12 primitive integer families.
- Warning-denied core Clippy/all targets, rustdoc, and affected-file formatting.
- Firmware 171 tests (FOC, clock, simulator) and strict all-target Clippy on
  Rust 1.88. Actual production paths repeat the core 219 and firmware 171 tests
  and their strict Clippy after transfer.
- Fixed-only Hyperlattice 28 tests; maintained FOC conformance 7 tests.
- Isolated actual Interface client 86 tests and locked WASM build. Its Clippy
  reproduces the existing large_enum_variant and nonminimal_bool findings;
  that command is explicitly failing and is not a passing gate.
- Cortex-M thumbv7em-none-eabihf clock/FOC check.
- Exact full-row native comparison: 5,366 servo rows on each of Rust 1.88/1.95,
  9,488 FOC rows, and the full maintained clock observer corpus, with identical
  allocation reports. Servo rows include complete update fields and final
  controller states across successful, stale, following-error and velocity
  faults, including subsequent fault-latched calls.
- Wasmtime 50.0.1 independent integer FOC replay: 1,660 complete transforms and
  405 range cases (335 successful, 70 Range). Both artifacts have zero imports,
  max fuel 16,555 at the unchanged million-fuel limit and size 35,463 bytes.
- Independent WASM position oracle: 2,090 midpoint/width calls, extreme and
  seeded full-i64 pairs, zero imports, no exhaustion at 10,000 fuel/call.
  Max observed fuel 206 to 21; probe bytes 5,233 to 3,495.

## Completed-workload cost

Native profiles use opt-level s, fat LTO, one codegen unit and overflow checks.
All timed work completes and consumes output with matching counts/checksums,
zero allocation, in-process warmup and alternating baseline/candidate ordering
on CPU 0. Host frequency and shared-host noise are not controlled. Results are
scoped host observations, not MCU cycle measurements.

For accessor, successful service and fault-latched service workloads, final
median candidate/baseline ratios are 0.9705/0.9909/0.9727 on Rust 1.88 (12 pairs)
and 0.9826/0.9941/0.9724 on 1.95 (24 pairs). Native servo text 247,148 to 247,116
and 244,590 to 244,462 bytes; binaries 389,560 to 389,560 and 395,400 to 395,272.
Clock 24-pair median ratio 0.9994, bootstrap95 [0.9975,1.0012]: no resolved
change. Clock text 267,148 to 267,100, binary unchanged 423,712 bytes.
FOC chain ratio 0.9836 (24 pairs), bootstrap95 [0.98349,0.98364]; all measured
component medians/intervals are below one. FOC text 247,740 to 247,660 and
binary 391,704 to 391,536. Exact raw data and artifact hashes are retained.

Initial delegation, inlining and hull variants failed timing and/or text-size
checks and are not retained. Their raw logs/source snapshots remain. The first
proven-add build had a delimiter error; its subsequent mistaken timing measured
the preceding artifact and is explicitly excluded (proven-add-retry.txt).
Final measurements follow successful builds and final observer/hash validation.
The initial core test had an incorrect contains method name; the corrected
contains_point assertion is retained and final tests pass without weakening it.

## Scope and preservation

The captured default and successive_operations feature dependency graphs for
CSGRS exclude Hyperinterval, so this change does not enter that benchmark's
binary. No fresh whole-geometry benchmark campaign is claimed. No new coverage,
ASan/fuzz campaign, complete workflow matrix or final firmware image is claimed.
MCU cycle counts, stack/register pressure and hardware-in-loop remain open.

Only seven core paths and one Firmware source path were committed. The 41
staged extraction paths retain their existing binary-patch digest; Interface's
eight pending edits and HEAD are unchanged. No push occurred. All 22 prior
frozen stages match their registered digests. Source budget before ledger update
passes at 4,180 files / 143,218,006 bytes. This software migration does not close
other phases, Phase 11 retention costs, or coordinated release obligations.
