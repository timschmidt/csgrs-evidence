"""Bind the retained increment to the unchanged complete domain and raw evidence."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes
read = lambda n: json.loads((OUT/n).read_text())
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
b = read('baseline.json')
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == b['baseline']
source = hashes()
assert source == read('final-source.json') == read('qualification-summary.json')['source']
assert read('retention-decision.json')['decision'] == 'kept'
documents = ['crates/hyperbrep/docs/DEVELOPMENT_PLAN.md', 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json',
             'crates/hyperbrep/PERFORMANCE.md', 'docs/properties-status.json']
files = {str(p.relative_to(OUT)): sha(p) for p in sorted(OUT.rglob('*'))
         if p.is_file() and p.name not in ['manifest.json', 'audit.json', 'audit.log']}
manifest = dict(baseline=b['baseline'], upstream=b['upstream'], decision='kept',
    source='final-source.json', source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    contract=['contract.md', 'relation-contract.md'], review='review.md', qualification='qualification-summary.json',
    retention='retention-decision.json', ideas='idea-ledger.json', resources='cost-summary.json',
    reconstruction='source-reconstruction.json', ledger='ledger-update.json',
    packaging='package-payload.json', resource_review='resource-review.md',
    source_ownership='HyperBRep topology owns exact prism grouping/admission. BREP geometry owns the common exact plane relation and complete intersection construction. Supporting runtime and dependency locks are unchanged; all non-BREP shared-ledger bytes persist.',
    properties=['P1', 'P3', 'P4', 'P6', 'P8', 'P10', 'P11', 'P17', 'P18', 'P19', 'P20', 'P24', 'P27', 'P35', 'P36', 'P37', 'P39'],
    evidence_files=files, documents={n: sha(ROOT/n) for n in documents},
    limits=read('retention-decision.json')['limits'])
(OUT/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
print('Bound', len(files), 'evidence files.', flush=True)
