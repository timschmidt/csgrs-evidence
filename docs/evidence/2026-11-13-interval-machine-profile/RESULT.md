# Rejected machine-profile uncertainty migrations

Baseline source: CSGRS 3e4382664d50a7734d3fbef33b0a5da0c5ac22ef and
Interface ff668ca39d5e1ecee91b438b20eca806f3a26f29. Main pending extraction
patches were excluded from isolated experiments and remain unchanged.
Firmware bdee397d0b80841f16bf17e7bcd029b4feb2c212 is unchanged.

No production change is retained. Three variants failed binary-size admission:

* Signed fraction uncertainty ingress preserves native profile transcripts,
  but grows the profile ELF from 805904 to 806576 bytes (+672).
* Typed u64/NonZeroU64 scalar and interval constructors preserve independently
  checked endpoints and consumed outputs, fresh-process exact dispatch under
  STRICT/APPROXIMATE_512, complete profile values/identities and raw allocation
  counts. Native raw-profile ELF shrinks 806000 -> 805792, function union
  438574 -> 438415, WASM 1064908 -> 1064857. Nevertheless borrowed_ops grows
  6463088 -> 6463232 (+144), including 20 exception-table bytes; attributed
  successive_operations grows 21930560 -> 21930696 (+136). Those failures reject
  the variant. No scalar benchmark or successive-operation timing campaign was
  executed after these size failures. Equal text length is not equal binary size.
* Inlining only the new scalar constructor still grows borrowed_ops to 6463176
  (+88). It is rejected before broader functional or runtime qualification.

Typed-profile correctness: 7497 independently cross-multiplied endpoint cases,
35 full-width scalar boundary pairs, 1200-digit nominal, negative-radius and
zero-denominator diagnostics, outputs consumed by interval arithmetic and
machine validation. Full core: 201 unit, one integration, one doctest; migration
trace test separately runs with dispatch-trace. Owner all-feature rational/replay
checks, release, ASan, warning-denying Clippy/docs and eight scalar-oracle tests
pass. Logs and commands state actual scope; this is not full pre-push validation.

Seven profile scenarios comprise six successes and one expected typed invalid
profile. Native/WASM full transcripts match for both variants. WASM uses Rust
1.95, consumes no host calls, and rejects invalid case/byte indices. Raw native
allocations match exactly. Two native timing campaigns each use six ABBA blocks
(24 processes), 31 samples of 64 complete outcomes, CPU0 and ASLR disabled for
subprocesses. Both preserve full outputs; their per-case bootstrap bounds are
below one. These focused observations do not waive other workload gates or
claim a general speedup; clock/governor and unrelated host activity are not
controlled. Raw-harness mean ratios range 0.94031--0.95563, including the typed
invalid case, which is reported separately in native transcripts.

Existing measurement consumer: eight full values and four conformance tests
match; binary sizes and executable text are unchanged. Build IDs and five u32
values matching the +12 source-line shift differ. All 160 completion/allocation
rows match; their concurrent-build timing is informational only.

Harness corrections and original failures remain: unreduced wire fractions,
missing probe index, omitted rational feature, and use of a private test helper.
No failed or zero-test invocation is counted as acceptance. First prototype
sources and pre-raw harness remain distinct from final typed source snapshots.

All three experiment worktrees were restored cleanly. After restoration, four
rational/replay tests, the existing full Interface core/integration/doc suites,
and workspace format checks pass. final-repository-state.json proves the main
41-path staged patch and Interface eight-path pending patch retain their original
hashes. No push occurred. The full fifteen-phase goal remains active; machine
integer scaling, positive arithmetic, named budgets, full browser/schedule,
firmware/HIL, extraction retention, wrapping/resource closure and release remain
open. Subsequent work must address these measured cost failures rather than
repeat the same variants or weaken a gate.

Compiler output and Python bytecode are excluded from this archive. Their local
locations and hashes are recorded; sources, locks, build attribution, semantic
transcripts, samples, symbols and section diagnostics remain.
