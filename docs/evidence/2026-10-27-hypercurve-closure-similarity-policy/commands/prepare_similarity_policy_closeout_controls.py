from pathlib import Path
import ast
import json
import time

root = Path(__file__).resolve().parent
base = '2395ba77d81a6eb172f62b99a13bef73a7235a43'
evidence_parent = '04eccb7d4eccb1928dc4e1c2998174cd4a6f27c4'

def adapted(name):
    text = (root / name).read_text()
    for old, new in [
        ('algebraic-similarity', 'similarity-policy'),
        ('algebraic_similarity', 'similarity_policy'),
        ('/tmp/hypercurve-closure-algebraic-similarities', '/tmp/hypercurve-closure-similarity-policy'),
        ('2026-10-27-hypercurve-closure-algebraic-similarities', '2026-10-27-hypercurve-closure-similarity-policy'),
        ('5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec', base),
        ('98fd9084af3539fabee8dbedc1ffe300935f46e9', evidence_parent),
    ]:
        text = text.replace(old, new)
    return text

s = adapted('archive_algebraic_similarity_evidence.py')
s = s.replace("'suites': 81, 'passed': 2745", "'suites': 85, 'passed': 2773")
s = s.replace("len(report['fixtures']) == 98", "len(report['fixtures']) == 125")
s = s.replace("'polynomial-location-evidence-archive.json'", "'selected-integration-evidence-archive.json'")
s = s.replace('refs/heads/hypercurve-polynomial-location-evidence-2026-10-26', 'refs/heads/hypercurve-selected-integration-evidence-2026-10-27')
s = s.replace("['tests/polynomial_algebraic_similarities.rs']", "['tests/similarity_policy_closure.rs', 'src/polynomial_curve.rs']")
s = s.replace("'guard_tests': 16, 'matrix_fixtures': 98", "'guard_tests': 16, 'matrix_fixtures': 125")
s = s.replace("'Record algebraic similarity native-line qualification'", "'Record selected similarity point policy qualification'")
start = s.index("    'owner':")
end = s.index("    'full_suite':", start)
s = s[:start] + '''    'owner': 'Hypercurve selected polynomial point and branch similarity construction, using the existing retained-policy protocol',
    'properties': ['P4', 'P8', 'P9', 'P15', 'P18', 'P19', 'P20'],
    'domain': 'Previously admitted selected polynomial graph branches and their existing similarity images. A locally certified selected point or transformed endpoint constructed under APPROXIMATE_512 must retain the policy actually consumed, while nested approximate source dependencies remain qualified.',
''' + s[end:]
start = s.index("    'baseline_findings':")
end = s.index("}, indent=2)", start)
s = s[:start] + '''    'baseline_findings': 'Two public witnesses on committed 2395ba77d8 return Certified point/image construction under APPROXIMATE_512, then fail Classification/Unsupported when the same returned points are queried under STRICT. Their independent STRICT reference constructions already succeed. Baseline commands, source snapshots and failures are retained.',
    'change': 'The two PolynomialCurveBranch2 similarity-point construction sites pass retained_object_policy() to the existing BezierSimilarityPoint2 constructor. The generic constructor and its original policy-barrier regression are unchanged.',
    'closure_argument': 'Selecting APPROXIMATE_512 does not consume an approximate terminal. The existing operation receipt determines the local retained policy; an exact similarity preserves the selected source point. The existing constructor only flattens policy-compatible nested images, and checked replay validates the source definition. Incompatible approximate dependencies therefore remain nested and keep their policy barriers.',
    'qualification': 'Two public witnesses exercise the same Certified outputs across APPROXIMATE_512 to STRICT: exact affine relations for a selected quintic root, strict point equality, checked in-memory point-definition replay, generated-chord incidence and further branch subdivision. A new unit witness seeds an observed consumed-policy receipt on the parent, constructs a locally Certified child, and verifies that strict endpoint queries and replay remain blocked. The existing generic nested-similarity policy-barrier test also passes unchanged. All four focused checks pass.',
    'limitations': [
        'This is a selected-polynomial similarity policy fix, not a general audit of all retained point families or arbitrary algebraic operation closure.',
        'The negative dependency witness seeds an observed consumed-policy receipt; it does not claim a newly generated numerically approximated geometric construction.',
        'Checked point-definition replay is in memory and does not establish native archive replay in a fresh process.',
        'No resource algorithm changes. Existing counted limits and external fixture allowances do not bound total arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) process peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
        'Full repository pre-push qualification remains pending; the separate earlier publication candidate does not validate these later source bytes.',
    ],
''' + s[end:]
s = s.replace("dependent = test_counts(root / 'similarity-policy-final-dependent-packages.log')", "dependent = test_counts(root / 'similarity-policy-final-dependent-packages.log')\nassert dependent['passed'] == 3010 and dependent['failed'] == 0 and dependent['ignored'] == 0")
(root / 'archive_similarity_policy_evidence.py').write_text(s)

