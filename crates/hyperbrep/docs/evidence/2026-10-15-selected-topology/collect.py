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

root = Path('/mnt/development/csgrs')
qualification = Path('/tmp/hyperbrep-selected-topology-final-qualification')
prototype = Path('/tmp/hyperbrep-selected-topology-qualification')
controls = Path('/tmp/hyperbrep-selected-topology-controls')
out = root/'crates/hyperbrep/docs/evidence/2026-10-15-selected-topology'
commands = json.loads((qualification/'commands.json').read_text())
assert len(commands) == 34 and all(command['exit_code'] == 0 for command in commands)
negative = json.loads((controls/'controls.json').read_text())
assert len(negative) == 4 and all(control['exit_code'] == 101 for control in negative)
def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()
for control in negative:
    assert sha(root/control['source']) == control['retained_source_sha256']
out.mkdir(exist_ok=False)
for directory in [qualification, controls]:
    for source in directory.iterdir():
        if source.is_file():
            shutil.copy2(source, out/source.name)
for source, name in [
    ('/tmp/qualify_hyperbrep_selected_topology_final.py','qualification.py'),
    ('/tmp/resume_hyperbrep_selected_topology.py','resume.py'),
    ('/tmp/recheck_hyperbrep_selected_topology.py','recheck.py'),
    ('/tmp/check_hyperbrep_selected_topology_controls.py','controls.py'),
    ('/tmp/collect_hyperbrep_selected_topology.py','collect.py'),
]:
    shutil.copy2(source, out/name)
initial = out/'prototype'
initial.mkdir()
for pattern in ['baseline-*.log','candidate-*.log','baseline-*-resources.json','candidate-*-resources.json','executables.json','native-replay-from-final.patch','native-source-sha256.json']:
    for source in prototype.glob(pattern):
        shutil.copy2(source, initial/source.name)
for path in out.rglob('*.log'):
    path.write_text(path.read_text().rstrip()+'\n')
sys.path.insert(0, str(root/'crates/hyperbrep/tools'))
import benchmark_receipt as checker
expected = checker.expected_cases((root/'crates/hyperbrep/benches/kernel.rs').read_text())
assert len(expected) == 66
def distribution(values):
    return {'samples':values, 'median':median(values), 'min':min(values), 'max':max(values)}
def compare(directory):
    runs = {name:[checker.read_receipt((directory/f'{name}-{trial}.log').read_text(), expected) for trial in range(1,4)] for name in ['baseline','candidate']}
    for series in runs.values():
        for receipt in series:
            checker.compare(runs['baseline'][0], receipt)
    rows = []
    for index, case in enumerate(runs['baseline'][0]):
        row = {key:value for key,value in asdict(case).items() if key not in ['elapsed_ns','per_iteration_ns']}
        for name in runs:
            row[name+'_ns'] = distribution([run[index].per_iteration_ns for run in runs[name]])
        row['candidate_over_baseline_medians'] = row['candidate_ns']['median']/row['baseline_ns']['median']
        rows.append(row)
    executables = json.loads((directory/'executables.json').read_text())
    summary = {
        'rows':len(rows),
        'median_of_case_median_ratios':median([row['candidate_over_baseline_medians'] for row in rows]),
        'largest_case_median_ratio':max(rows,key=lambda row:row['candidate_over_baseline_medians']),
        'over_ten_percent':[row['name'] for row in rows if row['candidate_over_baseline_medians']>1.1],
        'executable_bytes_delta':executables['candidate']['bytes']-executables['baseline']['bytes'],
        'rss_kib':{name:distribution([json.loads((directory/f'{name}-{trial}-resources.json').read_text())['max_rss_kib'] for trial in range(1,4)]) for name in runs},
    }
    record = {'schema_version':1,'rows':rows,'summary':summary,'limits':'Three alternating process pairs on CPU 0; descriptive samples, not allocation counts, statistical significance or universal bounds. Fixtures, counts and checksums agree; direct public API migration is recorded in kernel-harness.patch.'}
    (directory/'comparison.json').write_text(json.dumps(record,indent=2)+'\n')
    return summary
summary = compare(out)
initial_summary = compare(initial)
assert not summary['over_ten_percent']
features = {}
for target in ['retained_points','retained_parameters','work_budget','selected_topology']:
    labels = checker.expected_cases((root/f'crates/hyperbrep/benches/{target}.rs').read_text())
    receipts = [checker.read_receipt((out/f'{target}-{trial}.log').read_text(),labels) for trial in range(1,4)]
    for receipt in receipts:
        checker.compare(receipts[0],receipt)
    features[target] = [{'name':case.name,'iterations':case.iterations,'unit':case.unit,'checksum':case.checksum,'per_iteration_ns':distribution([receipt[index].per_iteration_ns for receipt in receipts])} for index,case in enumerate(receipts[0])]
