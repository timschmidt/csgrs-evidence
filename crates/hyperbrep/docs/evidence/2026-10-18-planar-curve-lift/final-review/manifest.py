"""Bind final source, evidence and documents without circular hashes."""
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
    'crates/hyperbrep/README.md',
    'crates/hyperbrep/docs/ARCHITECTURE.md', 'crates/hyperbrep/docs/SUPPORT_MATRIX.md',
    'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md', 'crates/hyperbrep/docs/SELECTED_ARCHIVE.md',
    'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json',
    'crates/hyperbrep/PERFORMANCE.md', 'docs/properties-status.json',
]
excluded = {'manifest.json', 'final-audit.json', 'staged-whitespace.json'}
files = {str(p.relative_to(OUT)): digest(p) for p in sorted(OUT.rglob('*'))
         if p.is_file() and str(p.relative_to(OUT)) not in excluded}
manifest = dict(baseline='7510a3603805364cf5409dd9efbcf0d7f4a0c201',
    upstream='540074a8c05ccc676d7c70b8f0093f98804b81d9',
    source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    source='final-source.json', decision='Keep finite exact planar lift and cap extrusion extension; no optimization or release-ready claim.',
    contract='contract.md', proofs='proofs.md', decisions='ideas.md', qualification='qualification-summary.json',
    consumers='consumers.json', artifacts='artifact-preservation.json',
    new_artifacts=len(json.loads((OUT/'planar-artifacts.json').read_text())['rows']),
    costs=['consumer-costs.json', 'new-costs.json'], resources='resource-review.json',
    reconstruction='source-reconstruction.json', remaining='next-domains.md',
    evidence_files=files, documents={name: digest(ROOT/name) for name in documents},
    excluded_administrative_files=sorted(excluded),
    provenance='Reuses existing Hypercurve procedural/selected-root/interval admission and BRep replay. Authored exact fixtures derive their independent expectations in proofs.md. No external kernel source copied; OCCT is an optional preserved-file reader oracle. Prior evidence is referenced without rewriting.',
    limitations='General selected spatial images, arbitrary procedural intersections, full source history, operation-wide resources, installed distribution/MSRV/bindings, coverage/formal/campaign and pre-push gates remain open. All 28 work packages are open/in-progress. No push.')
(OUT/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
print(json.dumps(dict(source_identity=manifest['source_identity'], files=len(files), documents=len(documents)), indent=2))