s = adapted('prepare_algebraic_similarity_receipt.py')
s = s.replace('assert passed==3009', 'assert passed==3010 and ignored==0')
s = s.replace('assert len(manifest)==350', 'assert len(manifest)==354')
start = s.index("text=f'''")
end = s.index("\np=checkout/'crates/hypercurve/FUTURE_WORK.md'", start)
s = s[:start] + '''text=f\'''**Selected similarity point policy increment (2026-10-27).** On committed
`{base[:10]}`, two public witnesses produce Certified selected-quintic points
or similarity images under APPROXIMATE_512, then reproduce
`Classification/Unsupported` when the same returned points are queried under
STRICT. Independent STRICT reference constructions already succeed. P4, P8,
P9, P15 and P18–P20 require retained evidence to follow the actual consumed
policy and preserve selected source dependencies through subsequent operations.

The polynomial point and branch similarity construction sites now pass the
existing `retained_object_policy()` result to `BezierSimilarityPoint2::new`.
The generic constructor is unchanged. Locally exact images retain strict
replay authority; incompatible approximate source images remain nested, so a
new local certificate cannot upgrade inherited evidence. Checked point replay
continues to validate the original source definition and selected fiber.

Two public witnesses keep the same returned points across the policy boundary,
verify exact affine relations for the selected root of `y^5+5y+5`, replay point
definitions in memory, and consume them in generated-chord incidence and branch
subdivision. A new negative unit witness seeds an observed consumed-policy
receipt on a parent, constructs a locally Certified child, and verifies that
strict endpoint queries and replay remain blocked. The original generic
similarity policy-barrier regression passes unchanged. All four focused
checks pass; this negative witness tests receipt propagation, not a newly
rounded geometric construction.

Final checks pass: 2,773 Hypercurve tests (85 suites, 34 existing ignored),
43 root downstream tests and {passed:,} tests across six dependent packages
({ignored} ignored). Strict Hypercurve all-target/all-feature MSRV Clippy,
formatting, 16 matrix guards, 125 capability witnesses, typos, repository budget
and diff checks pass. Raw failures, source snapshots and exact commands are in
`{record}`, SHA-256 `{digest}`. All non-receipt source bytes remain identical
after this receipt.

This addresses selected polynomial similarity points, not every retained point
family. General algebraic operation closure and fresh-process native archive
replay remain open. Existing counted limits and external timeouts do not bound
total arithmetic, coefficient growth, retained memory or cancellation. No
performance improvement is claimed. Full repository pre-push qualification
remains pending; checks on the separate earlier publication candidate do not
validate this later source revision.

\'''
''' + s[end:]
s = s.replace("assert '**Algebraic similarity section increment' not in s", "assert '**Selected similarity point policy increment' not in s")
start = s.index("text=f'''", s.index("p=checkout/'docs/evidence-archive.md'"))
end = s.index("\nmarker=", start)
s = s[:start] + '''text=f\'''The local `hypercurve-similarity-policy-evidence-2026-10-27` branch
ends at `{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records policy retention for selected polynomial similarity points and
endpoints: locally certified outputs remain usable under STRICT, while nested
approximate dependencies keep their replay barriers. 2,773 Hypercurve tests,
43 root downstream tests, {passed:,} tests across six dependent packages,
strict MSRV Clippy, formatting, 16 matrix guards and 125 capability witnesses
pass. Original failed witnesses, the unchanged generic policy-barrier check,
a consumed-receipt dependency witness and raw commands remain archived.
Point replay here is checked in memory. This record is local and unpushed;
full pre-push qualification and broader algebraic closure remain open.

\'''
''' + s[end:]
(root / 'prepare_similarity_policy_receipt.py').write_text(s)
s = adapted('close_algebraic_similarity_increment.py').replace('Consume algebraic similarities in polynomial line sections', 'Retain consumed policy for selected similarity points')
(root / 'close_similarity_policy_increment.py').write_text(s)
(root / 'persist_similarity_policy_increment.py').write_text(adapted('persist_algebraic_similarity_increment.py'))
paths = [root / name for name in ['archive_similarity_policy_evidence.py', 'prepare_similarity_policy_receipt.py', 'close_similarity_policy_increment.py', 'persist_similarity_policy_increment.py']]
for path in paths:
    ast.parse(path.read_text(), filename=str(path))
    assert 'algebraic-similarity' not in path.read_text()
    assert 'algebraic_similarity' not in path.read_text()
(root / 'similarity-policy-closeout-controls-prepared.json').write_text(json.dumps({'status':'Prepared only; not executed', 'base':base, 'evidence_parent':evidence_parent, 'paths':[str(p) for p in paths], 'expected_after_success':{'command_groups':15,'hypercurve':2773,'suites':85,'ignored':34,'dependent':3010,'matrix':125,'archive_records':353}, 'recorded_epoch':time.time()},indent=2)+'\n')
print('Prepared and parsed four gated closeout controls; no archive, receipt or commit executed.')
