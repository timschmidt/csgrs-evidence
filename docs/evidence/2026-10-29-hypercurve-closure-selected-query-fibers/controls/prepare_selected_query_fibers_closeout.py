"""Prepare guarded closeout controls; do not modify any qualified source."""
from pathlib import Path
import ast
import json
import subprocess

r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'selected-query-fibers'
implementation = set(subprocess.check_output(['git', 'diff', '--name-only', 'HEAD'], cwd=w, text=True).splitlines())
assert len(implementation) == 32
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
assert not implementation & receipts

def write(name, text):
    path = c / name
    assert not path.exists(), path
    ast.parse(text, filename=name)
    path.write_text(text)

def replace_once(text, old, new):
    assert text.count(old) == 1, old
    return text.replace(old, new, 1)

alignment = (c / 'align_selected_field_root_discovery.py').read_text()
alignment = alignment.replace('selected-field-root-discovery', 'selected-query-fibers')
alignment = alignment.replace('selected-polynomial-points-final-commit.json', 'selected-field-root-discovery-final-commit.json')
start = alignment.index('implementation=')
end = alignment.index('\nprepared=', start)
alignment = alignment[:start] + 'implementation=' + repr(implementation) + alignment[end:]
alignment = alignment.replace('qualification-final5', 'qualification-final1').replace('==15', '==25')
alignment = alignment.replace("prepared['point_parent']", "prepared['root_source_checkpoint_parent']")
alignment = alignment.replace("['git','add','-N','crates/hypersolve/tests/selected_polynomial_root_discovery.rs','crates/hypersolve/src/ordered_field_roots/complete.rs']", "['git','add','-N','crates/hypercurve/tests/polynomial_query_fibers.rs','crates/hypercurve/src/polynomial_point/selected_fiber.rs']")
alignment = alignment.replace("'point_parent'", "'root_parent'").replace("'point_evidence'", "'root_evidence'")
alignment = alignment.replace('root discovery working files', 'dependent fiber working files').replace('finalized point parent', 'finalized root-discovery parent')
write('align_selected_query_fibers.py', alignment)

probe = (c / 'probe_polynomial_operations_roots.py').read_text()
probe = probe.replace('selected-field-root-discovery', 'selected-query-fibers')
probe = probe.replace('hypersolve-selected-query-fibers-admission', 'hypercurve-selected-query-fibers-admission')
probe = probe.replace("default='roots1'", "default='query-fibers1'")
probe = probe.replace('qualification-final5', 'qualification-final1')
probe = probe.replace('Current solver discovery source built after all 15 qualification groups', 'Current dependent-fiber source built after all 25 qualification groups')
write('probe_polynomial_operations_query_fibers.py', probe)

