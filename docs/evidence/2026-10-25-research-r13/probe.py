from pathlib import Path
import hashlib,json,os,signal,subprocess,time
p=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-research-baseline-3cca6a8')
cmd=['cargo','test','--offline','--locked','--release','-p','hypercurve','--test','hypercurve_curve_region_boolean','--test','hypercurve_curve_region_stroke','--','--nocapture','--test-threads=1']
env=dict(os.environ,CARGO_TARGET_DIR='/tmp/csgrs-research-2026-10-25/r12/target-check',PROPTEST_RNG_SEED='20261025')
start=time.time()
with (p/'baseline-routes.log').open('w') as log:
 proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=proc.wait(timeout=600)
 except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='timeout'
record={'command':cmd,'cwd':str(root),'code':code,'seconds':time.time()-start,'timeout_seconds':600,'seed':env['PROPTEST_RNG_SEED'],'compiler':subprocess.check_output(['rustc','-Vv'],text=True)}
(p/'baseline-routes.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
