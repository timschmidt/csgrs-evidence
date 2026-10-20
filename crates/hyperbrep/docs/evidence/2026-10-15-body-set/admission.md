# BodySet Boolean composition

Target revision: `b47ad211f12ab24183485cebe041190658111a5e`.

Owning layers: HyperBRep's public volume selection, native Boolean composition,
and topology transfer. Properties: P6, P17–P20, P25, P27, P35–P36 and P39.
The missing acceptance test is a successful empty or disconnected Boolean
result consumed directly by another Boolean. The current public signatures
require two `SolidRef` values. The reproduction is retained before changing
production code; it is not a runtime pass.

The domain is finite selections of already validated, bounded exact solids.
Each input selection denotes its regularized union, including overlapping
selected bodies. This matters because `builder::extrude_regions` currently
validates each region independently, rather than certifying separation between
regions. Empty is a valid value; untrusted archives and staged topology are
not operands. Malformed source admission must fail before an identity shortcut.
No public compatibility overload is retained.

The implementation must preserve the three existing binary operations and
their single-solid certified-success corpus. Empty identities retain the
original immutable selection; nontrivial composition uses the native kernel,
preserves every selected component and reports a failed pair as failure of the
whole operation. It must not concatenate overlapping intersections, subtract
each cutter independently and union the answers, or copy unselected solids
when collecting results. Source curves, selected parameters, pcurves, topology
certificates and void shells must survive exact transfer and replay.

Regularized sets use closure of interior. This follows the mathematical model
described by [CGAL's Nef manual](https://doc.cgal.org/4.8.2/Nef_3/index.html),
reviewed on 2026-10-15. Our finite-set distribution and component normalization
are implementation deductions from that model, not a claim that a manifold
carrier is closed over all such operations. Unsupported/nonmanifold intermediate
geometry remains a typed limitation. Shared arrangements across expression
roots, generalized multi-solid intersections and durable Boolean provenance
receipts remain open work; this increment must not claim those gates complete.

Strict authority remains unchanged. OperationContext retains its existing
shared root-refinement/promotion accounting. These units do not bound all pair
evaluations, expression growth, heap bytes or cancellation latency. Qualification
uses explicit process timeouts; internal total-work, memory and cancellation
contracts remain open. No new approximate ingress or certainty upgrade is added.

Required evidence: exact empty identities and continued operations, disconnected
accumulation, overlapping input selections, a cutter splitting a body, bridging
separate components, reconstruction, holes, symbolic translations, selected
parameters, invalid admission, failed-operation atomicity and existing downstream
consumers. Independent rational cell membership and volume checks supplement
topology replay. A pre-change single-pair cost probe retains output materialization,
validation, allocation requests and deterministic archives for comparison.
Qualification status and limits are recorded separately after execution.

The subsequent curved-sweep self-identity probe exposed a second missing
acceptance case on this implementation: all three tautological self operations
returned `FacePartitionUnsupported`. Model revision plus identical selected IDs
is an existing exact witness of set identity. Reuse it for union/intersection
and complete subtraction; do not infer equality merely because two selections
share a model. A retained test exercises this proof, source identity, replay
and re-accumulation under zero instrumented solver work.
