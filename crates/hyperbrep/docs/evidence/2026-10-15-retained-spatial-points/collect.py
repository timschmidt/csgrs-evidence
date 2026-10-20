from pathlib import Path
from dataclasses import asdict
from statistics import median
import hashlib
import json
import os
import platform
import re
import shutil
import subprocess
import sys

root=Path('/mnt/development/csgrs')
qualification=Path('/tmp/hyperbrep-spatial-qualification')
controls=Path('/tmp/hyperbrep-spatial-controls')
out=root/'crates/hyperbrep/docs/evidence/2026-10-15-retained-spatial-points'
out.mkdir(exist_ok=False)
commands=json.loads((qualification/'commands.json').read_text())
assert len(commands)==30,len(commands)
assert all(command['exit_code']==0 for command in commands)
negative=json.loads((controls/'controls.json').read_text())
assert len(negative)==4 and all(control['exit_code']==101 for control in negative)
def sha(path): return hashlib.sha256(path.read_bytes()).hexdigest()
for control in negative:
    assert sha(root/control['source'])==control['retained_source_sha256']
for directory in [qualification,controls]:
    for source in directory.iterdir():
        if source.is_file(): shutil.copy2(source,out/source.name)
for source,name in [
    ('/tmp/qualify_hyperbrep_spatial.py','qualification.py'),
    ('/tmp/recheck_hyperbrep_spatial.py','recheck.py'),
    ('/tmp/check_hyperbrep_spatial_controls.py','controls.py'),
    ('/tmp/audit_hyperbrep_spatial_migration.py','migration-audit.py'),
    ('/tmp/hyperbrep-spatial-migration-audit.json','migration-audit.json'),
    ('/tmp/collect_hyperbrep_spatial_evidence.py','collect.py'),
    ('/tmp/hyperbrep-spatial-evidence-readme.md','README.md'),
]: shutil.copy2(source,out/name)
# Keep diagnostic content, normalize only trailing empty lines.
for path in out.glob('*.log'): path.write_text(path.read_text().rstrip()+'\n')
sys.path.insert(0,str(root/'crates/hyperbrep/tools'))
import benchmark_receipt as checker
expected=checker.expected_cases((root/'crates/hyperbrep/benches/kernel.rs').read_text())
runs={name:[checker.read_receipt((out/f'{name}-{trial}.log').read_text(),expected) for trial in range(1,4)] for name in ['baseline','candidate']}
for series in runs.values():
    for receipt in series: checker.compare(runs['baseline'][0],receipt)
def distribution(values):
    return {'samples':values,'median':median(values),'min':min(values),'max':max(values)}
rows=[]
for index,case in enumerate(runs['baseline'][0]):
    row={key:value for key,value in asdict(case).items() if key not in ['elapsed_ns','per_iteration_ns']}
    for name in ['baseline','candidate']:
        row[name+'_ns']=distribution([run[index].per_iteration_ns for run in runs[name]])
    row['candidate_over_baseline_medians']=row['candidate_ns']['median']/row['baseline_ns']['median']
    rows.append(row)
executables=json.loads((out/'executables.json').read_text())
comparison={'schema_version':1,'rows':rows,'summary':{
    'rows':len(rows),
    'median_of_case_median_ratios':median([row['candidate_over_baseline_medians'] for row in rows]),
    'largest_case_median_ratio':max(rows,key=lambda row:row['candidate_over_baseline_medians']),
    'over_ten_percent':[row['name'] for row in rows if row['candidate_over_baseline_medians']>1.1],
    'executable_bytes_delta':executables['candidate']['bytes']-executables['baseline']['bytes'],
    'rss_kib':{name:distribution([json.loads((out/f'{name}-{trial}-resources.json').read_text())['max_rss_kib'] for trial in range(1,4)]) for name in ['baseline','candidate']},
    'harness':'Same fixtures/counts/checksums, direct public API migration; see migration-audit.json and kernel-harness.patch. Not byte-identical source.',
    'limitations':'Three alternating pinned process pairs are descriptive; no statistical significance, allocation-count or universal performance claim.'
}}
(out/'comparison.json').write_text(json.dumps(comparison,indent=2)+'\n')
features={}
for target in ['retained_points','retained_parameters','work_budget']:
    expected=checker.expected_cases((root/f'crates/hyperbrep/benches/{target}.rs').read_text())
    receipts=[checker.read_receipt((out/f'{target}-{trial}.log').read_text(),expected) for trial in range(1,4)]
    for receipt in receipts: checker.compare(receipts[0],receipt)
    features[target]=[]
    for index,case in enumerate(receipts[0]):
        features[target].append({'name':case.name,'iterations':case.iterations,'unit':case.unit,'checksum':case.checksum,'per_iteration_ns':distribution([receipt[index].per_iteration_ns for receipt in receipts])})
