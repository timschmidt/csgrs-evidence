"""Bind the completed merge record to both parents and final local inputs."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

read=lambda name:json.loads((OUT/name).read_text())
sha=lambda path:hashlib.sha256(path.read_bytes()).hexdigest()
git=lambda *args:subprocess.check_output(['git',*args],cwd=ROOT,text=True).strip()
baseline=read('baseline.json')
assert git('rev-parse','HEAD')==baseline['local']
assert git('rev-parse','MERGE_HEAD')==baseline['upstream']
source=hashes()
assert source==read('final-source.json')==read('qualification-summary.json')['source']
assert read('retention-decision.json')['decision']=='kept'
documents=['crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
    'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json','docs/properties-status.json']
files={str(path.relative_to(OUT)):sha(path) for path in sorted(OUT.rglob('*'))
       if path.is_file() and path.name not in ['manifest.json','audit.json','audit.log']}
manifest=dict(baseline=baseline['local'],previous_upstream=baseline['previous_upstream'],
    upstream=baseline['upstream'],decision='kept',source='final-source.json',
    source_identity=hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest(),
    contract='contract.md',review='review.md',qualification='qualification-summary.json',
    retention='retention-decision.json',ideas='idea-ledger.json',resources='resource-observations.json',
    reconstruction='source-reconstruction.json',ledger='ledger-update.json',
    source_ownership='The merge retains upstream corrections and unchanged BREP runtime/test sources. Only BREP planning/status/evidence and its value in the shared ledger are authored here. Supporting crate changes needed for later BREP features remain authorized in their owning layer.',
    properties=['P1','P6','P11','P12','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P39'],
    evidence_files=files,documents={p:sha(ROOT/p) for p in documents},
    limits=read('retention-decision.json')['limits'])
(OUT/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('Bound',len(files),'integration evidence files.',flush=True)
