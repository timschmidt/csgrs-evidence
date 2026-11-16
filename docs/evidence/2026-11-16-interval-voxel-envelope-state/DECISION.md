# Rejected: aggregate result-state ownership

Owner: Hypervoxel `FieldEnvelopeFacts::from_envelopes`, Phase 13;
P6/P8/P9/P19/P35–P39. Candidate `200a3ecf92343145d48bbbd334fa39ccb87ef4d2`
adds in-place result construction to unaccepted validation candidate
`644732fdf9b6f4995d51635a43743b63b0a034c7`. Original implementation is
`17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f`; fixed cumulative baseline remains
`c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb`. Neither validation candidate is
an accepted or reset cost baseline.

The original implementation can publish certified facts for inverted vector or
tensor bounds and malformed tensor dimensions. Those findings were reproduced
in the parent stage and in this stage's controls. Required validation addresses
that correctness gap, but its first implementation adds 48 bytes of wrapper
stack even for empty input, which performs no validation. The new ownership
implementation removes the separate local accumulators/final assembly while
preserving iteration and predicate order. It improves the measured stack path,
but fails the already declared final native executable-code and named-code caps.
It is not retained. No cap, test, policy, fixture, or workload is weakened.

## Completed observations

The initial screen contains 162 fresh processes and 648 guarded-stack
observations. The expanded screen contains 594 processes across eleven cases,
three repetitions, cold/16-call-warm state and separate allocation/trace/stack
builds. Every operation outcome is checked against exact expected fields or its
typed error. Cases include errors after both vector and tensor aggregates own
symbolic endpoint clones. Relative to 644, all 528 allocation records, 528 full
trace records, outcome rows and input-drop cleanup records match; all 264 paired
stack observations are nonincreasing. These are finite observations, not a
universal resource bound. Original incorrect certifications and added validation
costs remain recorded separately.

Maximum touched stack bytes (original / 644 / 200): empty 6248/6288/6216;
first and many rational envelopes 6824/6872/6792; surd 6824/7376/7296;
computable e 6824/8216/8136; unknown identity 6824/13120/13040;
late inverted 8520/8216/8136; late unknown 12736/13120/13040.
Static `execute` reservation is 0xf8/0x128/0xd8 with the same six saved registers.
A zero paint reading means no detected overwrite below the protected region,
not zero stack. Added symbolic proof costs and known scalar-cache retention are
not waived or claimed bounded by these measurements.

This resource configuration resolves num-bigint 0.4.8 and rustc-hash 2.1.3.
A second probe lock matching all nine repository-pinned registry versions was
prepared, but its builds/runs were not executed after the decisive size failure.
No two-lock resource qualification is claimed. The prepared runner is not a
successful test. Pinned owner tests are distinct from pinned resource evidence.

Final-source Rust 1.95 and stable owner suites each report 92 passing tests or
doctests; Hypersdf reports 186 passing test reports (including nested output,
not a claim of 186 unique tests). Strict all-target/all-feature owner Clippy on
both compilers, downstream Clippy, strict docs, WASM library Clippy and nested
workspace formatting pass. The focused two-file suite reports 20 passes. No
full-current-revision CI, release packaging or hardware qualification is claimed.

## Final linked costs

Every control uses the same consumer sources, source path, configuration and
lock. The external consumer checks 225 independently expected rational hulls,
feeds each result back into aggregation, distinguishes four malformed cases
including target-width dimension overflow, and composes a valid zero-dimensional
tensor. Each WASM artifact runs 16 calls in four fresh instances with no imports.
Native/WASM controls pass the expected outcome masks (0 original/fixed;
15 validated/in-place). These are source consumers, not distributed packages.
The benchmark's 13 cases run in Criterion functional test mode only.

Fixed-baseline cumulative growth for 200 (bytes):

| Target | File | Executable code | Named native code |
| --- | ---: | ---: | ---: |
| Owner benchmark | 1360 | 480 | 457 |
| Native consumer | 7344 | 4464 | 4421 |
| WASM consumer | 758 | 564 | n/a |

All percentage increases are below 1%. The shared voxel allowance requires both
8 KiB file AND 1%, and 4 KiB executable/named code AND 1%, per target, incrementally
and cumulatively. Native executable code exceeds its absolute cap by 368 bytes;
named code exceeds it by 325 bytes. Current-baseline native values are identical
to fixed-baseline values. No savings on another target can offset that failure.
The original/fixed benchmark differs by eight file bytes but has equal measured
code sizes; both comparisons are retained.

Compared with 644 on this same expanded consumer, 200 adds 2184 file, 1344
executable-code and 1335 named-code bytes. Its benchmark has identical sizes;
WASM shrinks 17 bytes. The older narrower consumer from the parent stage cannot
replace these measurements. Changing the consumer removed no old assertion.
No allowance is adopted and all 54 existing accounts remain unchanged.

## Disposition and remaining scope

No timing was executed for 200. The unstarted old 644 owner timing command was
withdrawn from the quiet queue, preserving the previous plan. It would neither
qualify 200 nor resolve 644's known empty-input stack regression. The remaining
22 queued commands are unchanged. All build barriers stay closed until
restoration finishes. Existing external routing/enclosure work is left alone.

The candidate remains available under
`refs/interval-unaccepted/voxel-envelope-state-20261116`. Restoration results
are recorded separately in `restoration.json`; they must be terminal before
archival. The parent 644 worktree/evidence stays intact and unaccepted. A future
implementation must preserve validated outcomes, original completed-workload
costs, shared fixed caps, and all other gates; arbitrary layout/inlining sweeps
or cap enlargement are not an admission path. Field-public-mutation, ball
conversion, broader resource contracts, all fifteen phases and the goal remain
open. No primary production code is changed, pushed or published by this review.

Restoration completed: all 12 original field/path tests, strict owner Clippy and
formatting pass; the three rebuilt original artifacts reproduce current-control
hashes byte for byte. All 15 final artifact builds/functional runs pass and all
80 WASM invocations return their expected masks. The build barrier is released;
`verification.json` checks these records and the unchanged 54-account ledger.
