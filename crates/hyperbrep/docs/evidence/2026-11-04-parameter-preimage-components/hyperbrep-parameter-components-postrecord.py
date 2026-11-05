from pathlib import Path
import subprocess,json,hashlib
s=json.loads(Path('/tmp/hyperbrep-parameter-components-final-source.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in s.items())
roots=[Path('crates',c) for c in ['hypersolve','hypercurve','hyperbrep','hyperbrep-io']]
current={str(p) for root in roots for p in root.rglob('*') if p.is_file() and '.git' not in p.parts and 'target' not in p.parts and p.suffix in ['.rs','.json','.toml'] and 'docs' not in p.parts}
assert current==set(s), 'source file membership changed'
p=Path('crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json');status=json.loads(p.read_text());entry=status['increments'][-1]
assert entry['id']=='parameter-preimage-components-2026-11-04'
assert not status['complete'] and len(status['work_packages'])==28 and all(w['status']!='complete' for w in status['work_packages'])
for key in ['source','regressions']:
 for ref in entry[key]:assert (p.parent/ref).resolve().is_file(),ref
assert (p.parent/entry['evidence'].split('#')[0]).resolve().is_file()
a=entry['evidence_archive'];assert not a['published']
manifest=Path('/tmp/hyperbrep-parameter-components-manifest.tsv').read_text().splitlines()
index=Path('docs/evidence-archive.tsv').read_text().splitlines()
assert all(row in index for row in manifest)
before=Path('/tmp/hyperbrep-parameter-components-index-before.tsv').read_text().splitlines()
assert index[0]==before[0] and len(index)==len(before)+1
assert [row for row in index[1:] if row.split('\t')[0]!=a['record']]==before[1:], 'historical global index changed'
subprocess.run(['python3','scripts/evidence_archive.py','verify',a['local_repository'],a['commit'],'/tmp/hyperbrep-parameter-components-manifest.tsv'],check=True)
subprocess.run(['bash','scripts/check-repository-budget.sh'],check=True)
subprocess.run(['git','diff','--check'],check=True)
print('JSON/links, 28 active work packages, final source fingerprints, nine local records and the complete historical archive index, repository retention budget and diff checks pass')
