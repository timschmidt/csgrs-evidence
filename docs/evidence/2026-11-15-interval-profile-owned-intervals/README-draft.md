# Retained machine interval ownership: rejected

Source: CSGRS 217bdda844c040be8c6909bce503686744cb1915, Interface
f5341f36803ad77c856313315d67ac8b3bb63f9a, firmware
b9ecf8df54723e532a42867a1d3c549f827d5f6d. ADMISSION.md records ownership,
input domains, missing witnesses and unchanged acceptance gates.

This distinct candidate retains shared NonEmptyRationalInterval storage inside
ExactInterval through construction and scaling. Nominal values and physical
identity remain in the wrapper. Positive interval products/quotients share their
Bounds without unpacking at ingress completion. Hyperreal owns a positive scalar
witness constructed from NonZeroU64, so nominal, lower and upper divisions share
one existing scalar conversion and preserve that order. The previously rejected
typed-fraction API and generic finalizers are not reintroduced.

The missing integration witness first reproduces E0432 for absent owner APIs.
Final correctness checks pass: 19 interval tests, including original independent
exact/GMP oracles, new 1,200-digit repeated-division GMP expectations and all 70
complete division dispatch comparisons; one full-width scalar witness; one
Interface Debug/size/const-getter/scaling witness; all 18 existing machine-profile
tests. All-feature/all-target Clippy with -D warnings passes for both owners on
Rust 1.95; both workspace format checks pass. No existing assertion was weakened.

| Complete seven-profile artifact | Baseline | Candidate | Delta |
| --- | ---: | ---: | ---: |
| Native | 810416 | 810864 | +448 |
| WASM | 1069027 | 1069760 | +733 |

Native full profile/identity/allocation transcripts match byte for byte. WASM
replays the exact native fields and invalid cases with zero host calls. These
finite consumer comparisons supplement the independent oracles; they do not prove
full policy/canonical schedule/browser equivalence or universal closure.

Both artifacts fail the no-growth gate. A native link map reproduces the measured
candidate binary exactly. The reused baseline map is bound to an executable whose
SHA matches the current baseline byte for byte. Native .text grows 352 bytes and
the mapped function-address union grows 360; unwind sections grow 104. The largest
growth lies in separated scalar-ingress helpers. The main derivation symbol
shrinks 95 bytes; manual Debug grows 31, insufficient alone to explain the gate
failure. Relro padding shrinks 448 bytes; this is not a heap-memory improvement.
Native size equals the earlier rejected nonempty prototype but contents differ;
WASM is 111 bytes larger. Maps do not establish runtime cost or zero overhead for
inlined operations. No speculative Debug/layout/inlining variation follows.

The combined candidate, retained-owner API and positive-scalar witness are
rejected. Full policy/schedule/browser, owner runtime, successive-operation and
whole-owner monomorphized-size campaigns do not follow this early rejection.
No runtime speedup or completed Phase 8 claim is made.

All 13 changed source files and reapplicable patches are preserved. Isolated
worktrees are restored clean. All 18 restored machine-profile tests, five rational
interval tests and both format checks pass. Fresh restored native/WASM artifacts
and native transcript are byte-identical to baseline. Primary 41 staged paths and
Interface 8 pending paths remain byte-identical; firmware is clean. All 72 previous
frozen stages verify unchanged. No push or publication. The complete fifteen-phase
goal remains active.

Command/result JSON, logs, exact outputs, maps, source snapshots and restoration
receipts are retained. Saved executables are external and hash-bound in build
records. Intermediates reuse the previous experiment's external build cache;
saved artifacts have a distinct directory. Build time and WASM fuel are not
runtime benchmark evidence.
