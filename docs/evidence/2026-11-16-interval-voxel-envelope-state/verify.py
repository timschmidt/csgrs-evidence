from pathlib import Path
import subprocess,json,hashlib,re,time
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root'])
restored=json.loads((s/'restoration.json').read_text());assert restored['head']=='17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f' and not restored['status'] and restored['all_current_binary_hashes_reproduced']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==restored['head'];assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
comparison=json.loads((s/'final-comparison.json').read_text());assert not comparison['all_incremental_cumulative_caps_pass'];assert {x['target'] for x in comparison['failed_targets']}=={'native'}
assert all(x['exit_code']==0 for x in json.loads((s/'expanded-runs.json').read_text()))
assert not (s/'pinned-builds.json').exists() and not (s/'pinned-runs.json').exists()
for label in ['fixed','current','validated','inplace','restored']:
 rows=json.loads((s/f'final-{label}.json').read_text());assert len(rows)==3 and all(x['exit_code']==x['runtime_exit_code']==0 for x in rows)
 for row in rows:assert hashlib.sha256(Path(row['size']['path']).read_bytes()).hexdigest()==row['size']['sha256']
owner=['owner-1.95.0','owner-stable','clippy-1.95.0','clippy-stable','downstream-1.95.0','downstream-clippy-1.95.0','docs-1.95.0','wasm-1.95.0','fmt-1.95.0','inplace-tests']
for name in owner:assert json.loads((s/(name+'.json')).read_text())['exit_code']==0
ledger=Path('/mnt/development/csgrs/docs/research/interval-size-accounts.json');assert len(json.loads(ledger.read_text())['accounts'])==54
assert subprocess.check_output(['git','show','fae2610e6:'+str(ledger.relative_to('/mnt/development/csgrs'))],cwd='/mnt/development/csgrs')==ledger.read_bytes()
assert all(x['exit_code']==0 for x in restored['checks'])
ci=Path('/tmp/interval-refactor/coordinated-ci');assert not (ci/'quiet-workflow-executed-plan.json').exists();plan=json.loads((ci/'quiet-workflow-plan.json').read_text());assert len(plan['commands'])==22 and not any(x['id']=='hypervoxel.envelope-admission.owner' for x in plan['commands'])
(s/'verification.json').write_text(json.dumps({'time':time.time(),'status':'rejected, restored, ready to archive','restored_final_artifacts':3,'total_final_artifacts':15,'wasm_calls':80,'all_artifact_hashes_verified':True,'expanded_processes':594,'screen_processes':162,'restored_tests':12,'candidate_checks':owner,'size_accounts':54,'size_accounts_sha256':hashlib.sha256(ledger.read_bytes()).hexdigest(),'quiet_commands':22,'pinned_resource_work_not_executed':True,'no_timing':True},indent=2)+'\n')
progress=json.loads((s/'progress.json').read_text());progress.update(restoration=restored,final_artifact_controls=15,verification='verification.json',status='rejected and restored; final native absolute caps fail',frozen=True);(s/'progress.json').write_text(json.dumps(progress,indent=2)+'\n')
(s/'build-barrier').mkdir(exist_ok=True);(s/'build-barrier/result.json').write_text(json.dumps({'terminal':True,'time':time.time(),'reason':'Rejected on final linked native absolute code caps. All builds terminal; restored checks and3byte-identical artifacts pass. Timing withdrawn; no pending builds in this stage.'},indent=2)+'\n')
print('All record, source, restoration, and artifact checks pass; build barrier released.')
