# Explicit archive input admission

Retained as partial WP01/WP13/WP21 resource-contract work, with a documented
architectural cost exception. **The pooled native timing gate does not pass.**
All mathematical benchmark receipts match; the timing uncertainty and required
follow-up are recorded in [decision.json](decision.json). No work-package gate
is completed and no performance improvement is claimed.

## Contract and implementation

`RawModel::from_json(json, &ArchiveLimits)` requires explicit input allowances:
UTF-8 bytes, simultaneous JSON container depth, and syntax tokens. Defaults are
16 MiB, 1,024 levels and 1,000,000 tokens. The old one-argument API is removed;
repository callers, tests, benches and fuzz targets are migrated directly.
Archive version 9 and deterministic output bytes are unchanged.

An allocation-free, iterative scan precedes both version parsing and exact
scalar deserialization. Bytes are checked first. Tokens include each opening
container, quoted string/key and primitive lexeme. Structural punctuation and
whitespace are not tokens; their bytes still consume the input limit. Unknown
fields count, and escaped quotes or delimiters in strings cannot change the
structural depth. Exceeding an allowance returns a typed `ArchiveLimitExceeded`
with resource, limit and observed size or first disallowed count. Raising a
limit permits an exact retry. The scan does not replace JSON syntax validation.

This boundary has constant auxiliary storage and scans at most the input
length. It does **not** bound scalar evaluation, entity/degree expansion,
aggregate reconstruction allocations, native stack usage or geometric replay.
The existing stack-growth decoder remains. A configurable depth limit is not
proof of safe decoding/drop on every native/WASM stack. Those WP13 obligations
remain open; [the archive contract](../../SELECTED_ARCHIVE.md#input-admission)
is normative for this increment.

## Correctness evidence

[Commands](commands.json) record 243 all-feature core tests, 62 integration
tests and four doctests; default configuration has 236 core, 61 integration and
four doctests. Configurations overlap. The five new public admission tests use
an independently parsed JSON tree to check exact token/depth boundaries and
retry, multi-byte text and whitespace, strings/escape sequences, ignored fields,
50,000 nested arrays, wide arrays, malformed/trailing input and version errors.
Successful retry reconstructs an exact cuboid of volume 24 with identical bytes.

The 39 focused release tests cover limits, retained points, selected topology,
selected solids and spline replay. Strict Clippy, warning-denied docs, WASM
library compilation, fuzz-bin Clippy, nine benchmark builds and formatting
pass. Final all-feature tests, strict Clippy and formatting run after mutations
are restored. WASM compilation is not execution.

[Four deliberate faults](controls.json) are rejected by runtime test failures:
missing byte admission, missing depth admission, missing token admission and
incorrect escape handling. Each patch/log is retained under `controls/`; the
runner restores the exact source hash in a `finally` block. No compiler failure
is credited as a successful negative control.

## Costs and the open timing gate

The frozen baseline is `11078836b`; executable hashes are in
[executables.json](executables.json). The
[harness audit](harness-audit.json) checks that the existing four archive/kernel
bench sources change only by adding explicit limits and Rust formatting.
Fixtures, iterations, assertions and checksums are preserved. Twelve native
processes (six alternating pairs pinned to CPU 0) preserve all 66 receipts.
No original sample is discarded or called invalid.

| Native timing analysis | Median of case ratios | Largest case ratio |
| --- | ---: | ---: |
| First three pairs, pooled per-case medians | 1.001281 | 1.265185 |
| Second three pairs, pooled per-case medians | 1.003303 | 1.127975 |
| All six pairs, pooled per-case medians | 1.243534 | 1.340618 |
| Diagnostic median of six within-pair ratios | 1.003536 | 1.050614 |

The first over-budget row is coaxial revolution cavity construction. The
repeat's maximum is sphere planar conic trimming; the combined maximum is
rational bilinear tensor containment. Pairs 3 and 5 show approximately 26%
median differences across the entire harness. The cause is not established.
The alternate paired statistic is diagnostic and does not replace the failed
pooled 10% gate. Raw first/repeat/combined/paired comparisons are retained.

The architectural reason for retention is explicit admission before recursive
schema/scalar decoding, required by WP13. Removing the scan would remove this
resource contract, and the current reader has no equivalent guard. This is a
feature extension with a recorded cost exception, not an optimization waiver
or a claim that all established timing budgets pass. Controlled-host native
requalification and investigation of stable over-budget cases remain required
before release performance admission. The guarded executable is the next
feature baseline; the pre-admission baseline remains available.

The kernel executable grows 1,872 bytes to 24,773,112. Across all six native
processes per side, median peak RSS is 22,046 KiB for baseline and 21,748 KiB for
candidate. These samples do not establish a significant memory difference.

Three additional alternating pairs measure existing complete spline replay
cohorts. All eight receipts and archive byte/count checks match. Added replay
cost is 2.04–4.01% in these samples; the unchanged short prepared-query row has
equal 86 ns medians. [Per-case results](positive-comparison.json) include every
cohort, including the eight-cycle composition case.

The new allocation-instrumented harness has four cohorts in three processes:

| Cohort | Iterations per process | Median per iteration | Rust allocation calls per iteration |
| --- | ---: | ---: | ---: |
| Native cuboid decode and byte-identical encode | 256 | 470.637 µs | 695 |
| Reject a 1 MiB input at its byte allowance | 100,000 | 25 ns | 0 |
| Reject 50,000 nested arrays at depth 17 | 100,000 | 117 ns | 0 |
| Reject a wide array at token 33 | 100,000 | 213 ns | 0 |

Each rejection also records zero requested bytes in all processes. Positive
decode/encode requests 216,464 allocator bytes per iteration, demonstrating
that instrumentation is active. These are calls to the Rust global allocator
(`alloc`, `alloc_zeroed`, `realloc`) and summed requested sizes; foreign
allocations, retained/peak heap, native stack and general geometry allocation
bounds are not measured. Input construction is outside timing. These are
fixed descriptive samples, not statistical significance or arbitrary-chain
resource bounds. [Feature results](feature-cost.json), resource logs and
[all process commands](benchmark-commands.json) are retained.

## Reproduction and remaining work

Use the matching source snapshot and Cargo/rustc 1.99. `qualification.py` and
`recheck.py` contain exact validation commands. `controls.py` temporarily edits
source; run it without concurrent builds/tests. Build baseline `kernel` and
`spline_replay_cost` benches from `11078836b` in a separate checkout, preserving
them at the paths and hashes in `executables.json`. Compile `measure.c` with
`cc -O2 -Wall -Wextra -Werror measure.c -o /tmp/hyperbrep-selected-archive-measure`.
`benchmark.py` records the first three native pairs, three admission processes
and three positive-replay pairs; `repeat.py` adds the second three native pairs
and computes combined results. `paired.py` derives the diagnostic paired
statistic from the same unmodified receipts. Run timing without competing
CPU-heavy work. `collect.py` stores artifacts and source hashes; `verify.py`
checks hashes, commands, receipts, allocations, controls and the unresolved gate.

Entity/degree/control-lattice limits, coefficient-envelope validation,
iterative WASM-safe record/coefficient decoding, total allocation/work charging
and bounded geometric replay remain open. No runtime fuzz/ASan/lexicase campaign,
full Hypercurve/workspace suite, external oracle, WASM execution or pre-push
qualification is claimed. All 28 development-plan work-package gates remain open.
