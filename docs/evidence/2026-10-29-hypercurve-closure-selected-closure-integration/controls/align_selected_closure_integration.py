"""Align proven source to finalized parents, changing only evidence receipts."""
from pathlib import Path
import difflib
import hashlib
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'selected-closure-integration'
evidence = r.parents[1].parent / 'csgrs-evidence.git'
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
metadata = {'crates/hypercurve/CHANGELOG.md', 'crates/hypersolve/CHANGELOG.md', 'crates/hypercurve/qualification/capabilities.json'}
record_path = c / 'selected-closure-integration-parent-alignment.json'
assert not record_path.exists()

def load(path):
    return json.loads(path.read_text())

def git(*args):
    return subprocess.check_output(['git', *args], cwd=w, text=True).strip()

prepared = load(c / 'selected-closure-integration-candidate-prepared.json')
ready = load(c / 'selected-closure-integration-ready.json')
run = c / 'selected-closure-integration-qualification-final1'
qualification = load(run / 'complete.json')
rows = load(run / 'results.json')
assert qualification['all_passed'] and qualification['groups'] == len(rows) == 25
assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
assert ready['all_local_qualification_and_receipt_checks_passed']
finals = ready['increments']
parent = ready['base']
assert parent == finals['selected-query-fibers']['commit']
publication_dir = r / 'prepush-selected-fields'
publication = load(publication_dir / 'publication-final-commit.json')
publication_ready = load(publication_dir / 'publication-ready.json')
assert publication_ready['code'] == publication['head'] and publication_ready['evidence'] == publication['evidence']
assert publication_ready['qualified_groups'] == 328 and publication_ready['payload_scoped']
assert publication['qualified_code'] == finals['selected-polynomial-points']['parent']
assert set(git('diff', '--name-only', publication['qualified_code'], publication['head']).splitlines()) == receipts
assert set(git('diff', '--name-only', prepared['base'], parent).splitlines()) == receipts

spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files, patch = e.source_snapshot()
assert before == qualification['source'] == prepared['source']
assert files == load(run / 'files-before.json') == load(run / 'files-after.json')
assert git('rev-parse', 'HEAD') == prepared['base']
implementation = set(prepared['working_changes'])
assert set(git('diff', '--name-only', 'HEAD').splitlines()) == implementation
assert not git('ls-files', '--others', '--exclude-standard')

compatibility = {
    'crates/hypercurve/tests/selected_query_derivatives.rs': ('parameter: BezierParameter2::Exact(Real::from(n)),', 'parameter: BezierParameter2::Exact(Real::from(n)).into(),'),
    'crates/hypercurve/tests/rational_query_guards.rs': ('parameter: BezierParameter2::Exact(value.into()),', 'parameter: BezierParameter2::Exact(value.into()).into(),'),
}
for name, original in prepared['inputs'].items():
    final = finals[name]
    assert final['qualification'] == original['source']
    for path in prepared['applied'][name]['paths']:
        if path in metadata:
            continue
        data = subprocess.check_output(['git', 'show', final['commit'] + ':' + path], cwd=w)
        if path in compatibility:
            old, new = compatibility[path]
            assert data.decode().count(old) == 1
            data = data.decode().replace(old, new, 1).encode()
        assert data == (w / path).read_bytes(), path

# Merge immutable evidence histories without a worktree or shared index. Each
# validated increment adds its own record; a conflict or deletion is an error.
merge_order = ready['merge_order']
evidence_parents = [finals['selected-query-fibers']['evidence_commit']]
evidence_parents.extend(finals[name]['evidence_commit'] for name in merge_order)
evidence_parents.append(publication['evidence'])
evidence_record_path = c / 'selected-closure-integration-evidence-parents.json'
egit = ['git', '--git-dir=' + str(evidence)]
if evidence_record_path.exists():
    evidence_record = load(evidence_record_path)
    assert evidence_record['parents'] == evidence_parents
