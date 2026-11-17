from pathlib import Path
import subprocess,os,json,time,hashlib,shutil
s=Path(__file__).parent;h=s/'expanded';target=Path('/mnt/development/.interval-refactor-build/alpha-proof-stack');a=Path('/mnt/development/.interval-refactor-build/domain-certainty-artifacts');env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'};rows=[]
assert not (s/'build-barrier/result.json').exists();assert not (s.parent/'coordinated-ci/quiet-workflow-executed-plan.json').exists()
for name,cmd in [('fmt',['cargo','+1.95.0','fmt']),('build',['cargo','+1.95.0','build','--release','--offline','--locked']),('clippy',['cargo','+1.95.0','clippy','--locked','--offline','--all-targets','--','-D','warnings'])]:
 start=time.monotonic()
 with (s/f'expanded-{name}.log').open('w') as f:p=subprocess.run(cmd,cwd=h,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=1800)
 row={'name':name,'command':cmd,'exit_code':p.returncode,'seconds':time.monotonic()-start};rows.append(row);(s/'expanded-commands.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0,row
 print(name,'passed',flush=True)
artifact=a/'expanded-baseline';shutil.copy2(target/'release/domain-certainty-expanded',artifact);(s/'expanded-artifact.json').write_text(json.dumps({'path':str(artifact),'sha256':hashlib.sha256(artifact.read_bytes()).hexdigest(),'lock_sha256':hashlib.sha256((h/'Cargo.lock').read_bytes()).hexdigest(),'source_head':subprocess.check_output(['git','rev-parse','HEAD'],cwd='/mnt/development/csgrs',text=True).strip()},indent=2)+'\n')
for case in range(12):
 for name,expected in [('control',0),('witness',101)]:
  cmd=[str(artifact),name,str(case)];start=time.monotonic()
  with (s/f'expanded-{case}-{name}.log').open('w') as f:p=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,timeout=120)
  row={'case':case,'name':name,'command':cmd,'exit_code':p.returncode,'expected_exit_code':expected,'seconds':time.monotonic()-start};rows.append(row);(s/'expanded-commands.json').write_text(json.dumps(rows,indent=2)+'\n');print(case,name,p.returncode,flush=True);assert p.returncode==expected,row