finalizer = (c / 'finalize_selected_field_root_discovery.py').read_text()
finalizer = finalizer.replace('selected-field-root-discovery', 'selected-query-fibers').replace('selected_field_root_discovery', 'selected_query_fibers')
finalizer = finalizer.replace('selected-polynomial-points-final-commit.json', 'selected-field-root-discovery-final-commit.json')
finalizer = finalizer.replace('qualification-final5', 'qualification-final1').replace('== 15', '== 25')
finalizer = finalizer.replace("ALIGNMENT['point_parent']", "ALIGNMENT['root_parent']").replace("ALIGNMENT['point_evidence']", "ALIGNMENT['root_evidence']")
finalizer = finalizer.replace('2026-10-28', '2026-10-29').replace('polynomial-operation-frontier-roots1', 'polynomial-operation-frontier-query-fibers1')
start = finalizer.index('IMPLEMENTATION = ')
end = finalizer.index('\nPOINT =', start)
finalizer = finalizer[:start] + 'IMPLEMENTATION = ' + repr(implementation) + finalizer[end:]
finalizer = replace_once(finalizer, '"""Admit the arithmetic increment only after its frozen qualification passes."""', '"""Admit dependent query fibers only after frozen owner/downstream validation."""')
start = finalizer.index('    focused = ')
end = finalizer.index('    assert subprocess.run', start)
finalizer = finalizer[:start] + '''    focused_dir = CONTROLS / 'selected-query-fibers-fix4'
    focused = json.loads((focused_dir / 'complete.json').read_text())
    assert focused['all_passed'] and focused['source'] == qualified and focused['groups'] == 12
    focus_rows = json.loads((focused_dir / 'results.json').read_text())
    assert len(focus_rows) == 12 and all(row['exit_code'] == 0 and row['source_stable'] for row in focus_rows)
    preflight = json.loads((CONTROLS / 'selected-query-fibers-preflight-2/complete.json').read_text())
    assert preflight['exit_code'] == 0 and preflight['source_stable'] and preflight['source'] == qualified
    owners = json.loads((CONTROLS / 'selected-query-fibers-owners-2/complete.json').read_text())
    assert owners['all_passed'] and owners['groups'] == 3 and owners['source'] == qualified
    baseline = json.loads((CONTROLS / 'selected-query-fibers-baseline2/complete.json').read_text())
    assert baseline['statuses'] == [0, 0, 0, 101]
    operation_baseline = json.loads((CONTROLS / 'selected-query-fibers-operation-baseline1/complete.json').read_text())
    assert operation_baseline['expected_failure_reproduced']
    integration_baseline = json.loads((CONTROLS / 'selected-closure-integration-baseline1/complete.json').read_text())
    assert integration_baseline['source'] == qualified and integration_baseline['expected_outcomes_reproduced']
    depth_rows = json.loads((CONTROLS / 'selected-query-fibers-fix2/results.json').read_text())
    assert [row['exit_code'] for row in depth_rows] == [0, 0, 0, 0, 101]
    suites = {name: counts(run / (name + '.log')) for name in [
        'selected-fibers', 'selected-roots', 'brep-replay', 'solver-full', 'solver-minimal',
        'curve-full', 'model-full', 'dependent-hyperbrep', 'dependent-hyperbrep-io',
        'dependent-hypercircuit', 'dependent-hyperdrc', 'dependent-hypergraphics', 'dependent-hyperpack',
    ]}
    assert counts(focused_dir / 'polynomial_branch_consumes_a_nested_selected_fiber_query.log')['passed'] == 1
''' + finalizer[end:]
start = finalizer.index('    for name in [', finalizer.index('    prefixes ='))
end = finalizer.index('    for name in sorted(IMPLEMENTATION):', start)
finalizer = finalizer[:start] + '''    controls = {
        'prepare_selected_query_fibers_closeout.py', 'align_selected_query_fibers.py',
        'close_selected_query_fibers.py', 'finalize_selected_query_fibers.py',
        'probe_polynomial_operations_query_fibers.py', 'polynomial-operation-frontier-tests.rs',
        'probe_selected_closure_integration.py', 'selected-closure-integration-tests.rs',
        'selected-closure-integration-contract.json',
    }
    for path in CONTROLS.iterdir():
        if path.is_file() and ('query_fiber' in path.name or path.name.startswith('selected-query-fibers-')):
            if path.suffix in {'.py', '.rs', '.json', '.log', '.patch'}:
                controls.add(path.name)
    for name in sorted(controls):
        copy(CONTROLS / name, Path('controls') / name)
''' + finalizer[end:]
start = finalizer.index("        'owner': ")
end = finalizer.index("        'rustc': ", start)
finalizer = finalizer[:start] + '''        'owner': 'Hypercurve point and polynomial-branch carriers; Hypersolve selected fields and shared ordered-field Sturm discovery; native SVG and HyperBREP persistence adapters',
        'properties': ['P2', 'P12', 'P14', 'P18', 'P19', 'P20', 'P26', 'P36'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'owners': owners,
        'baseline': baseline, 'operation_baseline': operation_baseline, 'depth_regression': depth_rows,
        'integration_gaps': integration_baseline,
        'frontier': frontier, 'source_alignment': ALIGNMENT,
        'domain': 'Already admitted finite polynomial graph branches evaluated at source-bound rational queries over retained selected algebraic point fields. Arbitrary finite fiber degree with represented finite root bounds and decidable exact field signs. Original native Bezier-base fibers remain supported. Original polynomial, parameter recipe, scalar chart, branch ordinal, domains and selectors remain authoritative.',
        'proof': 'Evaluate original query and denominator in its retained field; form fiber coefficients in that same field; use the existing complete Sturm root census and original slab ordinal; select a singleton over the original equation. Store the shared x/y field pair with the original PolynomialFiber definition. Native replay reconstructs and validates source dependencies and selectors. No coordinate materialization or duplicate polynomial arithmetic kernel is introduced.',
        'witnesses': 'u>0,8u^2=1; v>0,16v^3=u; evaluate positive y^2=x at x=v and prove 2048x^6=1, incidence and a further evaluation recovering v. Ten cases cover opposite/repeated/exact roots, degree17, authored/generated queries, rational geometry, trim/reversal/affine transport, 1/10^12 separation, operation-local diagnostics, small limits and retries, and cold native replay followed by another operation. The original depth-zero and operation-attribution failures are retained. HyperBREP cold archives consume the new fiber through a retained query in a further affine point construction.',
        'migration': 'PolynomialFiber.parameter changes from BezierParameter2 to CurveParameter2. Existing callers convert with into() or inspect as_bezier_parameter(); original native assertions remain. Existing SVG fiber and HyperBREP planar records admit retained query references. CHANGELOG and MIGRATIONS record the public source compatibility change.',
        'limits': 'Configured per-segment subdivision depth and shared refinement charges are enforced before publishing complete roots; exhausted attempts publish no partial list. Depth is not a total arithmetic, coefficient-growth, memory, elapsed-time or cancellation bound. Unrestricted discovery keeps its existing behavior. Native scalar fibers lacking query recipes and more general relative-coefficient geometry remain open. Seven original implicit-region offset/corner fixtures still return Unsupported with three controls passing. These are implementation gaps, not completed closure. Twenty-five local/downstream groups do not replace the full publication pre-push contract.',
        'cost_scope': 'Raw focused completion times, time-v peak RSS, source and artifact sizes, compiler settings and allocation lifetime controls are retained. No speedup or uniform practical bound is claimed.',
        'hardware': output(['lscpu', '--json']),
''' + finalizer[end:]
finalizer = finalizer.replace('Record complete ordered-field root discovery', 'Record dependent polynomial query fibers and replay')
start = finalizer.index("    text = f'''")
end = finalizer.index("    path = CHECKOUT / 'crates/hypercurve/FUTURE_WORK.md'", start)
finalizer = finalizer[:start] + """    text = f'''**2026-10-29 dependent polynomial-query fibers:**
An exact source query v with v>0, 16v^3=u and u>0, 8u^2=1 could not be
consumed as the abscissa of y^2=x. The original source control passed and
branch evaluation returned Unsupported on the target revision. Hypercurve
now retains that query as the base of a polynomial fiber, reusing Hypersolve's
selected fields and complete Sturm discovery. The point keeps its original
equation, parameter recipe and selector alongside shared field coordinates.
Original branch domains, slab root counts and ordering still select the arc.

Ten acceptance cases pass. Independent relations include 2048x^6=1,
positive-root incidence and a further polynomial evaluation recovering the
original v. They cover repeated and opposite roots, exact events, degree17,
mixed authored/generated queries, rational evaluation, trim/reversal/affine
transport, 1/10^12 separation, certainty, cold native replay and further use.
HyperBREP archives also replay in a fresh process and feed another exact
affine point construction. Native-base fixtures retain their geometry and assertions.
PolynomialFiber.parameter now uses CurveParameter2; CHANGELOG and MIGRATIONS
document conversions and native query references.

A new zero-depth case exposed an ignored configured limit; the shared Sturm
implementation now enforces optional per-segment depth before publishing a
complete result. Exhaustion returns no partial roots and larger retries pass.
Another reproduced failure attributed invalid construction to Evaluation;
the diagnostic now retains Construction. Both failures and the original
unsupported chain remain archived alongside corrected results.

All 25 affected qualification groups pass, including full Hypersolve
({suites['solver-full']['passed']:,} passed), Hypercurve
({suites['curve-full']['passed']:,} passed), CSGRS
({suites['model-full']['passed']:,} passed), six downstream suites, strict
four-package MSRV Clippy, minimal checks, strict docs and both fuzz manifests,
allocation lifetime controls, capability checks and hygiene. Commands record
ignored tests separately. The qualified source is reconstructable from
retained revisions, patches and file inventories; only the finalized parent's
three receipt files change during alignment. Source, original failures,
completion times and peak RSS are in {record}, SHA-256 {digest}.
Receipt checks run after the final ledger edit. No speedup is claimed.

Seven original region offset/corner operations still return Unsupported with
three controls passing. Native scalar fibers without source-query recipes,
more general relative-coefficient geometry and general operation closure remain
open. Configured depth and refinement counts do not bound total arithmetic,
coefficient growth, memory, elapsed time or cancellation. This increment still
requires full pre-push verification before publication.

Two cross-increment witnesses also remain open on this isolated source:
the generated fiber's parameter is Unsupported in rational differentiation,
and a derived quotient recipe loses its original divisor pole guard and
incorrectly accepts that pole. Their source control passes. The separately
qualified derivative and guard fixes must be integrated and both original
witnesses must pass before this work is published. The failed integration
observations are retained in the same archive; they are not exact successes.

'''
""" + finalizer[end:]
start = finalizer.index("    paragraph = f'''")
end = finalizer.index('    path.write_text(content.replace', start)
finalizer = finalizer[:start] + """    paragraph = f'''The local {archive['branch'].removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. It records dependent polynomial fibers
over retained selected queries, ten exact/resource/replay cases and 25 affected
qualification groups. Original unsupported, depth-limit and error-attribution
failures, reconstruction patches and seven region blockers remain explicit.
General operation closure and publication are not claimed. This record is
unpushed.

'''
""" + finalizer[end:]
finalizer = finalizer.replace('Isolate repeated roots over retained exact coefficient fields', 'Evaluate polynomial branches over retained selected queries')
finalizer = finalizer.replace('Complete ordered-field root discovery qualified through local/downstream suites, aligned to finalized point parent, archived and committed locally. General geometric region integration remains open.', 'Dependent polynomial fibers qualified through owner/downstream suites, aligned to finalized root-discovery parent, archived and committed locally. General region-operation closure remains open.')
finalizer = finalizer.replace('Continue geometric construction from the committed exact selected-field discovery interface.', 'Continue general region-operation construction and integrate separately qualified increments.')
finalizer = replace_once(finalizer,
    "prefixes = ['selected-query-fibers-', 'polynomial-operation-frontier-query-fibers1']",
    "prefixes = ['selected-query-fibers-', 'polynomial-operation-frontier-query-fibers1', 'selected-closure-integration-baseline1']")
