# SDF-to-voxel frame transport admission

Base 6d57591078f1b14a425d874b5b3ee250b90f525c. Previous turn made progress
with matrix regressions and decisive rejection evidence. Goal remains the full
interval refactor, especially phase 13 conservative voxel occupancy/adoption.

Owner: Hypersdf optional Hypervoxel adapter, where SDF source grid identity meets
voxel frame authority. P1/P6/P17-P20/P27/P35-P37. Before production edits reproduce
that a negative-x filled source cell can be exported at a positive-x target origin
and materialized as exact filled occupancy. Missing tests also cover pitch and
unit mismatches, unknown exact comparison and source-index validation.

Correct contract: each exported row must describe the same closed cell in the
same declared units. Check source origin/pitch against target using the existing
strict construction predicate; use typed invalid/unknown errors. Never tolerance,
float or allocation identity equality. Source dimensions must be positive and
fit within target capacity; rectangular/partial batches inside a larger frame
remain supported and may use ordinary sparse intake. A complete exact target
cover remains governed by Hypervoxel's existing materialization checks. Validate
source indices. Do not infer source proof authenticity from public mutable batch
fields. No implicit translation/scaling/unit conversion or new geometry kernel.

Preserve payloads for valid source/frame pairs and Unknown occupancy. Add
independent geometric expectations, all five units, algebraic equality/nearby
inequality, output-as-input sparse and exact materialization, invalid sources
including empty batches, and retry after failed admission. This is an exactness
repair with necessary validation, not a behavior-preserving refactor or speedup.
Measure complete valid transfers including validation/materialization plus code
size and allocations; report costs without weakening correctness. Run owner and
affected downstream checks, strict Clippy, docs, MSRV, formatting and repository
budget. Preserve all 41 staged extraction paths and eight Interface edits. No push.
