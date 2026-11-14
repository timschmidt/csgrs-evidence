from pathlib import Path
import json,shutil,hashlib
s=Path(__file__).parent;out=[]
for row in json.loads((s/'cost-builds.json').read_text()):
 messages=[json.loads(x) for x in (s/('build-'+row['name']+'.jsonl')).read_text().splitlines()];exe=[x['executable'] for x in messages if x.get('reason')=='compiler-artifact' and x.get('executable')];assert len(exe)==1
 raw=Path(exe[0]).read_bytes();assert hashlib.sha256(raw).hexdigest()==row['sha256'];old=hashlib.sha256(Path(row['path']).read_bytes()).hexdigest();shutil.copy2(exe[0],row['path']);out.append(dict(name=row['name'],inspected_sha256=old,restored_sha256=row['sha256'],bytes=len(raw)))
(s/'artifact-restoration.json').write_text(json.dumps(out,indent=2)+'\n')
p=s/'inspect-artifacts.py';text=p.read_text().replace("section+'='+str(dest),p]","section+'='+str(dest),p,str(dest)+'.scratch']");p.write_text(text)
