# Exact feed, join and lookahead extraction candidate — not accepted

This extends the pending axis/metric/jerk candidate at CSGRS ledger HEAD
fc859710c3ba1468e0ec3b0f440a960feedd3fe9. It is not an accepted refactor or a
completed Phase 11. Prior axis, jerk and rejected cost experiment records remain
immutable. CANDIDATE.json binds the complete pending CSGRS and Interface patches
to their base commits. Production changes remain uncommitted. No push ran.

## Ownership and behavior

ADMISSION.md records the owning layer, properties, input domain and missing
witness; baseline-missing.log reproduces the absent native API. Hyperdynamics
now owns scalar feed equations/profile selection, corner speed constraints,
forward/reverse lookahead and component-bounded jerk refinement. MetricPath
supplies lazy aggregate length; MetricSpan supplies lazy per-span length and
structural dynamics class. JoinSpan transports the source-owned classification
and complete original receipt. The geometry owner remains responsible for exact
source validity and for route and join inputs describing the same retained path.
These protocols do not validate arbitrary provider implementations.

Hyperpath retains native metric/tangent authority, deprecated compatibility
functions and native receipt aliases. Its borrowed axis-only adapter retains
old rejection of diagonal lines without allocating geometry copies. No guards,
length/classifier queries or replay queries are evaluated eagerly or reordered.
The generic whole-path protocol does not adopt the rejected private type-erased
MetricRoute experiment. All original report data and typed errors are retained.
Interface consumes the lower operations directly while preserving Route errors
and its existing schedule encoding. Constructors, dependency direction, API
migration and a standalone exact-provider example accompany the extraction.

Eleven scalar helper functions match the original source after only visibility
normalization, error-type rename, whole-line comment removal and rustfmt;
source-equivalence.py/json specify and reproduce this limited claim. The generic
entry points and receipt transport are not claimed to be literal source moves.
No new total work/memory/cancellation bound, general ODE/reachability capability
or geometric operation closure is asserted. Existing qualified and undecided
outcomes remain part of the contract.

## Correctness and downstream checks

The full original feed/lookahead/jerk algorithms are frozen test-only references.
Forty-six fixtures run in six fresh processes: legacy, native and compatibility,
each under STRICT and APPROXIMATE_512. Complete Debug reports and every dispatch
counter match, including nested tangent receipts and failed candidates. Each
process emits 92 report/trace lines; fresh-replay.json and the six final logs
retain their digests. The first fixture requires 161 structural sign queries,
16,930 dispatch events and zero GCDs. The earlier axis and jerk differential
suites remain intact and pass with their fixed counts.

Fixtures include invalid limits, empty/mismatched shapes, unresolved signs,
corners, reversals, disconnected/degenerate paths and non-axis lines. Three
original mixed metric/tangent pairings are intentionally retained diagnostics;
they do not satisfy the same-path precondition and do not establish geometric
completion. Three additional source-consistent connected arc/cubic-PH/quintic-PH
plus line fixtures cover valid mixed-provider composition. These are created
lazily after the original fixtures to preserve their initial cache conditions.
The 43-fixture legacy-strict-first.log is intermediate, not the final corpus.

Four lower-layer tests use independent exact lengths, junction identities and
reachability/halving expectations, assert full opaque receipt transport, lazy
query order and failure precedence, and exercise zero-budget failure followed
by a successful larger-budget retry. A separate native/compatibility test proves
that all three old line-only feed APIs reject a 3-4-5 diagonal while native
Euclidean metric input retains exact length five. No existing assertion or hard
fixture was weakened. The standalone feed_schedule example executes successfully.

All 459 owner tests and 201 Interface tests/doctests pass. The Interface golden
remains 41,795 bytes, SHA-256
df893df83e90e6b53452e18586ffcaa2524a021631a395d4a6523be16263669c.
This checks canonical application encoding separately from report equality.
The ten checks.json commands pass: owner tests, strict all-feature/all-target
Clippy, docs, stable Wasm compile, example, owner benchmark smoke, root
successive_operations smoke, both repository formatting checks, and diff check.
Interface full tests and strict Clippy have separate logs. Nightly ASan passes
four independent lower tests and both feed/join migration tests, including fresh
processes; exact commands/environment are in asan.json. Earlier failures remain
recorded, including the example-only clone-on-Copy Clippy finding and its fix.

