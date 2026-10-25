from pathlib import Path
import hashlib,json,os,subprocess,time,signal,shutil,concurrent.futures,tomllib,sys
p=Path(__file__).resolve().parent
flags=' '.join(f'--remap-path-prefix=/tmp/csgrs-r15-{v}=/source --remap-path-prefix={p}/probe-{v}=/probe' for v in ['baseline','candidate'])
def build(v):
 root=Path('/tmp/csgrs-r15-'+v);probe=p/('probe-'+v);out=p/('build-'+v+'-'+str(time.time_ns()));out.mkdir()
 (out/'driver.py').write_bytes(Path(__file__).read_bytes())
 def inventory():
  names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
  return {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock'])}
 before=inventory();(out/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n');(out/'source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
 for name in ['main.rs','Cargo.toml','Cargo.lock']:shutil.copy2(probe/name,out/name)
 env=os.environ.copy();env.update(CARGO_TARGET_DIR=str(p/('target-'+v)),RUSTFLAGS=flags,CCACHE_DIR='/tmp/csgrs-r15-cost-'+v+'-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r15-cost-'+v+'-ccache/tmp');Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
 cmd=['cargo','build','--offline','--locked','--release'];start=time.time();print('BUILD',v,flush=True)
 with (out/'build.log').open('w') as log:
  proc=subprocess.Popen(cmd,cwd=probe,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:status=proc.wait(timeout=900)
  except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
 meta={'variant':v,'command':cmd,'cwd':str(probe),'status':status,'elapsed_seconds':time.time()-start,'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','RUSTFLAGS','CCACHE_DIR','CCACHE_TEMPDIR']}}
 after=inventory();(out/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n');assert before==after;meta['sources_unchanged']=True
 if status==0:
  binary=p/(v+'-probe');shutil.copy2(Path(env['CARGO_TARGET_DIR'])/'release/research_comparison_probe',binary);meta['binary']={'path':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'bytes':binary.stat().st_size,'sections':subprocess.check_output(['size','-A',str(binary)],text=True)}
 (out/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n');print('FINISH',v,status,out,flush=True);return meta
variants=sys.argv[1:] or ['baseline','candidate']
assert all(v in ['baseline','candidate'] for v in variants)
with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:results=list(pool.map(build,variants))
if len(variants)==1:
 previous=json.loads((p/'latest-builds.json').read_text())
 replacements={r['variant']:r for r in results}
 results=[replacements.get(r['variant'],r) for r in previous]
(p/'latest-builds.json').write_text(json.dumps(results,indent=2)+'\n')
assert all(r['status']==0 for r in results)
