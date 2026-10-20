"""Update BREP planning and only its entry in the shared property ledger."""
import json
from check import OUT, ROOT


def read(path):
    return json.loads(path.read_text())


def write(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


m = read(OUT / 'manifest.json')
assert all(r['exit_code'] == 0 and r['source_unchanged'] for r in m['qualification'])
validation = ('BREP/IO all-feature debug and release each pass 431 tests, minimal release 423; both all-target strict Clippy configurations, warning-denied docs, six examples, fuzz-target compilation, formatting and 37 zero-import WASM groups pass. Eleven complete exports pass independent OCCT topology and floating-point mass checks; all seven preceding STEP artifacts remain byte-identical. Exact native matrices cover primitives, clipped/void certificates, selected repeated splits/inverses, periodic seams, 1e-15 physical separation, all five spatial profile families, aliasing charts and typed rejection/recovery. Same-endpoint/wrong-interior profile corruption remains rejected. Every final check matches the complete final snapshot. The earlier qualification and cost campaign remain; final review reproduced split-then-reflect replay failure and all affected checks were repeated after its parameter-origin proof repair. All failed attempts and original full inputs remain.')
maximum = max(r['maximum_ratio'] for r in m['benchmark_summary'])
allocation_rows = sum(len(r['allocation_changes']) for r in m['benchmark_summary'])
cost = (f'Sixty alternating processes preserve required outputs and fixture facts for all 123 prior BREP/STEP/arc cases. Largest case-median candidate/baseline ratio: {maximum}; {allocation_rows} rows have changed allocator observations. All raw timing, allocation, process-resource and binary-size data remain, including adverse cases. Three additional processes measure nine complete new workflows with exact checks, output materialization and replay included. These are shared-host observations, not a speedup over the previously failing scale path or statistical release-performance admission.')
limits = ('All 28 work-package gates remain open. Nonlinear axial pcurves, general nonsimilar analytic promotion, three reproduced seam-aligned torus/cone cuts, broader CAD/STEP families/voids/assemblies, complete provenance/resource/cancellation and shipped package/MSRV/binding gates remain open. The three cuts fail on the final source and are not replaced by passing oblique examples. No runtime fuzz/ASan/lexicase, coverage, formal proof, full workspace/pre-push campaign or push claim. Surrounding implementation remains concurrent upstream work.')
entry = dict(id='native-analytic-similarities', work_packages=['WP00', 'WP01', 'WP02', 'WP03', 'WP13', 'WP14a', 'WP21'],
    properties=['P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P8', 'P9', 'P15', 'P16', 'P17', 'P18', 'P19', 'P20', 'P24', 'P25', 'P26', 'P27', 'P35', 'P36', 'P37', 'P39'],
    change='Certify and share native similarity scale, normalize analytic frames, scale physical dimensions/charts and every affected shell/void certificate, and preserve selected parameters/source pcurve lineage. Separate shared pcurves when face charts differ. Repair reproduced extrusion reflection and complete reversed-profile image validation; route elliptic revolution meridians through the existing complete proof. Canonicalize dependent archive records from emitted coordinates, and reduce the dimensionless torus height through the existing scalar primitive. Complete native scale/export/reimport unit workflows without IO-owned transforms or surrounding implementation changes.',
    source='../src/geometry/transform.rs',
    source_files=['../src/topology/transform.rs', '../src/topology/validation/analytic_image.rs', '../src/topology/validation/image.rs', '../src/persistence.rs', '../src/topology/measure.rs'],
    evidence='evidence/2026-10-16-analytic-similarity/manifest.json', validation=validation, cost_evidence=cost,
    migration=m['migration'], limits=limits)
p = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
s = read(p)
s['updated_on'] = '2026-10-16'
s['increments'] = [r for r in s['increments'] if r['id'] != entry['id']] + [entry]
assert len(s['work_packages']) == 28 and not s['complete']
for i, action in enumerate(s['next_actions']):
    if action.startswith('Continue WP14a from selected exact'):
        s['next_actions'][i] = ('Continue WP14a from exact selected faceted/analytic import/export and the now-completed native similarity/unit workflow. Preserve LINE/CIRCLE topology on PLANE/CYLINDRICAL_SURFACE, independent graph/interoperability checks, selected scale/edit/inverse replay and Boolean/empty continuation. Add other families and exact periodic seams without inventing tau from decimal data. WP14b retains spline/trim/void/mapped/assembly exchange and explicit healing/approximation. General nonlinear axial pcurves need native exact affine carriers; nonsimilar analytic transforms need deliberate family promotion. Source maps do not establish whole-document/history persistence.')
frontier = ('Resolve the three full-size seam-aligned cut workflows retained in evidence/2026-10-16-analytic-similarity/cut-frontier.md: torus axial/longitudinal halves fail one-use-edge manifold validation, and cone longitudinal half lacks an interior witness. Preserve both baseline/final diagnostics and passing oblique/clipped workflows; repair the native graph/topology owner without sampling, relaxing validation or substituting easier geometry (WP08/P17-P20/P35/P39).')
if frontier not in s['next_actions']:
    s['next_actions'].insert(2, frontier)
write(p, s)
p = ROOT / 'docs/properties-status.json'
s = read(p)
s['current_work']['hyperbrep']['latest_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-16-analytic-similarity/manifest.json'
s['current_work']['hyperbrep']['qualification'] = ('On merged upstream 72cd216cc and branch baseline f3d34bef, complete native analytic similarity transport and its reproduced BREP dependencies. ' + validation + ' ' + cost + ' ' + limits)
write(p, s)
for relative, link in [('crates/hyperbrep/PERFORMANCE.md', 'docs/evidence/2026-10-16-analytic-similarity/README.md'),
                       ('crates/hyperbrep-io/PERFORMANCE.md', '../hyperbrep/docs/evidence/2026-10-16-analytic-similarity/README.md')]:
    p = ROOT / relative
    marker = '\n## Native analytic similarities (2026-10-16)\n'
    text = p.read_text()
    if marker in text:
        text = text.split(marker)[0]
    text += marker + f'''
The [source-bound admission record]({link}) retains the exact metric/chart,
profile-reflection, archive and torus-measurement changes. No surrounding
implementation was changed. All 123 prior case receipts and fixture facts agree
across 60 alternating processes; seven previous STEP files are byte-identical.
The largest case-median candidate/baseline timing ratio is {maximum:.6f};
{allocation_rows} rows have changed allocator observations. Per-case costs,
all unfavorable samples, allocation requests, requested bytes, executable sizes
and process resources remain in the manifest. These are descriptive shared-host
observations, not a statistical performance gate or a general speedup.

Nine separately named new workloads include exact checks and complete archive
materialization/revalidation. Three processes measure rational, reflected and
radical cylinder replay, primitive/clipped/void/profile matrices, repeated
selected subdivision/inverse cycles, periodic near-offsets and rejection/recovery.
A previously failing scale operation is not their performance baseline. Integer
matrix receipts count completed workflows; each operation also asserts exact
formulas, images, provenance or deterministic archive contracts as appropriate.
No total scalar-work, heap, expression-growth or cancellation bound is established.
The source-path WASM consumer and optional OCCT reader do not close release gates.
'''
    p.write_text(text)
print('Updated BREP-owned plan/status/performance and only its shared ledger entry.')
