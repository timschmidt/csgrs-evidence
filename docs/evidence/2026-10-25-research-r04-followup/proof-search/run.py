from pathlib import Path
import subprocess,os,time,json,signal,sys
r=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r04-proof-search');env=os.environ.copy();env['CARGO_TARGET_DIR']='/tmp/csgrs-r04-proof-search-target';env['PROPTEST_RNG_SEED']='20261025';tag=sys.argv[1]
subprocess.run(['cargo','fmt','--all'],cwd=root,env=env,check=True)
(r/(tag+'-source.patch')).write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
cmd=['cargo','test','--locked','--release','-p','hypertri','--all-features','--lib','unresolved_bridge_priority_preserves_exact_triangulation','--','--nocapture'];start=time.time()
with (r/(tag+'.log')).open('x') as log:
 p=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=600)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code='timeout'
(r/(tag+'.json')).write_text(json.dumps({'command':cmd,'target':env['CARGO_TARGET_DIR'],'code':code,'seconds':time.time()-start},indent=2)+'\n')
print(code);print((r/(tag+'.log')).read_text()[-6000:])
