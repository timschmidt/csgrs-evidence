# Review of the axial prerequisite

The production change belongs to native BREP geometry, topology and Boolean
transfer. Hypercurve remains the sole filled-region implementation. The new
line factory and coplanar-cover proof are internal; the public API and archive
schema remain unchanged. The expanded domain is selected exact axial traces,
convex planar shells with complete curved internal subdivisions, and the two
original touching/disjoint cylinder differences with their supported consumers.

The whole-line proof uses exact structure rather than endpoint agreement:
the line lies in the plane, its direction is axial and its radial component
has the cylinder radius. Reversal, original/subinterval domains, secants,
tangency, both operand orders and exact near misses have direct tests. Periodic
trims use the existing retained trace path; no-interior outcomes are not promoted
to proofs of no isolated contact. This is an implemented mathematical argument
with executable tests, not a machine-checked formal proof.

The coplanar-cover proof requires prevalidated local faces and closed incidence.
Each face has nonnegative material winding in the common oriented plane.
Opposite shared edge images cancel in the winding sum. A remaining single convex
polygon therefore forces unit multiplicity inside and zero outside, excluding
overlap or a missing subregion. Consistent oriented planes and all boundary
vertices in their half-spaces certify the complete convex material boundary.
Missing/duplicate faces fail incidence; an opposed group fails the proof.
The fallback neither certifies curved exterior faces nor nonconvex partial cuts.

Both original partitioned operands preserve independently derived volume and
surface area. Cold tool-box replay additionally classifies exact inside,
boundary and `1e-12` outside points, intersects with its original tool and
replays that output. This follow-up exposed a transferred circular pcurve whose
parameter map was incorrectly affine. Preserving the existing angular relation
fixes the producer; the strict whole-image validator was not relaxed.

The initial cap aggregation produced a reversed-bore regression because a
vertical edge was projected before both heights were checked. The original
bore test is unchanged and passes after correction. The old five-case slab
loop preserves every input: three expectations advance from partition failure
to typed shell-admission failure, and touching/disjoint differences now require
the independent whole-cylinder measures, replay and empty intersection. These
are explicit stronger capability expectations, not removed hard cases.

Touching/disjoint continuations test complete material preservation, further
half cuts, reconstruction, subtraction to empty, recovery, rational rotation,
axis permutation/reflection, native persistence and STEP reimport/composition.
The external projects exercise source paths; package, actual binding distribution
and original-source qualification remain open. Optional OCCT measurements are
floating-point interoperability checks only.

All original 24 prism inputs and 81 preceding diagnostic slots remain. Diagnostic
native results alone are not credited as semantic workflow proof. The three
original partial-depth differences and covering reverse difference remain
unsupported, and the next shell work retains their full geometry and thin gaps.
The new completed touching/disjoint cases do not replace that original objective.

The cost campaign preserves 180 old receipts. Its 0 timing rows above the 10% review marker and 25 allocation increases remain in [the full report](costs.md). Retention is for exact capability and usable results, without an optimization or all-cohort performance claim. No historical cost or inherited failure is waived.
