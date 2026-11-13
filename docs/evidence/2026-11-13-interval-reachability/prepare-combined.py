from pathlib import Path
import subprocess,json,hashlib,shutil
p=Path(__file__).parent;root=Path('/mnt/development/csgrs');source=Path('/mnt/development/csgrs-reachability');baseline=json.loads((p/'SOURCE_FINAL.json').read_text());rows=[]
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()==baseline['base']
assert subprocess.check_output(['git','diff','--binary'],cwd=root)==b''
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=root)==(p/'pending-dynamics.patch').read_bytes()
for row in baseline['paths']:
 name=row['path'];candidate=source/name;current=root/name;dst=p/'combined-files'/name;dst.parent.mkdir(parents=True,exist_ok=True)
 assert hashlib.sha256(candidate.read_bytes()).hexdigest()==row['sha256']
 old=current.read_bytes() if current.exists() else None
 base=subprocess.run(['git','show',baseline['base']+':'+name],cwd=root,capture_output=True)
 if base.returncode:
  assert old is None;merged=candidate.read_bytes()
 elif old==base.stdout:merged=candidate.read_bytes()
 else:
  original=p/'merge-base';original.write_bytes(base.stdout)
  result=subprocess.run(['git','merge-file','-p',str(current),str(original),str(candidate)],capture_output=True)
  if result.returncode and name=='crates/hyperdynamics/CHANGELOG.md':
   header=b'# Changelog\n\n## 0.1.0 (unreleased)\n\n'
   addition=candidate.read_bytes()[len(header):].split(b'- Add owned, replayable')[0]
   assert old.startswith(header)
   merged=(header+addition+old[len(header):]).replace(b'  documented accounting exclusions. Validated evolution remains open.',b'  documented accounting exclusions.')
  elif result.returncode and name=='crates/hyperdynamics/README.md':
   assert old.startswith(base.stdout) and candidate.read_bytes().startswith(base.stdout)
   merged=old+candidate.read_bytes()[len(base.stdout):]
  else:
   assert result.returncode==0,(name,result.stderr.decode(),result.stdout.decode())
   merged=result.stdout
 dst.write_bytes(merged)
 rows.append(dict(path=name,before_sha256=hashlib.sha256(old).hexdigest() if old is not None else None,combined_sha256=hashlib.sha256(merged).hexdigest()))
(p/'combined-state.json').write_text(json.dumps(rows,indent=2)+'\n')
for row in rows:
 name=row['path'];target=root/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p/'combined-files'/name,target)
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=root)==(p/'pending-dynamics.patch').read_bytes()
(p/'combined-unstaged.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
print('Combined 15 new paths with unchanged 40-path staged extraction')
