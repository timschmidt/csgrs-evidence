from pathlib import Path
import subprocess,json,shutil,hashlib,os
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-order-sharing');target=Path('/mnt/development/.interval-refactor-build/adaptive-order-sharing');snap=Path('/mnt/development/.interval-refactor-build/adaptive-order-sharing-candidate-binaries');snap.mkdir();assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
source=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip();(s/'CANDIDATE.json').write_text(json.dumps(dict(commit=source,status='isolated unretained; binary gate under investigation'),indent=2)+'\n')
for p in (target/'release/deps').iterdir():
 if p.is_file() and os.access(p,os.X_OK):shutil.copy2(p,snap/p.name)
p=s/'binary-comparison.json';rows=json.loads(p.read_text());(s/'binary-comparison-initial.json').write_bytes(p.read_bytes())
for row in rows:
 old=Path(row['candidate']['path']);new=snap/old.name;assert hashlib.sha256(new.read_bytes()).hexdigest()==row['candidate']['sha256'];row['candidate']['built_path']=str(old);row['candidate']['path']=str(new)
p.write_text(json.dumps(rows,indent=2)+'\n')
base=json.loads((s/'BASELINE.json').read_text())['csgrs']['head'];orders='crates/hyperdynamics/src/field/taylor_flow/orders.rs';(r/orders).write_bytes(subprocess.check_output(['git','show',base+':'+orders],cwd=r))
p=r/'crates/hyperdynamics/src/field/taylor_flow/adaptive.rs';t=p.read_text();start=t.index('    adaptive_evolution!(evolve_shared');p.write_text(t[:start]+'}\n')
patch=subprocess.check_output(['git','diff','--binary'],cwd=r);(s/'factor-control.patch').write_bytes(patch)
cmd=['cargo','+1.95.0','bench','--locked','-p','hyperdynamics','--all-features','--no-run']
for row in rows:
 if row['name']!='hyperdynamics':cmd+=['--bench',row['name']]
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
try:
 with (s/'factor-control-build.log').open('wb') as out:result=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
 (s/'factor-control-build.exit').write_text(str(result.returncode)+'\n');assert result.returncode==0
 control=[]
 for row in rows:
  if row['name']=='hyperdynamics':continue
  binary=Path(row['candidate']['built_path']);data=binary.read_bytes();destination=Path('/mnt/development/.interval-refactor-build/adaptive-order-sharing-factor-binaries');destination.mkdir(exist_ok=True);shutil.copy2(binary,destination/binary.name)
  control.append(dict(name=row['name'],path=str(destination/binary.name),bytes=len(data),sha256=hashlib.sha256(data).hexdigest(),growth_from_baseline=len(data)-row['baseline']['bytes']))
 (s/'factor-control-binaries.json').write_text(json.dumps(control,indent=2)+'\n');print([(x['name'],x['growth_from_baseline']) for x in control])
finally:
 subprocess.run(['git','restore','--source',source,'--worktree','--',orders,'crates/hyperdynamics/src/field/taylor_flow/adaptive.rs'],cwd=r,check=True)
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
 print('qualified candidate source restored; measured candidate binaries retained separately')
