# Native enclosure voxel intake admission

Base e8fd700cce17a3cb0f0362ec3f2987d90a33ede3. Previous turn is progress:
retained exact source/target frame validation. Full interval-refactor goal remains
active. Owner Hypersdf's optional Hypervoxel adapter; plan phase 13/Tier 3,
P1/P6/P17-P20/P27/P35-P37. No current method transports native SdfProgram cell
proofs into Hypervoxel; reproduce missing public method before implementation.

Add SdfProgram::classify_voxel_grid for an immutable valid Hypervoxel GridFrame.
Use its own address/bounds authority, Hyperinterval::from_real and hull for
outward cell coordinates, then existing SdfProgram::image. Retain native source,
frame/units, address and each complete enclosure in immutable report fields.
No independent geometry kernel or mutable proof flag. Keep existing Sdf methods
and repaired legacy adapter intact. Gate new surface on both existing features;
no new dependency. Nonrational/algebraic source/frame data use the existing native
conversion contract, not a rational-only shortcut. Authored transforms stay in
SdfProgram source semantics.

Strict sign or all-zero images may classify; mere zero overlap is Unknown.
Export through existing Hypervoxel intake/payload semantics while preserving the
native report for source evidence; final exact materialization rejects Unknown.
Canonical complete frame traversal is z/y/x. Separate max_cells bounds retained
records, graph entries/work and cancellation cover adapter/native graph work,
and one shared DyadicBudget covers every conversion/evaluation. Check capacity
before traversal/allocation and cancellation before final publication. Errors
abort the full result; later larger-budget retries remain independent. Frame
scalar construction, Hyperreal refinement, scalar cloning/destruction and heap
bytes keep their existing exclusions; no whole-resource or interruption claim.

Acceptance: reproduce legacy Unknown versus certified native sin/cos whole-cell
signs; independent exact polynomial images and address bounds; source/metric/unit
identity, algebraic frames, transforms, zero versus overlap, full/Unknown intake,
small capacity/entry/work/arithmetic budgets, final contribution failure, initial
and active cancellation, retry, fresh-process replay, generated output as input.
Measure completed new workloads including proof retention and materialization;
report allocations/bytes/size and all costs without comparing weaker evidence as
speedup. Check legacy dispatch/owner tests and affected downstream, Clippy/docs,
MSRV/WASM/format. Any measured legacy regression must be reported and investigated;
this additive support is not a refactor with byte-identical new capability outputs.
Preserve all 41 staged extraction paths and eight Interface edits. No push.
