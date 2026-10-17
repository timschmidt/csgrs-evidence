"""Compare every existing diagnostic slot; do not equate diagnostics with proofs."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

OLD = OUT.parent/'2026-10-16-prism-continuation'
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

frontier = []
for before in json.loads((OLD/'continuation-frontier.json').read_text())['rows']:
    name, text = log(f"final-{before['family']}-{before['rotation']}")
    operation = before['operation']
    bodies = dict(re.findall(r'^(\S+): bodies=(\d+)$', text, re.M))
    errors = dict(re.findall(r'^(\S+): error=(.*)$', text, re.M))
    replays = dict(re.findall(r'^(\S+): replay=(.*)$', text, re.M))
    item = {k: before[k] for k in ['family', 'rotation', 'operation']}
    item['log'] = name
    if operation in bodies:
        assert replays[operation].startswith('Ok(')
        item.update(outcome='native_result', bodies=int(bodies[operation]), replay=replays[operation])
    elif operation in errors:
        error = errors[operation]
        outcome = ('resource_exhaustion' if 'Exhausted' in error else
                   'undecided' if any(t in error for t in ['PredicateUnresolved', 'RealSign']) else
                   'construction_rejected' if 'NonManifoldSolidEdge' in error else 'unsupported')
        item.update(outcome=outcome, error=error)
    else:
        item['outcome'] = 'not_attempted_after_prerequisite_failure'
    assert item['outcome'] == before['outcome'], (before, item)
    if item['outcome'] == 'native_result':
        assert item['bodies'] == before['bodies'] and item['replay'] == before['replay']
    frontier.append(item)
assert len(frontier) == 81
write('continuation-frontier.json', dict(rows=frontier,
    counts=dict(Counter(r['outcome'] for r in frontier)), all_prior_outcomes_preserved=True,
    scope='All 81 original slots and full-size inputs; native result/replay is a diagnostic, not an independent set proof.'))

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
print(json.dumps(dict(frontier=Counter(r['outcome'] for r in frontier), preceding=len(preceding),
                      prisms=Counter(r['outcome'] for r in prisms)), indent=2))
