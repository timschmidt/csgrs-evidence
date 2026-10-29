"""Assemble a private candidate without changing any running source or cache."""
from pathlib import Path
import difflib
import hashlib
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
user = r.parents[1]
base_dir = r / 'selected-query-fibers'
physical = base_dir.resolve().parent / 'selected-closure-integration'
alias = r / 'selected-closure-integration'
record_path = c / 'selected-closure-integration-candidate-prepared.json'
assert not physical.exists() and not alias.exists() and not record_path.exists()
assert shutil.disk_usage(user).free > 10 * 1024**3

def output(args, cwd=base_dir):
    return subprocess.check_output(args, cwd=cwd, text=True).strip()

def snapshot(path):
    spec = importlib.util.spec_from_file_location('e', path / 'scripts/successive-operations.py')
    e = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(e)
    return e.source_snapshot()

checkpoint = json.loads((c / 'selected-query-fibers-checkpoint.json').read_text())
source, files, patch = snapshot(base_dir)
assert source == checkpoint['source']
base = checkpoint['commit']
assert output(['git', 'rev-parse', base + '^{tree}']) == checkpoint['tree']
base_tests = json.loads((c / 'selected-query-fibers-fix4/complete.json').read_text())
base_lint = json.loads((c / 'selected-query-fibers-preflight-2/complete.json').read_text())
assert base_tests['all_passed'] and base_lint['exit_code'] == 0
assert base_tests['source'] == base_lint['source'] == source
inputs = {}
settings = [
    ('rational-query-guards', 'selected-point-fillets-query-guards-fix5', 'rational-query-guards-preflight-2', 'final2'),
    ('selected-query-derivatives', 'selected-query-derivatives-fix10', 'selected-query-derivatives-preflight-8', 'final7'),
    ('selected-join-correspondence', 'selected-join-correspondence-fix5', 'selected-join-correspondence-preflight-4', 'final1'),
]
for name, focus, lint, attempt in settings:
    work = r / name
    candidate, inventory, diff = snapshot(work)
    focused = json.loads((c / focus / 'complete.json').read_text())
    preflight = json.loads((c / lint / 'complete.json').read_text())
    full = c / (name + '-qualification-' + attempt)
    assert focused['all_passed'] and preflight['exit_code'] == 0 and preflight['source_stable']
    assert candidate == focused['source'] == preflight['source'] == json.loads((full / 'source-before.json').read_text())
    assert all(row['exit_code'] == 0 and row['source_stable'] for row in json.loads((full / 'results.json').read_text()))
    assert not output(['git', 'ls-files', '--others', '--exclude-standard'], work)
    (c / ('selected-closure-integration-input-' + name + '.patch')).write_bytes(diff)
    inputs[name] = {'source': candidate, 'inventory': inventory, 'head': output(['git', 'rev-parse', 'HEAD'], work), 'focus': focus, 'preflight': lint, 'qualification': str(full), 'full_qualification_complete': (full / 'complete.json').exists()}

subprocess.run(['git', 'worktree', 'add', '-b', 'hypercurve-selected-closure-integration', str(physical), base], cwd=base_dir, check=True)
alias.symlink_to(physical)
w = alias
metadata = {'crates/hypercurve/CHANGELOG.md', 'crates/hypersolve/CHANGELOG.md', 'crates/hypercurve/qualification/capabilities.json'}
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
applied = {}

def merge_insertions(path, baseline, incoming):
    old = baseline.splitlines(keepends=True)
    new = incoming.splitlines(keepends=True)
    text = path.read_text()
    for op, i, j, a, b in difflib.SequenceMatcher(a=old, b=new, autojunk=False).get_opcodes():
        if op == 'equal':
            continue
        assert op == 'insert' and i == j, (path, op, i, j)
        anchor = ''.join(old[i:i+4])
        assert anchor and text.count(anchor) == 1, (path, anchor)
        inserted = ''.join(new[a:b])
        assert inserted not in text
        text = text.replace(anchor, inserted + anchor, 1)
    path.write_text(text)

for name, _, _, _ in settings:
    work = r / name
    paths = output(['git', 'diff', '--name-only', 'HEAD'], work).splitlines()
    assert not set(paths) & receipts
    code_paths = [path for path in paths if path not in metadata]
    diff = subprocess.check_output(['git', 'diff', '--binary', 'HEAD', '--', *code_paths], cwd=work)
    subprocess.run(['git', 'apply', '--check', '-'], input=diff, cwd=w, check=True)
    subprocess.run(['git', 'apply', '-'], input=diff, cwd=w, check=True)
    for name_in_tree in set(paths) & metadata:
        old_text = subprocess.check_output(['git', 'show', 'HEAD:' + name_in_tree], cwd=work, text=True)
        new_text = (work / name_in_tree).read_text()
        path = w / name_in_tree
        if path.suffix == '.json':
            old, new, current = map(json.loads, [old_text, new_text, path.read_text()])
            assert {k:v for k,v in old.items() if k!='fixtures'} == {k:v for k,v in new.items() if k!='fixtures'} == {k:v for k,v in current.items() if k!='fixtures'}
            original = {row['id']:row for row in old['fixtures']}
            incoming = {row['id']:row for row in new['fixtures']}
            existing = {row['id']:row for row in current['fixtures']}
            assert all(original[key] == incoming[key] == existing[key] for key in original)
            added = [row for row in new['fixtures'] if row['id'] not in original]
            assert all(row['id'] not in existing for row in added)
            current['fixtures'].extend(added)
            path.write_text(json.dumps(current, indent=2) + '\n')
        else:
            merge_insertions(path, old_text, new_text)
    applied[name] = {'paths': paths, 'implementation_patch_sha256': hashlib.sha256(diff).hexdigest()}

