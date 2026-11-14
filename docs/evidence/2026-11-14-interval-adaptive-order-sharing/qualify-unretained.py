from pathlib import Path
import subprocess,json,re,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-order-sharing')
assert (s/'finish-driver.exit').read_text().strip()=='0'
assert (s/'typed-controlled-driver.exit').read_text().strip()=='0'
source=json.loads((s/'TYPED-CANDIDATE.json').read_text());assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip()==source['commit'];assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
patch=subprocess.check_output(['git','diff',source['base'],'HEAD','--'],cwd=r);assert patch==(s/'typed-candidate.patch').read_bytes()
assert json.loads((s/'typed-default-artifact-comparison.json').read_text())['identical']
assert json.loads((s/'default-artifact-comparison.json').read_text())['full_proofs_work_and_dispatch_identical']
assert (s/'typed-format.exit').read_text().strip()=='0'
commands=json.loads((s/'unretained-validation.json').read_text());assert len(commands)==7 and all(x['returncode']==0 for x in commands)
counts=list(map(int,re.findall(r'test result: ok\. (\d+) passed;', (s/'typed-owner-tests.log').read_text())));assert sum(counts)==150 and len(counts)==19
analysis=json.loads((s/'typed-controlled-timing-analysis.json').read_text());assert len(analysis['criterion_rows'])==35 and len(analysis['manual_rows'])==4
assert len(json.loads((s/'typed-controlled-timing-commands.json').read_text()))==28
adverse=[{'name':x['name'],'ratio':x['candidate_mean_ratio']} for x in analysis['criterion_rows'] if x['candidate_adverse_separation']];assert adverse
sizes=json.loads((s/'typed-binary-comparison.json').read_text());growth=[{'name':x['name'],'bytes':x['raw_growth']} for x in sizes if x['raw_growth']>0];assert growth
shared=json.loads((s/'timing-summary.json').read_text());assert len(shared)==6 and all(x['samples']==30 for x in shared.values())
alloc=re.findall(r'^(\w+)/(\w+) graph=(\d+) native=(\d+) allocations=(\d+) requested_bytes=(\d+) peak_requested_live=(\d+) output_requested_live=(\d+)$',(s/'cost-probe.log').read_text(),re.M);assert len(alloc)==6
costs=[dict(case=x[0],mode=x[1],**dict(zip(['graph','native','allocations','requested_bytes','peak_requested_live','output_requested_live'],map(int,x[2:])))) for x in alloc];(s/'cost-summary.json').write_text(json.dumps(costs,indent=2)+'\n')
source['status']='unretained: existing-path timing and raw binary-size gates not satisfied';(s/'TYPED-CANDIDATE.json').write_text(json.dumps(source,indent=2)+'\n')
result=dict(retained=False,source_commit=source['commit'],base=source['base'],default_artifacts_identical=True,default_artifact_sha256=json.loads((s/'typed-default-artifact-comparison.json').read_text())['sha256'],owner_tests=150,suite_count=19,strict_clippy=True,format=True,actual_example=True,criterion_default_rows=35,controlled_sweeps=4,observational_adverse_rows=adverse,raw_size_growth=growth,shared_rows=6,shared_samples_per_row=30,allocation_probe_rows=6,qualification_scope='Rust1.95.0 diagnostic validation only; not admission',not_executed=['stable requalification','archive-only consumer/replay','full downstream validation','WASM','fuzz','coverage','full pre-push checks'],production_integrated=False,goal_complete=False,push_or_publication=False)
(s/'QUALIFICATION.json').write_text(json.dumps(result,indent=2)+'\n')
(s/'CHECKPOINT.json').write_text(json.dumps(dict(status='unretained experiment complete; archive only',active_validation_processes=0,source_commit=source['commit'],goal_complete=False),indent=2)+'\n')
print(json.dumps(result,indent=2))
