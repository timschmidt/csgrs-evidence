"""Derive a self-contained closeout controller with empty-axis-specific gates."""
from pathlib import Path
import ast

c = Path(__file__).resolve().parent
text = (c / 'finalize_polynomial_multiplicities.py').read_text()


def replace(old, new):
    global text
    assert text.count(old) == 1, old[:120]
    text = text.replace(old, new, 1)


replace('fully qualified repeated-factor increment', 'fully qualified empty-axis increment')
text = text.replace('polynomial-multiplicities', 'empty-axis-topology')
text = text.replace('polynomial_multiplicities', 'empty_axis_topology')
replace("FOCUS = C / (NAME + '-focus-final3')", "FOCUS = C / (NAME + '-focus-final1')")
start = text.index('IMPLEMENTATION = {')
end = text.index('FOCUS_NAMES = ', start)
text = text[:start] + '''IMPLEMENTATION = {
    'crates/hypersolve/src/bivariate_topology.rs',
    'crates/hypersolve/tests/bivariate_empty_axis.rs',
    'crates/hypercurve/tests/polynomial_empty_axis.rs',
    'crates/hyperbrep/tests/empty_plane_sections.rs',
    'crates/hypersolve/CHANGELOG.md', 'crates/hypercurve/CHANGELOG.md',
    'crates/hypercurve/qualification/capabilities.json',
}
RECEIPTS = {
    'crates/hypersolve/FUTURE_WORK.md', 'crates/hypercurve/FUTURE_WORK.md',
    'docs/evidence-archive.md', 'docs/evidence-archive.tsv',
}
''' + text[end:]
replace("    path.write_text(json.dumps(value, indent=2) + '\\n')", "    temporary = path.with_name(path.name + '.tmp')\n    temporary.write_text(json.dumps(value, indent=2) + '\\n')\n    temporary.replace(path)")
start = text.index("    baseline = C / (NAME + '-baseline2')")
end = text.index('    repeat = next(', start)
text = text[:start] + '''    baseline = C / (NAME + '-cargo-baseline1')
    failed = read(baseline / 'result.json')
    assert failed['exit_code'] == 101 and failed['source_stable']
    assert read(baseline / 'source-before.json')['revision'] == PARENT
    assert read(baseline / 'files-before.json') == read(baseline / 'files-after.json')
    original = (baseline / 'acceptance.log').read_text()
    assert 'test result: FAILED. 2 passed; 2 failed;' in original
    assert original.count('closed rectangle: VerticalComponent') == 2
    assert re.findall(r'^diff --git a/(.*?) b/', (baseline / 'candidate.patch').read_text(), re.M) == ['crates/hypersolve/tests/bivariate_empty_axis.rs']
    preserved = [
        'crates/hypersolve/tests/bivariate_topology.rs',
        'crates/hypersolve/tests/support/bivariate_topology.rs',
        'crates/hypersolve/tests/bivariate_boundary_components.rs',
        'crates/hypercurve/tests/polynomial_chamfer_corners.rs',
        'crates/hypercurve/src/svg', 'crates/hyperbrep/src/persistence',
        'crates/hyperbrep/tests/plane_tensor_sections.rs',
        'crates/hyperbrep/tests/support/plane_tensor_sections.rs',
    ]
    assert not output(['git', 'diff', PARENT, '--', *preserved])
    replay = read(C / (NAME + '-replay-selector-audit.json'))
    assert replay['qualified_source'] == qualified
    assert replay['exit_code'] == 0 and replay['exact_selected_tests'] == 1
''' + text[end:]
start = text.index('    attempts = [')
end = text.index('    suffixes = ', start)
text = text[:start] + '''    attempts = [
        'baseline1', 'baseline2', 'cargo-baseline1', 'owner-fix1',
        'owner-fix2', 'owner-fix3', 'consumers1', 'focus-final1', 'full-final1',
    ]
''' + text[end:]
replace("'finalize_empty_axis_topology.py', 'close_empty_axis_topology.py']", "'finalize_empty_axis_topology.py', 'close_empty_axis_topology.py',\n                'prepare_empty_axis_finalizer.py', 'empty_axis_topology*.rs',\n                'polynomial_empty_axis.rs', 'empty_plane_sections.rs']")
start = text.index("        'closure_argument':")
end = text.index("        'hardware':", start)
text = text[:start] + '''        'closure_argument': 'For a nonzero rational first-coordinate polynomial, each real zero in the closed first-coordinate interval gives an identically zero second-coordinate fiber. The existing exact boundary projection includes every such first-coordinate root. Its closed-fiber census preserves live vertical-component refusal. A completed census without any such root therefore proves the zero set in the whole rectangle empty; original equation and domain remain authoritative. No geometric sampling is used.',
        'review': read(C / (NAME + '-owner-review.json')),
        'baseline': 'On the unchanged d31 production source, x^2+1 and x-3 execute and fail VerticalComponent on [-1,1] x [-2,2]; constant-empty/live-vertical and invalid-domain controls pass. The earlier external probe reproduces these cases; its compile-only import failure has no runtime credit.',
        'independent_evidence': 'Strict positivity and exact excluded roots establish the empty sets independently. Original equations and domains survive further fibers and curve-set reconstruction. Three whole tensor patches have height u^2+1, u-3 or (u-2)^2 on [0,1]^2; exact disjointness persists through both operand orders, fresh-process native replay, a nonsingular affine map and another replay/query.',
        'replay_selector_audit': replay,
        'selection': 'The existing projection and original-equation fiber census remain authoritative. No alternative geometric carrier, serialized success flag, coordinate rounding or tolerance is introduced. Empty topology is distinct from invalid domains and actual live vertical components.',
        'resources': 'Axis/projection degree refusal, zero-work refusal and larger retry are exercised. The same one-promotion budget correctly completes this rational census. A mistaken new expectation of exhaustion is retained and corrected against the existing WorkBudget contract; no artificial charge or production change forces exhaustion. Current counters do not bound total arithmetic, coefficient growth, retained memory or cancellation.',
        'cost_observations': metrics,
        'cost_limits': 'Cargo command wall times and maximum process RSS include builds and child processes. Existing allocation lifetime checks are regression coverage, not a matched empty-axis benchmark. No speedup or total resource bound is claimed.',
        'limits': 'This admits empty first-coordinate support over rational closed rectangles. Actual vertical components, algebraic-coefficient topology, general implicit operations and total resource bounds remain open. The independently qualified multiplicity and zero-distance increments are not part of this source. These affected checks are not full pre-push qualification.',
''' + text[end:]
replace('Record exact repeated-factor topology and consumer admission', 'Record empty first-coordinate topology and replay admission')
start = text.index("    scalar = f'''")
end = text.index("    path = W / 'docs/evidence-archive.md'", start)
text = text[:start] + """    scalar = f'''
## Empty first-coordinate polynomial topology (2026-10-29)

Removing an early nonconstant-axis rejection lets the existing exact projection
and closed-fiber census distinguish an empty rectangle from a live vertical
component. Every first-coordinate root in the closed domain enters that census;
an identically zero fiber still returns `VerticalComponent`. The original
equation, domain checks, root selection and resource controls remain authoritative.

On unchanged `d31ef199c3`, `x^2+1` and `x-3` incorrectly failed on
`[-1,1] x [-2,2]`. They now return empty topology and accept later fiber queries.
Seven owner tests include repeated and degree-six sources, algebraic live roots,
boundary roots, malformed domains, degree limits, zero-budget refusal and retry.
A one-promotion budget completes the rational census; a mistaken new exhaustion
expectation is recorded and corrected against the existing budget contract.

{shared}
This is empty-support admission. Actual vertical components and algebraic
coefficient topology remain open. Existing work counters do not bound total
arithmetic, coefficient growth, retained memory or cancellation. Command timing
and process RSS include builds; no performance improvement is claimed.
'''
    curve = f'''
## Empty polynomial sources through consumers (2026-10-29)

Empty first-coordinate polynomial topology now enters the native curve set,
retains its original equation and domain for reconstruction, and accepts further
fiber queries. Three rational tensor patches with exact heights `u^2+1`, `u-3`
and `(u-2)^2` over `[0,1]^2` are disjoint from the zero-height plane. Both operand
orders return successful empty sections. A fresh process validates each native
archive, repeats the queries, applies a nonsingular affine map, saves/reloads
and queries again. Exact sign expectations establish disjointness independently;
deterministic serialization is checked separately. The child-test selector was
audited on the qualified binary to exclude a zero-test successful exit.

{shared}
Original topology/boundary tests and the repeated-chamfer hard case are retained;
the latter still passes its unchanged 180-second envelope. Compile-only failed
probes and the incorrect new budget expectation remain in the evidence record.
Actual vertical components, arbitrary algebraic coefficients and general
implicit operations remain open. The independent multiplicity and zero-distance
changes are not included here. No full-solid or performance claim is made.
'''
    for relative, paragraph in [('crates/hypersolve/FUTURE_WORK.md', scalar),
                                ('crates/hypercurve/FUTURE_WORK.md', curve)]:
        path = W / relative
        content = path.read_text()
        assert paragraph.splitlines()[1] not in content
        path.write_text(content.rstrip() + '\\n' + paragraph)
""" + text[end:]
replace('It records exact repeated-factor\ntopology, geometric consumer admission, eight focused groups and 24 passing\naffected qualification groups. Original runtime failures, compile-only failed\nattempts and the interrupted review run are retained. Full pre-push and general\nalgebraic closure remain open. This evidence record is unpushed.', 'It records empty first-coordinate\ntopology, native curve and section consumers, eight focused groups and 24 passing\naffected qualification groups. Original runtime failures, the compile-only failed\nprobe and the corrected new budget expectation are retained. Full pre-push and\ngeneral algebraic closure remain open. This evidence record is unpushed.')
start = text.index("    relative = 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'", text.index("elif args.action == 'check':"))
end = text.index('    commands = [', start)
text = text[:start] + '    checks = []\n' + text[end:]
replace("assert len(checks) == 6", "assert len(checks) == 5")
replace('Preserve repeated polynomial factors through exact geometry', 'Admit empty first-coordinate polynomial topology')
replace('Eight focused groups, 24 affected groups and six receipt checks passed; code and evidence committed locally. Full pre-push, integration with the separate zero-distance correction and general closure remain open.', 'Eight focused groups, 24 affected groups and five receipt checks passed; code and evidence committed locally. Full pre-push, integration with the separate multiplicity and zero-distance increments and general closure remain open.')
ast.parse(text)
target = c / 'finalize_empty_axis_topology.py'
assert not target.exists()
target.write_text(text)
print(target)

close = (c / 'close_polynomial_multiplicities.py').read_text()
close = close.replace('polynomial-multiplicities', 'empty-axis-topology')
close = close.replace('polynomial_multiplicities', 'empty_axis_topology')
close = close.replace('Repeated polynomial factors', 'Empty first-coordinate topology')
ast.parse(close)
target = c / 'close_empty_axis_topology.py'
assert not target.exists()
target.write_text(close)
print(target)
