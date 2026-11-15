from pathlib import Path
import subprocess,os,time,json,shutil
s=Path(__file__).resolve().parent;r=Path('/mnt/development/csgrs-wasm-float');e=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/workspace-qualification','CARGO_BUILD_JOBS':'12','CARGO_TERM_COLOR':'never','RUSTDOCFLAGS':'-D warnings'};rows=[]
commands=[
('fmt',['cargo','+stable','fmt','--all','--','--check']),
('codegen',['python3','scripts/check_interval_float_codegen.py','--toolchain','stable','--output',str(s/'native-candidate-codegen')]),
('owner-tests',['cargo','+stable','test','--locked','-p','hyperinterval','--all-features']),
('clippy',['cargo','+stable','clippy','--locked','-p','hyperinterval','--all-targets','--all-features','--','-D','warnings']),
('clippy-minimal',['cargo','+stable','clippy','--locked','-p','hyperinterval','--all-targets','--no-default-features','--','-D','warnings']),
('docs',['cargo','+stable','doc','--locked','-p','hyperinterval','--no-deps','--all-features']),
('lattice-tests',['cargo','+stable','test','--locked','-p','hyperlattice-interval','--all-features']),
('alternate-modes',['cargo','+stable','test','--locked','-p','hyperinterval','--release','--all-features','--test','float','alternate_native_modes','--','--nocapture']),
('zizmor',['zizmor','--pedantic','--strict-collection','.']),
]
for name,args in commands:
 start=time.time()
 with (s/('native-'+name+'.log')).open('w') as f:p=subprocess.run(args,cwd=r,env=e,stdout=f,stderr=subprocess.STDOUT,timeout=7200)
 row=dict(name=name,command=args,exit_code=p.returncode,elapsed_seconds=time.time()-start);rows.append(row);(s/'native-validation.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if p.returncode:raise SystemExit(p.returncode)
 if name=='codegen':shutil.copyfile(json.loads((s/'native-candidate-codegen/report.json').read_text())['binary'],'/mnt/development/.interval-refactor-build/wasm-float-native-candidate')
(s/'native-validation-completed.json').write_text(json.dumps(dict(all_passed=True,commands=len(rows)))+'\n')
