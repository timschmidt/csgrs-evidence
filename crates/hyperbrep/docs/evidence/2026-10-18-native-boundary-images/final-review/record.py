"""Record the feature extension after complete correctness and resource review."""
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes
read = lambda n: json.loads((OUT/n).read_text())
write = lambda p, obj: p.write_text(json.dumps(obj, indent=2)+'\n')
source = hashes()
q, c, r = (read(n) for n in ['qualification-summary.json', 'cost-summary.json', 'resource-summary.json'])
new = read('new-cost-summary.json')
review = read('resource-decision.json')
assert source == q['source'] == c['source'] == r['source'] == new['source'] == review['source']
assert review['decision'] == 'kept'
assert review['reviewed_adverse_rows'] == [(x['corpus']+'/'+x['case']) for x in r['adverse_timing_rows']]
assert q['preceding_artifact_counts'] == dict(unchanged=211)
assert c['receipt_preserved'] and not c['migrations'] and len(c['costs']) == 192
assert read('frontier.json')['counts'] == dict(native_result=2, unsupported=5)
assert read('new-artifact-comparison.json')['unchanged'] == 8
b = read('baseline.json')
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == b['baseline']
validation = ('Hypercurve owns a strict source-bound complete native segment image query; BREP consumes it '
    'for retained profile construction, cold prism queries and common-profile interval continuation. '
    'The original mixed parabola/retained-chord extrusion now completes, with exact area 32/3 and volume 32 '
    'at height 3. Six BREP groups include all eight reversal/component/affine variants, exact holes and '
    'disconnected components, incidence, 1/10^12 boundary probes, native cold replay, planar-face admission, '
    'middle-slab subtraction/restoration, thin remnants, touching unions, invalid crossings and unequal-hole '
    'rejection. Eight Hypercurve groups cover native and restricted line/arc images, polynomial/rational/'
    'one-span NURBS line images, retained chords and parallel lines, symbolic coordinates, strict proof in '
    'an approximate scope, and nonmonotone/out-of-domain/multi-span blockers. Native/IO suites pass 608 '
    'all-feature and 600 minimal release tests; 93 focused curve release tests and 49 focused debug tests '
    'pass. Warning-denied affected all-target Clippy and rustdoc, external consumers, nine STEP examples, '
    'fuzz-target compilation and formatting pass. The previous actual WASM harness completes 138 groups '
    'and the new harness 14 groups, both with zero imports. All 211 previous final native/STEP artifacts '
    'are byte-identical; eight new profile artifacts agree across fresh processes. Original 24 prism '
    'outcomes and 81 continuation diagnostics remain. All seven original retained-profile recipes remain: '
    'two native successes and five UnsupportedPlanarProfile outcomes. Only the formerly unsupported uncut '
    'profile changes outcome; the other six original logs remain identical.')
cost = (f"All 192 original case receipts are preserved across 22 full corpora and 132 fresh processes "
    f"(three alternating CPU-pinned pairs). Median case ratio {r['timing_ratio_median']:.6f}; range "
    f"{r['timing_ratio_range'][0]:.6f}–{r['timing_ratio_range'][1]:.6f}. "
    f"{len(r['adverse_timing_rows'])} rows exceed the 10% review marker; "
    f"{len(r['increased_allocation_rows'])} rows increase allocation requests. "
    'Every adverse row, raw process sample, allocation and executable/WASM size is retained and reviewed. '
    'Six new complete native regression groups have separate absolute costs from three fresh processes, '
    'with four completion groups distinguished from two expected-rejection controls. No faster-error '
    'comparison or speedup claim. '+review['summary'])
