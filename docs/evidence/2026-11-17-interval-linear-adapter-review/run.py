from pathlib import Path
import json,subprocess,hashlib,time
s=Path(__file__).parent;q=s.parent/'coordinated-ci'
assert not (q/'quiet-workflow-executed-plan.json').exists()
assert not (s/'build-barrier/result.json').exists()
assert (s/'linalg.rs').read_bytes()==Path('/mnt/development/csgrs/crates/hypersolve/src/linalg.rs').read_bytes()
commands=[['rustc','+1.95.0','--version','--verbose'],['rustc','+1.95.0','--edition=2024','--test','-D','warnings','probe.rs','-o','/mnt/development/.interval-refactor-build/linalg-review-probe'],['/mnt/development/.interval-refactor-build/linalg-review-probe','--nocapture'],['/mnt/development/.interval-refactor-build/linalg-review-probe','--ignored','--nocapture']]
results=[]
for i,cmd in enumerate(commands):
 t=time.time();p=subprocess.run(cmd,cwd=s,capture_output=True,text=True,timeout=60);(s/f'command-{i}.log').write_text(p.stdout+p.stderr)
 results.append({'command':cmd,'cwd':str(s),'exit_code':p.returncode,'seconds':time.time()-t})
 if i<3:assert p.returncode==0,results[-1]
 else:assert p.returncode==101,results[-1]
(s/'results.json').write_text(json.dumps({'commands':results,'source_sha256':hashlib.sha256((s/'linalg.rs').read_bytes()).hexdigest(),'binary_sha256':hashlib.sha256(Path(commands[-1][0]).read_bytes()).hexdigest()},indent=2)+'\n')
print(json.dumps(results,indent=2))
