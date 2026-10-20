# Periodic cylinder certificate qualification — 2026-10-15

This is a retained native-kernel prerequisite for WP03/WP14a. Every one of the
28 work-package gates stays open. It does not implement analytic STEP import.

The former certificate required four quarter-turn strips. The replacement
admits any exactly proved rectangular partition of one angular period on the
same cylinder support. Existing face-image, rectangle-boundary, cap,
orientation and shell-incidence checks remain required. The new indexed sweep
rejects any missing or multiply covered cell. Event and tree allocation is
fallible; the tree depth is bounded by the target's machine-word width.

After exact boundaries have been ordered, N rectangles and U angular intervals
need O(N log N + N log U) work and O(N + U) storage. The old scalar sorting and
index lookup can still be quadratic, and scalar work, time and heap are not
globally bounded. No public API, archive envelope or production dependency was
added. The native builder still rejects a single edge whose start and end are
the same topological vertex; closed STEP circles need further work.

## Correctness and feasibility

[commands.json](commands.json) and its logs record:

- 366 results in each of debug and release: 324 HyperBRep and 42 IO results.
  These configurations overlap; they are not 732 distinct tests.
- Three new library tests compare the sweep with independent cell counts over
  all 512 subsets of the nine 2-by-2 rectangles, 2,000 deterministic 3-by-3
  multisets in both input orders, duplicate/invalid ranges, an address-overflow
  failure, a maximal-height interval, and a 100-million-cell staircase.
- Four new public integration tests cover one/two/three/four side faces,
  unequal widths, three periodic chart origins, axial splits/T-junctions,
  repeated seam uses, area/volume/classification, first/repeated queries and
  archive-byte equality. A shared seam survives subdivision and reflection;
  coincident-cylinder union/intersection/difference reuse the certificate.
  Invalid side collections and each reversed cap/side orientation are rejected.
- Strict all-feature/all-target Clippy and warning-denied docs for both affected
  kernel/IO packages, all three fuzz-target builds, workspace formatting and
  whitespace checks pass. Fuzz targets were compiled, not fuzzed.
- Five groups actually execute under Wasmtime with zero imports. They include
  native replay, split/reflection/Boolean composition, large coverage, a gap,
  32-bit capacity failure and native double-cover rejection. The executed WASM
  file is 15,680,891 bytes; see [wasm-runtime.json](wasm-runtime.json).

[Three deliberate faults](controls/results.json) fail at runtime and are restored:
ignoring minimum multiplicity, ignoring maximum multiplicity and restoring the
four-strip grid restriction. The latter demonstrates the original capability
blocker. Three independently applied benchmark-reader mutations reject a missing
row, duplicate row and changed checksum.

The original [OCCT cylinder](research/occt-cylinder.step) and
[OCCT box](research/occt-box.step) are research inputs, not successful analytic
imports. OCP 7.9.3.1 wrote them with 3D curve output and no pcurves. The cylinder
has one periodic side, two closed-circle edges and a repeated seam. Its decimal
vertices are not exactly on the declared circle: the
[exact rational audit](research/fixture-audit.json) preserves that fact. The
recipe is recorded in [check_fixture.py](research/check_fixture.py). Neither the
schema nor a tolerance authorizes silent vertex healing.

Local Git whitespace attributes preserve the original exporter bytes and the
space-only context lines required by the retained unified fault patches.

The [initial qualification](qualification-initial/) retains an all-target
Clippy failure caused by importing unit-test helpers into a harness-free bench.
The tests were moved to a separate private test module and the controls/native
checks were rerun. The first offline fuzz check also failed on uncached locked
dependencies. Fetching those unchanged dependencies allowed the remaining
checks to run. No source behavior was weakened to pass either check.

## Costs

The unchanged 66-case kernel benchmark runs in three alternating CPU-0 pairs
against the frozen executable from `51d41cc5038224da3fd21baf2daf17308a57daf1`.
All names, row order, iteration counts/units and checksums match in all six runs.
The median across the 66 ratios of per-case medians is **1.004237**; the maximum
is **1.025204**. This is descriptive evidence, not a statistical speedup claim.
The first baseline process was faster across many unrelated rows; all original
runs remain in [kernel-costs.json](kernel-costs.json) and the paired logs.

The new allocation-instrumented benchmark runs in three separate processes.
Inputs for replay/coverage are prepared outside the measured loop; native replay
includes parsing, validation, exact queries, serialization and complete archive
comparison. Construction includes fixture authoring and exact queries.

| Case | Median elapsed/cycle | Allocation requests/cycle | Requested bytes/cycle |
| --- | ---: | ---: | ---: |
| 1,999 rectangles / 1 million implicit cells | 0.551517 ms | 2 | 223,936 |
| 19,999 rectangles / 100 million implicit cells | 6.482475 ms | 2 | 2,239,936 |
| One-side cylinder replay | 1.551462 ms | 4,913 | 649,349 |
| Unequal-side replay | 1.628261 ms | 5,273 | 668,261 |
| T-junction replay | 2.227024 ms | 7,753.01 | 855,210.76 |
| One-side construction | 0.958969 ms | 3,362 | 320,849 |

Requested allocation bytes exclude the prebuilt input rectangles/archives and
are not RSS or allocator usable sizes. Every new fixture preserves its receipt;
the three archive fixtures preserve complete bytes and FNV fingerprints across
processes (33,237 / 35,569 / 51,149 bytes). The last construction row has no
serialized output. There is no previous successful implementation of these
new capabilities, hence no matched speedup claim for them.

Kernel executable size changes from 24,997,880 to 25,008,152 bytes (+10,272).
Median process peak RSS changes from 22,024 to 22,028 KiB. The instrumented new
benchmark is 22,337,408 bytes with median peak RSS 11,396 KiB. Executable hashes,
compiler versions, commands, allocation counters and all raw timings are retained.

The historical archive-admission timing failure remains open. These cylinder
measurements do not clear that separate gate. No new runtime fuzz/ASan/lexicase
campaign, full-workspace pre-push verification, general periodic trim proof or
whole-release qualification is claimed.

## Reproduction

`qualify.py` runs the command set; its temporary WASM probe is reproduced from
[wasm-probe/](wasm-probe/). Cargo caches/targets and optional Wasmtime live in
`/tmp`, and the fixture paths assume this checkout at `/mnt/development/csgrs`.
Fetch the locked fuzz dependencies if necessary before the offline check.

`benchmark.py` requires the recorded baseline executable to have been built and
copied before rebuilding the candidate. It verifies that executable's digest
and unchanged benchmark source. `controls.py` temporarily introduces each fault
and restores exact source bytes in a `finally` block; run it without concurrent
source edits or builds, before final qualification. `collect.py` binds the final
source and artifacts and audits unchanged dependency trees. `verify.py`
recomputes receipts, costs, counts, hashes and open-gate assertions. Its source
snapshot is intentionally specific to this increment; subsequent kernel edits
need new evidence.
