# Exact volume-selection composition

This increment replaces public `SolidRef` Boolean operands with `&BodySet`.
It adds canonical empty construction, exact same-selection identities, selection of one existing solid without
rebuilding it, and symmetric difference. Existing callers migrate directly;
there is no compatibility API. Read the [pre-change admission contract](admission.md)
and [compile-time reproduction](missing-api.log).

`A = union(A_i)` and `B = union(B_j)` define operand meaning. Native intersection
forms `union(A_i intersection B_j)`. Difference subtracts every `B_j` successively
from every remaining piece of each `A_i`, then normalizes their union. This
handles overlapping cutters and overlapping minuends without double-counting.
Union normalization inserts connected components and merges any intersecting
pair through the existing strict kernel. A certified two-component pair union
retains the two original complete sets and their source representations.

Previously separated components remain separate from the union of two inputs
which both missed them. Each insertion therefore needs at most the existing
component count in pair attempts; it does not restart the scan after every
merge. This finite algorithm is not an arrangement shared across expression
roots. Subtraction/intersection can still create many fragments, and supported
pair kernels can reject an intermediate representation.

The topology transfer implementation serves both complete model copies and
selected-solid collection. Its dependency masks select outer and void shells,
faces, wires, uses, curves, pcurves and endpoints. Records are copied in source
arena order, retaining source curve images, exact parameters, correspondence and
native certificates. The relocation arrays and masks scale with the backing
model's record count, even when selecting a small subset; this is not a retained
memory budget. Empty identities share their surviving immutable selection. Same-revision,
same-selection union/intersection retains that selection and subtraction is
empty, including native curved sweeps whose general face partition is still
unsupported. Matching the model alone is insufficient.

The [semantic cases](../../../tests/support/body_sets.rs) cover all empty
identities followed by further operations; disconnected accumulation and complete
removal; bridges, splits and reconstruction; all four operations on overlapping
and duplicate selections; holes, cavities, symbolic translations and exact small
gaps; selected algebraic endpoint replay and another split; invalid archive
admission and an unsupported tangent-sphere union after a successful prefix.
Integer-cell occupancy and volume provide an independent set oracle for the
rectangular cases. Native archive validation checks topology separately. A dedicated same-selection
curved-sweep case requires exact completion with zero instrumented solver work.

The [controls](controls/results.json) inject the four initial implementation mistakes and
require runtime assertion failures. Two additional faults remove the new
identity proof or confuse different selections in the same model. Source is restored after every attempt.
The missing-API compiler failure is historical; it is not counted as a runtime
control. The [curved-sweep reproduction](self-identity-before.log) records three
typed failures before the identity proof. The [initial qualification](initial-qualification/commands.json)
retains a fuzz-caller compilation failure, corrected by selecting the model-bound
solid through the native BodySet constructor. Its source snapshot and control
logs remain historical; final checks cover the corrected source. [Qualification commands](commands.json) bind the final executable
source via [environment hashes](environment.json). The WASM fixture executes
the same nine semantic groups with no host imports.

The [baseline probe](baseline_probe.rs) was compiled and run before production
edits against the recorded integrated revision. The [candidate probe](candidate_probe.rs)
changes only the operand extraction to match the new API. Each sample includes
Boolean construction, exact volume, deterministic archive materialization,
untrusted reload/validation and serialization equality. It records five samples
of twenty completions per row, allocation calls/requested bytes and archive
fingerprints, after one warm verification. Timing excludes fixture construction;
retained peak bytes and cold-process behavior are not measured by this probe.
Raw logs and unfavorable results remain part of the admission record. This is
a scoped regression probe, not a cross-library benchmark or speedup claim.

Remaining gates include general analytic/spline Boolean closure and multi-root
arrangements, boundary-level operation provenance/receipts, complete work/memory/
cancellation limits, new sanitizer/fuzz campaigns, formal/coverage admission,
installed-package/MSRV/binding validation and the whole pre-push matrix. The two
upstream 16/32-segment root drill-composition failures remain documented in the
[integration evidence](../2026-10-15-upstream-integration/README.md); this change
does not modify that root modeling path. The closed-edge candidate remains in
the verified Git stash and must migrate to the new operand API when restored.
All work-package gates remain open. Nothing in this record claims the complete
HyperBRep plan or a release is finished.

Final source qualification passes 383 combined BREP/IO results in each of debug
and release, and 375 in minimal-feature release (overlapping configurations).
Strict Clippy in both feature configurations, warning-denied docs, fuzz-target
compilation, workspace formatting and nine zero-import WASM groups pass. Six
restored implementation faults are detected. No native test is ignored.

The matched warm probe has the following candidate/baseline ratios. All six
rows retain certified completion, archive size and deterministic fingerprint.
Values near one are reported without inferring an improvement from timer noise.

| Completed operation | Median time ratio | Allocation-call ratio | Requested-byte ratio |
| --- | ---: | ---: | ---: |
| `box_union` | 0.9919 | 1.0050 | 1.0015 |
| `box_intersection` | 1.0009 | 1.0000 | 1.0000 |
| `complete_subtraction` | 0.0530 | 0.0141 | 0.0386 |
| `through_hole` | 1.0006 | 1.0000 | 1.0000 |
| `sphere_union` | 1.0172 | 1.0649 | 1.0015 |
| `cylinder_split` | 0.9990 | 1.0010 | 1.0007 |

The same-selection subtraction proof avoids recomputing intersections. The
extra selected-subgraph bookkeeping increases allocation calls for disjoint
sphere union by 6.49%; this cost is retained and visible. These measurements
support this scoped contract extension, not a claim of general Boolean speed.
See [all samples and binary hashes](performance.json) and [hardware](hardware.json).

The separate [scaling probe](growth.json) includes input construction,
difference/intersection, reconstruction, independent occupancy/volume assertions,
archive materialization, replay and complete subtraction. At 64 bodies in each
input it completes in 2.34 seconds, with 1.265 GB cumulative allocation requests
and a 36.9 MB peak of live requested bytes. That peak excludes allocator overhead
and process RSS. Post-drop live bytes include process/scalar caches and do not
constitute a leak proof. Smaller rows and the full raw observations are retained.
There is no matching old-API multi-body baseline, and this does not establish
an internal time, memory or cancellation bound. Shared arrangements and reducing
repeated model-wide relocation work remain future work.
