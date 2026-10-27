from pathlib import Path
import hashlib
import json
import subprocess
import time

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-selected-integration')
base = '5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
l = json.loads((root / 'algebraic-similarity-final-commit.json').read_text())
assert l['commit'] == 'f2d00711141f3738b5049d452f06326019312d5e'
assert json.loads((root / 'algebraic-similarity-persisted.json').read_text())['persisted']
assert not (root / 'selected-integration-jkl-source.json').exists()
results = json.loads((root / 'selected-integration-prototype3-results.json').read_text())
assert len(results) == 1 and results[0]['exit_code'] == 0 and results[0]['source_stable']
subprocess.run(['git', 'fetch', '/tmp/hypercurve-closure-algebraic-similarities', l['branch']], cwd=checkout, check=True)

def show(revision, name):
    return subprocess.check_output(['git', 'show', revision + ':' + name], cwd=checkout, text=True)

def apply_exact_text_change(name, edit):
    assert edit(show(base, name)) == show(l['commit'], name), ('incomplete parent patch', name)
    path = checkout / name
    path.write_text(edit(path.read_text()))

def polynomial_change(text):
    replacements = [
        ('/// source. Source branches and their retained rational similarities intersect\n/// authored native lines, including exact algebraic coordinates and selected\n',
         '/// source. Source branches and their retained rational or algebraic similarities\n/// intersect authored native lines, including exact algebraic coordinates and selected\n'),
        ('    /// Uses the source section authority after a rational similarity pullback.\n    /// Source abscissas remain the branch parameters; returned points and\n    /// tangent signs belong to the current image. Nonlinear rational images\n    /// and algebraic transform coefficients retain their existing capability gap.\n',
         '    /// Uses the source section authority after an exact similarity pullback.\n    /// Source abscissas remain the branch parameters; returned points and\n    /// tangent signs belong to the current image. The native line authority\n    /// decides algebraic coefficients without changing the original source.\n    /// Nonlinear rational images retain their existing capability gap.\n'),
        ('        let (a, b, d, e, xoff, yoff) = transform.affine_components();\n        if ![a, b, d, e, xoff, yoff]\n            .iter()\n            .all(|value| value.exact_rational_ref().is_some())\n        {\n            return Ok(None);\n        }\n', ''),
    ]
    for old, new in replacements:
        assert text.count(old) == 1
        text = text.replace(old, new, 1)
    return text

apply_exact_text_change('crates/hypercurve/src/polynomial_curve.rs', polynomial_change)

name = 'crates/hypercurve/FUTURE_WORK.md'
l_doc = show(l['commit'], name)
marker = '**Open, in dependency order:**'
start = l_doc.index('**Algebraic similarity section increment (2026-10-27).**')
block = l_doc[start:l_doc.index(marker, start)]
apply_exact_text_change(name, lambda text: text.replace(marker, block + marker, 1))

name = 'crates/hypercurve/qualification/README.md'
l_doc = show(l['commit'], name)
marker = 'The driver obtains executables from Cargo'
start = l_doc.index('The algebraic similarity witnesses extend native-line sections')
block = l_doc[start:l_doc.index(marker, start)]
old = 'chord carriers, broader transform coefficients and general branch pairs still\nneed separate qualification. They do not establish universal algebraic closure.'
new = 'chord carriers and general branch pairs need their own qualification. Algebraic\nsimilarity coefficients are exercised separately below. They do not establish universal algebraic closure.'
def readme_change(text):
    assert text.count(old) == 1 and text.count(marker) == 1
    return text.replace(old, new, 1).replace(marker, block + marker, 1)
apply_exact_text_change(name, readme_change)

