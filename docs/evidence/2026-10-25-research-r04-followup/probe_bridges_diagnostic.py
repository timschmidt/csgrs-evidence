from pathlib import Path
import hashlib,json,os,signal,subprocess,time,sys
p=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-research-r12-regression')
label='bridge-search-diagnostic'
cmd=['cargo','test','--offline','--locked','--release','-p','csgrs','--all-features','--test','downstream_profiles','circle_wall_from_opposite_offsets_keeps_one_hole','--','--nocapture','--test-threads=2']
patch=subprocess.check_output(['git','diff','--binary'],cwd=root);(p/(label+'-source.patch')).write_bytes(patch)
env=dict(os.environ,CARGO_TARGET_DIR='/home/tim/Documents/GitHub/workspace/csgrs/target',PROPTEST_RNG_SEED='20261025')
start=time.time()
with (p/(label+'.log')).open('w') as log:
 proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=proc.wait(timeout=180)
 except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='timeout'
record={'command':cmd,'cwd':str(root),'target_dir':env['CARGO_TARGET_DIR'],'code':code,'seconds':time.time()-start,'source_patch_sha256':hashlib.sha256(patch).hexdigest()}
(p/(label+'.json')).write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
