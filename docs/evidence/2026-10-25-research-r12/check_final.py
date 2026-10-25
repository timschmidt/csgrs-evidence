from pathlib import Path
import hashlib,json,os,signal,subprocess,time,sys
root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
p=Path(__file__).resolve().parent;out=p/('final-checks-'+str(time.time_ns()));out.mkdir()
env=dict(os.environ,PROPTEST_RNG_SEED='20261025')
env['WASM_BINDGEN']='/tmp/claude-1000/-home-tim-Documents-GitHub-workspace-csgrs/1dd6969b-b3fa-493b-8161-505ab6355a7e/scratchpad/wasm-bindgen-0.2.126/bin/wasm-bindgen'
checks=[
 ('fmt',['cargo','fmt','--all','--','--check'],300),
 ('clippy',['cargo','clippy','--locked','-p','csgrs','-p','hypercurve','-p','hyperbrep','-p','hypercircuit','--all-features','--all-targets','--','-D','warnings'],900),
 ('tangent-units',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--lib','tangent','--','--test-threads=2'],1200),
 ('opposition-units',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--lib','opposition','--','--test-threads=2'],300),
 ('curve-workflows',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','tangent_relations','--test','hypercurve_curve_region_stroke','--test','hypercurve_offset','--test','hypercurve_analytic_parallel_region','--test','hypercurve_open_path_compositions','--test','hypercurve_exact_closure','--test','hypercurve_composed_workloads','--test','hypercurve_curve_region_boolean','--test','work_budget','--','--test-threads=2'],1500),
 ('modeling',['cargo','test','--locked','--release','-p','csgrs','--all-features','--test','downstream_profiles','--test','receipt_composition','--test','enclosure_workflows','--test','mixed_modeling_profiles','--','--test-threads=2'],900),
 ('modeling-continuation',['cargo','test','--locked','--release','-p','csgrs','--all-features','--test','receipt_composition','--test','enclosure_workflows','--test','mixed_modeling_profiles','--','--test-threads=2'],900),
 ('brep',['cargo','test','--locked','--release','-p','hyperbrep','--all-features','--test','parallel_profile_extrusion','--test','parallel_pcurve_archive','--test','selected_profiles','--','--test-threads=2'],900),
 ('pcb',['cargo','test','--locked','--release','-p','hypercircuit','--all-features','--test','curved_routing','--test','curved_outline','--test','board_boundary_receipts','--','--test-threads=2'],900),
 ('docs',['cargo','doc','--locked','--no-deps','-p','hypercurve','--all-features'],600),
 ('wasm-bindings',['bash','scripts/test-wasm-bindings.sh'],900),
 ('repository-budget',['bash','scripts/check-repository-budget.sh'],300),
 ('diff',['git','diff','--check'],300),
]
if len(sys.argv)>1:checks=checks[next(i for i,c in enumerate(checks) if c[0]==sys.argv[1]):]
patch=subprocess.check_output(['git','diff','--binary'],cwd=root);(out/'source.patch').write_bytes(patch)
test=root/'crates/hypercurve/tests/tangent_relations.rs';(out/'tangent_relations.rs').write_bytes(test.read_bytes())
(out/'source.json').write_text(json.dumps({'source_head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),'source_patch_sha256':hashlib.sha256(patch).hexdigest(),'test_sha256':hashlib.sha256(test.read_bytes()).hexdigest(),'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'seed':env['PROPTEST_RNG_SEED']},indent=2)+'\n')
print('RECORD',out,flush=True)
with (out/'commands.jsonl').open('w',buffering=1) as journal:
 for name,cmd,limit in checks:
  step_env=env.copy()
  if name=='docs':step_env['RUSTDOCFLAGS']='-D warnings'
  start=time.time();journal.write(json.dumps({'event':'start','name':name,'command':cmd,'timeout_seconds':limit,'epoch':start})+'\n');print('START',name,flush=True)
  with (out/(name+'.log')).open('w') as log:
   proc=subprocess.Popen(cmd,cwd=root,env=step_env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
   try:code=proc.wait(timeout=limit)
   except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='timeout'
  journal.write(json.dumps({'event':'finish','name':name,'code':code,'seconds':time.time()-start})+'\n');print('FINISH',name,code,flush=True)
  if code!=0:raise SystemExit(1)
