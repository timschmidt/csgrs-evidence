# Exact SDF-to-voxel frame transport repair

Base 6d57591078f1b14a425d874b5b3ee250b90f525c. Source commit 87cd2481f23a3713ba945bef2370b64a2f7c240d.
This is a phase-13 conservative-occupancy prerequisite and exactness repair,
not completed native-enclosure voxel adoption or a behavior-preserving refactor.
See contract.md for the owning boundary, properties and pre-edit witness.

The current adapter accepted an unrelated target origin/pitch/unit. The baseline
regression constructs a negative-x field cell classified Filled and attempts to
export it at positive x. Its required rejection fails on the unchanged target
revision. Existing address validation alone does not bind classification to a
physical cell. No approval or approximation contract authorizes that relocation.

The retained fix compares all three source origins and pitches to the target via
the existing strict Hypersdf construction predicate. Known mismatch returns
InvalidContinuousFieldMaterialization; undecided equality returns UnknownOrdering
with its axis. Source units must match exactly, dimensions must be positive and
fit target capacity, and each emitted row must lie in its source grid. Six
comparisons are required for a valid rational pair and asserted in dispatch tests.
No existing predicate is reordered, and no numerical kernel is added. Matching
rectangular/partial batches remain supported. Exact complete materialization is
still Hypervoxel-owned; Unknown payloads remain Unknown. Public caller-built
labels are not magically authenticated by frame validation.

Ten feature-enabled regression tests include the original hard witness, all
five units and their mismatches, every origin/pitch axis shifted by exact 2^-60,
independently constructed algebraic equality, a mathematically zero but undecided
identity, invalid empty/dimension/index inputs, retry, rectangular/partial/unknown
intake, literal cell-bound expectations and fresh-process reconstruction followed
by exact storage materialization. Existing tests and fixtures are unchanged.
Stable all-feature owner tests pass 172; no-default tests 122; Rust 1.95 adapter
regressions nine (the dispatch-only tenth requires its feature). The fresh-process
child is an additional execution. All-target strict Clippy passes on stable with
all features and Rust 1.95 adapter configuration. Strict rustdoc, Rust 1.95 WASM
compilation and formatting pass. The separate Hypervoxel workspace passes 35
focused continuous-field, path-batch and grid-semantics tests.

The cost probe completes conversion, exact sparse materialization and drop using
retained valid integer-frame input batches of 1/8/512/4096 cells. Twenty runs use
baseline/candidate/candidate/baseline order repeated five times, CPU 0, disabled
ASLR and one executable path, with no overlapping builds. Every semantic digest
and allocation count/byte total matches. Median candidate/baseline elapsed ratios
are approximately 1.0265, 1.0140, 0.9789, 0.9869. These short overlapping samples
are observations, not a statistical no-regression or speedup claim. Input
construction, allocator overhead, retained source memory and peak RSS are excluded.
The standalone probe grows 2,320,560 to 2,619,616 bytes (+299,056) when the adapter
links certified scalar comparisons. This is explicitly accepted for the repaired
exactness contract, not used to waive a behavior-preserving refactor gate. The
old implementation does not satisfy that contract on mismatched inputs. There is
no application-wide size or universal timing claim. Full probe source, binaries,
hashes and adverse samples are retained; the probe is not a production example.

Preserved diagnostics include the reproduced baseline assertion, initial test
fixture compilation errors from missing Result unwraps, and a downstream command
using the parent rather than Hypervoxel's separate workspace. Corrected commands
and their successful outcomes are recorded; no assertion was relaxed.

Integration proves temporary-index tree equality while preserving all 41 pending
extraction paths. Interface's eight edits and firmware remain unchanged. All 60
prior frozen stages verify. Primary tests/format/diff/budget results are separate
records. No full pre-push, full fuzz/coverage/benchmark matrix, package release,
MCU/HIL, publication, full-goal or phase-completion claim is made. The goal remains
active with native-enclosure voxel consumption and the existing migration,
resource, hardware and release requirements still open.
