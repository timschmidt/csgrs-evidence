# Complete plane/tensor sections: implementation contract

Baseline: a4cf86f0d4b7d0862a1fa39c39e3efd9e246d54a. Main worktree stays frozen.

Owners: Hypersolve owns complete polynomial topology and basis conversion;
Hypercurve owns retained joint-field plane images and branch composition;
HyperBRep owns homogeneous surface pullback, spatial lifting, both pcurves,
image admissibility, and native persistence.
Properties: P1, P4, P5, P8, P9, P15, P17-P20, P25-P27, P35-P39.
Missing acceptance: the unchanged full 3x3 interior-circle fixture currently
returns UnsupportedIntersection despite its complete strictly interior curve.
The baseline probe runs before production edits.

Intended extension: exact rational tensor/plane pullbacks over the whole closed
parameter rectangle, including disconnected branches, isolated contacts,
singular UV events and wholly interior components within the complete solver's
finite-fiber domain. Rational images retain the original joint source field,
source/root/parameter identities, and original denominator guards. The spatial
image requires a proved injective planar projection; an insufficient proof or
unsupported vertical/repeated/boundary component is a typed refusal, never a
partial success. No sampled contour is authoritative.

Required composition: both pcurves agree with the spatial branch; evaluation,
restriction at retained endpoints, reversal, supported transforms, bounds and
replay preserve the same source chart. Preserve all existing complete fixtures
and native artifacts with any schema migration separately declared. Include
nonlinear weighted images, singular and isolated contacts, multiple components,
small exact offsets, malformed replay, budget refusal and recovery. Derivative
and arrangement limitations must remain explicit until implemented.

Resources: solver precision, subdivision/refinement and degree controls are
per-control limits, not total work/heap/stack/cancellation guarantees. Record
missing bounds honestly and contain costly probes externally. No new cache.
No performance improvement claim without matched complete-contract evidence;
retain adverse results. Qualify local and downstream affected checks after the
final code edit. Full pre-push workflow matrix remains separately required.
