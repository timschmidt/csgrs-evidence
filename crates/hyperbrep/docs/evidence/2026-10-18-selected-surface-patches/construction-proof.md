# Construction and validation contract

This is a finite extension of the existing public `builder::planar_face` and
`builder::extrusion_patch` workflows. It does not complete general surface
embedding, shell/solid construction, curved arrangements or revolution patches.

For an exact retained profile `P` with ordered domain `[u0,u1]` and authored
`v0 < v1`, the extrusion surface is `S(u,v) = P(u) + v D`. Its horizontal
boundaries are the complete translated profiles `P(u)+v0 D` and `P(u)+v1 D`.
Their pcurves have constant v and the correspondence `s = u`. Each vertical
boundary is the exact translation from `P(ui)+v0 D` by `(v1-v0)D`, with native
parameter `t = (v-v0)/(v1-v0)`. The four edge uses follow the positive rectangle
in the surface chart; the upper profile and left connector traverse their
spatial edges in reverse.

This construction divides only the authored nonzero sweep interval. It never
materializes or divides selected profile endpoints. Hypercurve owns those
parameters, retained planar points, curve definitions and exact chart maps.
HyperBRep owns their spatial lifts, translation curves and edge/face incidence.
The existing coordinate-image validator checks the complete constant-coordinate
line and complete profile/translation definitions, separately from endpoints.
The helper uses ordinary builder admission, with no supplied `true` image
certificate or sampling substitute. Native import re-runs ordinary admission
without trusting serialized image flags.

The planar constructor likewise delegates retained-loop regularity, contacts,
orientation and nesting to Hypercurve. It lifts original procedural definitions
and source restrictions where complete native promotion is unavailable, and
constructs selected spatial vertices from the lifted curve rather than asking
for an unavailable scalar view. Existing represented native paths remain.

The separate archive correction preserves an existing pcurve definition unless
analytic-arc export replaced its incident vertex representation. Reconstructing
unchanged endpoints through a plane projection discarded the stored expression
and changed the next encoding even though vertices and topology were unchanged.
Dependence on warm arithmetic evidence is an inference from the expression
changes, not an isolated measurement of a cache mechanism. The full
non-orthogonal parabolic-cap-and-hole fixture reproduced this on eaa0cae54:
64,623 bytes became 173,247 bytes after one cold round trip. The failure and both
archives are retained. The correction does not change archive schema 10 or
admission predicates. Any changed first-export scalar encodings need a recorded
migration with strict coefficient equality; byte identity alone is never a
geometric oracle.

Acceptance includes the original full clipped parallel cap, an independently
selected cubic-root profile interval, source reversal, skew/reflection frames,
both edge-split directions, retained transverse contact subdivision, holes and
exact 1e-12 gaps. Independent profile samples, region membership, plane equations
and exact area integrals supplement whole-image admission and three successive
cold replays. Wrong correspondence scales and connector displacements are
rejected; zero direction, invalid sweep intervals and budget exhaustion remain
typed failures with recovery. Ambient strict/approximate/strict policy scopes do
not weaken BRep's strict operation contract.

Input families outside the owner proofs retain explicit failures. Existing work
counters do not bound all coefficient growth, retained heap, total work or
cancellation. Runtime fuzz campaigns, coverage, formal verification, package
installation and production JavaScript bindings are not established by these
source-path tests. Final executed commands and results belong in the admission
manifest; prepared scripts and this explanation are not passing evidence.
