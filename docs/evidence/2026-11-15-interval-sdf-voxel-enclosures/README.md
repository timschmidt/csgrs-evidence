# Native source-bound voxel enclosure intake

Retained additive capability, source commit cbc9dc9d2b84946994bc3abc65172668b1ff1daa,
base e8fd700cce17a3cb0f0362ec3f2987d90a33ede3. Plan phase 13/Tier 3;
Hypersdf owns the optional consumer adapter. The pre-edit contract is in
contract.md; the missing-method compilation witness is missing-native-intake.log.
This is progress toward the active interval-refactor goal, not phase completion.

## Meaning and admission

SdfProgram::classify_voxel_grid consumes a valid Hypervoxel GridFrame using its
own exact address/bounds authority, outward Hyperinterval endpoint conversion,
and the existing native SdfProgram::image. The immutable report retains every
source-bound enclosure, address, options, exact frame and units. The report's
continuous_field_batch exports through the existing voxel occupancy mapper and
storage admission. The native report remains the proof, not the mutable exported
intake. Both existing enclosure-program and hypervoxel-adapter features are
required; there is no new dependency or geometric decision kernel.

The independent sin/cos fixture certifies whole cells and materializes exact
filled storage where the legacy classifier returns Unknown. Literal affine
polynomial images, exact address bounds and subsequent source image evaluation
exercise composition. Algebraic origin/pitch, transformed sources, metric/source
identity, zero versus zero overlap, canonical empty storage and fresh-process
source reconstruction are covered. Fresh reconstruction is not serialized proof
replay. Unknown remains Unknown; exact materialization rejects it.

max_cells bounds retained records. ExpressionBudget checks entries, work and
cancellation across the adapter and evaluator. One DyadicBudget covers all
coordinate conversion and evaluation. Typed capacity, graph, coordinate, storage,
domain and cancellation errors abort publication; small/larger budget attempts
remain independent. try_reserve_exact handles record-buffer allocation/capacity
failure. Scalar frame arithmetic, Hyperreal refinement, scalar clone/drop, heap
bytes and asynchronous interruption inside scalar work retain existing exclusions.
This does not complete the whole-resource contract. Cancellation tests cover
initial cancellation, cancellation between evaluation and export, and independent
concurrent attempts; they do not establish interruption during scalar refinement.

## Validation

Final owner tests pass; final-test-list identifies 181 main harness tests, including
13 new tests (fresh subprocess runs are additional executions). Earlier raw
stdout sums interleave subprocess output and must not be used as canonical counts.
Original test bodies and old adapter mathematics are unchanged. Stable all-feature
all-target Clippy, Rust 1.95 new regressions and all-target Clippy, strict rustdoc,
no-default tests, separate single-feature checks, formatting and Rust 1.95 WASM
compilation pass. WASM was compiled, not executed for this stage. Hypervoxel's
separate workspace passes 35 affected intake/path/grid tests. A separate Rust 1.95
path consumer builds and executes the new example; this is not a registry/package
release check. validation-summary.json points to exact commands and logs.
Primary post-integration regression, format, diff and repository budget checks are
recorded separately. No full pre-push, firmware/HIL or whole-stack release claim.

Setup failures remain recorded: initial non-Copy array fixture; corrected exact
sqrt domain expectations (both EmptyDomain and DomainNotCertified now asserted);
a default build that had discovered a subsequently removed temporary probe;
and a candidate build incorrectly Fresh after restoring old mtimes. The latter
is explicitly invalid evidence under invalid-fresh-candidate*, with a corrected
fresh rebuild. No acceptance assertion was removed to obtain a pass. The temporary
cost example is absent from the retained source; final-source and retained.patch
contain the eight accepted paths.

## Cost and disposition

This is a completeness extension, not a behavior-preserving simplification or
optimization. The admission priority permits the demonstrated higher-priority
capability gain with the following explicitly accepted measured costs. It does
not satisfy a no-regression claim or resolve broader migration performance gates.

Final native-cost-summary.json records complete proof construction, intake, exact
sparse materialization and destruction, with source/frame construction and program
compilation outside the measurement. CPU0, ASLR disabled, Rust 1.95 release, warm
short batches and no competing builds: median times for polynomial 1/8/512 cells
are 8.75 us / 63.22 us / 4.20 ms; trig 8/64 cells 0.946 / 8.218 ms; algebraic-frame
8 cells, successful empty storage, 81.00 us. Allocations/requested bytes are
59/3135, 560/19960, 41296/1329760, 13816/198808, 121154/1729920 and 711/23144.
These are requested allocation bytes, not retained memory or peak RSS. Raw samples,
work counts, occupancy expectations, binary and probe source are preserved.
Returning legacy Unknown is not an equivalent completed workload or speedup baseline.

The existing all-feature classification benchmark completed all 46 cases in a
same-path baseline/candidate/candidate/baseline campaign (.2 s warmup, .5 s measure,
10 samples). Thirteen cases had adverse separated confidence intervals in both
candidate runs against both baseline runs; that screen is not a formal simultaneous
significance claim. The three largest adverse ratios were selected before a longer
repeat (.5 s warmup, 1 s measure, 20 samples, same order and CPU/ASLR constraints).
Final repeat mean ratios and baseline/candidate means in ns are:

| Existing workload | Baseline | Candidate | Ratio |
| --- | ---: | ---: | ---: |
| AABB cell interval | 1331.16 | 1370.59 | 1.02962 |
| Arithmetic cell Lipschitz | 1942.40 | 2172.24 | 1.11833 |
| Cell batch classification | 2634.33 | 2818.89 | 1.07006 |

All three retain adverse separated intervals in the repeat. Full favorable and
unfavorable rows, raw Criterion artifacts, commands and binaries remain present.
Legacy benchmark bytes grow 8923800 to 8927144 (+3344); the existing basic example
grows 3546192 to 3549112 (+2920). These are real costs despite unchanged legacy
mathematical bodies. ELF/function diagnostics show changed emitted code and
relocations; a unique cause of the runtime changes is not established. The
pre-storage function comparison is labeled separately; its timings are not
substituted for the final candidate. No arbitrary inline/layout tuning was tried.

This opt-in extension is kept for completed native cell-to-voxel evidence transport.
It is not claimed faster, byte-identical, universal implicit-field completion, or
an exact reconstructed surface. Whole-resource closure, other consumer domains,
migration cost gates, hardware qualification and coordinated release remain open.
All 41 staged primary extraction paths and eight Interface edits are preserved;
firmware is unchanged. No push or publication.
