"""Bind final source, evidence and public documentation without circular hashes."""
import hashlib
import json
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, hashes

source = hashes()
assert source == json.loads((OUT/'qualification-driver.json').read_text())['source']
(OUT/'final-source.json').write_text(json.dumps(source, indent=2)+'\n')
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
documents = [
    'crates/hyperbrep/README.md', 'crates/hypercurve/README.md',
    'crates/hyperbrep/docs/ARCHITECTURE.md', 'crates/hyperbrep/docs/SUPPORT_MATRIX.md',
    'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md', 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json',
    'crates/hyperbrep/PERFORMANCE.md', 'crates/hypercurve/PERFORMANCE.md',
    'docs/properties-status.json',
]
excluded = {'manifest.json', 'audit.json', 'staged-whitespace.json'}
files = {str(path.relative_to(OUT)): digest(path) for path in sorted(OUT.rglob('*'))
         if path.is_file() and str(path.relative_to(OUT)) not in excluded}
manifest = dict(baseline='5de11cdf22322b326fb995e72b6267d18be20373',
    upstream='540074a8c05ccc676d7c70b8f0093f98804b81d9',
    source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    source='final-source.json', decision='Keep finite exact-completion extension; no optimization or release-ready claim',
    contract='contract.md', proofs='proofs.md', decisions='ideas.md', qualification='qualification-summary.json',
    consumers='consumers.json', artifacts='artifact-preservation.json', costs=['consumer-costs.json', 'new-costs.json'],
    resources='resource-review.json', reconstruction='source-reconstruction.json', remaining='next-domains.md',
    evidence_files=files, documents={name: digest(ROOT/name) for name in documents},
    excluded_administrative_files=sorted(excluded),
    provenance='Uses existing Hypercurve root/subcurve/integration proofs and BREP validation. Independent authored fixtures derive exact identities in proofs.md and research.md; no external kernel algorithm source copied. OCCT is an optional unchanged-file reader oracle. Prior evidence is referenced without rewriting.',
    limitations='All broader work-package, source-history, resource, distribution/MSRV/binding, coverage/formal/fuzz/ASan/lexicase and pre-push gates remain open. Source-path consumers are not installed distributions. No push.')
(OUT/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
print(json.dumps(dict(source_identity=manifest['source_identity'], files=len(files), documents=len(documents)), indent=2))
