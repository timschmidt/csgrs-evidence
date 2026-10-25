from pathlib import Path
import hashlib,json,os,shutil,subprocess,time
p=Path(__file__).resolve().parent
for v,root in [('baseline',Path('/home/tim/Documents/GitHub/workspace/csgrs')),('candidate',Path('/tmp/csgrs-research-baseline-3cca6a8'))]:
 d=p/('probe-'+v)
 env=dict(os.environ,CARGO_TARGET_DIR=str(p/'target-probe'))
 cmds=[['cargo','generate-lockfile','--offline'],['cargo','build','--offline','--locked','--release']]
 records=[]
 for i,cmd in enumerate(cmds):
  start=time.time()
  with (p/(v+'-build-'+str(i)+'.log')).open('w') as f:
   r=subprocess.run(cmd,cwd=d,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=600)
  records.append({'command':cmd,'code':r.returncode,'seconds':time.time()-start})
  if r.returncode: print(v,records,flush=True);raise SystemExit(r.returncode)
 binary=p/(v+'-probe');shutil.copy2(p/'target-probe/release/research_tangent_probe',binary)
 patch=subprocess.check_output(['git','diff','--binary','--','crates/hypercurve','crates/hyperreal','crates/hyperlimit','crates/hypersolve'],cwd=root)
 (p/(v+'-measurement-source.patch')).write_bytes(patch)
 record={'root':str(root),'commands':records,'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'target_dir':env['CARGO_TARGET_DIR'],'features':'hypercurve default-features=false; hyperreal serde; no dispatch-trace','source_head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),'source_patch_sha256':hashlib.sha256(patch).hexdigest(),'probe_sha256':hashlib.sha256((d/'main.rs').read_bytes()).hexdigest(),'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'binary_bytes':binary.stat().st_size,'size':subprocess.check_output(['size','-A',str(binary)],text=True)}
 (p/(v+'-measurement-build.json')).write_text(json.dumps(record,indent=2)+'\n')
 print(v,'built',record['binary_sha256'],flush=True)
