"""Record the retained local optimization after exact and complete-cost gates."""
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
q = read('qualification-summary.json')
c = read('cost-summary.json')
r = read('resource-summary.json')
assert source == q['source'] == c['source'] == r['source']
assert q['preceding_artifact_counts'] == dict(unchanged=211)
assert c['receipt_preserved'] and not c['migrations'] and len(c['costs']) == 192
assert not r['adverse_timing_rows'], 'Over-budget rows require explicit review before retaining a performance-only change.'
b = read('baseline.json')
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == b['baseline']
target = next(x for x in c['costs'] if 'nurbs_path_extrusion' in x['case'])
butt = [x for x in c['costs'] if x['corpus'] == 'region_exchange' and '/Butt/' in x['case']]
assert len(butt) == 2 and target['ratio'] < 1 and all(x['ratio'] < 1 for x in butt)
validation = ('Native/IO release suites pass 602 all-feature and 594 minimal-feature tests. '
    'All 35 focused debug tests, full/minimal all-target warning-denied Clippy, external consumer lint, '
    'warning-denied rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. '
    'The unchanged actual source-path WASM harness executes 138 groups with zero imports. '
    'All 24 full-size prism outcomes, 81 preceding native diagnostics, eight partial-depth axial workflows, '
    'four previous axial workflows, two multi-component workflows and the original four path outcomes persist. '
    'All 211 preceding final native/STEP artifacts are byte-identical, including eight original partial-shell '
    'prism outputs not included in the preceding increment\'s older-artifact comparison. '
    'Independent exact measures, classifications, incidence, cold replay and repeated supported composition '
    'remain exercised. New plane tests cover symbolic/rational heights, skew/reversed/scaled charts, operand '
    'reversal, a distinct 1/10^12 offset and independently specified full crossing lines. '
    'No public API, representation, supported input, policy or fixture changes. Supporting runtime is unchanged.')
cost = (f"The matched campaign preserves all 192 original case receipts across 22 full corpora in 132 fresh processes "
    f"(three alternating CPU-pinned pairs per corpus). Median case ratio {r['timing_ratio_median']:.6f}; "
    f"range {r['timing_ratio_range'][0]:.6f}–{r['timing_ratio_range'][1]:.6f}. No case-median ratio exceeds 1.10. "
    f"NURBS boundary extrusion measures {target['baseline_median_ns']/1e6:.6f} to {target['candidate_median_ns']/1e6:.6f} ms "
    f"({target['ratio']:.6f}x); butt-region ratios are {butt[0]['ratio']:.6f} and {butt[1]['ratio']:.6f}. "
    f"There are {len(r['increased_allocation_rows'])} rows with increased allocation requests; all raw/adverse rows, "
    'process CPU/wall/RSS and executable/WASM sizes remain. The largest allocation-request increase is '
    '1,363 calls (0.052635%) and 85,128 requested bytes (0.041245%) in the primitive-matrix workflow. '
    'Native harness size changes range from -1,104 to +5,712 bytes; the same 138-group WASM harness is '
    '7,958 bytes smaller. The resource review retains these tradeoffs without claiming a heap bound. '
    'The two preliminary full-harness pilots and '
    'pre-edit historical reproduction stay separate. Retain the measured reduction in redundant proof work '
    'against the complete current domain; shared-host samples establish neither broad speedup significance '
    'nor a retained-heap/distribution-size bound. Earlier cost observations remain open.')
limits = ('General curved-shell/Boolean closure, the preceding unencodable diagonal STEP vertex, general '
    'rational-path measurement, complete source qualification, operation-wide total-work/retained-memory/'
    'cancellation contracts, formal proofs, full coverage, runtime fuzz/ASan/lexicase, registry/MSRV/binding '
    'delivery, complete STEP/AP support and the full pre-push matrix remain open. The unchanged original '
    'unrotated lower thin-layer STEP shape remains invalid to the optional OCCT reader at its import '
    'tolerance; all exact native assertions and eight rotated/reflected outputs remain valid. No tolerance '
    'healing is introduced. No package or whole-project completion claim; all 28 work packages stay open '
    'or in progress. No push. Necessary future supporting-crate changes remain authorized in their owners; '
    'unrelated upstream failures remain with the concurrent thread.')
write(OUT/'retention-decision.json', dict(decision='kept', source=source, validation=validation,
    cost_evidence=cost, limits=limits, preserved_artifacts=211, preserved_cases=192,
    reason='Same exact complete domain at lower measured prism-admission cost; no semantic or representation exception.'))
