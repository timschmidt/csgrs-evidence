"""Bind the integration checks to their source and retained executable identities."""
import hashlib
import json
import re
import subprocess
from pathlib import Path

from check import OUT, ROOT, hashes


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT).decode().strip()


def read(path):
    return json.loads(path.read_text())


def write(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


pre = read(OUT / 'premerge.json')
assert git('rev-parse', 'HEAD') == pre['head']
assert git('rev-parse', 'MERGE_HEAD') == pre['upstream']
assert not git('diff', '--name-only', '--diff-filter=U')
source = hashes()
write('final-source.json', source)
attempts = read(OUT / 'attempts.json')
assert len(attempts) == 24
for row in attempts:
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    original = read(OUT / row['source'])
    row['source_differences_from_final'] = sorted(
        key for key in source.keys() | original.keys() if source.get(key) != original.get(key))
    assert not row['source_differences_from_final'], row['label']
    matches = re.findall(r'test result: \w+\. (\d+) passed; (\d+) failed; (\d+) ignored',
                         (OUT / row['log']).read_text())
    if matches:
        row['test_totals'] = dict(zip(['passed', 'failed', 'ignored'],
            [sum(int(match[i]) for match in matches) for i in range(3)]))

old = OUT.parent / '2026-10-16-step-analytic-export'
executables = read(old / 'benchmark-v2/executables.json')
build = next(row for row in attempts if row['label'] == 'retained-benchmarks-build')
assert build['command'] == executables['build']['command']
artifacts = {}
for line in (OUT / build['log']).read_text().splitlines():
    if not line.startswith('{'):
        continue
    record = json.loads(line)
    if record.get('reason') != 'compiler-artifact' or not record.get('executable'):
        continue
    name = record['target']['name']
    if name not in executables['candidate']:
        continue
    path = Path(record['executable'])
    prior = executables['candidate'][name]
    current = dict(path=str(path), bytes=path.stat().st_size,
                   sha256=digest(path), features=record['features'])
    for key in ['bytes', 'sha256', 'features']:
        assert current[key] == prior[key], (name, key, current[key], prior[key])
    artifacts[name] = dict(previous=prior, current=current, identical=True)
assert artifacts.keys() == executables['candidate'].keys()
assert len(artifacts) == 10
previous_cost = read(old / 'new-export-costs-v2/summary.json')['executable']
assert artifacts['analytic_export']['current']['sha256'] == previous_cost['sha256']
exports = []
for path in sorted((OUT / 'exports').glob('*.step')):
    previous = old / 'exports' / path.name
    assert path.read_bytes() == previous.read_bytes(), path.name
    exports.append(dict(file=path.name, bytes=path.stat().st_size, sha256=digest(path), identical=True))
assert len(exports) == 7
write('retained-artifacts.json', dict(
    historical_record='../2026-10-16-step-analytic-export/manifest.json',
    build=build, executables=artifacts, exports=exports,
    scope='Same build command, feature sets, executable bytes and STEP bytes. No fresh timing campaign or generalized performance claim. Historical measurements retain their original host, sampling limits and adverse observations.'))

# These comparisons run before staging this integration's documentation. No
# BREP or dependency file was changed by the upstream merge itself.
trees = {}
for name, previous in pre['premerge_trees'].items():
    # An index contains file entries, not a directly addressable directory tree.
    changes = git('diff', '--cached', pre['head'], '--name-only', '--', 'crates/' + name)
    assert not changes, (name, changes)
    trees[name] = dict(previous=previous, merged_index_changes=[], identical=True)
rules = {}
for path, previous in pre['normative_blobs'].items():
    current = git('rev-parse', ':' + path)
    upstream = git('rev-parse', pre['upstream'] + ':' + path)
    assert previous == current == upstream, path
    rules[path] = dict(previous=previous, merged_index=current, upstream=upstream)
ledger = read(ROOT / 'docs/properties-status.json')
upstream = json.loads(git('show', pre['upstream'] + ':docs/properties-status.json'))
for value in [ledger, upstream]:
    value['current_work'].pop('hyperbrep', None)
assert ledger == upstream
stashes = git('stash', 'list', '--format=%H').splitlines()
assert all(value in stashes for value in pre['stashes'])
incoming = git('log', '--format=%H %s', pre['head'] + '..' + pre['upstream']).splitlines()
write('integration.json', dict(
    parents=[pre['head'], pre['upstream']], incoming_commits=incoming,
    crate_trees_before_local_documentation=trees, normative_blobs=rules,
    unrelated_ledger_matches_upstream=True, preserved_stashes=pre['stashes']))
write('manifest.json', dict(
    baseline=pre['head'], upstream=pre['upstream'], source='final-source.json',
    contract='contract.md', integration='integration.json', qualification=attempts,
    retained_artifacts='retained-artifacts.json',
    wasm=read(OUT / 'wasm-runtime-1.log'),
    cost_scope='Ten benchmark executables and seven complete STEP artifacts are byte-identical to the previous qualified BREP increment. Its recorded costs retain their original scope; no timing campaign was rerun.',
    limits='Scoped integration, not a full workspace/pre-push, shipped-package/MSRV/binding, runtime fuzz/ASan/lexicase, coverage or formal-verification campaign. All 28 work packages remain open. No push.'))
print(json.dumps(dict(commands=len(attempts), identical_executables=len(artifacts),
                      identical_exports=len(exports), unchanged_crate_trees=len(trees))))
