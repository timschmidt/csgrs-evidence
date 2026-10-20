"""Compare every existing diagnostic slot; do not equate diagnostics with proofs."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

OLD = OUT.parent/'2026-10-17-curved-continuation'
attempts = json.loads((OUT/'attempts.json').read_text())
source = hashes()
inputs = [Path(__file__), OLD/'continuation-frontier.json', OLD/'prism-frontier.json']

def log(label):
    row = [r for r in attempts if r['label'] == label][-1]
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    assert json.loads((OUT/row['source']).read_text()) == source, label
    inputs.append(OUT/row['log'])
    return row['log'], (OUT/row['log']).read_text()

def write(name, rows):
    (OUT/name).write_text(json.dumps(rows, indent=2)+'\n')

_, text = log('preceding-frontier')
preceding = [dict(fixture=a, operation=b, bodies=int(c))
             for a, b, c in re.findall(r'^(\S+) (\S+): Ok\((\d+)\)$', text, re.M)]
assert len(preceding) == 15 and 'Err(' not in text
write('preceding-frontier.json', preceding)

prisms = []
before = {r['fixture']: r for r in json.loads((OLD/'prism-frontier.json').read_text())['rows']}
for label in sorted({r['label'] for r in attempts if r['label'].startswith('final-prism-')}):
    name, text = log(label)
    fixture = re.search(r'^fixture=(.*)$', text, re.M)[1]
    item = dict(fixture=fixture, log=name)
    error = re.search(r'^error=(.*)$', text, re.M)
    if error:
        item.update(outcome='unsupported', error=error[1])
    else:
        item.update(outcome='native_result', bodies=int(re.search(r'^bodies=(\d+)$', text, re.M)[1]))
        assert re.search(r'^replay=Ok\(', text, re.M)
        export = re.search(r'^step_bytes=(\d+)$', text, re.M)
        blocker = re.search(r'^step_error=(.*)$', text, re.M)
        item['step'] = 'exported' if export else 'unsupported' if blocker else 'canonical_empty'
        if export:
            item['step_bytes'] = int(export[1])
        if blocker:
            item['step_error'] = blocker[1]
    for key in ['outcome', 'bodies', 'step', 'step_bytes']:
        assert item.get(key) == before[fixture].get(key), (fixture, key, item, before[fixture])
    prisms.append(item)
assert len(prisms) == len(before) == 24
write('prism-frontier.json', dict(rows=prisms,
    counts=dict(Counter(r['outcome'] for r in prisms)), all_prior_outcomes_preserved=True,
    scope='All 24 original diagnostics. Independent exact expectations remain in the unchanged native/WASM acceptance suites.'))
write('frontier-analysis-inputs.json', {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
                                      for p in sorted(set(inputs))})
print(json.dumps(dict(preceding=len(preceding), prisms=dict(Counter(r['outcome'] for r in prisms)))))