write(OUT/'idea-ledger.json', [
    dict(idea='Check the existing necessary internal-edge incidence before whole-support comparison',
         decision='kept', scope='Component of the combined candidate', evidence='adjacency-pilot.json',
         result='All 68 original pilot receipts preserved; NURBS ratio 0.854194 and roughly 585 fewer butt-workflow allocation requests. Final retention uses the combined full campaign.',
         interactions='The relation query further reduces support-query construction after incidence has ruled out ineligible pairs.'),
    dict(idea='Share the exact native plane relation and omit unused transverse intersection-line construction',
         decision='kept', scope='Combined candidate', evidence='cost-summary.json', result=cost,
         interactions='Native plane carrier specialization increased plane-group queries. The original proof and full intersection formulas remain shared; no weaker support equivalence or persistent cache.')])

relative = 'evidence/'+OUT.name
location = str(OUT.relative_to(ROOT))
status_path = ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(status_path.read_text())
identity = 'prism-admission-cost-2026-10-17'
assert all(x['id'] != identity for x in status['increments'])
status['increments'].append(dict(id=identity, work_packages=['WP00', 'WP03', 'WP06', 'WP07', 'WP08', 'WP21'],
    properties=['P1', 'P3', 'P4', 'P6', 'P8', 'P10', 'P11', 'P17', 'P18', 'P19', 'P20', 'P24', 'P27', 'P35', 'P36', 'P37', 'P39'],
    change='Reduce redundant exact prism-admission work: test necessary side incidence first, then share native plane relation proof without constructing unused intersection lines.',
    source='../src/geometry/planes.rs', evidence=relative+'/manifest.json', validation=validation,
    cost_evidence=cost, limits=limits))
status['next_actions'][0] = ('Use '+relative+'/manifest.json as the current preserved-domain cost baseline, '
    'with evidence/2026-10-17-axial-shells/manifest.json for the underlying exact feature admission. '
    'Preserve all 211 final artifacts, 192 original full benchmark cases, 24 native prism successes, 81 '
    'preceding diagnostics, complete STEP workflows, scale/distant-seam controls and 138 WASM groups. '
    'Extend the next reproduced unsupported BREP domain with independent set, topology, source-fidelity '
    'and complete downstream composition evidence.')
status['next_actions'][1] = ('Retain native plane/cylinder carriers and complete affine prism transport. '
    'The prism-admission cost increment removes redundant incidence/support work while retaining all '
    'original fixtures and receipts. Historical NURBS, butt-region and other cost observations remain; '
    'temporary generic extrusion allocation, repeated positive proof construction and inline optional '
    'axial-witness storage are separate unmeasured candidates. Preserve the remaining unencodable '
    'diagonal STEP vertex, rational-path measurement and source/resource/delivery blockers without approximation.')
write(status_path, status)
plan_path = ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'
plan = plan_path.read_text()
plan = plan.replace('`be2a0c37bfe57799c62a36125a5cb883a5458f00` and concurrent development ownership.',
                    '`7ed43501755fd64a01f54c3078d12229cbc0129d` and concurrent development ownership.', 1)
