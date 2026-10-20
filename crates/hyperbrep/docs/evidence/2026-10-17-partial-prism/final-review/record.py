"""Record reviewed admission without changing another thread's ledger bytes."""
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,hashes
read=lambda p:json.loads(p.read_text())
write=lambda p,x:p.write_text(json.dumps(x,indent=2)+'\n')
sha=lambda data:hashlib.sha256(data).hexdigest()
q=read(OUT/'qualification-summary.json');r=read(OUT/'resource-summary.json')
assert q['source']==r['source']==hashes()
assert read(OUT/'cost-summary.json')['receipt_admitted']
assert read(OUT/'finish-checks.json')['passed']
evidence=str(OUT.relative_to(ROOT));relative='evidence/'+OUT.name
identity='axial-intersection-prerequisites-2026-10-17'
validation='Native/IO release suites pass 573 all-feature and 565 minimal-feature tests. Thirteen new focused debug tests, both all-target warning-denied Clippy configurations, external consumer and diagnostic lints, warning-denied rustdoc, nine STEP examples, fuzz-target compilation, formatting and 127 actual source-path WASM groups with zero imports pass. Four touching/disjoint transformed STEP/native workflows complete independent exact measures, incidence, near-boundary classification, cold replay, Boolean continuation and empty recovery. Partial-depth inputs now complete retained axial traces, both operand partitions and selections; the cold partitioned tool box also classifies and composes. All 24 original prism inputs remain: 20 native results, four unsupported; the three true partial-depth differences and covering reversed difference still lack shell admission. All 81 preceding native diagnostic outcomes, 71 preceding STEP files and twelve preceding region/component artifacts remain unchanged. Original general-path round-cap measurement blockers remain. The initial compile errors, failed consumers, full-suite/WASM bore regression and cold circular-correspondence failure are retained with source bytes. Scalar/dependency runtime is unchanged and inherited zero-factor failures remain upstream-owned.'
cost=f"The matched campaign retains all 180 preceding case receipts across twenty full corpora in three alternating pairs; four new complete workflow rows have absolute costs in three further processes (123 processes total). Median case ratio {r['timing_ratio_median']:.6f}, range {r['timing_ratio_range'][0]:.6f}–{r['timing_ratio_range'][1]:.6f}; {len(r['adverse_timing_rows'])} rows exceed the 10% review marker and {len(r['increased_allocation_rows'])} have increased allocation requests. All adverse rows, raw logs, process CPU/wall/RSS, allocator requests and executable sizes remain published. The new exact domain and continued consumption justify feature retention; this is not an optimization or an all-cohort performance-gate claim. Shared-host timing, requested allocation bytes and harness sizes do not establish speedup significance, retained-heap bounds or distribution size."
limits=[
 'Three genuine partial-depth cylinder differences and the covering reversed difference remain unsupported at native shell admission. Preserve every original full-size input and exact 1e-12 gap; complete the shell proof next.',
 'One preceding native prism result still has an unencodable STEP vertex. General curved embedding, Boolean closure and complete STEP/EXPRESS/AP support remain open.',
 'No total-work, retained-heap, expression/coefficient-growth or end-to-end cancellation bound is added. Existing solver-work counters and external test timeouts are distinct.',
 'Source qualification, shipped package/MSRV, actual C/Python/JavaScript distribution, full coverage, formal proofs, runtime fuzz/ASan/lexicase, release and complete pre-push gates remain open. No push; all 28 work packages stay open/in progress.',
 'Inherited scalar zero-factor failures, historical adverse BREP costs and unrelated upstream work remain separate obligations. No supporting runtime bytes change in this increment.'
]
write(OUT/'retention-decision.json',dict(decision='kept',reason='Exact native axial correspondence and usable coplanar partitions; touching/disjoint cylinder workflows now complete and remain consumable. Retain the prerequisites without claiming genuine partial-depth shell completion.',validation=validation,cost=cost,limits=limits))
write(OUT/'idea-ledger.json',[
 dict(idea='Native axial plane/cylinder whole-image correspondence with periodic trim/contact transfer',decision='kept',evidence='geometry/axial_lines.rs tests, partial-stage and shifted/reversed/tangent/near-miss acceptance, native/STEP/WASM consumers'),
 dict(idea='Complete oriented coplanar cover before convex-shell admission',decision='kept',evidence='convex_groups.rs positive/negative controls; cold partitioned-box measures, classification, Boolean consumption and replay'),
 dict(idea='Aggregate all top-cap material regions in the native prism profile query',decision='kept',evidence='original touching result previously produced an empty follow-up cut; current exact half measures, reconstruction, empty recovery and old bore tests pass'),
 dict(idea='Project a cap edge after checking only its start height',decision='rejected',evidence='retained native-release-1, native-minimal-1 and wasm-runtime-1 reversed-bore failures; both endpoints must precede projection'),
 dict(idea='Affine endpoint fit for a projected circular pcurve',decision='rejected',evidence='axial-cold-continuation-1 rejects the resulting archive; existing AngularSweep correspondence now preserves complete parameter meaning'),
 dict(idea='Keep strict circular whole-image validation unchanged',decision='already-satisfied',evidence='the new transfer uses the existing validator and archive representation; no endpoint-only admission or proof flag is accepted from JSON'),
 dict(idea='Admit partial shells from positive volume or a surface-family whitelist',decision='rejected',evidence='shell-proof-design.md records missing complete contact/embedding/coverage obligations; original partial-depth failures remain typed'),
 dict(idea='Replace exact authoritative intersections with OCCT tolerance sewing or polygonal Nef conversion',decision='architecture-inapplicable',evidence='contract.md primary-source research; external kernels remain optional interoperability oracles')
])
status_path=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json';status=read(status_path)
assert not any(x['id']==identity for x in status['increments'])
properties=['P1','P3','P6','P8','P9','P11','P12','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P39']
status['increments'].append(dict(id=identity,work_packages=['WP00','WP03','WP04','WP06','WP07','WP08','WP14a','WP21'],properties=properties,change='Retain exact axial plane/cylinder traces through periodic trimming and boundary witnesses. Prove complete coplanar convex covers for cold admission, aggregate every prism top-cap piece and preserve AngularSweep on projected circular Boolean pcurves. Add exact native/STEP/WASM continuations and complete-work evidence.',source='../src/geometry/axial_lines.rs',evidence=relative+'/manifest.json',validation=validation,cost_evidence=cost,limits=' '.join(limits)))
status['next_actions'].insert(0,'Complete genuine partial-depth cylinder/prism result shells using the prospective contact/embedding or piecewise-prismatic cover proof in '+relative+'/shell-proof-design.md. Retain all 24 original cases, the three partial-depth differences and reversed covering difference, every original 1e-12 gap, current cold partition/classification/continuation proofs, four new complete STEP workflows and all 127 WASM groups. Do not replace missing shell authority with volume or a surface whitelist.')
status['next_actions'].insert(1,'Use '+relative+'/manifest.json for the current axial prerequisite baseline: 180 preserved benchmark receipts, four absolute new complete-work rows, all adverse observations and failed attempts. Genuine partial-depth result admission remains the next capability, not completed by its successful tracing stages. Supporting crate changes remain authorized in their owner; unrelated repairs remain upstream-owned.')
write(status_path,status)
ledger_path=ROOT/'docs/properties-status.json';before=ledger_path.read_text();ledger=json.loads(before);brep=ledger['current_work']['hyperbrep']
brep.update(latest_evidence=evidence+'/manifest.json',latest_feature_evidence=evidence+'/manifest.json',latest_implementation=identity,qualification=validation+' '+cost+' '+' '.join(limits))
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec=importlib.util.spec_from_file_location('spans',helper);spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
after=spans.replace_brep(before,brep);ledger_path.write_text(after)
write(OUT/'ledger-update.json',dict(before_sha256=sha(before.encode()),after_sha256=sha(after.encode()),scope='Only current_work.hyperbrep changed; all surrounding bytes preserved.',helper_sha256=sha(helper.read_bytes())))
plan_path=ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md';plan=plan_path.read_text()
marker='Upstream mesh containment now validates closed PWN input before shortcuts and'
addition=f'''The [axial intersection prerequisite]({relative}/README.md) retains native
plane/cylinder line correspondence through authored periodic charts, exact
boundary contacts and both partition/selection stages. Coplanar convex cap
subdivisions now cold-replay, classify and compose; profile extraction uses the
complete cap cover, and projected circles retain their angular parameter map.
Touching/disjoint tool differences complete native and transformed STEP
continuations. The three original genuine partial-depth differences and the
covering reversed difference still lack a certified result shell. Implement
the [remaining shell proof]({relative}/shell-proof-design.md) next, preserving
all original full-size cases and exact thin layers. Positive volume, completed
selection or a list of overlapping slab bodies cannot substitute for complete
embedded-shell admission. Keep all current completed workflows and adverse
costs while extending that domain.

'''
assert marker in plan;plan_path.write_text(plan.replace(marker,addition+marker,1))
matrix_path=ROOT/'crates/hyperbrep/docs/SUPPORT_MATRIX.md';matrix=matrix_path.read_text()
old='| Plane / cylinder | Perpendicular circle; oblique ellipse; axial-parallel none, tangent line, or two lines |'
new='| Plane / cylinder | Perpendicular circle; oblique ellipse; axial-parallel none, tangent line, or two lines, with exact native affine axial correspondence and authored-periodic trim transfer |'
assert old in matrix;matrix=matrix.replace(old,new,1)
marker='## Booleans\n'
addition=f'''\nThe [axial continuation evidence]({relative}/README.md) admits touching/disjoint
cylinder/tool differences through exact measures, cold replay, further cuts,
reconstruction, empty recovery and transformed STEP exchange. It also proves
whole axial traces, both operand partitions and selection for the three original
partial-depth cuts; those results still fail explicitly at `UnsupportedSolidShell`.
The original 24-case prism corpus now has 20 native results and four unsupported
cases, including the covering reversed difference. This diagnostic count does
not certify every possible composition. Complete oriented coplanar convex
covers may contain curved internal subdivisions; cancellation proves their
coverage before cold shell admission. Native prism profile queries combine all
top-cap pieces, and planar circular Boolean transfers preserve `AngularSweep`.
General curved embedding and partial-depth result shells remain open.\n'''
assert marker in matrix;matrix_path.write_text(matrix.replace(marker,marker+addition,1))
for name,link in [('crates/hyperbrep/PERFORMANCE.md','docs/'+relative),('crates/hyperbrep-io/PERFORMANCE.md','../hyperbrep/docs/'+relative)]:
    path=ROOT/name;text=path.read_text();first,rest=text.split('\n',1)
    section=f'''\n\n## 2026-10-17: axial intersection and cold continuation prerequisites

Kept for exact capability and downstream consumption. [Admission evidence]({link}/README.md)
retains all original failed cases, the reversed-bore regression and the circular
parameter-map failure. Genuine partial-depth shells remain unsupported.

{cost}

[All adverse rows and new absolute costs]({link}/costs.md) include the complete
four-workflow native/STEP consumer, with one warmup and three measured iterations
per process. Existing source qualification, resource, package and historical
performance obligations remain open. All 28 work packages remain open/in progress.
'''
    path.write_text(first+section+rest)
assert hashes()==q['source']
print('Recorded axial prerequisites, retained frontier and BREP-only ledger update.',flush=True)
