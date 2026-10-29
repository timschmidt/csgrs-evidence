"""Prepare a closeout gated on complete predecessor and combined evidence."""
from pathlib import Path
import ast
import json

c = Path(__file__).resolve().parent
prepared = json.loads((c / 'selected-closure-integration-candidate-prepared.json').read_text())

def write(name, content):
    path = c / name
    assert not path.exists(), path
    ast.parse(content, filename=name)
    path.write_text(content)

def one(text, old, new):
    assert text.count(old) == 1, old
    return text.replace(old, new, 1)

s = (c / 'probe_polynomial_operations_query_fibers.py').read_text().replace('selected-query-fibers','selected-closure-integration').replace("default='query-fibers1'", "default='integration1'")
write('probe_polynomial_operations_integration.py', s)

s = (c / 'finalize_selected_query_fibers.py').read_text().replace('selected-query-fibers','selected-closure-integration').replace('selected_query_fibers','selected_closure_integration')
start = s.index('IMPLEMENTATION = ')
end = s.index('\n\n\n\ndef save', start)
s = s[:start] + '''IMPLEMENTATION = set(json.loads((CONTROLS / 'selected-closure-integration-candidate-prepared.json').read_text())['working_changes'])
ALIGNMENT = json.loads((CONTROLS / 'selected-closure-integration-parent-alignment.json').read_text())
PARENT = ALIGNMENT['parent']
CODE_PARENTS = ALIGNMENT['code_parents']
EVIDENCE_PARENT = ALIGNMENT['evidence_parent']
''' + s[end:]
s = one(s, "assert ALIGNMENT['root_parent'] == PARENT and ALIGNMENT['root_evidence'] == EVIDENCE_PARENT", "assert CODE_PARENTS[0] == PARENT and len(CODE_PARENTS) == 5")
s = s.replace('polynomial-operation-frontier-query-fibers1','polynomial-operation-frontier-integration1')
s = one(s, "assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION\n", "assert set(output(['git', 'diff', '--name-only', 'HEAD']).splitlines()) == IMPLEMENTATION | RECEIPTS\n")
start = s.index('    focused_dir = ')
end = s.index('    suites = ', start)
s = s[:start] + '''    focused_dir = CONTROLS / 'selected-closure-integration-fix1'
    focused = json.loads((focused_dir / 'complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 16
    focus_rows = json.loads((focused_dir / 'results.json').read_text())
    assert len(focus_rows) == 16 and all(row['exit_code'] == 0 and row['source_stable'] for row in focus_rows)
    preflight = json.loads((CONTROLS / 'selected-closure-integration-preflight-1/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-closure-integration-baseline1/complete.json').read_text())
    assert baseline['expected_outcomes_reproduced'] and baseline['statuses'] == [0, 0, 101, 101]
    readiness = json.loads((CONTROLS / 'selected-closure-integration-ready.json').read_text())
    assert readiness['all_local_qualification_and_receipt_checks_passed']
''' + s[end:]
s = one(s, "    assert counts(focused_dir / 'polynomial_branch_consumes_a_nested_selected_fiber_query.log')['passed'] == 1", "    for name in ['integration_dependent_fiber_feeds_derivatives_and_another_polynomial', 'integration_dependent_fiber_quotient_replay_retains_the_original_pole', 'integration_dependent_fiber_derivative_replays_cold_and_feeds_geometry']:\n        assert counts(focused_dir / (name + '.log'))['passed'] == 1")
start = s.index('    controls = {')
end = s.index('    for name in sorted(controls):', start)
s = s[:start] + '''    controls = {
        'prepare_selected_closure_integration_closeout.py', 'align_selected_closure_integration.py',
        'finalize_selected_closure_integration.py', 'close_selected_closure_integration.py',
        'probe_polynomial_operations_integration.py', 'polynomial-operation-frontier-tests.rs',
        'integration-disk-cleanup.json', 'integration-disk-live-users.json',
        'integration-private-commit-graph-repair.json',
    }
    for path in CONTROLS.iterdir():
        if path.is_file() and ('selected_closure' in path.name or path.name.startswith('selected-closure-integration-')):
            if path.suffix in {'.py', '.rs', '.json', '.log', '.patch'}:
                controls.add(path.name)
''' + s[end:]
start = s.index("        'owner': ")
end = s.index("        'rustc': ", start)
s = s[:start] + '''        'owner': 'Hypercurve selected-query fibers, derivatives, original rational denominator guards and native replay; Hypersolve selected-field joins and root discovery',
        'properties': ['P2', 'P12', 'P14', 'P18', 'P19', 'P20', 'P26', 'P36'],
        'qualified': qualified, 'code_parents': CODE_PARENTS, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'preflight': preflight,
        'baseline': baseline, 'frontier': frontier, 'source_alignment': ALIGNMENT, 'predecessor_admission': readiness,
        'domain': 'The combined admitted selected-point, query-derivative, complete-root-discovery, original-guard, join-correspondence and dependent-fiber envelopes. The new named chain evaluates a selected algebraic query on y^2=x, differentiates C(t)=(t,t^2) at its retained ordinate, replays the exact derivative and feeds further polynomial evaluation and differentiation.',
        'proof': 'Reuse the separately qualified lower-layer implementations without a new arithmetic or differentiation authority. Original equations, source-dependent coefficients, branch selectors and denominator guards survive the combined chain. Shared-field join correspondences preserve existing source generators. Two incoming test literals receive the already-declared PolynomialFiber parameter conversion; existing assertions remain. Capability rows and source changelogs are merged without removing prior entries.',
        'witnesses': 'Source control u>0,8u^2=1; v>0,16v^3=u; positive y^2=x at x=v. At t=y, exact derivatives of C(t) are (1,2t),(0,2),(0,0), and a further polynomial recovers v. A quotient equal to y-1 retains the original excluded pole y^2-1=0. A fresh-process derivative endpoint proves dx=1,dy>0,dy^12=2 and feeds another polynomial evaluation and derivative. Four new witnesses coexist with the original ten dependent-fiber cases and every predecessor corpus.',
        'retained_failures': 'The target revision passed source construction but rejected derivative consumption as Unsupported and incorrectly accepted the original divisor pole after recipe rebinding. Both complete original failing fixtures, exact source attribution and corrected outcomes are retained. Compilation and archived failed predecessor attempts remain in their original evidence histories.',
        'limits': 'Seven original polynomial-region offset/corner operations remain Unsupported with their three controls passing. General algebraic region and singular-branch operation closure, total arithmetic/coefficient/expression/memory limits and cooperative cancellation remain open. Fourteen named focused cases, 25 combined local/downstream groups and finalized predecessor records do not replace the separate full pre-push contract for the merged source.',
        'cost_scope': 'Raw completion times, peak RSS, allocation lifetime controls and source/artifact digests are retained. Concurrent timings do not establish a speedup. Inactive Cargo outputs were removed only after checking for live references; source, raw logs and evidence were preserved.',
        'hardware': output(['lscpu', '--json']),
''' + s[end:]
s = s.replace('Record dependent polynomial query fibers and replay', 'Record integrated exact query-fiber composition')
start = s.index("    text = f'''")
end = s.index("    path = CHECKOUT / 'crates/hypercurve/FUTURE_WORK.md'", start)
s = s[:start] + """    text = f'''**2026-10-29 integrated selected-query composition:**
The individually qualified point, derivative, complete-root, pole-guard,
join-correspondence and dependent-fiber increments now share one candidate.
The original generated-fiber control passed, but its parameter was Unsupported
in rational differentiation, and a derived quotient recipe incorrectly accepted
an input excluded by the original divisor denominator. Both failures were
reproduced on the frozen fiber revision and retained before integration.

Four new composition fixtures pass with the original ten fiber cases. For
u>0, 8u^2=1 and v>0, 16v^3=u, evaluate positive y^2=x at x=v. Its ordinate t
feeds C(t)=(t,t^2), whose derivatives are independently (1,2t), (0,2) and
(0,0); a further polynomial evaluation recovers v. The quotient with value
y-1 keeps the excluded pole y^2-1=0. Cold native replay of the derivative
proves dx=1, dy>0 and dy^12=2, then completes another polynomial evaluation
and derivative. Exact equations and semantic equality are distinct from
deterministic serialization. The two incoming native fiber test constructors
use the previously documented parameter conversion; their assertions remain.

All 25 combined qualification groups pass, including full Hypersolve
({suites['solver-full']['passed']:,} passed), Hypercurve
({suites['curve-full']['passed']:,} passed), CSGRS
({suites['model-full']['passed']:,} passed), six downstream suites, every
predecessor acceptance target, strict four-package MSRV Clippy, minimal checks,
strict docs and both fuzz manifests, allocation lifetime controls, capability
checks and hygiene. Raw commands report ignored tests separately. All six
predecessor admissions and the earlier selected-field publication receipt are
retained as code/evidence parents. Only three receipt files change after the
combined source qualification; receipt checks run after their final edit.

The evidence is in {record}, SHA-256 {digest}. It retains the original
failures, source inventories, patches, compiler settings, completion times and
peak RSS. The capability catalog preserves every predecessor row. No speedup
or universal closure claim follows from these measurements.

Seven original implicit-region offset/corner operations remain Unsupported,
with all three source controls passing. General algebraic region operations,
singular cases and total work, coefficient, expression, memory and cancellation
contracts remain open. Full repository pre-push qualification of this combined
source is still required before publication.

'''
""" + s[end:]
start = s.index("    paragraph = f'''")
end = s.index('    path.write_text(content.replace', start)
s = s[:start] + """    paragraph = f'''The local {archive['branch'].removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. Its parent merges all six selected-query
increment evidence histories and the earlier selected-field publication record.
Fourteen focused cases and 25 combined qualification groups pass. Original
derivative/pole failures and seven remaining region-operation blockers are
retained. General closure and publication of the combined source are not
claimed. This record is unpushed.

'''
""" + s[end:]
start = s.index("    subprocess.run(['git', 'commit',")
end = s.index("    assert not output(['git', 'status', '--porcelain'])", start)
s = s[:start] + '''    tree = output(['git', 'write-tree'])
    code_branch = output(['git', 'symbolic-ref', 'HEAD'])
    parents = [item for parent in CODE_PARENTS for item in ['-p', parent]]
    commit = output(['git', 'commit-tree', tree, *parents, '-m', 'Compose selected fibers with exact derivatives and original guards'])
    subprocess.run(['git', 'update-ref', code_branch, commit, PARENT], cwd=CHECKOUT, check=True)
    subprocess.run(['git', 'reset', '--mixed', commit], cwd=CHECKOUT, check=True)
''' + s[end:]
s = s.replace("'parent': PARENT, 'branch': persistent", "'parent': PARENT, 'code_parents': CODE_PARENTS, 'branch': persistent")
s = s.replace('Dependent polynomial fibers qualified through owner/downstream suites, aligned to finalized root-discovery parent, archived and committed locally. General region-operation closure remains open.', 'Combined selected-query composition qualified locally/downstream, aligned to all finalized code/evidence parents, archived and committed locally. General region-operation closure and integrated pre-push remain open.')
s = s.replace('Continue general region-operation construction and integrate separately qualified increments.', 'Continue the full geometric operation-closure plan and run all pre-push checks on the integrated source before its publication.')
s = s.replace("(NAME + '-ready.json')", "(NAME + '-receipt-ready.json')")
write('finalize_selected_closure_integration.py', s)

