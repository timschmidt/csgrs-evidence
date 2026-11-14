from pathlib import Path
import subprocess,os,json,time,hashlib,shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-model-composition');probe=s/'existing-allocation';(probe/'src').mkdir(parents=True)
bench=(r/'crates/hypersolve/benches/taylor_polynomial.rs').read_text();body=bench[:bench.index('criterion_group!(benches')].replace('use criterion::{Criterion, criterion_group, criterion_main};\n','')
observer=(s/'allocation/src/main.rs').read_text();framework=observer[observer.index('use std::alloc::'):observer.index('fn main(){')]
(probe/'src/main.rs').write_text(body+'\n'+framework+'''\nfn main(){
 benchmarks(&mut Criterion);
 for case in cases(){
  validate(&case);
  retained(case.name,"reuse",|g,a|TaylorPolynomialModel::new(case.seed.clone(),case.map.clone(),g,a).unwrap());
  retained(case.name,"redifferentiate",|g,a|case.native.taylor_model(case.request.clone(),g,a).unwrap());
 }
}
''')
shutil.copy2(r/'Cargo.lock',probe/'Cargo.lock');rows=[]
for variant,tree,feature in [('baseline',str(r)+'-base','taylor-polynomial'),('enabled',str(r),'taylor-composition')]:
 manifest=f'''[package]
name = "composition-existing-allocation"
version = "0.0.0"
edition = "2024"
[workspace]
[dependencies]
hypersolve = {{path="{tree}/crates/hypersolve",features=["{feature}"]}}
hyperinterval = {{path="{tree}/crates/hyperinterval",features=["hyperreal"]}}
hyperreal = {{path="{tree}/crates/hyperreal",features=["serde"]}}
'''
 (probe/'Cargo.toml').write_text(manifest);(s/f'existing-{variant}-manifest.toml').write_text(manifest)
 cmd=['cargo','+1.95.0','build','--release','--offline','--manifest-path',str(probe/'Cargo.toml'),'--target-dir','/mnt/development/.interval-refactor-build/taylor-model-composition-cost'];start=time.monotonic()
 with (s/f'existing-{variant}-build.log').open('w') as out:run=subprocess.run(cmd,env=os.environ|{'CARGO_BUILD_JOBS':'4'},stdout=out,stderr=subprocess.STDOUT)
 assert run.returncode==0
 artifact=Path('/mnt/development/.interval-refactor-build/taylor-model-composition-artifacts')/f'existing-{variant}-allocation';shutil.copy2('/mnt/development/.interval-refactor-build/taylor-model-composition-cost/release/composition-existing-allocation',artifact)
 with (s/f'existing-{variant}-results.log').open('w') as out:observation=subprocess.run([str(artifact)],stdout=out,stderr=subprocess.STDOUT)
 assert observation.returncode==0
 shutil.copy2(probe/'Cargo.lock',s/f'existing-{variant}-Cargo.lock')
 rows.append(dict(variant=variant,feature=feature,command=cmd,returncode=run.returncode,observation_returncode=observation.returncode,seconds_not_timing=time.monotonic()-start,path=str(artifact),sha256=hashlib.sha256(artifact.read_bytes()).hexdigest()))
 (s/'existing-allocation-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(variant,'pass',flush=True)
