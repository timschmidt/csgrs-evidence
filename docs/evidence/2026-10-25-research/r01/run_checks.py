import subprocess, json, os, time, sys
from pathlib import Path
root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
record=Path(__file__).resolve().parent
env=os.environ.copy()
env['CSGRS_LIBRARY']=str(root/'target/release/libcsgrs_ffi.so')
env['WASM_BINDGEN']='/tmp/claude-1000/-home-tim-Documents-GitHub-workspace-csgrs/1dd6969b-b3fa-493b-8161-505ab6355a7e/scratchpad/wasm-bindgen-0.2.126/bin/wasm-bindgen'
checks=[
('fmt',['cargo','fmt','--all','--','--check'],300),
('clippy-all',['cargo','clippy','--locked','--all-targets','--all-features','--','-D','warnings'],600),
('native-unit',['cargo','test','--locked','--release','--no-default-features','--features','curve','--lib','curve::native::tests'],600),
('affected-tests',['cargo','test','--locked','--release','--no-default-features','--features','curve','--test','exact_profile_sweeps','--test','adapter_curve_failures','--test','empty_composition','--test','receipt_composition','--test','construction_evidence','--test','exact_linear_modeling','--test','sweep_frames'],1200),
('revolved-continuation',['cargo','test','--locked','--release','--no-default-features','--features','curve,stl-io,obj-io','--test','successive_operations','revolved_ring_accepts_a_cut_in_the_previous_cut_plane','--','--exact'],600),
('ffi-tests',['cargo','test','--locked','--release','-p','csgrs-ffi'],1200),
('ffi-build',['cargo','build','--locked','--release','-p','csgrs-ffi'],1200),
('ffi-python',['python3','tests/ffi/curve_operation_failures.py'],300),
('ffi-c-build',['cc','-std=c11','-Wall','-Wextra','-Werror','-I','crates/csgrs-ffi/include','tests/ffi/curve_operation_failures.c','-L','target/release','-lcsgrs_ffi','-Wl,-rpath,'+str(root/'target/release'),'-o',str(record/'curve-failures-c')],300),
('ffi-c',[str(record/'curve-failures-c')],300),
('ffi-cpp-build',['c++','-std=c++17','-Wall','-Wextra','-Werror','-I','crates/csgrs-ffi/include','-I','bindings/cpp','tests/ffi/curve_operation_failures.cpp','-L','target/release','-lcsgrs_ffi','-Wl,-rpath,'+str(root/'target/release'),'-o',str(record/'curve-failures-cpp')],300),
('ffi-cpp',[str(record/'curve-failures-cpp')],300),
('docs',['env','RUSTDOCFLAGS=-D warnings','cargo','doc','--locked','--no-default-features','--features','curve','--no-deps'],600),
('wasm',['bash','scripts/test-wasm-bindings.sh'],1800),
]
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
