import subprocess, json, os, time, sys
from pathlib import Path
root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
record=Path(__file__).resolve().parent / 'validation-final'
record.mkdir(exist_ok=True)
env=os.environ.copy()
env['CCACHE_DIR']='/tmp/csgrs-research-ccache'
env['CCACHE_TEMPDIR']='/tmp/csgrs-research-ccache-tmp'
env['CSGRS_LIBRARY']=str(root/'target/release/libcsgrs_ffi.so')
env['WASM_BINDGEN']='/tmp/claude-1000/-home-tim-Documents-GitHub-workspace-csgrs/1dd6969b-b3fa-493b-8161-505ab6355a7e/scratchpad/wasm-bindgen-0.2.126/bin/wasm-bindgen'
checks=[('fmt', ['cargo', 'fmt', '--all', '--', '--check'], 300), ('clippy-hypercurve', ['cargo', 'clippy', '--locked', '-p', 'hypercurve', '--all-targets', '--all-features', '--', '-D', 'warnings'], 900), ('clippy-root', ['cargo', 'clippy', '--locked', '--all-targets', '--all-features', '--', '-D', 'warnings'], 900), ('subdivision-units', ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--lib', 'curve::curve_subdivision::tests', '--', '--test-threads=2'], 600), ('polynomial-continuation', ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--test', 'polynomial_curves', '--', '--test-threads=2'], 600), ('curve-consumers', ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--test', 'hypercurve_curve', '--test', 'hypercurve_curve_intersection', '--test', 'selected_point_definitions', '--test', 'point_equality_contract', '--test', 'rational_point_forms', '--test', 'point_affine_forms', '--', '--test-threads=2'], 900), ('brep-sections-archives', ['cargo', 'test', '--locked', '--release', '-p', 'hyperbrep', '--test', 'plane_tensor_sections', '--test', 'parallel_pcurve_archive', '--', '--test-threads=2'], 900), ('modeling-consumers', ['cargo', 'test', '--locked', '--release', '--no-default-features', '--features', 'curve', '--test', 'mixed_modeling_profiles', '--test', 'receipt_composition', '--test', 'construction_evidence', '--test', 'exact_linear_modeling'], 900), ('docs-hypercurve', ['env', 'RUSTDOCFLAGS=-D warnings', 'cargo', 'doc', '--locked', '-p', 'hypercurve', '--all-features', '--no-deps'], 600), ('wasm-hypercurve', ['cargo', 'check', '--locked', '-p', 'hypercurve', '--no-default-features', '--target', 'wasm32-unknown-unknown'], 600), ('repository-budget', ['bash', 'scripts/check-repository-budget.sh'], 300), ('diff-check', ['git', 'diff', '--check'], 300)]
if len(sys.argv)>1:
 checks=checks[next(i for i,(name,_,_) in enumerate(checks) if name==sys.argv[1]):]
with (record/'checks.jsonl').open('a',buffering=1) as journal:
 for name,cmd,limit in checks:
  print('START',name,flush=True)
  start=time.time()
  journal.write(json.dumps({'event':'start','name':name,'command':cmd,'utc_epoch':start,'cwd':str(root),'timeout_seconds':limit})+'\n')
  with (record/(name+'.log')).open('w') as log:
   try:
    result=subprocess.run(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=limit)
    status=result.returncode
   except subprocess.TimeoutExpired: status='timeout'
  journal.write(json.dumps({'event':'finish','name':name,'exit_code':status,'elapsed_seconds':time.time()-start})+'\n')
  print('FINISH',name,status,flush=True)
  if status!=0: raise SystemExit(1)
