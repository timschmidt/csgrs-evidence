# E105: glTF empty-result composition

Canonical empty meshes, named empty objects and scenes with no objects now
export and reimport as valid empty scenes. Imported emptiness continues
through transforms, strict Boolean identities, complete subtraction and export.
The [contract](contract-v1.md) identifies the owning format layer, input domain
and external containment before implementation.

The baseline also exposed zero-count accessor and invalid-reference panics,
unreadable indices silently replaced with implicit indices, and stack overflow
on cyclic and deep node graphs. Reader preconditions now fail explicitly and
node forests are checked and traversed iteratively. The original 10,000-node
valid hierarchy completes without reducing its size or imposing a depth cap.
Positions without triangles, malformed native indices and duplicate names
remain errors. Geometry failures leave writer sinks untouched.

Twelve public tests cover exact geometry, separate topology checks, qualified
source history, scene selection and transforms, caches, invalid input and
continued composition. Twenty-four valid accessor combinations also pass on
the retained baseline. The final test edit strengthens the disconnected-box
oracle before any Boolean call; production is unchanged from the V3 format
checks. All affected tests and the broader matrix run after that edit.

The Khronos validator accepts all 32 generated JSON/GLB files with zero errors.
It also identifies malformed baseline fixtures, but the tool itself overflows
its stack on the full deep valid hierarchy. That limitation and the original
fixture are retained. Six nonempty serialization snapshots match the previous
baseline byte for byte, independently of the semantic checks.

The [review](review-v1.json) and [command record](command-summary-v1.json)
record full affected minimal-feature runtime tests, default IO/export tests,
strict all-target Clippy, isolated features, Rust 1.95 checks, rustdoc, wasm32
compilation/Clippy and formatting. Compiler mistakes and all adverse probes
remain in the raw evidence. The current C/JS APIs do not expose these glTF
functions; Node format validation is not foreign binding acceptance.

Import reports missing source history; empty import consumes no coordinates.
Later local proofs cannot certify original source intent. Full provenance,
internal total-work/allocation/cancellation contracts, broader format
conformance, current package/public installation and the full plan remain open.
The full default runtime suite was not repeated. PLY tiny-coordinate loss and
adapter index projection remain next. There is no performance claim or
Hypervoxel work. Historical missing artifacts were not reaudited. The
[checkpoint](checkpoint-v1.json) records the exact evidence and limitations.
