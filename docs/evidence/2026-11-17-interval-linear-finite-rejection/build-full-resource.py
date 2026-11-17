from pathlib import Path
import subprocess,json,hashlib,os,shutil,time
s=Path(__file__).parent;h=s/'full-resource-harness';r=Path('/mnt/development/interval-linalg-finite/csgrs');art=Path('/mnt/development/.interval-refactor-build/linalg-finite-artifacts');target=Path('/mnt/development/.interval-refactor-build/alpha-proof-stack')
assert not (s.parent/'coordinated-ci/quiet-workflow-executed-plan.json').exists()
assert not (s/'build-barrier/result.json').exists()
assert json.loads((s/'candidate-clippy.json').read_text())['exit_code']==0
candidate=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip();assert candidate.startswith('0caf282ad')
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
subprocess.run(['git','update-ref','refs/interval-unaccepted/linalg-finite-20261117',candidate],cwd=r,check=True)
(s/'candidate.patch').write_bytes(subprocess.check_output(['git','diff','a32805da2',candidate],cwd=r))
(s/'snapshot.json').write_text(json.dumps({'baseline':'a32805da2dd4d8e038c1275969526b58e9160215','candidate':candidate},indent=2)+'\n')
for label,revision in [('baseline','a32805da2dd4d8e038c1275969526b58e9160215'),('candidate',candidate)]:
 subprocess.run(['git','checkout','--detach',revision],cwd=r,check=True,capture_output=True)
 env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'};cmd=['cargo','+1.95.0','build','--release','--offline'];
 if (h/'Cargo.lock').exists():cmd+=['--locked']
 t=time.monotonic()
 with (s/f'full-{label}-build.log').open('w') as log:p=subprocess.run(cmd,cwd=h,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1800)
 row={'command':cmd,'revision':revision,'exit_code':p.returncode,'seconds':time.monotonic()-t};(s/f'full-{label}-build.json').write_text(json.dumps(row,indent=2)+'\n');assert p.returncode==0
 binary=art/f'full-{label}-resource';shutil.copy2(target/'release/linalg-finite-resource',binary);row['binary_sha256']=hashlib.sha256(binary.read_bytes()).hexdigest();row['lock_sha256']=hashlib.sha256((h/'Cargo.lock').read_bytes()).hexdigest()
 checks=[]
 for case in range(16):
  for mode in ['observe','stack']:
   cmd=[str(binary),str(case),mode,'0','165'];p=subprocess.run(cmd,capture_output=True,text=True,timeout=30);(s/f'full-{label}-functional-{case}-{mode}.log').write_text(p.stdout+p.stderr);checks.append({'command':cmd,'exit_code':p.returncode});assert p.returncode==0,p.stderr
 row['checks']=checks;(s/f'full-{label}-build.json').write_text(json.dumps(row,indent=2)+'\n');print(label,'full owner artifact passed32functional invocations',flush=True)
print('Full owner source restored to clean unaccepted candidate',flush=True)
