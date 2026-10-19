# Producer review before implementation

All twelve frozen E98 pipelines were replayed against source pins matching HEAD
9283ae925. Stdout and STL hashes agree with E98. Owner: native mesh carrier;
P9/P19 certainty is distinct from reusable topology and scalar facts.

Reviewed native carrier/new/shared buffers, borrowed views, transforms (including
projective), reversal, finite materialization, subdivision and smoothing;
concatenation, three hull entrypoints, Boolean materialization, Minkowski input
compaction/empty/final paths, surface nets. Every native output must preserve
parent summaries and actual local consumption. The raw point-set hull APIs
start a declared-coordinate claim; the mesh hull method additionally inherits
mesh evidence. Raw TriangleMesh::new is untracked.

Reviewed root indexed primitives, polyhedron/loft, native Boolean empty bridge,
transform/rotate/scale/mirror/center/float, distribution/cache storage, hull and
Minkowski wrappers. Empty outputs preserve all parents. Primitive and explicit
point-loop construction start declared-coordinate claims. Sampled constructions
record sampling separately. Source identity in model caches includes evidence.

Reviewed curve triangulate/extrude/profile fallback and closed/surface validation,
SDF result tuples, TPMS sampler, adapters and format imports. Bare curve lineage
is not available; conversion remains explicitly untracked and records actual
local approximation plus sampling/projection. Adapter inverse must reuse native
reversal instead of rebuilding untracked geometry. STL raw ingress is untracked
and binary32-projected. Other imports remain untracked; format-specific projection
is explicit where performed. No imported flag is accepted as proof.

Reviewed JS native mesh/outcome extraction and STL methods; expose native summary
and a bound STL artifact, with immutable bytes and no unchecked receipt restore.
C/C++/Python use ScalarMesh around native handles and strict APIs; expose the
same summary there and run real consumers. Full curve lineage and per-boundary
proof replay remain open, explicitly outside this summary claim.

API migration: BooleanMeshBatch raw literals become constructor calls; shared Arc
buffers permit identity-bound mutation detection. Geometry equality and all
malformed carrier checks stay independent. Mesh metadata is constant-size;
buffer binding reuses existing weak identities. Additional retained storage and
costs will be measured without a speedup claim.
