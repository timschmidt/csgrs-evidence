# E64: native aggregation works, but intermediate report retention fails admission

The isolated aggregation repair fixes five reproduced native failures and passes
the complete production HyperDRC suite: 1,669 tests, zero failures or ignored
tests. Both baseline and candidate pass all three original full-project resource
gates. Candidate formatting, Clippy with warnings denied, and documentation with
warnings denied also pass. The candidate remains **unadmitted and unapplied**
because repeated aggregation retains intermediate report caches.

The owning layer is HyperDRC's native PCB aggregation and its retained source
owners. The five-file repair avoids using finite report coordinates as a
prerequisite for native composition. The independent native-constructor corpus
improves from 8 passes / 5 failures to 13 / 0. All 39 existing source-failure
tests retain their names and passing results. The unchanged archived KiCad
review corpus improves from 8 / 4 to 9 / 3; its three remaining failures require
the separate, unadmitted exact KiCad-ingress proposal. No policy, assertion,
fixture geometry, original workload threshold or difficult input was weakened.

The prototype also declares readiness version 21 → 22 for changed diagnostic
semantics. Only the 960 corresponding version fields in six existing Hypercircuit
fixtures change; parsed comparisons verify every other value is unchanged.
Complete CLI report comparisons and Hypercircuit qualification were planned but
not executed for this rejected version. No report compatibility, public
distribution or speedup claim follows from the local passes.

The resource probe repeatedly aggregates the same exact unit square from empty,
then checks exact area one, interior membership and the full authored report of
N polygons. Each sample is a fresh process. Values below are **live requested
Rust allocation bytes after complete report materialization**, not RSS or a
heap-byte bound. Raw timings, peaks, pre-report state and post-drop state are
retained separately.

| Steps | Baseline live bytes | Prototype live bytes |
| --- | ---: | ---: |
| 16 | 14,640 | 100,996 |
| 64 | 26,928 | 772,804 |
| 256 | external 60-second exhaustion; no completed result | 9,358,276 |

Every completed sample satisfies the same semantic checks. The baseline timeout
is preserved and is not a faster successful operation or a completed comparison
at 256 steps. The prototype completes all three cases, but its source-owner
chain retains each preceding aggregate and its cached report. Retained report
storage grows superlinearly. Dropping the aggregate returns live allocations to
7,756 bytes in every completed sample, so this is excessive retention while the
result is alive, rather than evidence of a permanent leak. The next repair must
flatten retained report sources, preserve all source facts and authored order,
and pass an allocation-growth regression plus the existing acceptance gates.

Two harness corrections are explicit. The first complete library run passed
1,557 tests and failed two converter tests because a relative `out` directory
could not be created in the read-only working directory. Eight focused runs
against both source versions establish four read-only failures and four writable
passes; syscall traces show `EROFS` before converter execution. The complete
library rerun in private writable scratch passes all 1,559 tests. Separately,
a saved CLI bind prevented Cargo from replacing its output (`EBUSY`) before any
integration test ran. Compilation and execution were then separated, and the
CLI and eight test executables were frozen before execution. All integrations,
the binary test target and three doctests pass. The final helper initially
expected one doctest summary; both successful summary groups were retained and
counted without rerunning the tests. No implementation or test assertion changed
for these corrections.

Two complete project archives pass CRC/member-hash checks and independent
Python/unzip extraction. Fresh source trees, separate Cargo targets, explicit
binary copies, helpers, command logs, resource probes and remaining scratch
files are individually hashed. Large source and build artifacts remain on
persistent storage outside Git. General caches stay open. The E63 availability
audit reported 921,794 missing historical paths; that older history was not
reaudited here, and complete preservation is not claimed.

Only `current_work` changes in the ledger. The original 35-file bundle, cache
proposal and exact-track proposal remain unadmitted. Hypervoxel remains out of
scope. No source change, push, publication or full-plan completion is claimed.
