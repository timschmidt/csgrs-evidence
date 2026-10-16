"""Update only the BREP plan ledger and its root property-ledger entry."""
import json

from check import ROOT, OUT


def read(path):
    return json.loads(path.read_text())


def write(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


manifest = read(OUT / 'manifest.json')
checks = {row['label']: row for row in manifest['qualification']}
counts = {label: row['test_totals']['passed'] for label, row in checks.items() if 'test_totals' in row}
ignored = {label: row['test_totals']['ignored'] for label, row in checks.items()
           if row.get('test_totals', {}).get('ignored')}
ignored_text = ', '.join(f'{label} {count}' for label, count in ignored.items()) or 'none'
assert all(row['exit_code'] == 0 for row in checks.values())
summary = manifest['benchmark']['summary']
geometry = [row for row in summary if not row['kind'].endswith('_micro')]
ratios = '; '.join(f"{row['kind']} {row['median_ratio']:.6f}/{row['maximum_ratio']:.6f}" for row in geometry)
costs = manifest['new_pcurve_costs']['costs']
new_costs = '; '.join(f"{row['case']} {row['median_ns']/1000:.3f} us" for row in costs)
validation = (
    f"All {len(checks)} final scoped qualification/measurement commands pass on identical source snapshots. "
    f"BREP/IO debug and release pass {counts['native-debug']} and {counts['native-release']} tests; "
    f"minimal release passes {counts['native-minimal']}. Scalar all/minimal pass {counts['scalar-all']}/{counts['scalar-minimal']}, "
    f"predicates all/minimal {counts['predicates-all']}/{counts['predicates-minimal']}, curve {counts['curve-release']}, "
    f"solver {counts['solver-release']} and selected root acceptance {counts['root-acceptance']}. Counts overlap; inherited ignored counts: {ignored_text}. "
    f"Strict scoped Clippy, warning-denied docs, examples, fuzz-target compilation, formatting and {manifest['wasm']['probe_groups']} zero-import WASM groups pass. "
    "The independent pinned OCCT reader accepts the authored fixture with expected topology and floating-point mass properties; it does not certify exactness. "
    "Source maps are independently evaluated across master, direction, partial/full, placement and unit variants. Split/replay/reflection/BodySet/empty continuation and typed failures pass. "
    "Missing-capability and scalar-blocker failures, rejected normalization attempts, the corrected leaf-versus-value test and the invalidated overlapping-format run remain archived."
)
cost_evidence = (
    "All 100 preserved geometry cases retain required receipts and fixture facts across 36 alternating processes; "
    "258 selected scalar Criterion cases add 12 processes. Median/max geometry timing ratios: " + ratios + ". "
    "All adverse samples, allocation changes and executable sizes remain in the manifest; short scalar probes and shared-host timings do not establish a general speedup or complete timing admission. "
    "Three separate new-domain processes give absolute medians: " + new_costs + ". "
    "Fresh/reused syntax and rejection boundaries differ explicitly. Requested bytes and process RSS are not retained-memory or total-work bounds."
)
limits = (
    "All 28 work packages remain open. Exact general seam success, other analytic/spline/trimmed/void/assembly mappings, curved STEP export and explicit healing remain open. "
    "Source maps belong to the imported revision and are not automatically propagated by native edits or archives. "
    "Full operation provenance/receipts, total-work/retained-byte/cancellation bounds, published-package/MSRV and actual C/C++/Python/JavaScript consumers remain unqualified. "
    "Earlier archive/cached-arc timing exceptions and every new adverse cost observation remain visible. "
    "No new runtime fuzz/ASan/lexicase, coverage, formal-verification or complete pre-push campaign is claimed. No push."
)
entry = dict(
    id='step-supplied-pcurves',
    work_packages=['WP00', 'WP01', 'WP03', 'WP14a', 'WP21'],
    properties=['P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P8', 'P9', 'P10', 'P11', 'P15', 'P16', 'P17', 'P18', 'P19', 'P20', 'P25', 'P26', 'P27', 'P35', 'P36', 'P37', 'P39'],
    decision='Keep the exact supplied analytic pcurve extension and its reproduced scalar dependency repair. Remove the unsuccessful importer normalization approaches. Preserve failures, adverse costs and all broader gates; no optimization claim.',
    change='Map supplied planar CIRCLE and cylindrical LINE pcurves on spatial LINE/CIRCLE edges. Keep every directed source parameter map and master selector, with independent length/angle units. Use native staged whole-image proof for each new curved tuple and independent final face/shell/model validation. Preserve the exact planar-line specialization. Decode SEAM_CURVE and reject duplicate bounds and finite-decimal near-period encodings without claiming successful exact seam import. A directly reproduced partial-arc source-map blocker requires a bounded Hyperreal certificate for odd integer pi/4 +/- atan(x), after the existing quarter-turn path. No unrelated surrounding implementation changes; the earlier scalar prototype remains parked.',
    source='../../hyperbrep-io/src/step/advanced/pcurves.rs',
    source_files=['../../hyperbrep-io/src/step/advanced/curves.rs', '../../hyperbrep-io/src/step/advanced/circles.rs',
                  '../../hyperreal/src/computable/node/algebra.rs', '../../hyperreal/src/computable/node/exp_trig.rs'],
    evidence='evidence/2026-10-15-step-pcurves/manifest.json',
    validation=validation,
    cost_evidence=cost_evidence,
    limits=limits,
)
path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = read(path)
status['updated_on'] = '2026-10-16'
status['increments'] = [row for row in status['increments'] if row['id'] != entry['id']] + [entry]
assert len(status['work_packages']) == 28 and not status['complete']
status['next_actions'][9] = (
    'Continue WP14a from selected exact faceted, planar advanced, direct-circle and supplied analytic-pcurve exchange. '
    'Preserve every source/master map, basis-aware unit conversion, native complete-image validation and strict split/replay/reflection/BodySet/empty workflow. '
    'Extend to successful exact periodic seams, other analytic families and exact curved export; do not infer a period from decimal values or a familiar unit name. '
    'WP14b adds spline/trim/void/mapped/assembly exchange and explicit healing/export approximation. '
    'Keep the original off-carrier decimal cylinder and near-period seam as typed rejections. '
    'Imported-revision maps do not by themselves establish edit provenance or whole-document exchange.'
)
write(path, status)
path = ROOT / 'docs/properties-status.json'
ledger = read(path)
entry = ledger['current_work']['hyperbrep']
entry['latest_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-15-step-pcurves/manifest.json'
entry['qualification'] = (
    'On merged upstream 362e157c1, admit selected supplied planar/cylindrical analytic STEP pcurves with every exact source map and native image/face validation. '
    'A reproduced partial-arc source-map blocker requires a narrow two-file scalar certificate; all unrelated surrounding implementation and the parked scalar prototype remain untouched. '
    + validation + ' ' + cost_evidence + ' ' + limits
)
write(path, ledger)
print('Updated BREP increment and its property-ledger entry; 28 work-package gates remain open.')
