from pathlib import Path
import os,subprocess,json,time,shutil
s=Path(__file__).resolve().parent;r=Path('/mnt/development/csgrs-wasm-float');e=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/workspace-qualification','CARGO_BUILD_JOBS':'12','CARGO_TERM_COLOR':'never'};rows=[]
commands=[('codegen',['python3','scripts/check_interval_float_codegen.py','--toolchain','stable','--output',str(s/'native-baseline-codegen')]),('float-tests',['cargo','+stable','test','--locked','-p','hyperinterval','--all-features','--test','float'])]
for name,args in commands:
 start=time.time()
 with (s/(name+'-baseline.log')).open('w') as f:p=subprocess.run(args,cwd=r,env=e,stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,command=args,exit_code=p.returncode,elapsed_seconds=time.time()-start);rows.append(row);(s/'native-baseline-results.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True);assert p.returncode==0
 if name=='codegen':shutil.copyfile(json.loads((s/'native-baseline-codegen/report.json').read_text())['binary'],'/mnt/development/.interval-refactor-build/wasm-float-native-baseline')