(out/'feature-cost.json').write_text(json.dumps({'schema_version':1,'targets':features,'limits':'New topology rows include exact assertions, mappings, classification and volume checks. Root isolation and source construction are outside timing. The 16-split case is a fixed-size workload, not an asymptotic growth proof. Existing point/parameter/budget rows are receipt controls.'},indent=2)+'\n')
ratio = summary['median_of_case_median_ratios']
largest = summary['largest_case_median_ratio']['candidate_over_baseline_medians']
delta = summary['executable_bytes_delta']
rss = summary['rss_kib']
costs = [row['per_iteration_ns']['median']/1000 for row in features['selected_topology']]
readme = f'''# Selected topology qualification — 2026-10-15

Baseline: `6f18d5152` on `brep`. This extends WP02; **WP02/G1 remains open**.
The [manifest](manifest.json) binds commands, source hashes, controls and
executable identities. No whole-plan completion is claimed.

## Implemented contract

Vertices retain `GeometricPoint3`; canonical edge trims use `ParameterRange`
with increasing `Parameter` endpoints. Authored carrier coefficients and knot
domains remain `Real`. Edge splitting retains one spatial source, partitions
every incident use and transports each selected cut through its affine pcurve
relation. Selected restrictions keep their source chart; native scalar pieces
use the existing scalar remapping formula. Native coefficient consumers now
request stored views explicitly and fail typed when unavailable.

Exact subdivision inherits the validated source boundary's image, simplicity,
orientation, nesting and solid proofs. Builder publication still checks
connectivity, ownership and actual affine endpoint mappings. Arbitrary
replacements invalidate inherited certificates. Bounds include retained-point
enclosures. Transforms share the transformed arena source when available;
the lookup allocates only when a selected vertex needs it.

Hypercurve's new `Curve2::parameter_endpoints` exposes traversal order without
evaluating points. Its increasing source interval need not have the same order
as traversal. This distinction was required by a failing reflection regression.
Pcurve reflection delegates retained/rational geometry to Hypercurve's exact
similarity and reversal operations. Native line/circle paths stay direct.

## Correctness and limits

[Final all-feature tests](final-tests.log) pass 240 core tests, 45 integration
tests and four doctests. [Default tests](final-default-tests.log) pass 233 core,
44 integration and four doctests; these totals overlap. All ten new topology
tests pass in [release mode](final-release-regressions.log). Cases include:

- a nonmaterializable quintic cut shared by two incident uses and one vertex;
- exact endpoint mapping, endpoint image agreement and inverse mapping;
- repeated subdivision, repeated-endpoint rejection and retained source models;
- rational Bézier and NURBS profile sheets with authored non-unit knot charts;
- shear, scale, reflection/inverse and another split after reflection;
- native and selected rational pcurves on a curved planar boundary;
- cuboid/cylinder classification and volume from retained solid certificates;
- builder endpoint rejection, invalid affine coefficients and proof invalidation;
- no-op edits, explicit selected archive rejection and unsupported conic angles.

Four [negative controls](controls.json) fail their focused tests: wrong spatial
vertex, forced scalar cut, ignored directed source chart and trusted affine
endpoints. [The runner](controls.py) restores source bytes after each mutation
and requires a runtime test failure, not a compiler failure. The last mutant
restores the old endpoint shortcut and admits a wrong affine map; the retained
implementation validates the actual coefficients.

Strict [Clippy](final-clippy.log), warning-denied [rustdoc](docs.log),
[WASM library compilation](wasm.log), [fuzz-bin Clippy](fuzz-clippy.log), workspace
and fuzz formatting, and all five benchmark builds pass. [Commands](commands.json)
record all 34 successful checks/processes. A [Clippy setup finding](setup-failure.json)
requested removal of a redundant `Ok(...?)`; it was fixed before resuming.
Both test configurations, release regressions, Clippy and formatting were run
again after restoring the controls and adding the final curved-pcurve case.
Production and benchmark source did not change after the final timed runs.

The format-8 archive cannot yet encode selected roots, spatial images and
restricted pcurve graphs. It fails explicitly; it never writes a rounded
substitute. Selected angular conics, arbitrary selected surface/contact
validation, general Boolean transfer and reload/split/classify composition
remain open. No complete resource-accounting, asymptotic-growth, external-oracle,
new fuzz/ASan/lexicase campaign, WASM-execution or full-workspace/pre-push claim
follows from this increment.

## Measured cost and rejected prototype

All 66 kernel receipts agree in three alternating process pairs pinned to CPU 0.
The median of case median ratios is **{ratio:.6f}**; the largest is **{largest:.6f}**,
within the 10% cohort budget. The executable grows **{delta:,} bytes** and median
peak process RSS changes from **{rss['baseline']['median']:,} to {rss['candidate']['median']:,} KiB**.
[Comparison data](comparison.json) retains every row and sample. These are
descriptive measurements, not allocation counts or statistical guarantees.
The [kernel harness patch](kernel-harness.patch) contains direct API caller
migration; fixture labels, iterations, assertions and checksums are preserved.

The [first prototype](prototype/comparison.json) exceeded the budget in three
editing cohorts (largest ratio {initial_summary['largest_case_median_ratio']['candidate_over_baseline_medians']:.6f}).
Routing stored scalars through root-map preparation and comparing old maps
before recomputing native split coefficients was rejected. The final native
path evaluates the original scalar formulas directly; selected chart transport
still reuses Hypercurve. The prototype's [native replay patch](prototype/native-replay-from-final.patch)
recovers both original library file hashes and preserves all other native
library/kernel sources listed in its [source record](prototype/native-source-sha256.json).
Use it only in an isolated checkout. Prototype feature benchmarks are not
credited; this comparison concerns the existing 66-case kernel harness.

The four new topology rows run 200 iterations with exact assertions. Three-run
median costs, with prepared roots/source models outside timing, are:

| Scenario | Median per iteration |
| --- | ---: |
| Authored shared-edge split and query/mapping checks | {costs[0]:.3f} µs |
| Selected shared-edge split and query/mapping checks | {costs[1]:.3f} µs |
| Selected model followed by sixteen exact splits and checks | {costs[2]:.3f} µs |
| Selected reflection/inverse pair and checks | {costs[3]:.3f} µs |

All point, parameter and budget control receipts also agree in three processes.
See [feature costs](feature-cost.json). No previous selected topology
implementation supplies a speedup baseline.

## Replay

[Qualification](qualification.py), [resume](resume.py), [final recheck](recheck.py),
[controls](controls.py) and [collection](collect.py) retain the executed commands.
Fresh qualification accepts current source; the resume script records the
actual local recovery after the style-only Clippy finding. Existing `/tmp`
destinations intentionally reject reuse; choose fresh paths for a new run.
The baseline executable hash is checked before measurement. The small `wait4`
resource launcher is retained with the earlier ownership evidence.
'''
(out/'README.md').write_text(readme)
performance = root/'crates/hyperbrep/PERFORMANCE.md'
section = f'''## Selected topology — 2026-10-15

Kept for exact selected vertices, trims, shared-edge subdivision and pcurve
composition. The [qualification](docs/evidence/2026-10-15-selected-topology/README.md)
records ten public regressions, four rejected mutants and all native/WASM-build
checks. The first native-mapping prototype exceeded the default budget in
three editing cohorts and was replaced with direct stored-scalar formulas.
Selected charts continue to use Hypercurve's existing algebraic authority.

All 66 existing receipts agree across three alternating process pairs. The
median of case median ratios is **{ratio:.6f}**, with a maximum of **{largest:.6f}**;
all cohorts stay within 10%. Binary size grows **{delta:,} bytes**; median process
peak RSS is **{rss['baseline']['median']:,} → {rss['candidate']['median']:,} KiB**. The
[comparison](docs/evidence/2026-10-15-selected-topology/comparison.json) and
[rejected prototype](docs/evidence/2026-10-15-selected-topology/prototype/comparison.json)
retain every sample. No allocation-count or statistical significance is claimed.

The new four-row topology harness measures native/selected splits, sixteen
composed splits and reflection/inverse with exact checks. Prepared roots and
source construction are outside timing. Median costs are {costs[0]:.3f},
{costs[1]:.3f}, {costs[2]:.3f} and {costs[3]:.3f} µs respectively; these are
feature costs, not speedups. Selected archive graphs, complete work bounds,
large-chain growth and external comparisons remain open.

'''
text = performance.read_text()
assert '## Selected topology —' not in text
performance.write_text(text.replace('## Retained spatial points — 2026-10-15', section+'## Retained spatial points — 2026-10-15',1))
ledger_path = root/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
ledger = json.loads(ledger_path.read_text())
ledger['increments'].append({
    'id':'selected-topology',
    'work_packages':['WP01','WP02'],
    'properties':['P1','P3','P6','P15','P17','P18','P19','P20','P24','P27','P36','P37','P39'],
    'change':'Store retained geometric vertices and selected edge trim ranges. Split all incident pcurves with exact affine chart transport, inherit subdivision proofs and validate actual endpoint mappings. Preserve source sharing and traversal through transforms; add Hypercurve directed parameter endpoints and typed scalar-view blockers. Directly migrate callers without compatibility APIs.',
    'source':'../src/topology/edit/edge.rs',
    'evidence':'evidence/2026-10-15-selected-topology/manifest.json',
    'validation':'240 all-feature core tests, 45 integration tests and four doctests; 233 default core tests, 44 integration tests and four doctests; ten release topology regressions; four rejected mutants. Strict Clippy, warning-denied rustdoc, WASM compilation, fuzz-bin Clippy and formatting pass. Five benchmark builds, 66 matched native receipts and all 19 feature/control rows pass in three runs.',
    'cost_evidence':f'Final median of case median ratios {ratio:.6f}, largest {largest:.6f}; all within 10%. Binary +{delta} bytes; median peak RSS {rss["baseline"]["median"]} to {rss["candidate"]["median"]} KiB. First prototype exceeded 10% in three editing cohorts and was replaced with direct native scalar mapping. Measurements are descriptive; no allocation or asymptotic-growth claim.',
    'limits':'WP02/G1 remains open: selected graph persistence, untrusted replay/recertification, general surface/contact images and Boolean transfer are unfinished. Angular conics and native coefficient algorithms retain typed materialization boundaries. No full resource budget, external oracle, new fuzz/ASan/lexicase campaign, WASM execution or full-workspace/pre-push qualification.'
})
ledger['next_actions'][1] = 'Complete WP02/G1 beyond retained parameters, spatial points and selected topology splits: persist selected source/root/chart graphs, validate untrusted evidence on load, and compose reload/split/classification without requiring Real materialization. Add general surface/contact images and extend selected Boolean transfer while preserving all existing exact behavior.'
ledger_path.write_text(json.dumps(ledger,indent=2)+'\n')
property_path = root/'docs/properties-status.json'
properties = json.loads(property_path.read_text())
properties['current_work']['hyperbrep']['latest_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-15-selected-topology/manifest.json'
property_path.write_text(json.dumps(properties,indent=2)+'\n')
previous = json.loads((root/'crates/hyperbrep/docs/evidence/2026-10-15-retained-spatial-points/manifest.json').read_text())
sources = set(previous['source_sha256'])
sources.update(['crates/hyperbrep/tests/selected_topology.rs','crates/hyperbrep/benches/selected_topology.rs','crates/hypercurve/src/curve.rs'])
sources.update(subprocess.check_output(['git','diff','--name-only'],cwd=root,text=True).splitlines())
for path in (root/'crates/hyperbrep/src').rglob('*.rs'):
    sources.add(str(path.relative_to(root)))
manifest = {
    'schema_version':1,'date':'2026-10-15',
    'baseline_revision':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),
    'decision':'Keep the exact selected topology extension with direct native scalar paths. Reject the first native-map overhead prototype. All work-package gates remain open.',
    'qualification':'See README.md and commands.json for final counts, 34 successful command/process records, four rejected controls, scoped limitations and prototype costs.',
    'limits':['Selected graph persistence and general recertification remain open; G1 is not complete.','Instrumented work budgets are partial.','No new ASan/fuzz/lexicase campaign, external oracle, WASM execution or full-workspace/pre-push qualification.','Timing and RSS samples are descriptive, not allocation counts, statistical significance or global growth bounds.'],
    'environment':{'rustc':subprocess.check_output(['rustc','--version'],text=True).strip(),'cargo':subprocess.check_output(['cargo','--version'],text=True).strip(),'platform':platform.platform(),'cpu':next((line.split(':',1)[1].strip() for line in Path('/proc/cpuinfo').read_text().splitlines() if line.startswith('model name')),'unknown'),'benchmark_cpu_affinity':[0],'cargo_home':os.environ.get('CARGO_HOME'),'cargo_target_dir':os.environ.get('CARGO_TARGET_DIR')},
    'source_sha256':{path:sha(root/path) for path in sorted(sources)},
    'artifact_sha256':{str(path.relative_to(out)):sha(path) for path in sorted(out.rglob('*')) if path.is_file()},
}
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps(summary,indent=2))
print('Evidence collected; source files:',len(sources),'artifacts:',len(manifest['artifact_sha256']))
