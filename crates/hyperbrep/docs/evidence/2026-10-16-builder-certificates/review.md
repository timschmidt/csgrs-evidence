# Proof-scope review

The mutation audit and implementation compare against commit
`79e807edf3c267712f5fe3ddc3757b2a7b00fe89`. This review is reasoning about the
change; the executed evidence and retention decision are recorded separately.

| Family | Admission fact retained | Finalization condition preserved |
| --- | --- | --- |
| Sphere | Whole solid, including supported voids | Retry when absent |
| Cylinder | Whole solid, including supported spherical subtraction | Retry when absent |
| Sphere pair | Outer shell, only stored without voids | No voids |
| Cone frustum | Outer shell, only stored without voids | No voids |
| Torus | Outer shell, only stored without voids | No voids |
| Revolution | Outer shell, only stored without voids | With voids, derive the original whole-solid proof |
| Curve sweep | Outer shell, only stored without voids | No voids |
| Loft | Outer shell, only stored without voids | No voids and no prism proof |
| Prism | Not obtained by this admission optimization | Preserve the original derivation without voids |

`BuilderSolidCertificates::Admitted` denotes partial positive knowledge.
`reuse` returns no answer for an absent or inapplicable proof. It does not turn
recognizer refusal, unresolved work, or exhaustion into a negative fact. The
old recognizer still runs. A transferred record describes the previously
validated model's complete available proof set; its absent fields retain their
old meaning. This distinction is necessary for authoritative region extrusion
and selected-geometry transfer as well as ordinary analytic primitives.

All references, unique ownership, manifold edge-use pairing, outer/void
orientation and void nesting are checked before installing an admission
record. Finalization still rejects orphan edge uses, wires and faces before
reusing anything. No record is installed on the fallible path. The builder's
private line-pcurve normalization can only access as-yet-unowned uses with
uniquely used pcurves; a new use referencing an old pcurve disables that rewrite.
The sweep interval helper filters global adjacency by the current shell's
face set. Other family recognition uses reachable shell geometry directly.

Model replacement edits still clear solid, endpoint, image and wire certificates.
Replay reconstructs a fresh builder. Transform and validated subgraph transfer
continue to use their existing complete certificates. There is no new serialized
state and no key surviving destruction of its builder. Strict context remains
mandatory; there is no approximate-proof ingress or precision-specific setting
for this record. Concurrent builders share no mutable certificate vector.

The focused tests distinguish independently derived measures and point locations
from deterministic replay. They exercise a cylinder's secondary prism, a sphere
with a cavity, a translated cuboid, repeated builders, validated transfer,
deliberately discarded positive facts, failed nesting and ownership followed by
recovery, an orphan introduced after valid admission, shared pcurves, and an
edited sphere whose old radius must no longer classify points. Existing full
corpora cover cylinder/sphere cavities, revolution cavities, sweeps, lofts,
inward-shell rejection, selected parameters and repeated Boolean continuation.
Passing counts must come from the actual logs, not this inventory.

Retaining successful proofs lengthens their builder lifetime. Finalization
currently clones them into the immutable model, as validated transfer already
did; allocator-request totals and peak process RSS must therefore be reported.
A possible later experiment could consume the builder-owned proofs during
finalization to avoid those clones. It is not implemented or credited here.
Likewise, this change does not remove repeated prism-orientation work, introduce
a heap-byte budget, resolve the inherited resource gates, or claim that all
prior prism cost increases have been recovered.
