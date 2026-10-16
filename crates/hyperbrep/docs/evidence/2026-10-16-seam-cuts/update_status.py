"""Update BREP planning and only its owned entry in the shared property ledger."""
import json
from check import OUT, ROOT


def read(path):
    return json.loads(path.read_text())


def write(path, data):
    path.write_text(json.dumps(data, indent=2) + '\n')


m = read(OUT / 'manifest.json')
assert all(row['exit_code'] == 0 and row['source_unchanged'] for row in m['qualification'])
maximum = max(row['maximum_ratio'] for row in m['benchmark_summary'])
over_budget = sum(len(row['over_ten_percent']) for row in m['benchmark_summary'])
allocation_rows = sum(len(row['allocation_changes']) for row in m['benchmark_summary'])
validation = ('BREP/IO all-feature debug and release each pass 444 tests, minimal release 436; both strict all-target Clippy configurations, warning-denied docs, six examples, fuzz-target compilation, formatting and 44 zero-import WASM groups pass. Sixty-three full-size seam-cut workflows check independent exact volume/area, nine inside/outside/boundary/near-offset samples, manifold incidence, deterministic untrusted replay, subdivision and reflected rescaling. Sixteen boundary-provenance cases plus both closed-boundary directions retain original source identity and paired parameters; wrong spatial interiors, partial/gapped/near overlaps and uncertain exclusions remain controlled. Eleven STEP files pass independent OCCT topology/floating-point mass checks and every retained generated STEP artifact is byte-identical. Torus/cone export remains typed unsupported with recovery checked. All 26 final commands match the final source snapshot; earlier qualifications, failures and cost campaigns remain.')
cost = (f'The final 66-process campaign compares all 132 prior cases: 131 receipts unchanged, with one explicit radical-cylinder canonical-expression migration independently proving equality of all 32 changed scalar values and every non-scalar field. Both full archives validate; bytes change from 75603 to 57195. Largest final case-median candidate/baseline ratio {maximum}; {over_budget} rows exceed 10%, and {allocation_rows} rows change allocator observations. The first campaign and its failed byte comparison remain, including five spline ratios of 1.135–1.241 before the native-line representation precheck. Three separate processes measure six new complete workloads with exact checks and full materialization/replay inside timing. All adverse samples, allocations, process resources and executable sizes remain. No speedup against failed cuts, internal resource bound or statistical release-performance admission.')
limits = ' '.join(m['limits'])
entry = dict(id='seam-aligned-analytic-cuts',
    work_packages=['WP00', 'WP01', 'WP03', 'WP06', 'WP07', 'WP08', 'WP12', 'WP13', 'WP21'],
    properties=['P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P8', 'P9', 'P15', 'P16', 'P17', 'P18', 'P19', 'P20', 'P24', 'P25', 'P26', 'P27', 'P35', 'P36', 'P37', 'P39'],
    change='Retain native closed-set trace intervals, prove complete boundary overlap with full edge-image validation, expose source-bound no-op provenance, deduplicate complete seam traces, lift periodic iso pcurves, and stitch equivalent circles using the native full-parameterization proof. Reuse strict plane/AABB separation for unsupported infinite carriers outside finite faces. Repair repeated replay using native scalar compaction at shared planar projection, axial line direction, analytic signed-area magnitude and line construction. Skip the optional line-boundary proof before nonlinear materialization. No surrounding implementation changes.',
    source='../src/boolean_kernel.rs',
    source_files=['../src/boolean_kernel/periodic.rs', '../src/topology/edit/boundary.rs',
                  '../src/topology/edit/partition.rs', '../src/ownership/changes.rs',
                  '../src/geometry.rs', '../src/geometry/transform.rs',
                  '../src/persistence.rs', '../src/topology/measure.rs'],
    evidence='evidence/2026-10-16-seam-cuts/manifest.json',
    validation=validation, cost_evidence=cost, migration=m['migration'], limits=limits)
p = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
s = read(p)
s['updated_on'] = '2026-10-16'
s['increments'] = [row for row in s['increments'] if row['id'] != entry['id']] + [entry]
assert len(s['work_packages']) == 28 and not s['complete']
for row in s['work_packages']:
    if row['id'] in ['WP03', 'WP08']:
        row['status'] = 'in-progress'
for index, action in enumerate(s['next_actions']):
    if action.startswith('Resolve the three full-size seam-aligned cut workflows'):
        s['next_actions'][index] = ('Extend the completed 63 seam-cut workflows through repeated Booleans using evidence/2026-10-16-seam-cuts/continuation-frontier.json. Preserve all original full-size inputs, exact measurements, near samples, split/reflection/replay and public boundary provenance. The fifteen diagnostic attempts retain twelve typed blockers in coincident curved planar caps, mixed angular/axial shell validation and unresolved classification/line predicates. Repair native partition/embedding owners without seam perturbation, fixture-specific identity shortcuts, weaker validation or accepting a new Unknown; verify repeated set identities independently (WP03/WP06/WP07/WP08, P17-P20/P35/P39).')
for index, action in enumerate(s['next_actions']):
    if action.startswith('Requalify archive-admission native timings') and 'seam-cut candidate' not in action:
        s['next_actions'][index] = action + ' The seam-cut candidate is the new exact-feature baseline; native_nurbs_mobius_inverse_pcurve_partition retains a 1.150828 timing ratio and needs isolated cost investigation with the complete fixture, alongside the earlier archive/cached-arc gates. Four other first-campaign spline regressions are within budget after the representation precheck.'
write(p, s)
p = ROOT / 'docs/properties-status.json'
s = read(p)
s['current_work']['hyperbrep']['latest_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-16-seam-cuts/manifest.json'
s['current_work']['hyperbrep']['qualification'] = ('On upstream 72cd216cc and branch baseline e8c1b6e1, complete original torus axial/longitudinal and cone longitudinal cuts with explicit native boundary provenance and exact replay. ' + validation + ' ' + cost + ' ' + limits)
write(p, s)
for relative, link in [('crates/hyperbrep/PERFORMANCE.md', 'docs/evidence/2026-10-16-seam-cuts/README.md'),
                       ('crates/hyperbrep-io/PERFORMANCE.md', '../hyperbrep/docs/evidence/2026-10-16-seam-cuts/README.md')]:
    p = ROOT / relative
    marker = '\n## Seam-aligned analytic cuts (2026-10-16)\n'
    text = p.read_text()
    if marker in text:
        text = text.split(marker)[0]
    text += marker + f'''
The [source-bound record]({link}) qualifies the original full-size seam cuts
and their replay dependencies. The complete final 66-process campaign preserves
131 of 132 prior receipts. One radical-cylinder archive has an explicit exact
expression migration: all 32 changed scalar values prove equal, every non-scalar
field agrees, and both full archives validate. No other receipt is waived.
The largest final case-median timing ratio is {maximum:.6f}; {over_budget} rows
exceed 10%, and {allocation_rows} rows change allocator observations. All raw
timing, allocation, requested-byte, executable-size and process-resource records
remain. These are shared-host observations, not statistical performance admission.

The first campaign remains intact, including its failed byte comparison and
five spline timing ratios of 1.135–1.241. The optional boundary proof now checks
its native line representation before reconstructing nonlinear pcurves; complete
correctness and all corpora were repeated. Six new workloads have separate
absolute costs over three processes, including exact checks, complete archive
materialization and validation. Previously failing cuts are not a speedup
baseline. The original 70 MB swapped cone archive failure and the 46,077-byte
completed result both remain; the 16 MiB default admission cap is unchanged.
The remaining native NURBS Mobius inverse pcurve partition row has ratio
1.150828; its cause is not isolated. Retain the exact extension as the next
feature baseline for the recorded semantic reason, with the all-cohort timing
gate open. No total-work, retained-heap, expression-growth or cancellation bound
is claimed.
All broader work-package, typed-frontier and delivery gates remain open.
'''
    p.write_text(text)
print('Updated BREP planning/performance and only its shared ledger entry.')
