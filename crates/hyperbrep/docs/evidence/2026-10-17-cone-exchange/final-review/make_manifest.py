"""Bind the completed feature record without attributing it to pending upstream."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
read = lambda p: json.loads(p.read_text())
source = hashes()
assert source == read(OUT/'final-source.json')
baseline = '490ed3421a471ef010d647def63c083138e45633'
assert subprocess.check_output(['git','rev-parse','HEAD'], cwd=ROOT, text=True).strip() == baseline
assert read(OUT/'retention-decision.json')['decision'] == 'kept'
assert read(OUT/'finish-checks-driver.json')['passed']
files = {str(p.relative_to(OUT)):sha(p) for p in sorted(OUT.rglob('*'))
         if p.is_file() and p.name not in ['manifest.json','audit.json','audit.log']}
documents = ['crates/hyperbrep/README.md','crates/hyperbrep/PERFORMANCE.md',
             'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md','crates/hyperbrep/docs/SUPPORT_MATRIX.md',
             'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json','crates/hyperbrep-io/README.md',
             'crates/hyperbrep-io/PERFORMANCE.md','crates/hyperbrep-io/docs/STEP_MAPPING.md']
manifest = dict(baseline=baseline, incorporated_upstream='99b88f707b04053de7f40a86d6d029e3c07460d9',
    pending_upstream='be2a0c37bfe57799c62a36125a5cb883a5458f00', decision='kept', source='final-source.json',
    source_identity=hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest(),
    owner='HyperBRep owns exact conical recognition, native charts and complete image/topology proofs. HyperBRep IO owns STEP syntax, units, source maps, policy accounting and finite decimal encoding.',
    input_domain='Declared nonsingular conical LINE revolutions and supported finite cone faces/closed shells. Original full-size cone Boolean/replay/recut/reunion/empty-recovery corpus, finite anchor controls, authored source/pcurve controls and rational native edge subdivisions.',
    contract='contract.md', proof_review='review.md', qualification='qualification-summary.json',
    retention='retention-decision.json', ideas='idea-ledger.json', reconstruction='source-reconstruction.json',
    performance='benchmark-summary.json', dependency_performance='dependency-costs-v1/summary.json',
    benchmark_helpers=read(OUT.parent/'2026-10-17-cone-continuation/manifest.json')['benchmark_helpers'],
    frontier='continuation-frontier.json', continuation='continuation-admission.json',
    fixture_migrations='fixture-migrations.json', source_binding='final-review/source_binding.py',
    independent_readers=['cone-exports-occt.json','rational-split-occt.json'],
    properties=['P1','P2','P3','P4','P5','P6','P8','P9','P10','P11','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P38','P39'],
    evidence_files=files, documents={p:sha(ROOT/p) for p in documents},
    limitation='Finite exact capability extension, not general cone exchange or Boolean closure. Two inherited zero-factor debug failures remain recorded with the upstream owner. All adverse costs and failed prototypes retained. No full-workspace/pre-push, package, total-resource or complete-work-package claim; no push.')
(OUT/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('Bound evidence files:',len(files))
