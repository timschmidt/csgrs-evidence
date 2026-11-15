# Lattice exact-support experiment and retained rectangular regressions

Base f3a283a5c095ab6b6d9f05e7d0f157f555f47c78. Owner Hyperlattice interval companion;
plan phase 6 / section 5.3. See contract.md for the pre-edit acceptance contract.

The opt-in borrowed PreparedIntervalMatrix candidate is rejected. Its exact-zero
mask omitted certified zero coefficients and delegated the ordered remaining
terms to the existing dot kernel. Focused tests passed across six scalar
configurations, including generated-output composition, dyadic shared-work
exhaustion/retry, no-allocation controls and six fresh-process source replays.
Those results do not establish full qualification or a retained capability.
The missing API was reproduced on the unchanged base with Rust 1.88.

The old centered_cost example grew from 1,696,312 to 1,696,320 bytes in the same
source/build paths. Section comparison finds identical code, allocated data and
unwind bytes; .strtab grows by seven bytes plus file padding, with build-id and
symbol-table bytes also changing. This still fails the predeclared raw-size
condition. No gate was waived, no layout/inlining/name variant was attempted,
and no timing campaign was run. prepared_cost.rs is an unexecuted draft, not
performance evidence. Candidate source, patch, focused test logs, artifact
hashes and section comparisons are preserved here. The candidate has not had
full Clippy, documentation, fuzz, coverage, platform or package qualification.

Only four independent regression tests for existing rectangular products are
retained. They exercise 512 deterministic 2x3 by 3x2 products per scalar
configuration (fixed i32/F0, fixed i64/F16, F32, F64, rational and dyadic), both
output columns, a subsequent signed-diagonal transform, and empty/unit shapes.
The existing exhaustive endpoint-corner oracle supplies independent exact
integer expectations. Original test contents remain an unchanged byte prefix.
No production implementation, public API or manifest change remains.

Stable owner tests pass 94 cases; the no-default configuration passes five;
Rust 1.88 fixed/dyadic/IEEE/serde passes 80; Hyperlattice's interval surface
passes seven. Strict all-target Clippy passes on stable/all-features and the
Rust 1.88 primitive configuration. The first stable Clippy run diagnosed a
manual divisibility check in the new generator; the standard method fixes it,
and both compiler suites and Clippy were rerun. Formatting passes. All eight
original release examples are byte-identical to baseline after restoration.
No benchmark claim or universal closure claim is made.

Source commit: 0157d6b9bcb344ba60e1badfd0a2d2ff400aa655. Integration preserves the exact pending 41-path
index patch; Interface's eight paths and firmware remain unchanged. All 59
previous frozen evidence stages verify unchanged. Individual JSON records
contain exact executed commands and outcomes; primary checkout checks are
recorded separately. No full pre-push, whole-goal completion, MCU/HIL, push or
publication claim is made. Prepared object-fact reuse and the existing larger
migration/resource/qualification gaps remain open.
