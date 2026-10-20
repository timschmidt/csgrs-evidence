# Prism side-group proof scheduling

The source owner is `topology/validation/prism_topology.rs`. A lateral face
can join a partitioned side group only when it shares an internal split edge
with a member and their complete supporting surfaces agree. The existing
internal-edge condition excludes native lines and circle arcs; this change
does not alter that condition or broaden the permitted carriers.

Previously the support query ran before the incidence condition. Publishing
native plane sides in the axial-shell increment made many more wall pairs
eligible for a plane/plane intersection query, even when their shared-edge
condition was already false. The prototype moves that existing necessary
topology check ahead of the complete support comparison.

For a pair of already validated faces, write the join relation as `E && S`.
`E` is the decidable shared-edge/type condition over model-owned IDs. `S` is
the unchanged identity-or-coincident-plane proof. If `E` is false, the join
relation is certified false independently of `S`; no approximation or guessed
geometric separation is involved. If `E` is true, the original support proof
still runs and retains its typed failure behavior. Avoiding an irrelevant
unresolved query is permitted by the least-cost proof contract; it does not
reinterpret an unresolved geometric answer as false.

The connected-component search, candidate order, group boundaries, cap-pair
correspondence, whole-wall coverage, solid orientation, retained certificate,
measurement and consumer behavior are unchanged. Every eligible join still
needs exactly the former geometric proof. Existing validated ownership is the
trusted precondition for the internal edge/face lookups, as it was previously.
This finite conjunction argument is not a machine-checked verification of the
entire shell-admission algorithm.

The original kernel and region-exchange harnesses reproduce the regression
before editing. The prototype must retain all named exact outputs, archive
and STEP bytes, typed rejection controls and downstream continuations. Costs
will be compared against the complete axial-shell revision, not credited as
an improvement against an earlier unsupported operation.

Other observed costs remain separate candidates: the temporary generic
extrusion allocated before native specialization, repeated positive prism
proof reconstruction, and inline optional axial certificates on every solid.
None is silently changed or credited to this scheduling experiment. Their
possible interactions require separate evidence. Full release, source fidelity,
internal resource, coverage and complete-plan obligations remain open.

## Shared plane relation

The second prototype factors the existing native plane/plane proof and line
construction into `geometry/planes.rs`. `PlanePair` is temporary algebra, not
retained state. Its normals, cross product, squared direction and exact offset
are computed in the same order using the same expressions as the preceding
intersection function. The relation uses the same `STRICT_PREDICATES` and
`decided_order` calls. Unresolved comparisons still return their typed error.

For two validated nondegenerate plane charts, a nonzero cross-normal gives a
transverse relation and therefore disproves coincidence. Parallel normals need
the complete origin-offset proof to distinguish coincident and distinct
supports. The private query consumes that relation without constructing a line.
Full intersection consumes the same relation and constructs its line using the
unchanged formulas, operation order and numeric error mapping. Nonplane inputs
to the private query return `UnsupportedIntersection`, never `false`.

Only the three prism grouping call sites consume the new relation query. They
already establish native plane carriers, including canonical planes produced by
the existing affine-tensor proof. No caller-side geometric formula, tolerance,
sampling, persistent cache or public representation changes. Exact coincidence
does not certify that trimmed faces or solids are equal; all trim, incidence,
orientation and whole-shell admission requirements remain.

The new relation matrix checks rational and symbolic plane heights, identity,
translated origins, reversed/scaled/skew charts, a distinct 1/10^12 offset,
transverse planes, both operand orders and repeated queries. Independent
equations `x = 2` and `z = height` establish the complete crossing line's point
and direction; existing intersection tests and downstream artifact checks remain.
This is finite executable evidence plus the factorization argument, not a
formal proof or coverage claim for every symbolic expression.

The adjacency-only and combined prototypes remain separately frozen with their
source epochs and original full-harness pilot observations. The combined pilot
preserves all 68 receipts and observes a NURBS ratio 0.685144 and butt-region
ratios 0.900056/0.897533, with about 4,505 fewer allocation requests per butt
workflow. These are diagnostic observations only. Final retention depends on
the complete qualification and matched full-corpus campaign; the pre-extension
historical cost remains separate and is not used as the optimization baseline.
