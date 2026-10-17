# Exact cone STEP continuation contract

Baseline: `490ed3421a471ef010d647def63c083138e45633` on `brep`.
The preceding goal turn made progress: it committed exact rotated cone
continuation with native, downstream, WASM and isolated cost evidence. The
worktree is clean and the latest fetched upstream is
`99b88f707b04053de7f40a86d6d029e3c07460d9`.

This increment implements the next cone exchange milestone in the development
plan. It does not replace the full CAD objective or close broader work packages.
The [preceding feasibility review](../2026-10-17-cone-continuation/future-cone-step.md)
contains independent STEP reader probes and proposed formulas; those are not
production admission. Reproduce export and import failures on this baseline
before editing production code.

## Ownership and domain

HyperBRep geometry owns exact recognition of a line revolved around a unit
axis as a right circular cone, the selected branch, and the complete affine
parameter and orientation correspondence. HyperBRep-IO owns STEP syntax,
units, representability, entity identity, encoding and import source maps.
Neither I/O path may duplicate a cone recognizer or introduce a topology
tolerance. Relevant properties are P1–P6, P8–P11, P15–P20, P24–P27 and P35–P39;
`properties.md` and `docs/admission.md` remain normative.

The source revolution is `rotate(P+t*D, axis(C,a), u)`. For a conical generator,
its axial and radial direction components are nonzero and its infinite line
meets the axis exactly. An admitted branch has nonnegative native slant
distance, with the apex as a singular boundary. Recognition must preserve
negative source line parameters, shifted line origins, either direction of the
axis or generator, and both cone branches. A non-apex boundary witness selects
the branch; the whole face still needs native edge-image and topology validation.
One STEP support may be shared by faces on different branches. Cache keys and
source accounting must retain that distinction.

Export the native cone using a `SURFACE_OF_REVOLUTION` with a `LINE` generator
and `AXIS1_PLACEMENT`, retaining the exact native-to-source parameter map.
Choose encodable generator and axis anchors from certified source geometry
when an exact apex has no finite decimal encoding. Do not approximate an angle,
vertex, anchor or direction. Direct spatial edge curves remain authoritative
in the current advanced exchange subset. Supplied pcurves must consume the
same admitted chart map or fail with a typed unsupported diagnostic; they may
not use cylinder V semantics for a conical revolution.

## Missing acceptance and preserved inputs

The current writer rejects cones and the importer rejects the three manually
authored revolution frusta retained with the preceding feasibility review.
Record their actual results here. Native conical-generator recognition and a
borrowed cone view are missing public APIs. Their acceptance requires independent
point/partial/normal identities, both parameter branches, offsets, units,
reversal, skew/parallel/perpendicular/zero generators, invalid axes, apex-only
witnesses, exact near misses and unresolved predicates.

Full exchange acceptance retains the radius-5 to radius-2, height-6 frustum and
40-unit cutter rotated by exact (3/5,4/5). Test whole, complementary halves,
axial band, lower remainder and both reunion orders with independent integrated
volume/area and exact near-boundary point expectations. Cold archive replay and
repeated split/recut/reunion/empty recovery must consume imported native cones.
Retain the height-7 frustum whose apex Z=35/3 cannot be written as a finite
decimal, and the manual LINE fixtures as independent parser controls.
The manually authored B-spline generator remains an explicit unsupported
control until its own exact recognition is implemented.

An irrational vertex created by an exact split may remain unencodable. Preserve
that diagnostic and the native model; do not round or remove the split. Existing
cone-unsupported fixtures need an explicit capability migration only when their
original modeled inputs earn stronger success or a later exact encoding limit.
Keep independent unsupported, invalid, uncertainty, small-budget and recovery
controls. Preserve all existing 175 completed main cost cases, 196 dependency
cases and 61 STEP artifacts, except a separately reviewed capability migration.

## Evidence and limits

Freeze the preceding candidate binaries, their source identity and metadata as
prospective baselines before production edits. Measure newly completed exchange
workflows absolutely; an earlier rejection is not a successful-work baseline.
Compare unchanged workloads and feature graphs, retaining raw samples, exact
receipts, allocations, RSS, binary sizes and adverse observations. Retain every
failed prototype and the source needed to reconstruct it.

Use the existing strict operation context, typed predicate/numeric exhaustion
and parser/output limits. These are not total-work or retained-heap guarantees;
externally contain diagnostics and adversarial cases. Test native debug/release,
minimal features, affected downstream consumers, Clippy, rustdoc, examples and
the source-path WASM runtime after the final code edit. An optional OCCT reader
is a floating-point interoperability oracle, not the native exactness authority.
Package/MSRV/binding/release, formal proof, coverage and directed campaign gates
remain explicitly open where not executed. Do not repair unrelated upstream
failures or push without the full repository pre-push gate.
