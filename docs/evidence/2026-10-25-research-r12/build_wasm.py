from pathlib import Path
import hashlib,json,os,shutil,subprocess,time,tomllib
p=Path(__file__).resolve().parent
workspace=tomllib.loads(Path('/home/tim/Documents/GitHub/workspace/csgrs/Cargo.lock').read_text())
declared={(x['name'],x['version'],x.get('checksum')) for x in workspace['package'] if 'registry' in x.get('source','')}
for v in ['baseline','candidate']:
 d=p/('wasm-'+v);env=dict(os.environ,CARGO_TARGET_DIR=str(p/'target-wasm'))
 records=[]
 for i,locked in enumerate([False,True]):
  cmd=['cargo','build','--offline','--release','--target','wasm32-unknown-unknown']+(['--locked'] if locked else [])
  start=time.time()
  with (p/(v+'-wasm-build-'+str(i)+'.log')).open('w') as f:r=subprocess.run(cmd,cwd=d,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=600)
  records.append({'command':cmd,'code':r.returncode,'seconds':time.time()-start})
  if r.returncode:print(v,records,flush=True);raise SystemExit(r.returncode)
 binary=p/(v+'-probe.wasm');shutil.copy2(p/'target-wasm/wasm32-unknown-unknown/release/research_tangent_wasm.wasm',binary)
 lock=tomllib.loads((d/'Cargo.lock').read_text());versions={(x['name'],x['version'],x.get('checksum')) for x in lock['package'] if 'registry' in x.get('source','')};assert not versions-declared,versions-declared
 record={'commands':records,'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'registry_dependencies':len(versions),'matched_workspace_dependencies':True,'probe_sha256':hashlib.sha256((d/'lib.rs').read_bytes()).hexdigest(),'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'binary_bytes':binary.stat().st_size}
 (p/(v+'-wasm-build.json')).write_text(json.dumps(record,indent=2)+'\n');print(v,'WASM built',record['binary_bytes'],flush=True)
