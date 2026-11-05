from pathlib import Path
import subprocess,json,hashlib,tempfile,difflib
prefix='/tmp/hyperbrep-parameter-components'
base=json.loads(Path('/tmp/hyperbrep-tensor-inverse-final-source.json').read_text())
now=json.loads(Path(prefix+'-final-source.json').read_text())
changed=[p for p,h in now.items() if base.get(p)!=h]
repo='/tmp/hyperbrep-nonlinear-evidence';record='crates/hyperbrep/docs/evidence/2026-11-04-selected-tensor-preimages'
patch=subprocess.check_output(['git','-C',repo,'show','fcb5fab5b62636c697b3982fca288e0cf4fdc77f:'+record+'/source.patch'])
head=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()
with tempfile.TemporaryDirectory(prefix='hyperbrep-component-review-') as temp:
 root=Path(temp)
 names=subprocess.check_output(['git','diff','--name-only','HEAD','--','crates/hypercurve','crates/hyperbrep','crates/hypersolve','crates/hyperbrep-io'],text=True).splitlines()
 for name in names:
  r=subprocess.run(['git','show',head+':'+name],capture_output=True)
  if r.returncode==0:
   p=root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(r.stdout)
 subprocess.run(['git','apply','-'],input=patch,cwd=root,check=True)
 lines=[]
 for name in changed:
  old=(root/name).read_text() if (root/name).exists() else ''
  lines.extend(difflib.unified_diff(old.splitlines(True),Path(name).read_text().splitlines(True),fromfile='record8/'+name,tofile='working/'+name))
 Path(prefix+'-source-review.patch').write_text(''.join(lines))
info={'previous_archive_commit':'fcb5fab5b62636c697b3982fca288e0cf4fdc77f','previous_fingerprints':len(base),'current_fingerprints':len(now),'changed_or_new_paths':changed,'added_paths':sorted(set(now)-set(base)),'removed_paths':sorted(set(base)-set(now)),'source_review_diff_sha256':hashlib.sha256(Path(prefix+'-source-review.patch').read_bytes()).hexdigest()}
Path(prefix+'-source-review.json').write_text(json.dumps(info,indent=2)+'\n')
print(json.dumps(info,indent=2))