close = '''from pathlib import Path
import importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls'
spec=importlib.util.spec_from_file_location('gate',c/'selected_closure_candidate_gate.py');gate=importlib.util.module_from_spec(spec);spec.loader.exec_module(gate)
q=c/'selected-closure-integration-qualification-final1'
launch=gate.load(c/'selected-closure-integration-qualification-final1-controller.json')
readiness=gate.load(c/'selected-closure-integration-readiness-controller.json')
publication=2563553
while True:
 rows=gate.load(q/'results.json') or []
 assert all(row['exit_code']==0 and row['source_stable'] for row in rows),'Combined qualification failed'
 complete=gate.load(q/'complete.json')
 if complete:assert complete['all_passed'] and complete['groups']==25
 elif not gate.alive(launch['pid']):raise SystemExit('Combined qualification stopped before completion')
 ready=gate.load(c/'selected-closure-integration-ready.json')
 if not ready and not gate.alive(readiness['pid']):raise SystemExit('Predecessor readiness stopped before final admission')
 published=gate.load(r/'prepush-selected-fields/publication-ready.json')
 if not published and not gate.alive(publication):raise SystemExit('Parent publication closeout stopped before its final receipt')
 if complete and ready and published:break
 time.sleep(15)
def run(script,*args):
 command=['python3',str(c/script),*args];print('START',command,flush=True)
 result=subprocess.run(command,cwd=r/'selected-closure-integration');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
run('align_selected_closure_integration.py')
run('probe_polynomial_operations_integration.py')
for action in ['archive','receipts','check','commit']:run('finalize_selected_closure_integration.py',action)
print('INTEGRATED SOURCE COMMITTED LOCALLY; FULL PRE-PUSH AND GENERAL GEOMETRIC CLOSURE REMAIN OPEN',flush=True)
'''
write('close_selected_closure_integration.py', close)
print('Prepared original frontier replay, guarded finalizer and closeout.')