needle = 'Upstream `7ed435017` adds package/license and README corrections.'
assert needle in plan
plan_path.write_text(plan.replace(needle, '''The [prism admission cost increment](evidence/2026-10-17-prism-admission-cost/README.md)
preserves the complete current domain and deterministic outputs while reducing
redundant proof work. Keep necessary topology checks before irrelevant support
queries, and put shared exact geometric relations in the geometry owner.
Construct full intersection geometry only when the consumer needs it. This
does not relax whole-boundary validation or prove broader shell embedding.
Future optimizations must retain the full current 192-case corpus, all 211
final native/STEP artifacts and supported continuation; historical failures and
cost obligations stay visible. General CAD functionality and delivery remain
the project objective, with all work-package completion gates still open.

The retained diagonal STEP case also has a
[schema and exact-coordinate feasibility review](evidence/2026-10-17-prism-admission-cost/future-step-research.md).
Do not replace its irrational Cartesian vertices with points-on-curves inside
the current advanced-face profile. Nor can one affine instance transform make
all of that fixture's existing vertices finite-decimal. Any exact representation
normalization, alternate conforming profile or explicit lossy exchange route
requires its own contract, source mapping and complete admission evidence.

'''+needle, 1))
performance_path = ROOT/'crates/hyperbrep/PERFORMANCE.md'
performance = performance_path.read_text()
heading = '# HyperBREP Performance Contract\n'
assert performance.startswith(heading)
performance_path.write_text(heading+f'''
## 2026-10-17: exact prism admission proof scheduling

Kept after the [complete qualification]({relative}/README.md).
The necessary shared internal-edge condition precedes a wall support query.
Native plane grouping shares the full intersection relation proof and omits
unused transverse intersection-line construction. Exact topology, strict
certainty, supported composition, deterministic output and failure semantics
remain unchanged.

{cost}

[All cost observations]({relative}/costs.md) retain every case and raw sample.
All 211 preceding final native/STEP artifacts agree byte-for-byte. Broader
geometry, resource, coverage, delivery and historical cost obligations remain
open; all 28 work packages remain open or in progress.
'''+performance[len(heading):])
# PERFORMANCE.md is one level above docs, unlike plan-relative evidence links.
performance_path.write_text(performance_path.read_text().replace(f']({relative}/', f'](docs/{relative}/'))
ledger_path = ROOT/'docs/properties-status.json'
before = ledger_path.read_text()
entry = json.loads(before)['current_work']['hyperbrep']
entry.update(latest_evidence=location+'/manifest.json', latest_implementation=identity,
             qualification=validation+' '+cost+' '+limits)
helper = OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec = importlib.util.spec_from_file_location('spans', helper)
spans = importlib.util.module_from_spec(spec)
spec.loader.exec_module(spans)
after = spans.replace_brep(before, entry)
ledger_path.write_text(after)
write(OUT/'ledger-update.json', dict(before_sha256=hashlib.sha256(before.encode()).hexdigest(),
    after_sha256=hashlib.sha256(after.encode()).hexdigest(), helper_sha256=hashlib.sha256(helper.read_bytes()).hexdigest(),
    scope='Only current_work.hyperbrep changes; every other shared-ledger byte remains intact.'))
(OUT/'README.md').write_text(f'''# Exact prism admission at lower cost

Qualified against `{b['baseline']}` with upstream `{b['upstream']}` integrated.
The previous increment exposed native plane/cylinder walls and complete axial
shells. The original full harnesses reproduce its NURBS and butt-region cost
regressions before editing. This increment preserves that complete domain.

The [original contract](contract.md), [plane relation supplement](relation-contract.md)
and [proof review](review.md) describe the two changes: test the existing
necessary side incidence before whole-support proof, and share the exact
plane relation without constructing a line a coincidence query does not use.
Geometry owns the shared proof; topology retains whole-wall and shell admission.

{validation}

{cost}

The [full cost report](costs.md) retains every timing, allocation and size
observation, with the [resource review](resource-review.md) recording the
small unfavorable allocation and binary-size changes. [Both prototype pilots](idea-ledger.json) are separate from the
final campaign. The [pre-edit reproduction](reproduction.json) retains the
historical reference and current complete domain, original iteration counts
and every raw sample. The initial adjacency formatting failure remains with its
source epoch. Expected original round-path measurement errors are still errors.
The interrupted session's combined pilot had completed all four processes and
written its source-bound report before work resumed; no process was restarted
or sample replaced on the basis of a missing handle.

The [artifact comparison](artifact-comparison.json) covers all 211 preceding
final outputs, including the eight original partial-prism artifacts in addition
to the previous 187 compared and sixteen new axial-consumer outputs. Hashes
support deterministic preservation; independent exact semantic assertions and
optional external reads remain separate evidence. [Qualification](qualification-summary.json),
[all command attempts](attempts.json), [source reconstruction](source-reconstruction.json),
[retention decision](retention-decision.json), [manifest](manifest.json) and
[audit](audit.json) bind the record to the implementation. The current bounded
[storage identity check](storage-identity.json) uses the same physical tmpfs
target/cache and ext filesystem source as the preceding qualified baseline;
it does not audit all historical artifacts.

The [package payload check](package-payload.json) verifies that Cargo lists
185 members, including the new plane module, and no historical evidence files.
This checks package membership and physical source bytes; it does not build or
publish a release archive or establish installed-consumer delivery.

The [future STEP feasibility review](future-step-research.md) records why the
preserved diagonal export failure cannot be removed by simply substituting
points-on-curves or changing one affine instance frame. It changes no writer
behavior and does not close a STEP work-package gate.

{limits}
''')
assert hashes() == source
print('Recorded the exact prism admission cost increment.', flush=True)
