from pathlib import Path
import os,subprocess,json,time,shutil,hashlib
s=Path(__file__).resolve().parent;r=Path('/mnt/development/csgrs-wasm-float');target=Path('/mnt/development/.interval-refactor-build/wasm-float');env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'12','CARGO_TERM_COLOR':'never'};rows=[]
def run(name,args):
 start=time.time()
 with (s/(name+'.log')).open('w') as f:p=subprocess.run(args,cwd=r,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=1800)
 row=dict(name=name,command=args,exit_code=p.returncode,elapsed_seconds=time.time()-start);rows.append(row);(s/'wasm-candidate-results.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True);return p.returncode
assert run('baseline-missing-witness',['node','crates/hyperinterval/conformance/wasm-float/check.mjs',str(target/'baseline.wasm'),str(s/'corpus.json')])!=0
artifacts=[]
for version in ['1.88.0','1.95.0','stable']:
 assert run('build-'+version,['cargo','+'+version,'build','--locked','--release','--manifest-path','crates/hyperinterval/conformance/wasm-float/Cargo.toml','--target','wasm32-unknown-unknown'])==0
 path=target/('candidate-'+version+'.wasm');shutil.copyfile(target/'wasm32-unknown-unknown/release/interval_float_wasm_conformance.wasm',path);artifacts.append(dict(toolchain=version,path=str(path),bytes=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest()));(s/'candidate-wasm-artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
 assert run('node-'+version,['node','crates/hyperinterval/conformance/wasm-float/check.mjs',str(path),str(s/'corpus.json')])==0
 assert run('clippy-'+version,['cargo','+'+version,'clippy','--locked','--release','--manifest-path','crates/hyperinterval/conformance/wasm-float/Cargo.toml','--target','wasm32-unknown-unknown','--','-D','warnings'])==0
(s/'wasm-candidate-completed.json').write_text(json.dumps(dict(all_passed=True,commands=len(rows)))+'\n')