# The declared PolynomialFiber parameter migration applies to the two incoming
# fixtures. Only the conversion changes; geometry and assertions stay intact.
compatibility = [
    ('crates/hypercurve/tests/selected_query_derivatives.rs', 'parameter: BezierParameter2::Exact(Real::from(n)),', 'parameter: BezierParameter2::Exact(Real::from(n)).into(),'),
    ('crates/hypercurve/tests/rational_query_guards.rs', 'parameter: BezierParameter2::Exact(value.into()),', 'parameter: BezierParameter2::Exact(value.into()).into(),'),
]
for name, old, new in compatibility:
    p = w / name
    text = p.read_text()
    assert text.count(old) == 1
    p.write_text(text.replace(old, new, 1))

path = w / 'crates/hypercurve/tests/polynomial_query_fibers.rs'
fixture = (c / 'selected-closure-integration-tests.rs').read_text()
assert 'fn integration_dependent_fiber()' not in path.read_text()
path.write_text(path.read_text() + fixture)

path = w / 'crates/hypercurve/qualification/capabilities.json'
catalog = json.loads(path.read_text())
assert len(catalog['fixtures']) == 312
for ident, test, domain, claims, oracle in [
    ('integration_fiber_control', 'integration_dependent_fiber_source_control', 'u>0,8u^2=1; v>0,16v^3=u; the positive branch y^2=x at x=v.', [('evaluation','exact_success','The generated point satisfies y^2=x and 2048x^6=1 with y>0.')], 'Independent defining equations and the selected positive branch.'),
    ('integration_fiber_derivatives', 'integration_dependent_fiber_feeds_derivatives_and_another_polynomial', 'The dependent fiber ordinate t becomes the parameter of C(t)=(t,t^2), then half the first derivative ordinate feeds y=x^2.', [('evaluation','exact_success','The exact derivatives are (1,2t), (0,2) and (0,0); definition replay and a further polynomial evaluation recover the original v.')], 'Differentiate the explicit rational polynomial independently, then prove the final ordinate equals the original fiber abscissa.'),
    ('integration_fiber_pole_guard', 'integration_dependent_fiber_quotient_replay_retains_the_original_pole', 'A quotient (1/(y+1))/(1/(y^2-1)) on the generated fiber, followed by exact recipe rebinding at (1,1).', [('evaluation','exact_success','The quotient equals y-1 on its original domain.'), ('exact_replay','invalid','The original divisor pole y^2-1=0 remains ZeroRationalPointDenominator after recipe rebinding.')], 'The independently factored quotient value and original excluded denominator; finite cancellation does not extend the authored domain.'),
]:
    assert all(row['id'] != ident for row in catalog['fixtures'])
    catalog['fixtures'].append({'id':ident,'target':'polynomial_query_fibers','test':test,'owner':'Hypercurve selected-query fibers, rational derivatives and original pole guards; Hypersolve shared selected fields','properties':['P2','P14','P18','P19','P20','P26'],'domain':domain,'origins':['authored','generated','selected_implicit'],'families':['ImplicitPolynomial','RationalBezier'],'policies':['STRICT'],'semantics':'Finite compositions of retained exact source queries. This named corpus does not claim general implicit-region operations or total resource bounds.','claims':[{'stage':stage,'outcome':outcome,'assertion':assertion} for stage,outcome,assertion in claims],'oracle':oracle,'timeout_seconds':180})
path.write_text(json.dumps(catalog,indent=2)+'\n')
assert len(catalog['fixtures']) == 315
subprocess.run(['git', 'add', '-N', 'crates/hypercurve/tests/selected_query_derivatives.rs', 'crates/hypercurve/tests/rational_query_guards.rs'], cwd=w, check=True)
subprocess.run(['cargo', '+1.99.1', 'fmt', '--all'], cwd=w, check=True)
subprocess.run(['git', 'diff', '--check'], cwd=w, check=True)
for name, record in inputs.items():
    assert snapshot(r / name)[0] == record['source']
assert snapshot(base_dir)[0] == source
candidate, inventory, diff = snapshot(w)
assert not candidate['untracked_inputs']
(c / 'selected-closure-integration-candidate.patch').write_bytes(diff)
record = {'base':base,'checkout':str(physical),'branch':'hypercurve-selected-closure-integration','source':candidate,'base_source':source,'inputs':inputs,'applied':applied,'compatibility':[row[0] for row in compatibility],'capability_rows':315,'working_changes':output(['git','diff','--name-only','HEAD'],w).splitlines(),'scope':'Private unqualified integration candidate. All predecessor source trees and running caches are unchanged. Final parent/evidence alignment, all predecessor qualifications and combined admission remain mandatory before retention or publication.','epoch':time.time()}
record_path.write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps({key:value for key,value in record.items() if key!='inputs'},indent=2))
