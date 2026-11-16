from pathlib import Path
import subprocess,json,os,re,time,hashlib
s=Path(__file__).parent;r=Path(json.loads((s/'initial-state.json').read_text())['root']);root=Path('/mnt/development/csgrs')
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()=='17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f'
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
source=r/'crates/hyperinterval/src/dyadic.rs';assert source.read_bytes()==(root/'crates/hyperinterval/src/dyadic.rs').read_bytes()
assert json.loads((s/'restored-artifact-verification.json').read_text())['all21byte_identical_to_current_baseline']
checks={}
for name in ['baseline-focused','candidate-focused','candidate-owner','candidate-clippy','candidate-minimal','candidate-fmt','candidate-lattice','candidate-solver','candidate-lattice-clippy','candidate-wasm','candidate-msrv-dyadic','candidate-msrv-clippy','candidate-stable-owner','candidate-stable-clippy','restored-owner','restored-clippy','restored-fmt']:
 v=json.loads((s/(name+'.json')).read_text());assert v['exit_code']==0
 text=(s/(name+'.log')).read_text();results=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',text)
 checks[name]=v|{'passing_reports':sum(int(x[0]) for x in results),'result_summaries':len(results)}
accounts=root/'docs/research/interval-size-accounts.json';original=subprocess.check_output(['git','show','17522b4eb:docs/research/interval-size-accounts.json'],cwd=root);assert accounts.read_bytes()==original
q=Path('/tmp/interval-refactor/coordinated-ci/quiet-workflow-plan.json');plan=json.loads(q.read_text());assert len(plan['commands'])==23 and all('dyadic-quotient' not in x['id'] for x in plan['commands'])
assert not (s/'owner-timing').exists()
(s/'environment.json').write_text(json.dumps({'toolchains':{tc:subprocess.check_output(['rustc','+'+tc,'-vV'],text=True) for tc in ['1.95.0','1.88.0','stable']},'compiler':subprocess.check_output(['cc','--version'],text=True),'environment':{k:os.environ.get(k) for k in ['RUSTFLAGS','CARGO_ENCODED_RUSTFLAGS','CARGO_INCREMENTAL','CARGO_PROFILE_RELEASE_LTO','CARGO_PROFILE_RELEASE_CODEGEN_UNITS','RUSTUP_TOOLCHAIN']},'explicit_build_overrides':'Per-command records contain target paths, six Cargo jobs, offline resolution and exact argument vectors. Probe release uses opt-level3, thin LTO and one codegen unit; owner release uses unchanged repository profile.'},indent=2)+'\n')
result={'disposition':'rejected: external-lock completed-workload stack maxima grow16bytes in12cases','candidate':json.loads((s/'candidate-source.json').read_text())['head'],'restored_head':'17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f','restored_status':'','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'checks':checks,'resource_processes':1656,'paired_serialization_work_rows':5520,'paired_trace_records':2208,'paired_allocation_records':2208,'paired_stack_observations':1104,'restored_final_artifacts':21,'fixed_current_artifact_controls_byte_identical':21,'accounts_unchanged':54,'timing_commands_queued':0,'timing_samples':0,'existing_quiet_commands':23,'limitations':'No performance claim, full size admission, release/platform/HIL qualification or phase completion. Draft timing script never run. Original initial-harness build errors preserved. All production code restored.'}
(s/'verification.json').write_text(json.dumps(result,indent=2)+'\n')
(s/'build-barrier/result.json').write_text(json.dumps({'terminal':True,'exit_code':0,'time':time.time(),'head':result['restored_head'],'status':'','scope':'All quotient candidate and restoration builds/checks terminal. Releases scheduling exclusion only; candidate rejected, no timing command added.'},indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='checks'},indent=2))
