"""Update BREP's roadmap/performance record and only its shared-ledger entry."""
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
full = m['test_counts']['native-debug']['passed']
minimal = m['test_counts']['native-minimal']['passed']
validation = (f'BREP/IO all-feature debug and release each pass {full} tests, minimal release {minimal}; both strict all-target Clippy configurations, warning-denied docs, six examples, fuzz-target compilation, formatting and 58 zero-import WASM groups pass. Nine original recut/clear/reconstruct configurations plus 54 exact similarity configurations verify 126 continuation outputs with independent exact volume/area, nine classification samples including 1e-12 offsets, opposite paired edge uses, deterministic untrusted replay, subdivision and reflected rescaling. Canonical empty results feed recovery. Public circular-boundary records replay actual source identities and native paired parameters. Negative controls reject wrong spatial interiors despite matching endpoints/internal image flags, partial/gapped/near circles, changed carrier charts, near-shifted shell records, wrong angular parameters and adjacent domains describing the same semicircle. All 22 final commands match final source. Eleven STEP files pass independent OCCT topology/floating-point mass checks; 22 generated STEP artifacts remain byte-identical. Six new torus/cone export attempts retain typed surface/body/entity blockers followed by supported same-context recovery. The complete fifteen-case frontier now has ten validated results and five typed quarter/band blockers; its counts are diagnostic, not independent set proofs.')
cost = (f'The complete 72-process campaign compares all 138 preserved cases across twelve corpora with no receipt waiver. Largest case-median candidate/baseline ratio {maximum}; {over_budget} rows exceed 10%, and {allocation_rows} rows change allocator observations. Three separate processes measure eleven new complete workloads, with exact checks and full materialization/replay inside timing. The first full campaign, its six over-budget rows and all original new-domain costs remain. A complete focused 64-case native probe preserves every receipt and reduces the largest ratio from 1.295617 to 1.119734 after strict native line-side exclusion, with four spline rows still above 10%. Full final qualification and both complete cost campaigns are repeated. All trials, allocations, process resources and executable sizes remain. Previously failed work is not a speedup baseline. The old native NURBS Mobius inverse, archive and cached-arc timing exceptions remain open; current observations neither isolate their cause nor close controlled-host/statistical admission. No internal total-resource bound is claimed.')
limits = ' '.join(m['limits'])
entry = dict(id='curved-coplanar-composition',
    work_packages=['WP00', 'WP01', 'WP03', 'WP06', 'WP07', 'WP08', 'WP12', 'WP13', 'WP21'],
    properties=['P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P8', 'P9', 'P15', 'P16', 'P17', 'P18', 'P19', 'P20', 'P24', 'P25', 'P26', 'P27', 'P35', 'P36', 'P37', 'P39'],
    change='Retain both actual surface charts for coincident planar circles and identical cone/torus iso-boundaries. Map contacts through native preimages of actual authored edge uses. Prove complete circular boundary coverage with native overlap receipts and independent spatial image validation. Coalesce whole circular images across redundant/reversed frames only with complete coverage, retaining phase. Reuse the cone meridian section parameterization and prove complete geometric parameterization equality across analytic shell carrier records. Use a strict native line-side exclusion before generic source inverses; positive/blocked classification retains the full inverse. No surrounding production changes.',
    source='../src/boolean_kernel.rs',
    source_files=['../src/boolean_kernel/coincident.rs', '../src/boolean_kernel/circle_traces.rs',
                  '../src/topology/edit/boundary.rs', '../src/topology/edit/results.rs',
                  '../src/ownership/changes.rs', '../src/geometry.rs',
                  '../src/topology/validation/cone.rs', '../src/topology/validation/torus.rs'],
    evidence='evidence/2026-10-16-curved-coplanar/manifest.json',
    validation=validation, cost_evidence=cost, migration=m['migration'], limits=limits)
p = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
s = read(p)
s['updated_on'] = '2026-10-16'
s['increments'] = [row for row in s['increments'] if row['id'] != entry['id']] + [entry]
assert len(s['work_packages']) == 28 and not s['complete']
for row in s['work_packages']:
    assert row['status'] in ['open', 'in-progress']
