"""Resume after restoring omitted fixture copies; keep completed same-source checks."""
from pathlib import Path
import hashlib,json,subprocess,sys
OUT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(OUT))
from check import ROOT,ENV,hashes
source=hashes();sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();recovery=json.loads((OUT/'harness-recovery.json').read_text())
inputs={str(Path(__file__)):sha(__file__)}
for r in recovery['restored_inputs']:
 p=OUT/r['path'];assert sha(p)==sha(r['baseline'])==r['sha256'];inputs[str(p)]=r['sha256']
for name,count in [('consumer-admission.json',8),('previous-axial-admission.json',4)]:
 d=json.loads((OUT/name).read_text());assert d['source']==source and d['complete_workflows']==count;assert sha(d['binary']['path'])==d['binary']['sha256']
for name in recovery['remaining']:
 subprocess.run(['python3','-B',str(OUT/'analysis-recipes'/(name+'.py'))],cwd=ROOT,env=ENV,check=True)
 assert hashes()==source and all(sha(p)==h for p,h in inputs.items())
old=OUT.parent/'2026-10-18-spline-exchange';rows=[]
for r in json.loads((old/'artifact-comparison.json').read_text())['rows']:
 a,b=old/r['path'],OUT/r['path'];assert a.read_bytes()==b.read_bytes(),r['path'];rows.append(dict(path=r['path'],baseline=str(a.relative_to(ROOT)),bytes=b.stat().st_size,sha256=sha(b),unchanged=True))
assert len(rows)==211
(OUT/'artifact-comparison.json').write_text(json.dumps(dict(source=source,rows=rows,scope='Complete original 211-file comparison after same-source preservation. The first twelve successful workflows were reused; the remaining helpers ran after restoring byte-identical fixture copies.'),indent=2)+'\n')
recovery.update(recovered=True,source=source,inputs=inputs,preserved_files=211)
(OUT/'harness-recovery.json').write_text(json.dumps(recovery,indent=2)+'\n')
print('Preservation resumed successfully; all 211 earlier artifacts are unchanged.')
