from pathlib import Path
import json,subprocess,os,time,hashlib,shutil
s=Path(__file__).parent;r=Path('/mnt/development/interval-linalg-finite/csgrs');h=s/'full-resource-harness';art=Path('/mnt/development/.interval-refactor-build/linalg-finite-artifacts');target=Path('/mnt/development/.interval-refactor-build/alpha-proof-stack')
assert json.loads((s/'candidate-fmt.json').read_text())['exit_code']==0
assert not json.loads((s/'full-resource-summary.json').read_text())['stack_pass']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
subprocess.run(['git','checkout','--detach','a32805da2dd4d8e038c1275969526b58e9160215'],cwd=r,check=True,capture_output=True)
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'};cmd=['cargo','+1.95.0','build','--release','--offline','--locked'];t=time.monotonic()
with (s/'restored-full-build.log').open('w') as log:p=subprocess.run(cmd,cwd=h,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1800)
row={'command':cmd,'exit_code':p.returncode,'seconds':time.monotonic()-t};assert p.returncode==0
binary=art/'full-restored-resource';shutil.copy2(target/'release/linalg-finite-resource',binary)
row['baseline_sha256']=hashlib.sha256((art/'full-baseline-resource').read_bytes()).hexdigest();row['restored_sha256']=hashlib.sha256(binary.read_bytes()).hexdigest();assert row['baseline_sha256']==row['restored_sha256']
for case in range(16):
 for mode in ['observe','stack']:
  p=subprocess.run([str(binary),str(case),mode,'0','165'],capture_output=True,text=True,timeout=30);(s/f'restored-functional-{case}-{mode}.log').write_text(p.stdout+p.stderr);assert p.returncode==0
(s/'restoration.json').write_text(json.dumps(row,indent=2)+'\n');print('Original source restored and whole external artifact byte-identical;32functional runs pass',flush=True)
for label,args in [('restored-proposal-controls',['test','--locked','-p','hypersolve','--all-features','--test','smoke','proposal_route_reports_named_lossy_adapter']),('restored-pivot-control',['test','--locked','-p','hypersolve','--all-features','--test','smoke','dense_linear_adapter_reports_lossy_pivot_diagnostics']),('restored-clippy',['clippy','--locked','-p','hypersolve','--all-features','--all-targets','--','-D','warnings']),('restored-fmt',['fmt','--all','--','--check'])]:
 subprocess.run(['python3',str(s/'run-owner.py'),label,*args],check=True)
 assert json.loads((s/f'{label}.json').read_text())['exit_code']==0
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
(s/'build-barrier/result.json').write_text(json.dumps({'exit_code':0,'elapsed_seconds':0,'status':'All builds/checks terminal. Candidate rejected on stack; original source restored and binary matches baseline. See restoration.json and full-resource-summary.json.'},indent=2)+'\n');print('All restoration checks pass; build barrier released',flush=True)
