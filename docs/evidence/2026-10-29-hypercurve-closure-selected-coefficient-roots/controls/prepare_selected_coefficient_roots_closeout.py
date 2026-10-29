from pathlib import Path
import ast
r=Path(__file__).resolve().parents[1];c=r/'controls'
s=(c/'finalize_selected_closure_integration.py').read_text().replace('selected-closure-integration','selected-coefficient-roots').replace('selected_closure_integration','selected_coefficient_roots')
s=s.replace("selected-coefficient-roots-candidate-prepared.json","selected-coefficient-roots-admission-prepared.json").replace('len(CODE_PARENTS) == 5','len(CODE_PARENTS) == 1')
a=s.index("    frontier = json.loads(");b=s.index("    stage = ROOT /",a)
s=s[:a]+'''    frontier_dir = CONTROLS / 'polynomial-operation-frontier-coefficient-roots-final1'
    frontier = json.loads((frontier_dir / 'complete.json').read_text())
    assert frontier['source_stable'] and frontier['source'] == ALIGNMENT['aligned'] and frontier['probe_count'] == 12
    frontier_rows = json.loads((frontier_dir / 'results.json').read_text())
    assert len(frontier_rows) == 14
    blocked = [row for row in frontier_rows if row['exit_code'] == 101]
    assert len(blocked) == 7 and all(row['exit_code'] in [0, 101] and row['source_stable'] for row in frontier_rows)
    for row in blocked:
        log = (frontier_dir / (row['name'] + '.log')).read_text()
        assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
    focused_dir = CONTROLS / 'selected-coefficient-roots-fix4'
    focused = json.loads((focused_dir / 'complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 10
    preflight = json.loads((CONTROLS / 'selected-coefficient-roots-preflight-4/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    owner = json.loads((CONTROLS / 'selected-coefficient-roots-owners-3/complete.json').read_text())
    assert owner['all_passed'] and owner['groups'] == 3 and owner['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-coefficient-roots-baseline2/complete.json').read_text())
    assert baseline['missing_acceptance_reproduced'] and baseline['compile']['exit_code'] == 1
    readiness = ALIGNMENT['predecessor_admission']
    assert readiness['commit'] == PARENT and len(readiness['checks']) == 5 and all(x['exit_code'] == 0 for x in readiness['checks'])
    suites = {name: counts(run / (name + '.log')) for name in [
        'selected-fibers', 'selected-roots', 'brep-replay', 'solver-full', 'solver-minimal',
        'curve-full', 'model-full', 'dependent-hyperbrep', 'dependent-hyperbrep-io',
        'dependent-hypercircuit', 'dependent-hyperdrc', 'dependent-hypergraphics', 'dependent-hyperpack',
    ]}
    assert counts(focused_dir / 'selected_coefficient_root_preserves_its_equation_and_feeds_geometry.log')['passed'] == 1
    assert subprocess.run(['git', '--git-dir=' + str(EVIDENCE), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
'''+s[b:]
a=s.index('    prefixes = ');b=s.index('    for folder in sorted',a)
s=s[:a]+'''    prefixes = ['selected-coefficient-roots-', 'polynomial-operation-frontier-coefficient-roots-final1', 'polynomial-operation-frontier-polynomial-chamfer-']
'''+s[b:]
a=s.index('    controls = {');b=s.index('    for path in CONTROLS.iterdir():',a)
s=s[:a]+'''    controls = {
        'align_selected_coefficient_roots.py', 'finalize_selected_coefficient_roots.py',
        'prepare_selected_coefficient_roots_closeout.py', 'close_selected_coefficient_roots.py',
        'probe_polynomial_operations_coefficient_roots.py', 'polynomial-operation-frontier-tests.rs',
        'polynomial-chamfer-sections-tests.rs', 'polynomial-chamfer-construction-contract.json',
        'polynomial-chamfer-root-base.json', 'probe_polynomial_chamfer_frontier.py',
        'probe_polynomial_chamfer_root_frontier.py',
    }
'''+s[b:]
s=s.replace("'selected_closure' in path.name", "'selected_coefficient' in path.name")
a=s.index("    save(dest / 'admission.json', {");b=s.index("    env = {**os.environ, 'GIT_INDEX_FILE'",a)
s=s[:a]+'''    save(dest / 'admission.json', {
        'owner': 'Hypercurve selected coefficient queries, exact point definitions and SVG replay; Hypersolve selected fields, polynomial evaluation and root selection; HyperBRep native archive adapter',
        'properties': ['P2', 'P12', 'P14', 'P18', 'P19', 'P20', 'P26', 'P36'],
        'qualified': qualified, 'code_parents': CODE_PARENTS, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'preflight': preflight, 'owner_checks': owner,
        'baseline': baseline, 'frontier': frontier, 'source_alignment': ALIGNMENT, 'predecessor_admission': readiness,
        'domain': 'A nonzero univariate polynomial of arbitrary finite degree with ascending coefficients retained as rational point queries, including dependent and independent admitted algebraic selections. The output (z,0) retains an open singleton selector or a checked represented exact root. Symbolic coefficients require exact decisions.',
        'proof': 'Every coefficient source and original denominator is validated, including zero/trailing coefficients. Hypersolve common-field joins transport dependencies; strict singleton selection and original-equation residuals validate roots, including repeated factors. SVG point references and HyperBRep selected-parameter references preserve these dependencies; cold replay re-establishes them. Already admitted field values reuse structural zero/unit identities after alignment; public source recipes retain original guards and division validates its denominator.',
        'witnesses': 'Independent a>0,8a^2=1 and b>0,17b^5=1 select z^3+a*z-b=0, then definition replay, y^2=x and y=x^2 recover z. Repeated/opposite roots, degree17/nonmonic relations, exact/invalid selectors, 10^-12 separation, original poles and budget retry are covered. Fresh SVG and HyperBRep processes feed further geometry and derivatives; transform/restriction/reversal preserve the same source. Malformed unused native records are checked and repeated archive dependencies stay shared.',
        'retained_failures': 'The missing public definition was reproduced as E0599 on the base. The first draft exceeded180seconds in the unchanged original composition fixture; progress-only diagnostics completed at195.59/191.30seconds. After exact zero/unit arithmetic reuse, the unchanged fixture completes within180seconds. Harness setup errors and an exact parameter type error in an added transform test are retained separately from geometric outcomes.',
        'limits': 'All seven original implicit-region offset/corner fixtures remain Unsupported, while their three controls and two circle-section controls pass. General algebraic/singular region closure and total arithmetic, coefficient, expression, memory and cancellation bounds remain open. Full pre-push qualification is a separate gate.',
        'cost_scope': 'Raw completed-contract timings, peak RSS, source/artifact hashes, allocation lifetime controls and failed attempts are retained. Individual concurrent samples are not a universal speed claim. External process timeouts are not kernel BudgetExhausted outcomes.',
        'hardware': output(['lscpu', '--json']), 'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
'''+s[b:]
s=s.replace('Record integrated exact query-fiber composition','Record selected-coefficient root admission and native replay')
a=s.index("    text = f'''");b=s.index("    path = CHECKOUT / 'docs/evidence-archive.md'",a)
s=s[:a]+'''    text = f"""
**2026-10-29 selected-coefficient root admission:** Eight focused curve cases,
the native wire regression and affected solver/archive cases pass. All25
qualification groups pass, including full Hypersolve
({suites['solver-full']['passed']:,} passed), Hypercurve
({suites['curve-full']['passed']:,} passed), CSGRS
({suites['model-full']['passed']:,} passed), six downstream suites, strict MSRV
Clippy, minimal builds, strict docs/fuzz manifests, allocation lifetime checks,
the325-row capability matrix and hygiene. Ignored cases remain separately
reported in the raw commands. The finalized integrated predecessor and its
evidence history are retained; only the three receipt files change afterward.

Evidence: {record}, SHA-256 {digest}. Original failures, complete source
attribution, shared-definition replay, completion costs and the seven remaining
region-operation blockers are retained. Those blockers are not completed
support. This local admission does not replace full pre-push qualification.

"""
    path = CHECKOUT / 'crates/hypercurve/FUTURE_WORK.md'
    content = path.read_text()
    pending = 'The selected-coefficient root increment is in qualification.'
    assert content.count(pending) == 1
    content = content.replace(pending, 'The selected-coefficient root increment has passed local and downstream qualification.')
    assert text.splitlines()[1] not in content
    path.write_text(content + text)
'''+s[b:]
a=s.index("    paragraph = f'''");b=s.index('    path.write_text(content.replace(marker, marker + paragraph, 1))',a)
s=s[:a]+'''    paragraph = f"""The local {archive['branch'].removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. It extends the finalized integrated
selected-query evidence history. Eight focused curve cases and25 complete
qualification groups pass, with native replay, malformed-input and shared
construction checks. Original missing/slow cases and seven remaining
region-operation blockers are retained. This record is unpushed.

"""
'''+s[b:]
s=s.replace('Compose selected fibers with exact derivatives and original guards','Retain exact roots over selected coefficient queries and native graph replay')
s=s.replace('Combined selected-query composition qualified locally/downstream, aligned to all finalized code/evidence parents, archived and committed locally. General region-operation closure and integrated pre-push remain open.','Selected-coefficient root points qualified locally/downstream, aligned to finalized integration, archived and committed locally. General region-operation closure and full pre-push remain open.')
s=s.replace('all25','all 25').replace('All25','All 25').replace('the325-row','the 325-row').replace('and25','and 25').replace('exceeded180seconds','exceeded 180 seconds').replace('at195.59/191.30seconds','at 195.59/191.30 seconds').replace('within180seconds','within 180 seconds')
ast.parse(s)
(c/'finalize_selected_coefficient_roots.py').write_text(s)
(c/'close_selected_coefficient_roots.py').write_text('''from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-coefficient-roots'
q=c/'selected-coefficient-roots-qualification-final1'
while True:
 if (q/'results.json').exists():
  assert all(x['exit_code']==0 and x['source_stable'] for x in json.loads((q/'results.json').read_text())), 'selected-coefficient qualification failed'
 complete=json.loads((q/'complete.json').read_text()) if (q/'complete.json').exists() else None
 parent=json.loads((c/'selected-closure-integration-final-commit.json').read_text()) if (c/'selected-closure-integration-final-commit.json').exists() else None
 if complete:
  assert complete['all_passed'] and complete['groups']==25
 if complete and parent:break
 time.sleep(15)
for script,args in [('align_selected_coefficient_roots.py',[]),('probe_polynomial_operations_coefficient_roots.py',['--attempt','coefficient-roots-final1'])]+[('finalize_selected_coefficient_roots.py',[action]) for action in ['archive','receipts','check','commit']]:
 command=['python3',str(c/script),*args];print('START',command,flush=True)
 result=subprocess.run(command,cwd=w);print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
print('SELECTED-COEFFICIENT ROOTS COMMITTED LOCALLY; FULL PRE-PUSH AND GENERAL OPERATION CLOSURE REMAIN OPEN',flush=True)
''')
print('Prepared closeout; final qualification and parent admission gates remain required.')
