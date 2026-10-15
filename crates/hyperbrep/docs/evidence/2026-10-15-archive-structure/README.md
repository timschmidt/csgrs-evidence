# Archive structure admission

Retained as partial WP01/WP13/WP21 work. Explicit archive limits now cover
records, spline/root degrees, variable geometry elements and topology lists
before exact-scalar reconstruction. All established measured cohorts pass this
increment's 10% timing budget. The inherited archive-input-admission timing
issue remains open; see [decision.json](decision.json). No work-package gate is
completed and no speedup is claimed.

## Contract and implementation

The [archive contract](../../SELECTED_ARCHIVE.md#input-admission) defines units,
defaults, rejection and retry semantics. `persistence/admission.rs` carries one
budget through Serde seeds; `admission/shapes.rs` summarizes record metadata
without exact scalars or per-record collections. Model arenas, selected roots,
detached sources and inline extrusion/revolution profiles share the budget.
Empty tensor rows count, and declared degrees are checked without constructing
a spline. Geometry and reference indices remain untrusted until full decoding
and validation. No data is simplified to fit a limit.

Successful input combines version and structural admission in one pass after
the existing syntax scan. On metadata failure, a header-only read preserves
unsupported-version diagnostics independently of field order. There is no old
schema reader or migration path. Archive version 9 and successful serialized
bytes are unchanged.

These counters are not total allocation, scalar-work, stack or geometric-replay
bounds. The metadata/error path may allocate. Native stack growth remains;
WASM compilation does not establish safe hostile-input execution or drop.

## Correctness

[Commands](commands.json) record 243 all-feature core tests, 70 integration tests
and four doctests; the default configuration has 236 core tests, 69 integration
tests and four doctests. Configurations overlap. Forty-seven focused release
tests cover admission, retained points, selected topology/solids and spline
replay. Strict Clippy, warning-denied docs, WASM library compilation, fuzz-bin
Clippy, all nine release benchmark builds and formatting pass.

Eight new public tests cover:

- Exact cuboid record/reference boundaries, byte-identical retry and volume 24.
- Valid NURBS degree/element boundaries with exact replay.
- Every spline storage family, with invalid scalar payloads proving that
  structural rejection occurs before scalar decoding.
- Every variable topology list, with invalid indices behind the limit.
- Shared totals across detached curves, pcurves, roots and both inline profiles.
- Empty tensor rows and a `usize::MAX` declared degree.
- Every topology/geometry/selected-graph record array, charged before payloads.
- Early/late versions, obsolete records, missing versions and duplicate versions.

[Six deliberate implementation faults](controls.json) each fail runtime test
assertions: omitted record, degree, geometry or topology admission; omitted
empty-row headers; omitted inline-profile records. Patches and logs are under
`controls/`. The runner restores source hashes in a `finally` block. Compiler
failures are not credited. Final tests, Clippy and formatting pass after all
faults are restored.

## Costs and the superseded experiment

The frozen baseline is `155f15e4f`; [executable metadata](executables.json)
records hashes and sizes. [Benchmark commands](benchmark-commands.json) run
18 processes, all pinned to CPU 0: three alternating native pairs, three
allocation-instrumented archive pairs and three positive spline replay pairs.
Fixtures are constructed outside timing. Every original case retains its
iterations, assertions, output units and checksums.

All 66 native receipts match. [Native case ratios](comparison.json) have median
0.995768 and maximum 1.073196. The kernel executable grows 224,768 bytes to
24,997,880. Median native process peak RSS is 21,796 KiB for baseline and
22,008 KiB for candidate. These samples do not establish statistical significance
or general memory bounds.

The eight [positive spline replay receipts](positive-comparison.json) match,
including native/selected trims, multi-span NURBS and eight replay/encode cycles.
Per-case ratios range from 0.999766 to 1.014925. These fixed cases are not
asymptotic bounds on arbitrary composition.

The four established [allocation-instrumented archive cases](admission-comparison.json)
also preserve receipts and pass the 10% budget. Cuboid decode/encode changes
from 379.930 to 380.386 microseconds (1.001200 ratio), with unchanged 695 Rust
allocator calls and 216,464 requested bytes per iteration. The candidate's
eight [feature costs](feature-cost.json) are:

| Case | Iterations per process | Median per iteration | Allocation calls per iteration | Requested bytes per iteration |
| --- | ---: | ---: | ---: | ---: |
| Cuboid decode/encode | 256 | 380.386 µs | 695 | 216,464 |
| Reject bytes | 100,000 | 21 ns | 0 | 0 |
| Reject nesting | 100,000 | 88 ns | 0 | 0 |
| Reject tokens | 100,000 | 166 ns | 0 | 0 |
| Reject records | 10,000 | 180.694 µs | 7 | 214 |
| Reject degree | 10,000 | 1.082 µs | 4 | 126 |
| Reject geometry elements | 10,000 | 9.104 µs | 5 | 166 |
| Reject topology references | 10,000 | 8.556 µs | 4 | 126 |

Structural fixtures reject a 100-record cuboid with allowance 99, a declared
degree 300 with allowance 256, or 128 control/reference entries with allowance
64. Error construction allocates. Instrumentation counts Rust `alloc`,
`alloc_zeroed` and `realloc` requests and requested sizes; it does not measure
foreign allocations, retained heap, native stack or arbitrary geometry work.

The [separate-pass prototype](separate-pass/admission-comparison.json) kept
version admission and metadata admission as separate traversals. Its cuboid
median was 580.281 microseconds against 379.363, ratio 1.529619; its three short
syntax rows also exceeded the 10% gate. That implementation is superseded, not
retained. All initial commands, raw observations, source files and the
[source difference](separate-pass.patch) remain available. Initial qualification
is historical evidence for that prototype and is not credited as final-source
validation. The final statistics use only the final-source processes. Comparing
the two experiments does not establish statistical significance.

This increment's baseline already includes the prior syntax-admission change.
Passing against it does not clear that change's
[unresolved pooled native timing gate](../2026-10-15-archive-admission/decision.json).
Controlled-host requalification remains on the work-package ledger.

## Reproduction and scope

Use the matching source snapshot and Cargo/rustc 1.99. `qualification.py` and
`recheck.py` contain exact validation commands. Run `controls.py` without
concurrent builds/tests; it temporarily changes implementation code. Build the
three baseline benches (`kernel`, `archive_limits`, `spline_replay_cost`) from
`155f15e4f` in a separate checkout and preserve the paths/hashes recorded in
`executables.json`. Build `measure.c` using
`cc -O2 -Wall -Wextra -Werror measure.c -o /tmp/hyperbrep-selected-archive-measure`.
Run `benchmark.py` without competing CPU-heavy work. The reverse experiment
patch reconstructs the separate-pass implementation from the final source.
`collect.py` records source/artifact hashes; `verify.py` checks those hashes,
commands, receipts, allocations, restored controls and the open-gate statement.

Scalar-work/allocation budgets, iterative WASM-safe record/coefficient decoding,
independent coefficient/certificate envelopes, semantic provenance, general
selected support graphs and bounded geometric replay remain open. No runtime
fuzz/ASan/lexicase campaign, full dependency/workspace suite, external oracle,
WASM execution or pre-push qualification is claimed. All 28 development-plan
work-package gates remain open.
