"""Write the scope of the completed and deliberately unfinished capability."""
import json
from pathlib import Path
OUT=Path(__file__).resolve().parents[1]
q=json.loads((OUT/'qualification-summary.json').read_text())
r=json.loads((OUT/'resource-summary.json').read_text())
assert q['new_complete_workflows']==4 and q['wasm']['groups']==127
(OUT/'README.md').write_text('''# Axial intersection and cold continuation prerequisites

Baseline `6e00d3ba96acacf4ad8486e4e510b916fa28c93a` on `brep`, incorporating
upstream `be2a0c37b`. This increment extends exact native plane/cylinder traces
and makes their partitioned operands usable after cold replay. Touching and
disjoint tool differences complete four native/STEP continuations, including
exact rotation/reflection. Genuine partial-depth result shells remain open.

The [prospective contract](contract.md) preserves all 24 original full-size prism
inputs, including the six former failures and exact `1e-12` gaps. On this source,
20 cases return native results and four remain unsupported. The three genuine
partial-depth differences now complete tracing, both partitions and selection,
then fail at `UnsupportedSolidShell`; the covering reversed difference remains
unsupported too. One preceding native result still has an unencodable STEP
vertex. [Original outcomes and changes](prism-frontier.json) distinguish these
diagnostics from the independent complete-workflow tests.

## Native ownership and proof

- Geometry proves the complete axial line image: plane incidence, parallel
  cylinder axis and constant exact radius. The original spatial domain maps
  affinely to cylinder height with a constant angular chart. Existing trim
  machinery retains authored periodic lifts and finite endpoint contacts.
- Topology groups consistently oriented coplanar faces, cancels opposite shared
  complete edge images and requires one convex polygon per supporting plane.
  Local face simplicity, winding, holes and closed incidence remain required.
  Nonnegative face winding and cancellation prove multiplicity-one coverage;
  complete half-space checks then establish the convex shell. This admits curved
  internal subdivisions without converting those curves to display chords.
- The native prism query unions every top-cap material piece. Both edge endpoint
  heights are checked before projection. This fixes a later cut that previously
  lost material, while retaining reversed-bore behavior.
- Boolean planar transfer preserves the existing `AngularSweep` correspondence
  for a native circular pcurve. An affine endpoint fit does not preserve its
  interior parameter meaning. The strict cold image validator is unchanged.

No external production kernel, tolerance, new archive representation, public
compatibility adapter or supporting-crate runtime change is introduced. See
[review](review.md), [remaining shell design](shell-proof-design.md),
[idea decisions](idea-ledger.json) and [retention decision](retention-decision.json).

## Executed evidence

The [qualification summary](qualification-summary.json) binds 573 all-feature
and 565 minimal-feature native/IO release tests, thirteen focused debug tests,
both all-target warning-denied Clippy configurations, external consumer and
diagnostic lints, warning-denied documentation, nine STEP examples, fuzz-target
compilation, formatting and 127 actual WASM groups with zero imports.
All 119 preceding WASM groups remain. Counts overlap across configurations.

Four source-path external consumers check independent cylinder volume `150*pi`
and area `110*pi`, exact boundary/near-boundary classification, opposite paired
edge incidence, native replay, half cuts, reconstruction, empty recovery,
transformed STEP import and further composition. Optional OCCT reads all four
outputs as valid single solids with the independently expected floating-point
measures. OCCT is an interoperability oracle, not exact geometric authority.
The three partial inputs also check independent partition measures, cold
classification and Boolean/replay consumption of the partitioned tool box.

All 81 preceding native diagnostic outcomes remain unchanged. The 71 old STEP
artifacts and twelve preceding region/component artifacts remain byte-identical. The original
general-path controls retain two butt successes and two round-cap
`UnsupportedMeasurement` failures. Initial compile errors, failed consumers,
the first native/minimal/WASM reversed-bore regression and the circular
correspondence failure remain in [all attempts](attempts.json),
[first qualification](qualification-v1.json) and reconstructible source overlays.
The old fourteen-file OCCT reader also retains its failed count check; the
[expanded reader](reader-expansion.json) requires all fourteen old files and
the two new whole-cylinder exports with independent expectations. No difficult
fixture or strict validator was removed to obtain a pass.

The [cost campaign](costs.md) retains all 180 old receipts across twenty full
corpora, plus four absolute new complete-work rows. Three alternating pairs
and three candidate-only processes total 123 fresh processes. All adverse rows,
allocator requests, peak process RSS, executable sizes and raw samples remain.
New successful workflows have no speed ratio against former errors. These
shared-host observations do not establish a general speedup or internal
total-work, retained-heap or cancellation bound.

## Reproduction and limits

[check.py](check.py) freezes the runtime, dependency, test and retained-input
hashes around each externally contained command. [Storage checks](storage-identity.json)
exercise reads, hard links, atomic replacement and executable loading on this
physical source/target setup; they do not repair historical nested-view evidence.
The [source reconstruction record](source-reconstruction.json) identifies every
baseline/overlay byte, including failed candidates. Reconstruct each recorded
snapshot before replaying its [attempt command](attempts.json). External `/tmp`
projects, pinned optional readers and frozen binaries are development tools;
their retained manifests, sources, locks and hashes are not a shipped package.

Final drivers are [qualification](final-review/qualify.py),
[consumer preservation](final-review/finish_checks.py),
[matched harness builds](final-review/build_benchmarks.py) and
[cost measurement](final-review/benchmark.py). Build the baseline before any
production edit; use the same recorded feature set on the final source. Freeze
source during checks and measurements and avoid overlapping task builds/tests.
Bind the final record with [manifest.json](manifest.json) and
[audit.json](audit.json). The audit also checks protected stashes, unchanged
supporting runtime and unchanged non-BREP bytes of the shared property ledger.

The [remaining shell proof](shell-proof-design.md) is the next implementation
task. Positive volume, completed face selection and overlapping slab bodies are
insufficient. Broader Boolean/STEP closure, source qualification, complete
resources, package/MSRV/binding delivery, runtime fuzz/ASan/lexicase, coverage,
formal proofs and the full pre-push matrix remain open. The inherited scalar
zero-factor failures remain upstream-owned. All 28 work packages remain open
or in progress; no push or release qualification is claimed.
''')
(OUT/'review.md').write_text('''# Review of the axial prerequisite

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

'''+f"The cost campaign preserves 180 old receipts. Its {len(r['adverse_timing_rows'])} timing rows above the 10% review marker and {len(r['increased_allocation_rows'])} allocation increases remain in [the full report](costs.md). Retention is for exact capability and usable results, without an optimization or all-cohort performance claim. No historical cost or inherited failure is waived.\n")
print('Wrote scope and review after qualification.',flush=True)
