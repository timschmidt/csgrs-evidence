"""Bind the feature record to its merged baseline and final qualified inputs."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

read=lambda name:json.loads((OUT/name).read_text())
sha=lambda path:hashlib.sha256(path.read_bytes()).hexdigest()
baseline=read('baseline.json')['baseline']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip()==baseline
source=hashes()
assert source==read('final-source.json')==read('qualification-summary.json')['source']
assert read('retention-decision.json')['decision']=='kept'
documents=['crates/hyperbrep/docs/DEVELOPMENT_PLAN.md','crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json',
    'crates/hyperbrep/docs/SUPPORT_MATRIX.md','crates/hyperbrep/docs/ARCHITECTURE.md','crates/hyperbrep/PERFORMANCE.md','crates/hyperbrep-io/PERFORMANCE.md','docs/properties-status.json']
files={str(path.relative_to(OUT)):sha(path) for path in sorted(OUT.rglob('*'))
    if path.is_file() and path.name not in ['manifest.json','audit.json','audit.log']}
manifest=dict(baseline=baseline,upstream='be2a0c37bfe57799c62a36125a5cb883a5458f00',decision='kept',
    source='final-source.json',source_identity=hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest(),
    contract='contract.md',review='review.md',qualification='qualification-summary.json',retention='retention-decision.json',
    ideas='idea-ledger.json',resources='cost-summary.json',reconstruction='source-reconstruction.json',ledger='ledger-update.json',
    source_ownership='HyperBRep topology owns complete axial-shell admission and its retained region/height witness; geometry and Boolean code preserve full native chart/image evidence. Construction publishes native carriers and exact prism transform promotion preserves the old domain. Supporting consumers live in hyperbrep-io. No supporting-crate runtime changes; all non-BREP shared-ledger bytes remain unchanged.',
    properties=['P1','P6','P8','P9','P11','P12','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P39'],
    evidence_files=files,documents={name:sha(ROOT/name) for name in documents},limits=read('retention-decision.json')['limits'])
(OUT/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('Bound',len(files),'feature evidence files.',flush=True)