(out/'feature-cost.json').write_text(json.dumps({'schema_version':1,'targets':features,'limits':'Feature costs include the exact assertions in each source. New selected-point capabilities have no old implementation to compare. Other harnesses are receipt controls, not cross-revision timing claims. Cold carrier rows reuse a prepared root; they do not include isolation.'},indent=2)+'\n')
previous=json.loads((root/'crates/hyperbrep/docs/evidence/2026-10-15-retained-inverse-parameters/manifest.json').read_text())
sources=set(previous['source_sha256'])
sources.update(['crates/hyperbrep/src/geometry/point.rs','crates/hyperbrep/tests/retained_points.rs','crates/hyperbrep/benches/retained_points.rs'])
manifest={
    'schema_version':1,
    'date':'2026-10-15',
    'baseline_revision':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),
    'decision':'Keep for exact selected-point evaluation and composition; no optimization claim.',
    'source_review':'Curve3::point_at accepts Parameter and returns GeometricPoint3. Native coefficient calculations call the unchanged private evaluate_real implementation. Selected line/Bezier/NURBS images retain immutable source geometry and one parameter; lazy XY/XZ projections reuse Hypercurve predicates. Positive identity is an optimization; independent images and distinct visits still compare mathematically. Bounds are conservative, failures retryable, and affine transforms preserve the selector without a wrapper chain.',
    'qualification':'240 all-feature core tests, 35 integration tests and 4 doctests; 233 default core tests, 34 integration tests and 4 doctests; 12 release point regressions. Four mutants rejected. Strict all-target/all-feature Clippy, warning-denied rustdoc, WASM library build, fuzz-bin strict Clippy, both formatting checks and four release benchmark builds pass. Six kernel processes preserve all 66 receipts; nine additional processes preserve seven point, four parameter and four budget rows.',
    'setup_findings':[
        'Initial strict Clippy requested a let-chain simplification; fixed and the final complete qualification passes.',
        'After adding the selected-coordinate ambient-policy assertion, both full test configurations, release point regressions, Clippy and formatting were rerun. Production and benchmark sources did not change.',
        'A zero-budget coincidence probe used zero instrumented solver work and succeeded. It is not credited as a budget-denial regression. A real cold coordinate failure followed by explicit scalar refinement is covered by the retry regression.',
        'The migration audit initially selected the earlier Pcurve::point_at body. Its corrected full Point3-returning signature compares the intended Curve3 evaluator and passes.'
    ],
    'limits':[
        'WP02/G1 remains incomplete: selected vertices and edge domains, 3D edge split, both pcurve correspondences, selected surface/contact images and archive/reload/split composition remain open.',
        'Selected angular conic evaluation returns UnsupportedSelectedEvaluation. Derivatives and subdivision still require represented parameters; partly constant NURBS inverse images retain their existing typed blocker.',
        'Shared scopes count only existing instrumented root refinements/promotions. There is no full scalar/geometry/degree/coefficient/memory/time bound or worker budget propagation.',
        'Projection caches may duplicate cold preparation under races. Source lifetime and retry tests do not establish global memory bounds or full cache completeness.',
        'Timing/RSS samples are descriptive; no allocation-count or asymptotic-growth guarantee. The kernel harness changes only for the public API migration, as separately audited.',
        'WASM and fuzz targets compile. No WASM execution, independent geometry oracle, new fuzz/lexicase/ASan campaign, full-workspace/pre-push qualification or complete-plan claim.'
    ],
    'environment':{
        'rustc':subprocess.check_output(['rustc','--version','--verbose'],text=True).strip(),
        'cargo':subprocess.check_output(['cargo','--version'],text=True).strip(),
        'platform':platform.platform(),
        'cpu':next((line.split(':',1)[1].strip() for line in Path('/proc/cpuinfo').read_text().splitlines() if line.startswith('model name')),'unknown'),
        'benchmark_cpu_affinity':[0],
        'cargo_home':os.environ.get('CARGO_HOME'),
        'cargo_target_dir':os.environ.get('CARGO_TARGET_DIR'),
    },
    'source_sha256':{path:sha(root/path) for path in sorted(sources)},
    'artifact_sha256':{path.name:sha(path) for path in sorted(out.iterdir()) if path.is_file()},
}
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps(comparison['summary'],indent=2))
print('Feature medians (ns):')
for row in features['retained_points']: print(row['name'],row['per_iteration_ns']['median'])
