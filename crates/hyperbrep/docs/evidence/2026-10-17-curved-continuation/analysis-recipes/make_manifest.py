"""Bind the completed record after all measurements and documentation edits."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
source = hashes()
assert source == json.loads((OUT / 'final-source.json').read_text())
baseline = '95011fbb4995e4f39549d1680e972235c750db29'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == baseline
decision = json.loads((OUT / 'retention-decision.json').read_text())
assert decision['decision'] == 'kept'
files = {str(p.relative_to(OUT)): sha(p) for p in sorted(OUT.rglob('*'))
         if p.is_file() and p.name not in ['manifest.json', 'audit.json', 'audit.log']}
documents = ['crates/hyperbrep/README.md', 'crates/hyperbrep/PERFORMANCE.md',
             'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
             'crates/hyperbrep/docs/SUPPORT_MATRIX.md',
             'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json', 'docs/properties-status.json']
manifest = dict(baseline=baseline, upstream='99b88f707b04053de7f40a86d6d029e3c07460d9',
    decision='kept', source='final-source.json',
    source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    owner='Hyperreal certified rounding/function-congruence proofs; HyperBRep workflow acceptance and benchmarks.',
    input_domain='Original R=5,r=2 ring torus and 40-unit cutter with exact rotation (3/5,4/5); both union orders and two split/reload/recut/remainder/reunion/empty-recovery cycles.',
    contract='contract.md', proof_review='review.md', qualification='qualification-summary.json',
    retention='retention-decision.json', ideas='idea-ledger.json', reconstruction='source-reconstruction.json',
    performance='benchmark-summary.json', dependency_performance='dependency-costs-v1/summary.json',
    dependency_outcomes='dependency-summary.json', independent_oracles=['scalar-oracle.json', 'endpoint-oracle.json'],
    benchmark_helpers=json.loads((OUT / 'benchmark-helpers.json').read_text()),
    frontier='continuation-frontier.json', growth='growth-summary.json',
    properties=['P1','P2','P3','P4','P5','P6','P8','P9','P10','P11','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P38','P39'],
    evidence_files=files, documents={p: sha(ROOT / p) for p in documents},
    limitation='Scoped exact-completion extension. All failed/adverse evidence retained, with three unresolved cone diagnostics and inherited external-owner failures. No broad optimization, total-resource, package, complete work-package or pre-push claim; no push.')
(OUT / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
print('bound evidence files:', len(files))
