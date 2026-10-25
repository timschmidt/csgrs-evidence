from pathlib import Path
import hashlib, json, subprocess, re

record = Path(__file__).resolve().parent
owner = Path(json.loads((record/'latest-owner.json').read_text())['directory'])
assert json.loads((owner/'completion.json').read_text()) == {'failed': None, 'sources_unchanged': True}
before = json.loads((owner/'sources-before.json').read_text())
after = json.loads((owner/'sources-after.json').read_text())
assert before == after
candidate = Path('/tmp/csgrs-r23-candidate')
baseline = Path('/tmp/csgrs-r23-baseline')
primary = Path('/home/tim/Documents/GitHub/workspace/csgrs')
assert all(hashlib.sha256((candidate/n).read_bytes()).hexdigest() == sha for n,sha in after.items())
first = json.loads((record/'owner-validation-1792940773067831299/sources-before.json').read_text())
assert set(first) == set(after)
changed_since_first = sorted(n for n in after if first[n] != after[n])
assert changed_since_first == ['crates/hypercurve/src/curve_box_containment.rs', 'crates/hypercurve/src/rational_bezier_general.rs']
names = [
    'crates/hypercurve/src/curve_box_containment.rs',
    'crates/hypercurve/src/rational_bezier_general.rs',
    'crates/hypercurve/tests/curve_box_containment.rs',
    'crates/hypercurve/tests/rational_box_containment.rs',
    'crates/hypercurve/README.md', 'crates/hypercurve/CHANGELOG.md',
    'crates/hypercurve/FUTURE_WORK.md',
]
manifest = []
for n in names:
    a,b,c = primary/n, baseline/n, candidate/n
    if b.exists():
        assert a.read_bytes() == b.read_bytes(), ('primary drift', n)
    else:
        assert not a.exists()
    manifest.append({'path':n,'baseline_sha256':hashlib.sha256(b.read_bytes()).hexdigest() if b.exists() else None,
                     'candidate_sha256':hashlib.sha256(c.read_bytes()).hexdigest()})
summary = {}
for filename in ['full-hypercurve.log', 'modeling-continuation.log']:
    rows = re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;', (owner/filename).read_text())
    assert rows
    summary[filename] = {'groups':len(rows),'passed':sum(int(r[0]) for r in rows), 'failed':sum(int(r[1]) for r in rows),'ignored':sum(int(r[2]) for r in rows)}
result = {'owner_directory':str(owner),'compiled_sources_unchanged':True,'only_two_production_files_changed_since_first':True,
          'acceptance_tests_unchanged_since_first':True,'primary_matches_private_baseline':True,
          'files':manifest,'tests':summary,'status':'reviewed; promotion still depends on final paired costs'}
(record/'promotion-review.json').write_text(json.dumps(result,indent=2)+'\n')
(owner/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='files'},indent=2))