name = 'crates/hypercurve/tests/polynomial_algebraic_similarities.rs'
assert not (checkout / name).exists()
(checkout / name).write_text(show(l['commit'], name))
name = 'crates/hypercurve/qualification/capabilities.json'
before = json.loads(show(base, name))
current = json.loads((checkout / name).read_text())
other = json.loads(show(l['commit'], name))
assert {k: v for k, v in other.items() if k != 'fixtures'} == {k: v for k, v in before.items() if k != 'fixtures'}
by_id = [{row['id']: row for row in doc['fixtures']} for doc in [before, current, other]]
assert len(current['fixtures']) == 113 and len(other['fixtures']) == 98
for key, value in by_id[0].items():
    assert by_id[2][key] == value
new_rows = [row for row in other['fixtures'] if row['id'] not in by_id[0]]
assert len(new_rows) == 7 and all(row['id'] not in by_id[1] for row in new_rows)
current['fixtures'].extend(new_rows)
(checkout / name).write_text(json.dumps(current, indent=2) + '\n')

name = 'docs/evidence-archive.md'
marker = '## Follow-on records\n\n'
base_doc = show(base, name)
l_doc = show(l['commit'], name)
base_suffix = base_doc.split(marker, 1)[1]
assert l_doc.endswith(base_suffix)
block = l_doc.split(marker, 1)[1][:-len(base_suffix)]
assert base_doc.replace(marker, marker + block, 1) == l_doc
path = checkout / name
path.write_text(path.read_text().replace(marker, marker + block, 1))

archive = Path('/tmp/csgrs-closure-evidence.git')
archive_git = ['git', '--git-dir=' + str(archive)]
prior = json.loads((root / 'selected-integration-jk-evidence.json').read_text())
branch = prior['branch']
parents = [prior['commit'], l['evidence']]
assert subprocess.check_output(archive_git + ['rev-parse', branch], text=True).strip() == parents[0]
merged = subprocess.run(archive_git + ['merge-tree', '--write-tree', *parents], text=True, capture_output=True)
(root / 'selected-integration-jkl-evidence-merge.log').write_text(merged.stdout + merged.stderr)
assert merged.returncode == 0
commit = subprocess.check_output(archive_git + ['commit-tree', merged.stdout.splitlines()[0],
    '-p', parents[0], '-p', parents[1], '-m', 'Include qualified algebraic similarity section evidence'], text=True).strip()
subprocess.run(archive_git + ['update-ref', branch, commit, parents[0]], check=True)
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', str(archive), commit], cwd=checkout, text=True).splitlines()
assert len(manifest) == 352
path = checkout / 'docs/evidence-archive.tsv'
excluded = [row for row in path.read_text().splitlines() if row.startswith('excluded:')]
assert len(excluded) == 4
path.write_text('\n'.join(manifest + excluded) + '\n')
path = checkout / 'docs/evidence-archive.md'
text = path.read_text()
receipt = (f'The integration evidence branch now ends at `{commit}`,\n'
           'retaining 351 records including the independently qualified algebraic\n'
           'similarity increment. Combined source and composition qualification\n'
           'remain pending; these parent records do not establish that result.\n\n')
path.write_text(text.replace(marker, marker + receipt, 1))
result = {
    'source_parents': ['b6da97710cbc124f243f969c5f224b06826c18d6',
                       'e49c24719f3b7ccf60451e9e4caaeba155d2b550', l['commit']],
    'evidence': commit, 'evidence_parents': parents, 'evidence_branch': branch,
    'archive_records': 351, 'capability_rows': 120, 'recorded_epoch': time.time(),
    'production_merge': 'The exact three L text changes were verified to reproduce its complete polynomial_curve.rs parent diff, then applied to the already combined J/K source. Original rational-map views and source guards remain.',
    'commit_plan': 'After complete combined qualification, create a merge commit with all three qualified source parents. The current pending Git merge still records J/K only; L is explicitly retained here for the final commit parents.',
    'additional_unqualified_change': 'Selected-point axis probe fallback and composition regression from prototype3; full qualification pending.',
}
(root / 'selected-integration-jkl-source.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result), flush=True)
