from pathlib import Path
import subprocess,json,hashlib
prefix='/tmp/hyperbrep-selected-attachment-final3'
s=json.loads(Path(prefix+'-source.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in s.items())
p=Path('crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json');status=json.loads(p.read_text());entry=status['increments'][-1]
assert entry['id']=='selected-endpoint-chains-2026-11-04'
assert not status['complete'] and len(status['work_packages'])==28 and all(w['status']!='complete' for w in status['work_packages'])
for key in ['source','regressions']:
 for ref in entry[key]:assert (p.parent/ref).resolve().is_file(),ref
ref=entry['evidence'].split('#')[0];assert (p.parent/ref).resolve().is_file()
a=entry['evidence_archive'];assert not a['published']
manifest=Path('/tmp/hyperbrep-selected-attachment-manifest.tsv').read_text().splitlines()
index=Path('docs/evidence-archive.tsv').read_text().splitlines()
assert all(row in index for row in manifest)
subprocess.run(['python','scripts/evidence_archive.py','verify',a['local_repository'],a['commit'],'/tmp/hyperbrep-selected-attachment-manifest.tsv'],check=True)
subprocess.run(['bash','scripts/check-repository-budget.sh'],check=True)
subprocess.run(['git','diff','--check'],check=True)
print('JSON, new ledger links, 28 active work packages, source fingerprints, archive/index, repository retention budget and diff checks pass')
