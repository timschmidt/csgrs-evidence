from pathlib import Path
import hashlib, importlib.util, json, os, subprocess, time
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-endpoint-identity')
base='fa312fd849718a246e60b8a057d38d82a2e16ed9'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
qualification=json.loads((root/'capability-matrix-qualification.json').read_text())
record='docs/evidence/2026-10-26-hypercurve-capability-matrix'
staging=Path('/tmp/hypercurve-capability-matrix-evidence-archive');out=staging/record
out.mkdir(parents=True,exist_ok=False)
manifest=[]
def copy(source,relative):
 data=source.read_bytes();dest=out/relative;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(data)
 manifest.append({'path':str(relative),'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()})
for source in sorted(root.glob('capability-matrix-*')):
 if source.is_file() and source.suffix in ['.json','.patch','.log']:copy(source,Path('commands')/source.name)
for label,key in [('first','first_report'),('workflow','workflow_report')]:
 run=Path(qualification[key]).parent;report=json.loads((run/'report.json').read_text())
 assert report['status']=='witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures'])==18
 for source in sorted(run.rglob('*')):
  if source.is_file():copy(source,Path('runs')/label/source.relative_to(run))
copy(Path(__file__),Path('commands')/Path(__file__).name)
(out/'source.json').write_text(json.dumps({'base':base,'recorded_epoch':time.time(),'owner':'Hypercurve M0 qualification tooling','properties':['P12','P15','P17','P18','P19','P20','P35','P37','P39'],'qualification':qualification,'patch':'commands/capability-matrix-implementation.patch','scope':'Initial18named public-fixture catalog and16harness regression tests; no Rust kernel or geometry fixture changes. Successful blocker assertions remain gaps. Empty stage lists mean unqualified.','limitations':['The complete M0 matrix and broad algebraic closure remain open.','The source snapshots and actual logs qualify only their recorded revision/patch and named assertions.','One test process per fixture does not establish fresh-process generated archive replay.','Harness timeout/interruption cleanup is not kernel cancellation or typed resource exhaustion.','Zizmor mandatory command passed with no findings in default offline mode; online-only audits unavailable without a token.','Hosted artifact upload was inspected, not executed. Full repository pre-push matrix for this source remains pending.','Concurrent timings are qualification data, not a performance comparison.']},indent=2)+'\n')
(out/'retained-files.json').write_text(json.dumps(manifest,indent=2)+'\n')
repo=Path('/tmp/csgrs-closure-evidence.git');branch='refs/heads/hypercurve-capability-matrix-evidence-2026-10-26';parent='b98f70fa0673c4fd165bd118a68d8ee1d9313097'
assert subprocess.check_output(['git','--git-dir='+str(repo),'rev-parse','refs/heads/hypercurve-native-pair-evidence-2026-10-26'],text=True).strip()==parent
assert subprocess.run(['git','--git-dir='+str(repo),'show-ref','--verify','--quiet',branch]).returncode==1
env={**os.environ,'GIT_INDEX_FILE':'/tmp/hypercurve-capability-matrix-evidence.index'};cmd=['git','--git-dir='+str(repo),'--work-tree='+str(staging)]
subprocess.run(cmd+['read-tree',parent],env=env,check=True);subprocess.run(cmd+['add','--',record],env=env,check=True)
tree=subprocess.check_output(cmd+['write-tree'],env=env,text=True).strip();commit=subprocess.check_output(cmd+['commit-tree',tree,'-p',parent,'-m','Record executable Hypercurve capability matrix qualification'],env=env,text=True).strip();subprocess.run(cmd+['update-ref',branch,commit,'0'*40],check=True)
spec=importlib.util.spec_from_file_location('evidence_archive',checkout/'scripts/evidence_archive.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);module.ROOTS={record:False};rows=module.manifest(str(repo),commit);assert len(rows)==2
result={'commit':commit,'parent':parent,'branch':branch,'record':record,'manifest_row':rows[1]};(root/'capability-matrix-evidence-archive.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
