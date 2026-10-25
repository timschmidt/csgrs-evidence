from pathlib import Path
import hashlib,json,os,shutil
raw=Path(__file__).resolve().parent
dest=Path('/tmp/csgrs-evidence-research-2026-10-25/docs/evidence/2026-10-25-research-r12')
assert not dest.exists();dest.mkdir(parents=True)
excluded=[];directories_omitted=[];count=size=0
for parent,dirs,names in os.walk(raw):
 kept=[]
 for name in sorted(dirs):
  path=Path(parent)/name
  if name.startswith('target') or name in ['__pycache__','.git']:
   directories_omitted.append(str(path.relative_to(raw)))
  else:kept.append(name)
 dirs[:]=kept
 for name in sorted(names):
  source=Path(parent)/name;relative=source.relative_to(raw)
  with source.open('rb') as f:magic=f.read(8)
  if magic.startswith((b'\x7fELF',b'\0asm',b'!<arch>')) or name.endswith('.crate'):
   data=source.read_bytes();excluded.append({'path':str(relative),'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),'reason':'compiled product or third-party package; source, commands and digest retained'});continue
  target=dest/relative;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(source,target);count+=1;size+=source.stat().st_size
(dest/'excluded-build-products.json').write_text(json.dumps({'directories_omitted':directories_omitted,'files':excluded},indent=2)+'\n')
print(json.dumps({'destination':str(dest),'copied_files':count,'copied_bytes':size,'excluded_files':len(excluded),'build_directories_omitted':len(directories_omitted)},indent=2))