for index, action in enumerate(s['next_actions']):
    if action.startswith('Extend the completed 63 seam-cut workflows'):
        s['next_actions'][index] = ('Extend the completed recut/clear/reconstruct workflows using evidence/2026-10-16-curved-coplanar/continuation-frontier.json. Preserve all fifteen original diagnostic inputs, the nine exact targeted configurations and 54 transformed variants, full-size geometry, near samples, split/reflection/replay, source parameters and public overlap provenance. Five quarter/band attempts retain typed blockers in mixed angular/axial shell validation or native partition/predicate work. Repair BREP owners without identity shortcuts, weaker validation or accepting a new Unknown; only change a dependency for a reproduced BREP blocker after checking concurrent upstream corrections. Verify repeated set identities independently (WP03/WP06/WP07/WP08, P17-P20/P35/P39).')
for index, action in enumerate(s['next_actions']):
    if action.startswith('Requalify archive-admission native timings') and 'curved-composition increment is now' not in action:
        s['next_actions'][index] = action + (' The curved-composition increment is now the next exact-feature baseline. Its complete 138-case final campaign and eleven successful new workloads are retained in evidence/2026-10-16-curved-coplanar/manifest.json. Strict native line-side exclusion improves the added source-inverse scheduling cost; isolate any remaining over-budget rows with complete inputs, all receipts, actual source identities and no weaker proof or policy. Preserve prior adverse campaigns and their unresolved causes.')
write(p, s)
p = ROOT / 'docs/properties-status.json'
s = read(p)
s['current_work']['hyperbrep']['latest_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-16-curved-coplanar/manifest.json'
s['current_work']['hyperbrep']['qualification'] = ('On upstream 72cd216cc and branch baseline 2c52ee7d5, complete repeated native recuts, canonical-empty recovery and complementary reconstruction of the original torus/cone halves. ' + validation + ' ' + cost + ' ' + limits)
write(p, s)
for relative, link in [('crates/hyperbrep/PERFORMANCE.md', 'docs/evidence/2026-10-16-curved-coplanar/README.md'),
                       ('crates/hyperbrep-io/PERFORMANCE.md', '../hyperbrep/docs/evidence/2026-10-16-curved-coplanar/README.md')]:
    p = ROOT / relative
    marker = '\n## Repeated curved composition (2026-10-16)\n'
    text = p.read_text()
    if marker in text:
        text = text.split(marker)[0]
    text += marker + f'''
The [source-bound record]({link}) qualifies native recuts, canonical-empty
recovery and complementary reconstruction on three original full-size torus/cone
half cuts, both applicable orders and six exact similarities. All 138 preserved
cases run in twelve complete corpora, three alternating CPU-0 pairs each, without
receipt waivers. The largest case-median ratio is {maximum:.6f}; {over_budget} rows
exceed 10%, and {allocation_rows} rows change allocator observations. Every sample,
allocator request, process resource and executable size is retained. These are
shared-host observations, not statistical performance admission.

Eleven new workloads have separate absolute costs from three processes. Exact
checks and complete archive materialization/revalidation remain inside timing;
each case has one untimed warmup. The matrix hashes all complete outputs and
continues through split/reflection/replay. Existing failures cannot serve as a
speedup baseline. The old NURBS Mobius inverse, archive and cached-arc timing
exceptions remain open, alongside any current over-budget rows. Retain this
increment for its exact completion/correctness extension with all costs visible.
The first complete campaign remains, including six over-budget rows. The native
line-side exclusion reduces the largest focused native ratio from 1.295617 to
1.119734; four focused spline rows remain over budget. The final full campaign
above follows complete requalification and retains every cohort. No total-work,
retained-heap, cancellation or controlled-host claim is made.
The five remaining quarter/band diagnostics and all broader work-package,
resource/provenance and delivery gates remain open.
'''
    p.write_text(text)
print('Updated BREP planning/performance and only its shared ledger entry.')
