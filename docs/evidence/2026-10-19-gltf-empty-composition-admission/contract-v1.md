# E105: glTF empty-result composition

Previous goal turn: progress. E104 committed at 04fd2ddf1, with 26 blobs verified,
37 recorded commands, 293 passing test executions, and unchanged successful
serialization snapshots. Its reproduced glTF empty-export rejection is open.
Apply properties P4/P6/P18/P19/P25/P26/P27/P29/P30/P35/P36/P37/P39 and docs/admission.md.

Owner: CSGRS glTF format boundary, reusing native triangle carriers, gltf crate
parsing and existing scalar/mesh certification. Native emptiness, schema-valid
scene representation and source provenance are distinct claims. No new kernel.

Domain: native canonical empty results, valid open triangles and closed bodies,
empty/nonempty named scene objects, self-contained JSON glTF and GLB scenes,
selected-scene node trees, transforms, embedded buffers and TRIANGLES primitives.
Keep existing explicit rejection of missing scenes, external resources, skins,
morph targets and other primitive modes. Preserve valid nonempty serialized
bytes, exact finite projection contracts, metadata names/order, counters and
native failure causes. Unknown/exhausted construction must never become empty.

Before implementation, reproduce public empty exports/imports on the current
revision. Audit zero-primitive meshes, zero-count or unreadable index accessors,
invalid references and node graphs before allowing zero triangles to succeed.
Use isolated processes for cyclic/deep graph probes with core dumps disabled;
if existing traversal aborts or consumes unbounded work, fix that owning-layer
invariant before admitting the new empty workflow. Avoid recursion depth limits
that silently shrink the valid domain; report any remaining internal resource
bounds that are absent. This is not a claim of full glTF schema compliance.

Acceptance: empty export -> import -> transform -> strict Boolean identities
and repeated subtraction -> export, with certified local operations and retained
missing-source/projection qualifications. Include empty scene with no objects,
named empty objects, mixed scenes and scene selection. Writers remain untouched
on geometry/metadata failure. Validate independent JSON/schema representation,
exact volume/bounds/topology of representable nonempty scenes and serialization
byte stability separately. Cache cold/warm/eviction/mutation/concurrency must
agree in mathematical results, with stronger evidence allowed. Successful empty
import is canonical; malformed operands remain typed failures.

Khronos glTF 2.0.1 specification (published commit
8e798b02d254cea97659a333cfcb20875b62bdd4), sections 3.5, 5.27 and accessor/buffer
constraints, is the primary format source:
https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html
A scene may omit its nodes; a named node may omit a mesh. Present root-node
arrays are nonempty. Scene graphs are forests; zero-length geometry buffers
are not a substitute for an empty scene. Retain versioned independent schema
validation evidence where available; source inspection alone is not acceptance.

No changed format export is exposed by current C/JS bindings; qualify foreign
coverage accordingly and compile affected WASM features. Source-package/public
release acceptance, full provenance, PLY quantization and adapter index failures
remain open. No Hypervoxel work and no performance claim.

Preserve unlimited artifact-volume allowance with a 1 GiB physical free guard,
original root/tmp baselines, cumulative 200 MiB logs, 8 GiB child address space,
two Cargo jobs, 1800-second build/full checks and 60-second focused probes.
Input allocation/cancellation bounds are not inferred from external containment.
Keep sources and prior evidence read-only during checks. Only current_work may
change in the ledger. Preserve the protected checkpoint, all earlier controls,
failed attempts, full-scale fixtures, policy and output-completion requirements.
