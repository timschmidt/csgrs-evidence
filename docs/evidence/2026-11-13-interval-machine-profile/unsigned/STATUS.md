# Rejected typed prototype

The signed prototype is rejected (+672 native ELF bytes). The typed unsigned
prototype adds Rational::unsigned_fraction and interval unsigned uncertainty;
source, tests and docs are under admission-source/ with checksums. No main
source changes or commits yet. Main 41-path staged extraction patch and main
Interface eight-path unstaged extraction patch remain intact.

Typed variant: scalar boundaries and independent GMP oracle pass; interval
independent endpoints, full-width u64, arbitrary nominal, consumed output,
all-feature rational trace/replay tests pass. Interface 201 unit tests plus
integration/doc pass; three migration tests with fresh-process dispatch pass.
Targeted release, ASan, strict Clippy and warning-denying docs pass. Existing
measurement conformance four tests pass; all eight value cases match.

Original profile harness: baseline 805904, candidate 805696 bytes. Six ABBA
blocks (24 fresh native processes, CPU0, ASLR off) preserve all seven full
results/identities/displayed allocation rows; mean ratios 0.9802--0.9903,
bootstrap intervals below one. Focused probe only.

Raw allocation harness: baseline 806000, candidate 805792 bytes; complete
transcripts including raw allocation totals match. Native emitted function
union 438574 -> 438415 bytes; .text 441831 -> 441671. Same Rust1.95 WASM
baseline 1064908 -> 1064857 bytes, seven full native/WASM transcripts match,
invalid index rejected, zero host calls. Fuel decreases 388--1716 per scenario.
Existing measurement binaries retain sizes, .text and other sections except
build IDs and five u32s matching the +12 source-line shift. 160 completed cost
rows match exact allocation columns; their timing was concurrent-build
informational only.

The variant is rejected by retention-result.json. Unexecuted gates: new raw-harness isolated timing, scalar and
successive_operations regression gates, further full integration with preserved
pending patches, evidence archive and admission ledger, focused commit(s).
Full plan remains active; integer scaling, positive products/quotients and
named budget composition are not migrated by this constructor increment.

All unsigned prototype validation/build/timing processes completed. The scalar
borrowed_ops benchmark grows 144 bytes (including +20 in its exception table),
and successive_operations grows 136 bytes. Native profile reductions do not
waive those failures. Their runtime campaigns were not run after the size gate
failed. An independent one-new-wrapper inline experiment lives in
../unsigned-inline and does not alter this preserved prototype source.
