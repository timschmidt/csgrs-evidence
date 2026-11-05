"""Qualify actual main executions and exact unchanged dependency scopes.

Every attempt keeps its actual revision and raw log. Never count an incomplete
or failed command, or unqualified BRep source, as a passing main execution.
"""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
ROOT = Path('/tmp/csgrs-main-qualified-20261105')
OLD = REPO / 'target/prepush-20261105'

def records(path):
    return [json.loads(line) for line in path.read_text().splitlines()] if path.exists() else []

def latest(rows):
    return {row['sequence']: row for row in rows}

def effective(command):
    if 'cargo install' in command or 'cargo +stable install' in command:
        return command.replace('install --locked', 'install --root "$PREPUSH_TOOL_ROOT" --locked')
    return command

plans = [json.loads((HERE / name).read_text()) for name in ['plan.json', 'lint-plan.json']]
expected = {row['sequence']: row for plan in plans for row in plan}
assert len(expected) == 280
scope = json.loads((HERE / 'scope-classification.json').read_text())
contract = json.loads((HERE / 'source-contract.json').read_text())
inputs = json.loads((HERE / 'source-inputs.json').read_text())
for path, digest in inputs.items():
    assert hashlib.sha256((ROOT / path).read_bytes()).hexdigest() == digest, path
assert contract['revision'] == scope['revision']
# The publication tree has the intended trait fix and excludes the unqualified
# integration. Every library change against original main is in these six files.
changes = subprocess.check_output(['git', 'diff', '--name-only', scope['base'], contract['revision']], cwd=ROOT, text=True).splitlines()
assert changes == contract['changed_paths']
assert set(p for p in changes if '/src/' in p) == {
    'crates/hypercurve/src/bezier_offset/parallel_construction.rs',
    'crates/hypercurve/src/curve.rs',
    'crates/hypercurve/src/curve_fidelity.rs',
    'crates/hypercurve/src/svg/exact/graph.rs',
    'crates/hypercurve/src/svg/exact/graph/fidelity.rs',
    'crates/hypercurve/src/svg/exact/graph/fidelity/tests.rs',
}
owner = '952b987fe8b23ace512619fb4b1e63ca9d7c17a5'
for path in changes:
    if '/src/' in path or path == 'crates/hypercurve/tests/curve_carrier_traits.rs':
        assert subprocess.check_output(['git','show',owner+':'+path],cwd=ROOT) == (ROOT/path).read_bytes(), path

prior_rows = records(OLD / 'results.jsonl')
current_rows = records(HERE / 'results.jsonl')
for row in prior_rows + current_rows:
    path = REPO / row['log']
    assert hashlib.sha256(path.read_bytes()).hexdigest() == row['log_sha256'], path
prior = latest(prior_rows)
current = latest(current_rows)
unaffected = {row['sequence']: row for row in scope['unaffected']}
qualified, missing, failed = [], [], []
for sequence, item in sorted(expected.items()):
    if sequence in unaffected:
        proof = unaffected[sequence]
        diff = subprocess.check_output(['git','diff','--name-only',scope['base'],contract['revision'],'--',*proof['prefixes']],cwd=ROOT,text=True)
        assert not diff, (sequence,diff)
        row = prior.get(sequence)
        basis = 'actual earlier pass; exact unchanged owner/local-dependency inputs'
        if row:
            assert row['revision'] == scope['base'], (sequence,row['revision'])
    else:
        row = current.get(sequence)
        basis = 'executed on frozen main publication inputs'
        if row:
            assert row['revision'] == contract['revision'], (sequence,row['revision'])
            assert row['source_unchanged'] and row['source_inputs'] == len(inputs), sequence
    if row is None:
        missing.append(sequence)
    elif row['exit_code']:
        failed.append(sequence)
    else:
        assert row['command'] == effective(item['command']), (sequence,row['command'],item['command'])
        qualified.append({'sequence':sequence,'basis':basis,'actual_revision':row['revision'],'log':row['log'],'log_sha256':row['log_sha256']})
result = {'required_commands':len(expected),'qualified':len(qualified),'missing':missing,'failed':failed,'source_revision':contract['revision'],'frozen_input_count':len(inputs),'records':qualified}
(HERE/'gate-audit.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='records'}))
raise SystemExit(bool(missing or failed))
