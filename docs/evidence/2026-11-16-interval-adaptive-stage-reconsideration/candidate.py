from pathlib import Path
import subprocess,json,os,time,shutil,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/interval-adaptive-stage-current/csgrs');a=Path('/mnt/development/csgrs-evidence/docs/evidence/2026-11-15-interval-adaptive-stage-ownership')
assert (s/'baseline-probe-artifact.json').exists()
subprocess.run(['python3',str(s/'measure-allocation.py'),'baseline'],check=True)
subprocess.run(['git','apply','--exclude=crates/hyperdynamics/tests/field_taylor_orders.rs',str(a/'candidate.patch')],cwd=r,check=True)
for source in (a/'candidate-new-files').rglob('*'):
 if source.is_file():
  dest=r/source.relative_to(a/'candidate-new-files');dest.parent.mkdir(exist_ok=True,parents=True)
  if dest.exists():assert dest.read_bytes()==source.read_bytes(),dest
  else:shutil.copy2(source,dest)
subprocess.run(['git','add','crates/hyperdynamics'],cwd=r,check=True)
subprocess.run(['git','commit','-m','Unaccepted coefficient association sharing; current qualification pending'],cwd=r,check=True)
head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip();subprocess.run(['git','update-ref','refs/interval-unaccepted/adaptive-stage-current-20261116',head],cwd=r,check=True)
(s/'candidate-snapshot.json').write_text(json.dumps({'head':head,'baseline':'184faefa1d4cc1353325b82dcd5d019d5b3da537','status':'unaccepted','original_patch_sha256':hashlib.sha256((a/'candidate.patch').read_bytes()).hexdigest()},indent=2)+'\n')
(s/'candidate.patch').write_bytes(subprocess.check_output(['git','diff','184faefa1',head,'--','crates/hyperdynamics'],cwd=r))
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/adaptive-stage-reconsideration','CARGO_BUILD_JOBS':'8','CARGO_NET_OFFLINE':'true'}
commands=[('candidate-correctness',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--features','adaptive-taylor,dispatch-trace','--test','field_taylor_orders','--test','adaptive_order_sharing','--test','adaptive_preparation_baseline','--test','stage_ownership_baseline','--','--nocapture']),('candidate-allocation-build',['cargo','+1.95.0','build','--locked','--release','--manifest-path',str(s/'allocation-probe/Cargo.toml')])]
for label,cmd in commands:
 start=time.monotonic()
 with (s/(label+'.log')).open('w') as out:done=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT,timeout=1200)
 row={'label':label,'command':cmd,'cwd':str(r),'source':head,'exit_code':done.returncode,'seconds':time.monotonic()-start};(s/(label+'.json')).write_text(json.dumps(row,indent=2)+'\n');print(row,flush=True);assert done.returncode==0
art=Path('/mnt/development/.interval-refactor-build/adaptive-stage-reconsideration-artifacts');source=Path(env['CARGO_TARGET_DIR'])/'release/adaptive-stage-allocation-probe';dest=art/'candidate';shutil.copy2(source,dest)
(s/'candidate-probe-artifact.json').write_text(json.dumps({'path':str(dest),'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'bytes':dest.stat().st_size},indent=2)+'\n')
subprocess.run(['python3',str(s/'measure-allocation.py'),'candidate'],check=True)
print('candidate measurements ready; no admission',flush=True)
