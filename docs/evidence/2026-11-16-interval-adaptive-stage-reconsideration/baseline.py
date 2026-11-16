from pathlib import Path
import subprocess,json,os,time,shutil,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/interval-adaptive-stage-current/csgrs')
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/adaptive-stage-reconsideration','CARGO_BUILD_JOBS':'8','CARGO_NET_OFFLINE':'true'}
commands=[('missing-association-witness',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--features','taylor-flow','--test','field_taylor_orders','complete_coefficient_association_is_shared_by_restriction','--','--nocapture'],r,101),('baseline-artifacts',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--features','adaptive-taylor,dispatch-trace','--test','stage_ownership_baseline','--','--nocapture'],r,0),('baseline-allocation-build',['cargo','+1.95.0','build','--release','--manifest-path',str(s/'allocation-probe/Cargo.toml')],r,0)]
for label,cmd,cwd,expected in commands:
 start=time.monotonic()
 with (s/(label+'.log')).open('w') as out:done=subprocess.run(cmd,cwd=cwd,env=env,stdout=out,stderr=subprocess.STDOUT,timeout=1200)
 row={'label':label,'command':cmd,'cwd':str(cwd),'exit_code':done.returncode,'expected':expected,'seconds':time.monotonic()-start};(s/(label+'.json')).write_text(json.dumps(row,indent=2)+'\n');print(row,flush=True);assert done.returncode==expected
 if expected==101:assert 'immutable coefficient association was copied instead of shared' in (s/(label+'.log')).read_text()
art=Path('/mnt/development/.interval-refactor-build/adaptive-stage-reconsideration-artifacts');art.mkdir(exist_ok=True);source=Path(env['CARGO_TARGET_DIR'])/'release/adaptive-stage-allocation-probe';dest=art/'baseline';shutil.copy2(source,dest)
(s/'baseline-probe-artifact.json').write_text(json.dumps({'path':str(dest),'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'bytes':dest.stat().st_size},indent=2)+'\n')
print('baseline ready',flush=True)
