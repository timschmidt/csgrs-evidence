"""Compare final BREP package members and every retained physical file."""
import json,re
from pathlib import Path
from check import ROOT,OUT,hashes,sha,run
source=hashes();old=json.loads((OUT/'baseline-package-files.json').read_text());result={}
for crate in ['hyperbrep','hyperbrep-io']:
 command=run('final-package-'+crate,['cargo','package','--list','--allow-dirty','--offline','-p',crate])
 assert command['exit_code']==0
 names=(OUT/command['stdout']).read_text().splitlines();original=set(old[crate]['files'])|set(old[crate]['generated'])
 removed=sorted(original-set(names));added=sorted(set(names)-original)
 assert added==['LICENSE-APACHE']
 assert removed==sorted(n for n in original if n.startswith('docs/evidence/'))
 files={};generated=[];changed=[]
 for n in names:
  p=ROOT/'crates'/crate/n
  if not p.is_file():generated.append(n);continue
  item=dict(sha256=sha(p),bytes=p.stat().st_size);files[n]=item
  if n in old[crate]['files'] and item!=old[crate]['files'][n]:changed.append(n)
 expected=['Cargo.toml','docs/DEVELOPMENT_PLAN.md','docs/IMPLEMENTATION_STATUS.json'] if crate=='hyperbrep' else []
 assert changed==sorted(expected),(crate,changed)
 assert generated==old[crate]['generated']
 includes=[]
 for folder in ['src','tests','benches','examples','fuzz/fuzz_targets']:
  for p in (ROOT/'crates'/crate/folder).rglob('*.rs'):
   for literal in re.findall(r'include_(?:str|bytes)!\(\s*"([^"]+)"\s*\)',p.read_text()):
    target=(p.parent/literal).resolve();relative=str(target.relative_to(ROOT/'crates'/crate))
    assert relative in files,(crate,p,literal)
    includes.append(dict(source=str(p.relative_to(ROOT/'crates'/crate)),literal=literal,member=relative))
 result[crate]=dict(before_count=len(original),after_count=len(names),removed=removed,added=added,changed_physical_members=changed,files=files,generated=generated,physical_bytes=sum(x['bytes'] for x in files.values()),compile_time_includes=includes)
assert hashes()==source
(OUT/'package-comparison.json').write_text(json.dumps(dict(source=source,crates=result,recipe_sha256=sha(Path(__file__)),scope='Cargo file-list membership and physical file bytes after final package/documentation edits. Cargo-generated members are distinguished. No archive construction, registry installation or full release qualification is inferred.'),indent=2)+'\n')
print({k:dict(before=v['before_count'],after=v['after_count'],physical_bytes=v['physical_bytes'],changes=v['changed_physical_members']) for k,v in result.items()},flush=True)