limits = ('The image view retains the borrowed original curve, but its native segment has its own chart. '
    'The live extrusion retains the original normalized region; native archives replay exact geometry '
    'and regenerate admission facts, not the complete authoring graph or an original-to-native parameter '
    'map. Strict local certification does not upgrade an earlier source construction. Four original '
    'selected parabola Boolean/affine profiles and the nonlinear parallel cap remain unsupported. STEP '
    'export of the new uncut solid reports UnsupportedCurve(RationalBezier) at body 0, edge 0; later '
    'surface requirements are not tested by that rejection. General selected-parameter integration, '
    'analytic parallel spatial carriers, unequal-profile stepped shells, general surface Booleans, '
    'operation-wide work/retained-heap/cancellation bounds, full coverage/formal/fuzz/ASan/lexicase gates, '
    'registry/MSRV/real binding delivery and complete STEP/AP support remain open. Existing cost and '
    'thin-layer OCCT limitations remain recorded. Source-path WASM and Cargo membership are not shipped '
    'consumer qualification. All 28 work packages remain open or in progress. No push or complete '
    'pre-push claim. Necessary supporting-crate changes belong in their owners; unrelated upstream '
    'breakage remains with the concurrent thread.')
write(OUT/'retention-decision.json', dict(decision='kept', source=source, validation=validation,
    cost_evidence=cost, limits=limits, preserved_artifacts=211, preserved_cases=192,
    reason='Extend exact useful native work through construction, replay and continued modeling; preserve the previous complete domain.'))
write(OUT/'idea-ledger.json', [
    dict(idea='Source-bound native line/arc image view in Hypercurve', decision='kept',
         evidence='review.md', result='Reuse existing full-image proofs with range and injectivity guards; eight proof groups pass.',
         interactions='BREP consumes the proof without duplicating curve formulas or exposing retained fragment variants.'),
    dict(idea='Consume native images before whole planar-path validation', decision='kept',
         evidence='retained-profile-tests-1.log', result='Resolve the retained-line handoff while retaining simplicity/nesting checks and invalid-crossing rejection.'),
    dict(idea='Reuse admitted cold prism cap paths after native contour projection fails', decision='kept',
         evidence='retained-profile-tests-2.log', result='Cold replay feeds continued modeling; original native contour projection remains first.'),
    dict(idea='Common-profile regularized finite interval union and subtraction', decision='kept',
         evidence='retained-profile-tests-4.log', result='Require empty full-profile XOR, then preserve gaps, touching unions and two residual solids; unequal-hole control rejects.',
         interactions='Original successful Boolean routes remain first. Attempts 2 and 3 retain the original middle-cut and restoration failures.'),
    dict(idea='Infer a retained trimmed line image from its endpoints or source line fit alone', decision='rejected',
         evidence='../../../../hypercurve/tests/native_curve_images.rs',
         result='Nonmonotone and exterior-range controls leave the endpoint segment; complete image/traversal evidence is necessary.'),
    dict(idea='General spline STEP exchange from native success alone', decision='architecture-inapplicable',
         evidence='next-step-domain.md', result='IO owns exact entity/chart/encoding admission; the current writer still rejects the rational Bezier edge. No STEP completion is claimed.')])

relative = 'evidence/'+OUT.name
location = str(OUT.relative_to(ROOT))
status_path = ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(status_path.read_text())
identity = 'native-boundary-images-2026-10-18'
assert all(x['id'] != identity for x in status['increments'])
status['updated_on'] = '2026-10-18'
status['increments'].append(dict(id=identity, work_packages=['WP00', 'WP02', 'WP03', 'WP06', 'WP08', 'WP21'],
    properties=['P1', 'P6', 'P8', 'P9', 'P11', 'P12', 'P15', 'P16', 'P17', 'P18', 'P19', 'P20', 'P24', 'P27', 'P35', 'P36', 'P37', 'P39'],
    change='Share certified native curve images with BREP; complete retained-chord profile construction, cold replay and common-profile slab continuation.',
    source='../src/construction.rs', evidence=relative+'/manifest.json', validation=validation, cost_evidence=cost, limits=limits))
status['next_actions'][0] = ('Use '+relative+'/manifest.json as the current native feature and preserved-domain cost baseline. '
    'Preserve all 211 previous artifacts, eight new repeated profile artifacts, 192 original full benchmark cases, '
    '24 prism successes, 81 previous diagnostics, six complete BREP and eight curve proof groups, and both '
    '138-group and 14-group WASM harnesses. Keep original full failures and all resource observations.')
