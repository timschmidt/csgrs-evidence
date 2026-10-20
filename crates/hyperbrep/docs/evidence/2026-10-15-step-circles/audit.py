"""Check changed documentation targets, open gates and byte-preserved fixtures."""
import hashlib
import json
import re
import subprocess
from check import ROOT, OUT, hashes

changed = subprocess.check_output(['git', 'diff', '--name-only', 'HEAD'], cwd=ROOT, text=True).splitlines()
paths = sorted({ROOT / p for p in changed if p.endswith('.md')})
count = 0
missing = []
for path in paths:
    for target in re.findall(r'\]\(([^)]+)\)', path.read_text()):
        target = target.split('#')[0]
        if not target or ':' in target:
            continue
        count += 1
        if not (path.parent / target).exists():
            missing.append([str(path.relative_to(ROOT)), target])
assert not missing, missing

ledger_path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
ledger = json.loads(ledger_path.read_text())
assert len(ledger['work_packages']) == 28 and not ledger['complete']
assert all(p['status'] != 'complete' for p in ledger['work_packages'])
increment = ledger['increments'][-1]
assert increment['id'] == 'step-direct-circles'
for path in increment['source_files'] + [increment['source'], increment['evidence']]:
    assert (ledger_path.parent / path).exists(), path
properties = json.loads((ROOT / 'docs/properties-status.json').read_text())
assert (ROOT / properties['current_work']['hyperbrep']['latest_evidence']).exists()
assert hashes() == json.loads((OUT / 'final-source.json').read_text())

fixtures = ROOT / 'crates/hyperbrep-io/tests/fixtures'
original = OUT.parent / '2026-10-15-periodic-cylinder/research/occt-cylinder.step'
assert original.read_bytes() == (fixtures / 'occt-cylinder-off-carrier.step').read_bytes()
for row in json.loads((OUT / 'axis-occt-read.json').read_text())['fixtures']:
    assert hashlib.sha256((fixtures / (row['name'] + '.step')).read_bytes()).hexdigest() == row['sha256']
for row in json.loads((OUT / 'diagnostic-restoration.json').read_text())['files']:
    assert hashlib.sha256((ROOT / row['path']).read_bytes()).hexdigest() == row['sha256']

result = dict(
    documents=[str(p.relative_to(ROOT)) for p in paths],
    local_documentation_targets=count, missing=missing, open_work_packages=28,
    source_matches_final=True, independent_fixture_bytes_preserved=True,
    temporary_native_diagnostics_removed=True,
    formatting='preserved-data-whitespace.json records intentional original raw-data whitespace; code/documentation checks are separate.',
)
(OUT / 'documentation-audit.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
