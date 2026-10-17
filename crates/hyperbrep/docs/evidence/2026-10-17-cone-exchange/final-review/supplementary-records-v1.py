"""Record preserved fixtures, diagnostic controls and the final WASM wrapper."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0,str(OUT))
from check import ROOT, hashes

read = lambda p:json.loads((OUT/p).read_text())
write = lambda p,v:(OUT/p).write_text(json.dumps(v,indent=2)+'\n')
digest = lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
source = hashes()
baseline = read('baseline.json')['baseline']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip() == baseline
attempts = read('attempts.json')
latest = lambda label:next(r for r in reversed(attempts) if r['label']==label)
paths = ['crates/hyperbrep/tests/support/sectors.rs','crates/hyperbrep/tests/support/seam_cuts.rs',
         'crates/hyperbrep-io/tests/support/torus_exchange.rs']
unchanged = {}
for path in paths:
    assert (ROOT/path).read_bytes() == subprocess.check_output(['git','show',f'{baseline}:{path}'],cwd=ROOT)
    unchanged[path] = digest(ROOT/path)
changes = []
for name,description in [
    ('seam_export','Original kind=2 cone half now requires STEP reimport, exact measures, incidence, cold replay and subdivision continuation.'),
    ('coplanar_export','Original kind=2 cone recut and both-half reconstruction now require exact exchange and continuation, with independently integrated full measures.'),
    ('sector_export','Original cone kinds=2,4 now require exact exchange, measures and classifications. The original irrational torus kind=3 remains NonRational with attribution.')]:
    path = f'crates/hyperbrep-io/tests/support/{name}.rs'
    before = subprocess.check_output(['git','show',f'{baseline}:{path}'],cwd=ROOT)
    changes.append(dict(path=path,before_sha256=hashlib.sha256(before).hexdigest(),
        after_sha256=digest(ROOT/path),change=description))
failure = latest('cone-migration-before')
assert failure['exit_code'] != 0
write('fixture-migrations.json',dict(admitted=True,baseline=baseline,source=source,
    unchanged_geometric_fixtures_and_round_trip_oracle=unchanged,changes=changes,
    original_failure=failure,
    positive_acceptance=['native-debug','native-release','native-minimal','wasm-runtime'],
    independent_controls=['Original finite B-spline generator remains unsupported.',
        'Invalid/zero/skew generators, off-carrier points, all-apex faces and malformed pcurves remain typed failures.',
        'Strict unresolved symbolic coplanarity remains undecided under an ambient approximate policy.',
        'Insufficient work/import/output budgets remain explicit; a valid retry completes.',
        'The original irrational torus band and native-valid irrational cone subdivisions retain NonRational export errors.'],
    scope='Stronger-success fixture migration on unchanged modeled inputs. Source-bound commands establish the finite acceptance; ledger edits alone do not.'))

project = Path('/tmp/hyperbrep-cone-exchange-wasm-probe')
binding = {}
for retained,copied in [('Cargo.toml','Cargo.toml'),('Cargo.lock','Cargo.lock'),('lib.rs','src/lib.rs'),('faceted.rs','src/faceted.rs'),('run.py','run.py')]:
    a,b = OUT/'wasm-probe'/retained,project/copied
    assert a.read_bytes() == b.read_bytes()
    binding.update({str(p):digest(p) for p in [a,b]})
assert read('wasm-source-binding.json') == binding
correction = read('wasm-consumer-correction.json')
key = str((OUT/'wasm-probe/lib.rs').relative_to(ROOT))
assert digest(OUT/'final-review/wasm-v1/lib.rs') == correction['changes'][key]['before']
assert binding[str(OUT/'wasm-probe/lib.rs')] == correction['changes'][key]['after']
write('wasm-final-source-binding.json',binding)

prisms = []
for row in attempts:
    if not row['label'].startswith('final-prism-'):
        continue
    data = (OUT/row['log']).read_text()
    error = re.search(r'^error=(.*)$',data,re.M)
    item = dict(fixture=re.search(r'^fixture=(.*)$',data,re.M).group(1),log=row['log'],
        outcome='unsupported' if error else 'native_result')
    if error:
        item['error'] = error.group(1)
    else:
        assert 'replay=Ok(' in data
        item['bodies'] = int(re.search(r'^bodies=(\d+)$',data,re.M).group(1))
        size = re.search(r'^step_bytes=(\d+)$',data,re.M)
        if size:
            item.update(step='exported',step_bytes=int(size.group(1)))
        elif item['bodies']==0:
            item['step'] = 'canonical_empty'
    prisms.append(item)
assert len(prisms)==24
counts = dict(Counter(r['outcome'] for r in prisms))
assert counts == dict(native_result=18,unsupported=6)
old = json.loads((OUT.parent/'2026-10-17-cone-continuation/prism-frontier.json').read_text())
assert sorted(prisms,key=lambda r:r['fixture']) == sorted(old['rows'],key=lambda r:r['fixture'])
write('prism-frontier.json',dict(rows=prisms,counts=counts,
    scope='Original 24-input diagnostic inventory; unsupported controls remain explicit. Independent exact fixture checks and reader artifacts are separate evidence.'))
row = latest('preceding-frontier')
preceding = re.findall(r'^(\S+) (\S+): Ok\((\d+)\)$',(OUT/row['log']).read_text(),re.M)
assert len(preceding)==15
write('preceding-frontier.json',[dict(family=f,operation=o,bodies=int(n),log=row['log']) for f,o,n in preceding])
assert hashes() == source
print('Recorded exact fixture migrations, 24 prism controls, 15 preceding results and final WASM inputs.')