status['next_actions'][1] = ('The original uncut mixed parabola/retained-line profile now constructs, replays and '
    'continues through exact middle cuts and restoration. Four original selected parabola Boolean/affine variants '
    'and the curved analytic parallel remain unsupported. Native image proof does not supply missing selected '
    'integrals or general spatial carriers. Follow '+relative+'/next-step-domain.md for the reproduced '
    'RationalBezier STEP edge blocker: investigate exact clamped B-spline and linear-extrusion exchange in IO, '
    'with native whole-image/chart proofs, independent authored import, full edited workflows and real WASM. '
    'Keep complete authoring graph and source qualification persistence separate from native geometry replay.')
write(status_path, status)

plan_path = ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'
plan = plan_path.read_text()
start = plan.index('The [retained-region extrusion diagnostic]')
end = plan.index('\nThe retained diagonal STEP case', start)
plan = plan[:start]+'''The [retained-region diagnostic](evidence/2026-10-17-retained-region-extrusion/README.md)
preserves the seven original profile recipes. The subsequent
[native boundary image increment](evidence/2026-10-18-native-boundary-images/README.md)
resolves the uncut mixed parabola/retained-line workflow through construction,
cold replay and exact cuts/restoration. Hypercurve owns the source-bound whole
image view; BREP owns spatial topology and common-profile interval composition.
Native image charts and native geometry archives must not be described as the
original source chart or complete authoring history. Preserve the five remaining
unsupported recipes, nonmonotone image controls and unequal-hole rejection.
The [next STEP domain](evidence/2026-10-18-native-boundary-images/next-step-domain.md)
starts from the reproduced rational Bezier edge blocker. Exact B-spline and
linear-extrusion exchange needs native chart/image proof, format-owned numeric
admission, independent authored import and complete continued modeling. General
selected-parameter measurement and analytic parallel extrusion remain open.
'''+plan[end:]
plan_path.write_text(plan)

matrix_path = ROOT/'crates/hyperbrep/docs/SUPPORT_MATRIX.md'
matrix = matrix_path.read_text()
needle = 'Full cones remain absent until the apex singularity'
assert needle in matrix
matrix = matrix.replace(needle, '''Retained path boundaries can use Hypercurve's source-bound `Curve2::native_segment`
view when it proves the complete oriented line/arc image. Source ranges require
range and traversal evidence; source fitting or endpoint sampling is insufficient.
BREP then validates the complete path and uses the native image's parameter chart.
The [retained-profile evidence](evidence/2026-10-18-native-boundary-images/README.md)
covers the mixed parabola/chord profile, reversal, affine maps, holes/components,
planar faces, cold replay and further native cuts/restoration. The live extrusion
retains its original region. Native geometry replay does not persist the full
authoring boundary graph. Selected-parameter integrals and general nonlinear
parallel extrusion remain unsupported; STEP rejects this profile's rational
Bezier edge before reaching any later surface requirements.

'''+needle, 1)
start = matrix.index('`boolean::{union, intersection, difference}` supports certified global-z')
end = matrix.index('\nParallel and antiparallel analytic cylinders', start)
matrix = matrix[:start]+'''`boolean::{union, intersection, difference}` has a native line/arc global-z
prism route. Its profile Boolean uses the overlapping z slab for intersection,
identical slabs for union, and a covering cutter slab for directed difference.
Other routes retain their separate domains. Certified right-prism outputs with
parallel axes can continue in a common orthonormal chart after transforms or
replay; skew/nonparallel prisms are not admitted by that shortcut.

Cold global-z prism queries also consume admitted complete cap-path certificates
when native line/arc projection is unsupported. After the earlier Boolean routes
fail with incompatible slabs, a common-profile rule proves empty symmetric
difference of the complete filled profiles, including holes. Union then merges
touching/overlapping finite z intervals or retains two disjoint solids; difference
can leave zero, one or two finite products. Exact 1/10^12 residual layers remain
distinct. This completes the retained mixed-profile cut/restoration workflow;
matching outer contours or bounds cannot substitute for profile equality.
Unequal-profile stepped shells and arbitrary oblique products remain outside
this rule. See the [proof and continuation review](evidence/2026-10-18-native-boundary-images/review.md).
'''+matrix[end:]
matrix_path.write_text(matrix)