else:
    merged = evidence_parents[0]
    merges = []
    for incoming in evidence_parents[1:]:
        result = subprocess.run([*egit, 'merge-tree', '--write-tree', merged, incoming], text=True, capture_output=True)
        assert result.returncode == 0, result.stdout + result.stderr
        tree = result.stdout.splitlines()[0]
        assert len(tree) == 40
        commit = subprocess.check_output([*egit, 'commit-tree', tree, '-p', merged, '-p', incoming, '-m', 'Combine validated selected closure evidence'], text=True).strip()
        assert not subprocess.check_output([*egit, 'diff', '--diff-filter=D', '--name-only', merged, commit], text=True).strip()
        merges.append({'first':merged, 'second':incoming, 'tree':tree, 'commit':commit})
        merged = commit
    branch = 'refs/heads/hypercurve-selected-closure-integration-parents-evidence-2026-10-29'
    subprocess.run([*egit, 'update-ref', branch, merged, '0' * 40], check=True)
    evidence_record = {'parents':evidence_parents,'commit':merged,'branch':branch,'merges':merges,'epoch':time.time()}
    e.save_json(evidence_record_path, evidence_record)

def merge_receipt_insertions(path, baseline, incoming):
    old, new = baseline.splitlines(keepends=True), incoming.splitlines(keepends=True)
    text = path.read_text()
    for op, i, j, a, b in difflib.SequenceMatcher(a=old, b=new, autojunk=False).get_opcodes():
        if op == 'equal':
            continue
        assert op == 'insert' and i == j, (path, op, i, j)
        anchor = ''.join(old[i:i+4])
        assert anchor and text.count(anchor) == 1, (path, anchor)
        addition = ''.join(new[a:b])
        assert addition not in text
        text = text.replace(anchor, addition + anchor, 1)
    path.write_text(text)

subprocess.run(['git', 'reset', '--mixed', parent], cwd=w, check=True)
for name in receipts:
    (w / name).write_bytes(subprocess.check_output(['git', 'show', parent + ':' + name], cwd=w))
receipt_inputs = [(finals[name]['parent'], finals[name]['commit']) for name in merge_order]
receipt_inputs.append((publication['qualified_code'], publication['head']))
for base, head in receipt_inputs:
    for path in sorted(receipts - {'docs/evidence-archive.tsv'}):
        old = subprocess.check_output(['git', 'show', base + ':' + path], cwd=w, text=True)
        new = subprocess.check_output(['git', 'show', head + ':' + path], cwd=w, text=True)
        merge_receipt_insertions(w / path, old, new)
path = w / 'docs/evidence-archive.tsv'
excluded = [line for line in path.read_text().splitlines() if line.startswith('excluded:')]
assert len(excluded) == 4
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', str(evidence), evidence_record['commit']], cwd=w, text=True).splitlines()
assert not any(line.startswith('excluded:') for line in manifest)
path.write_text('\n'.join(manifest + excluded) + '\n')
subprocess.run(['git','add','-N','crates/hypercurve/tests/selected_query_derivatives.rs','crates/hypercurve/tests/rational_query_guards.rs'], cwd=w, check=True)
after, after_files, _ = e.source_snapshot()
assert [row for row in files if row[0] not in receipts] == [row for row in after_files if row[0] not in receipts]
assert set(git('diff','--name-only','HEAD').splitlines()) == implementation | receipts
assert not git('ls-files','--others','--exclude-standard')
code_parents = [parent, *(finals[name]['commit'] for name in merge_order), publication['head']]
record = {'qualified':before,'aligned':after,'parent':parent,'code_parents':code_parents,'evidence_parent':evidence_record['commit'],'evidence_parents':evidence_parents,'changed_since_qualification':sorted(receipts),'all_nonreceipt_bytes_unchanged':True,'predecessor_implementation_correspondence_checked':True,'source_reconstruction':'The original private source checkpoint, applied predecessor patches, declared two parameter conversions, new fixture sources, final source patch and file inventories reconstruct the qualified candidate. Final parent alignment changes only three evidence receipts.','epoch':time.time()}
e.save_json(record_path, record)
e.save_json(c / 'selected-closure-integration-aligned-files.json', after_files)
print(json.dumps(record,indent=2))