Final review changed only two feed API descriptions. All five subsequent owner
test/Clippy/doc/benchmark-smoke/fmt commands passed. The script's final full-binary
hash assertion failed: the rebuilt executable gained 24 bytes in non-runtime
metadata. Both hashes and the assertion outcome remain recorded. Stripping
symbols alone still leaves different build IDs; stripping symbols and removing
only .note.gnu.build-id produces byte-identical complete ELF files, SHA-256
0982eb076710a0eec936fcc6dc19ecb5827336dd9ec0ef72652ab2d19300e45c.
This establishes the measured executable's runtime identity to the final
candidate; final-doc-review.patch records the source distinction. The final
six fresh-process transcripts were recaptured after this rebuild. Interface tests and strict Clippy were also rerun after these edits; exact
commands and results are in interface-final.json. Earlier Wasm and ASan checks
precede only these documentation edits.

successive_operations completes all 200 certified manifold rows with identical
structural and allocation columns to the original baseline. Its normal dependency
graph is unchanged and contains neither Hyperpath nor Hyperdynamics. Its elapsed
times are not a controlled performance comparison. The source retention budget
passes (4,094 files, 142,125,362 bytes before ledger registration). No complete
pre-push CI matrix, hosted OS, hardware or firmware qualification is claimed.

## Adverse cost evidence

Benchmarks use the preserved original baseline binary, SHA-256
0ecc889ef0349447b9b015a41d0e6fbcf7a2e60de70834db68e7f0f76afa820d.
The baseline source directory is the earlier dependency-only control and was
not rebuilt for these measurements. Hash checks select the original binary.
Runs occur after builds stop, pinned to CPU 0, without governor control.
All 194 owner cases complete, with 0.1s warmup, 0.2s requested measurement and
ten samples. The mean-ratio median is 0.9993, range 0.9084–1.0689. The broad
256-record parser ratio is 1.0544; the broad lookahead ratio is 0.9609.

Four targeted runs in candidate/baseline/baseline/candidate order retain raw
samples for ten cases, with 0.2s warmup, 0.5s requested measurement and twenty
samples. The 256-record parser baseline means are 171.295/172.734 us, candidate
181.896/182.511 us, mean ratio 1.0592. Other parser mean ratios range from 1.0472
to 1.0763. Single-phase jerk averages 1.0088, multi-phase jerk 0.9980 and lookahead
1.0402 with visible drift (candidate 92.347/85.370 us). The favorable broad
lookahead observation does not establish a general improvement. The required
owner no-regression envelope remains unproved and parser regressions persist.

The measured owner executable grows 13,308,824 -> 13,451,968 bytes (+143,144).
The final documentation-reviewed executable is 13,451,992 bytes (+143,168),
SHA-256 1be96dccd6484f4a3fef3eacf36b22202b9cf60d9a301e5189169b8369cf6af6.
Text is 10,667,638 -> 10,780,182 (+112,544) for either candidate. Complete symbols
are retained. The specifically selected report/geometry Debug/Clone/drop symbols
number 38 in each binary and grow 9,939 -> 10,066 bytes (+127). This narrow
selection is not a global monomorphized-code qualification. Whole executable,
parser timing, global instantiation and owner allocation gates are not waived.
Compiler versions, CPU data, locks, commands and raw samples are retained.

## Next work

The functional ownership boundary is now represented in a correctness-qualified
candidate, but retention remains blocked by cost gates. Investigate whole-boundary
code generation and instantiation with isolated controls, preserving the full
source/receipt/dispatch and application encoding corpus. Do not alter unrelated
parser algorithms, compiler policies, fixtures or acceptance thresholds to mask
these failures. General enclosed functions, validated evolution/reachability,
remaining interval phases and earlier blockers stay open in the main ledger.