performance_path = ROOT/'crates/hyperbrep/PERFORMANCE.md'
performance = performance_path.read_text()
heading = '# HyperBREP Performance Contract\n'
assert performance.startswith(heading)
performance_path.write_text(heading+f'''
## 2026-10-18: native boundary image feature admission

The [complete qualification](docs/{relative}/README.md) extends retained-profile
construction and continued modeling. This is a capability extension, with
previous successful routes and all deterministic receipts preserved.

{cost}

The [full report](docs/{relative}/costs.md),
[new absolute costs](docs/{relative}/new-cost-summary.json) and
[resource review](docs/{relative}/resource-review.md) retain every observation.
Allocation requests and process RSS are not retained-heap bounds; harness sizes
are not distribution sizes. Historical regressions remain tied to their source
and are not erased by this campaign. All project completion gates remain open.
'''+performance[len(heading):])

ledger_path = ROOT/'docs/properties-status.json'
before = ledger_path.read_text()
entry = json.loads(before)['current_work']['hyperbrep']
entry.update(latest_evidence=location+'/manifest.json', latest_feature_evidence=location+'/manifest.json',
    latest_implementation=identity, qualification=validation+' '+cost+' '+limits)
helper = OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec = importlib.util.spec_from_file_location('spans', helper)
spans = importlib.util.module_from_spec(spec)
spec.loader.exec_module(spans)
after = spans.replace_brep(before, entry)
ledger_path.write_text(after)
write(OUT/'ledger-update.json', dict(before_sha256=hashlib.sha256(before.encode()).hexdigest(),
    after_sha256=hashlib.sha256(after.encode()).hexdigest(), helper_sha256=hashlib.sha256(helper.read_bytes()).hexdigest(),
    scope='Only current_work.hyperbrep changes; every other shared-ledger byte remains intact.'))
(OUT/'README.md').write_text(f'''# Native boundary images and retained-profile continuation

Qualified against `{b['baseline']}` with upstream `{b['upstream']}` integrated.
The [pre-edit reproduction](reproduction.json) retains all seven original full
recipes on the unchanged baseline. The [contract](contract.md) identifies the
owners, strict proof requirements, source-chart distinction and missing tests
before each implementation step. The [review](review.md) explains the shared
whole-image proof, cold prism certificate and common-profile interval rule.

{validation}

The [frontier](frontier.json) retains every original recipe. Failed development
attempts 1–3 remain in [all command attempts](attempts.json), with reconstructible
source epochs; the full tests were extended, never reduced to obtain success.
The original round-path measurement diagnostics still exit with their expected
typed failure and remain separate from passing qualification gates.
The original [artifact comparison](artifact-comparison.json) and
[new repeated artifacts](new-artifact-comparison.json) separately establish
deterministic bytes. Independent exact integrals, topology incidence and set
identities supply semantic assertions; checksums alone do not.

{cost}

The [complete cost report](costs.md), [new absolute observations](new-cost-summary.json)
and [resource review](resource-review.md) preserve raw unfavorable results and
state the resource limits. New work is never compared against a former error.
The [idea ledger](idea-ledger.json) records retained and rejected approaches.

[Qualification](qualification-summary.json), [new native/WASM consumers](new-consumers.json),
[source reconstruction](source-reconstruction.json), [retention decision](retention-decision.json),
[manifest](manifest.json) and [audit](audit.json) bind the evidence to source.
The [storage check](storage-identity.json) covers the current physical paths;
it does not audit all historical artifacts. [Cargo payload lists](package-payload.json)
check that the curve API and BREP regression ship in the proposed source payload,
with historical evidence excluded; they do not establish release delivery.

The [STEP feasibility review](next-step-domain.md) starts at the actual rejected
rational Bezier edge and records primary schema references, ownership, required
proofs and complete consumers for the next domain. No writer change is included.

{limits}
''')
assert hashes() == source
print('Recorded native boundary image feature admission.', flush=True)