write('finalize_selected_query_fibers.py', finalizer)

closeout = (c / 'close_selected_field_root_discovery.py').read_text()
closeout = closeout.replace('selected-field-root-discovery', 'selected-query-fibers').replace('selected_field_root_discovery', 'selected_query_fibers')
closeout = closeout.replace('qualification-final5', 'qualification-final1')
closeout = closeout.replace('selected-polynomial-points-final-commit.json', 'selected-field-root-discovery-final-commit.json').replace('selected-polynomial-points-closeout-final7', 'selected-field-root-discovery-closeout-final5')
closeout = closeout.replace('Root discovery qualification', 'Dependent-fiber qualification').replace('Point finalization', 'Root-discovery finalization').replace('root discovery alignment', 'dependent-fiber alignment')
closeout = closeout.replace('probe_polynomial_operations_roots.py', 'probe_polynomial_operations_query_fibers.py')
closeout = closeout.replace('SELECTED FIELD ROOT DISCOVERY INCREMENT COMMITTED', 'DEPENDENT POLYNOMIAL QUERY FIBERS COMMITTED')
write('close_selected_query_fibers.py', closeout)

(c / 'selected-query-fibers-closeout-prepared.json').write_text(json.dumps({
    'implementation_files': sorted(implementation), 'source_frozen': True,
    'qualification': 'selected-query-fibers-qualification-final1', 'required_groups': 25,
    'parent': 'selected-field-root-discovery-final-commit.json',
    'scope': 'Prepare guarded receipt-only parent alignment, original seven-operation blocker replay, evidence archive and final local commit. No source change or push.',
}, indent=2) + '\n')
print('Prepared four closeout controls; source unchanged.')
