"""Preserve all 22 previously qualified exact STEP byte contracts."""
import hashlib,json
from pathlib import Path
from check import OUT
old=OUT.parent/'2026-10-16-conic-comparison-reuse'
rows=[]
for folder in ['exports','faceted-exports','advanced-exports','scaled-exports']:
    before=sorted((old/folder).glob('*.step'))
    after=sorted((OUT/folder).glob('*.step'))
    assert [x.name for x in before]==[x.name for x in after],folder
    for a,b in zip(before,after):
        rows.append(dict(path=str(b.relative_to(OUT)),bytes=b.stat().st_size,
            sha256=hashlib.sha256(b.read_bytes()).hexdigest(),
            baseline_sha256=hashlib.sha256(a.read_bytes()).hexdigest(),unchanged=a.read_bytes()==b.read_bytes()))
assert len(rows)==22,len(rows)
(OUT/'preserved-step-artifacts.json').write_text(json.dumps(rows,indent=2)+'\n')
print(json.dumps(rows,indent=2))
assert all(x['unchanged'] for x in rows),'an existing STEP byte contract changed'
