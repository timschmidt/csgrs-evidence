"""Final source, merge ownership, preserved evidence and documentation checks."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[4]
sys.path.insert(0, str(OUT))
from qualify import ENV, hashes
from ledger_spans import replace_brep

read = lambda path: json.loads(path.read_text())
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
manifest = read(OUT / 'manifest.json')
assert manifest['decision'] == 'kept'
assert git('rev-parse', 'HEAD').decode().strip() == manifest['baseline']
assert git('rev-parse', 'MERGE_HEAD').decode().strip() == manifest['upstream']
assert git('branch', '--show-current').strip() == b'brep'
assert not git('diff', '--name-only', '--diff-filter=U')
source = hashes()
assert source == read(OUT / manifest['source'])
for row in manifest['qualification']:
    assert row['exit_code'] == 0 and row['source_unchanged']
    assert read(OUT / row['source']) == source
for name, expected in manifest['script_inputs'].items():
    assert digest(OUT / name) == expected

baseline = manifest['baseline']
upstream = manifest['upstream']
assert not git('diff', baseline, '--', 'crates/hyperbrep/src', 'crates/hyperbrep-io/src',
    'crates/hyperreal', 'crates/hyperlimit', 'crates/hypercurve', 'crates/hypersolve',
    'crates/hyperlattice', 'crates/hypermesh', 'crates/hypertri', 'Cargo.lock',
    'properties.md', 'docs/admission.md', 'AGENTS.md')
assert not git('diff', baseline, '--', 'crates/hyperbrep/docs/evidence/2026-10-16-prism-continuation')
ledger = read(ROOT / 'docs/properties-status.json')
raw_upstream_ledger = git('show', upstream + ':docs/properties-status.json').decode()
assert (ROOT / 'docs/properties-status.json').read_text() == replace_brep(
    raw_upstream_ledger, ledger['current_work']['hyperbrep'])
expected = json.loads(raw_upstream_ledger)
for value in [ledger, expected]:
    value['current_work'].pop('hyperbrep', None)
assert ledger == expected
status = read(ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
stashes = git('stash', 'list', '--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(stashes)

incoming = git('diff', '--name-only', read(OUT / 'merge-review.json')['previous_upstream'], upstream).decode().splitlines()
# The local branch has no modifications to any incoming file except its ledger entry.
incoming_unchanged = [name for name in incoming if name != 'docs/properties-status.json']
assert not git('diff', upstream, '--', *incoming_unchanged)
changed = git('diff', '--name-only', baseline).decode().splitlines()
untracked = git('ls-files', '--others', '--exclude-standard').decode().splitlines()
local = sorted(set(changed + untracked) - set(incoming))
allowed = {'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md', 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'}
prefix = str(OUT.relative_to(ROOT)) + '/'
assert all(name in allowed or name.startswith(prefix) for name in local), local

wasm_project = Path('/tmp/hyperbrep-prism-wasm-probe')
old = OUT.parent / '2026-10-16-prism-continuation'
external = {}
for name, copied in [('Cargo.toml','Cargo.toml'), ('Cargo.lock','Cargo.lock'),
                      ('lib.rs','src/lib.rs'), ('faceted.rs','src/faceted.rs'), ('run.py','run.py')]:
    original = old / 'wasm-probe' / name
    actual = wasm_project / copied
    assert original.read_bytes() == actual.read_bytes()
    external[str(actual)] = digest(actual)
wasm = Path(ENV['CARGO_TARGET_DIR']) / 'wasm32-unknown-unknown/release/hyperbrep_prism_wasm_probe.wasm'
assert digest(wasm) == manifest['wasm']['wasm_sha256']

documents = [OUT / 'README.md', ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md']
links = []
for path in documents:
    for _, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', path.read_text()):
        if '://' in target or target.startswith('#'):
            continue
        destination = path.parent / target.split('#')[0]
        assert destination.exists() or destination == OUT / 'audit.json', (path, target)
        links.append(dict(document=str(path.relative_to(ROOT)), target=target))
for path in OUT.glob('*.json'):
    read(path)
checks = []
for command in [['cargo','fmt','--all','--','--check'], ['git','diff','--check'],
                ['git','diff','--cached','--check','--','crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
                 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json','docs/properties-status.json',str(OUT.relative_to(ROOT))]]:
    result = subprocess.run(command, cwd=ROOT, env=ENV, text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=300)
    assert result.returncode == 0, (command, result.stdout)
    checks.append(dict(command=command, exit_code=result.returncode, output=result.stdout))
report = dict(source_identity=manifest['source_identity'], source_matches_qualification=True,
    unchanged_brep_and_dependency_runtime=True, incoming_files_match_upstream=len(incoming)-1,
    other_upstream_ledger_entries_preserved=True, prior_prism_evidence_unchanged=True,
    local_changed_paths=local, open_work_packages=28, preserved_stashes=stashes,
    documents={str(path.relative_to(ROOT)):digest(path) for path in documents}, links=links,
    wasm_inputs=external, wasm_binary_unchanged=True, final_checks=checks,
    scope='Local integration audit. Incoming upstream evidence retains its original bytes, including historical failed diagnostics. No whole-history artifact, remote-link, full-workspace or pre-push admission.')
(OUT / 'audit.json').write_text(json.dumps(report, indent=2) + '\n')
assert hashes() == source
print(json.dumps(dict(incoming_files=len(incoming), local_paths=len(local), open_work_packages=28)))
