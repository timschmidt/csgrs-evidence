# Finer-grid identity: rejected on performance

The complete external-consumer profile identified dyadic regridding as a removable
allocation cost. Canonical-source reuse removes the fine-grid mantissa expansion
while preserving exact representations, conservative charges and failure order.
The allocation witness fails on the original source (48 bytes versus a 16-byte
clone for [-7,9]*2^-3 regridded to -67) and passes for all 18 candidate cases.

The candidate passes the final 2,020-test core matrix, 10 boundary-representation
interval tests, one native curve consumer, 186 SDF tests, 448 physics/circuit tests,
87 Rust 1.88 tests, strict all-target core Clippy, no_std WASM/Thumb compilation,
and formatting. These are scoped local checks, not the full pre-push/hosted/HIL,
fuzz or coverage matrix. Complete preparation, report, trace and resource rows
match all 373,388 baseline bytes. Direct regridding/alignment has zero scalar
dispatch. All eight external certificates match and pass independent analytic
containment, widths, continuous tubes and actual step-cap checks.

All 25 measured binaries and their .text/named-code-symbol measurements are
nonincreasing. The successive_operations executable is byte-identical. Whole-process
Callgrind instructions fall from 612,282,606 to 568,028,589 (7.23%); inclusive
regrid counts fall from 63,028,733 to 18,190,372. Inclusive counts overlap and the
observer includes warmup/replay/serialization, not just timed integration.

The ABBA external campaign records 640 samples of 100 complete integrations:
median latency falls 3.6–13.1% in all 16 fresh/prepared configurations. The owning
scalar campaign preserves all exact/checksum/work rows across 380 configurations.
It also exposes regressions. Dyadic wide log at precision -256 rises from
439.183 us to 454.986 us (+3.60%). A separate focused ABBA confirmation reproduces
439.030 us to 455.263 us (+3.70%); the partial-domain -256 row rises 3.99%.
Other unfavorable owner observations, including timer-scale primitive/shortcut
rows, remain in the full summaries. No aggregate win overrides those observations.

Decision: reject under the unchanged owning-benchmark performance gate. Neither
allocation reduction, smaller binaries nor application wins waive that gate.
The cause of the native latency change is not proved here; do not claim that the
instruction profile explains it. No arbitrary inlining or layout retry was made.

All four experimental paths were byte-verified before restoring/removing them.
The isolated checkout is clean at the admitted revision. Original owner tests and
formatting pass; all 25 rebuilt binaries reproduce baseline bytes, and the external
consumer again reproduces its full transcript and passes the analytic oracle.
Main 41 staged and Interface 8 pending paths are unchanged; firmware and CAPD stay
clean. The prior 75 frozen stages were verified unchanged. No production change,
push or publication is retained. The full interval-refactor goal stays active.
