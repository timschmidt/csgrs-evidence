"""Retain the explicitly UNQUALIFIED incoming integration and research.

This never relaxes collect_evidence.py's completed-integration admission gate.
The completed main publication has a separate source and qualification record.
"""
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
OLD = ROOT / 'target/prepush-20261105'
OUT = ROOT / 'target/evidence-closeout-staging-20261105/docs/evidence/2026-11-05-integration-review'
run = subprocess.run(['python3',str(HERE/'audit_gates.py')],stdout=subprocess.PIPE,text=True)
audit = json.loads((HERE/'gate-audit.json').read_text())
assert run.returncode == 1 and set(audit['failed']) == {115,123}
assert (HERE/'publication-scope-decision.json').is_file()
assert json.loads((HERE/'sign-index-cost/summary.json').read_text())['all_processes_completed']
if OUT.exists():
    raise SystemExit('Refuse to overwrite '+str(OUT))
OUT.mkdir(parents=True)
inventory = []
def copy(path, relative):
    destination = OUT / relative
    destination.parent.mkdir(parents=True, exist_ok=True)
    if path.is_symlink():
        destination.symlink_to(os.readlink(path))
        inventory.append({'path':str(relative),'symlink':os.readlink(path)})
    else:
        assert path.suffix != '.crate', path
        shutil.copy2(path,destination)
        inventory.append({'path':str(relative),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()})
def tree(path, relative):
    for entry in sorted(path.rglob('*')):
        if entry.is_file() or entry.is_symlink():
            copy(entry,Path(relative)/entry.relative_to(path))

for p in sorted(HERE.iterdir()):
    if p.is_file() and p.suffix in {'.py','.json','.jsonl','.log','.tsv','.txt','.toml','.patch'}:
        copy(p,Path('review-campaign')/p.name)
for p in sorted(OLD.iterdir()):
    if p.is_file() and p.suffix in {'.py','.json','.jsonl','.log','.tsv','.txt','.toml','.patch'}:
        copy(p,Path('earlier-attempts')/p.name)
for name in ['brep-fixed-source','brep-combined-source','brep-external-downstream']:
    tree(OLD/name,Path('brep-components')/name)
for name in ['brep-cost','sign-index-cost']:
    tree(HERE/name,Path('cost')/name)
for p in sorted((HERE/'package-cache-reproduction').iterdir()):
    if p.is_file(): copy(p,Path('package-cache-counterexample')/p.name)
tree(Path('/tmp/csgrs-brep-external-20261104'),'original-external-snapshot')
coverage = HERE/'coverage-hypersolve-external'
for p in sorted(coverage.iterdir()):
    if p.is_file(): copy(p,Path('incoming-solver-coverage')/p.name)
raw=[{'path':p.name,'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in sorted((coverage/'profraw').glob('*.profraw'))]
(OUT/'incoming-solver-coverage/raw-profile-inventory.json').write_text(json.dumps(raw,indent=2)+'\n')
d03=ROOT/'target/d03-20261105'
for p in sorted(d03.iterdir()):
    if p.is_file():copy(p,Path('d03-preflight')/p.name)
tree(d03/'controls','d03-preflight/controls')
(OUT/'README.md').write_text('''# Incoming integration review — unqualified

The incoming BRep integration is **not admitted or merged into main**. Its
unchanged nonlinear transverse-recut fixture did not complete within the
90-minute CI job envelope. The local controls overshot that envelope before
external termination; they are not typed exhaustion or geometric success.
Partial and interrupted all-feature root runs are also failures, not passes.
The original strict completed-integration collector remains unchanged and
correctly refuses this record as admission evidence. Main publication uses a
separate source and complete gate audit.

The original external 120-file snapshot, complete binary-safe source patches
from public main ancestor 41fb7657dc, actual revisions, exact source hashes,
failed attempts, corrections and diagnostic samples remain. Apply the patches
in their declared base order to reproduce source trees; the research refs are
preserved locally and are not pushed as qualified code. No fixture or assertion
was ignored or weakened to make the integration pass.

Component results include the finite 3,171-test native curve corpus (37 existing
ignores), downstream/resource checks, incoming solver coverage and stable/MSRV
package consumers. They do not establish full BRep operation closure. The old
staged-source cache defect is reproduced independently and corrected in the
separate main release-validation changes. Old trait-owner package results have
a source-cache limitation; clean consumers patched to unpacked owner packages
still tested the actual owner source. Main's fresh-cache package verification
provides the stronger current-source evidence.

The rational-sign index passes 1,366 MSRV solver tests and all 15 matched BRep
ordinary workloads in three fresh processes per variant/bench. Exact receipts
agree. Requested allocation changes are retained, as are adverse timings
(including a 1.0694 median ratio on one short workload). No overall speedup,
peak-memory bound or nonlinear-recut completion is claimed. It stays separate
from main. Indexing moved stack samples away from linear proof lookup; large
exact arithmetic and unbounded equality refinement remained.

The compact recut diagnostic retains F(alpha,v)=32alpha+16v²−16v−10 with alpha
selected by −1+3alpha−alpha²=0 and an exact computed boundary beta. It records
repeated refinement with no nonzero certificate; interval refinement cannot
prove equality. A rejected Debug formatter expanded a shared scalar graph;
its partial output and termination are preserved. Scalar bounds in compact
logs are certified cached enclosures for diagnosis, not substituted geometry.

The final endpoint proof-order candidate has three passing MSRV owner tests,
including an unchanged pre-fix zero-budget counterexample and a retraced-curve
negative preimage guard. Its full nonlinear recut/downstream suite has not
qualified. The earlier bounded-domain candidate still found endpoint equality
Unknown and continued refining. Required correlated construction/selector/chart
proofs remain open. Initial incorrect test assumptions and compilation errors
remain labelled and uncredited.

D03 records a checksum-verified portable Manifold tool, two successful holed
geometry probes and all 524 pinned corpus source hashes. No full native
comparison harness or corpus comparison ran. Exported OFF/SVG have no proved
source-fidelity bound. The unchanged native B-text case still times out.
Neither D03 nor the nonlinear integration is marked complete.

Compiler binaries/caches, downloaded tools, third-party crate archives,
duplicate coverage HTML and raw individual profile files are excluded. Merged
coverage and profile inventories remain. Package digests were captured before
compiler-output reuse; no package bytes are redistributed.
''')
(OUT/'retained-files.json').write_text(json.dumps({'created':time.time(),'qualification':'UNQUALIFIED research; never completed-integration admission','files':inventory},indent=2)+'\n')
print(json.dumps({'record':str(OUT),'files':len(inventory)+3,'copied_bytes':sum(x.get('bytes',0) for x in inventory),'largest':max(x.get('bytes',0) for x in inventory)}))
