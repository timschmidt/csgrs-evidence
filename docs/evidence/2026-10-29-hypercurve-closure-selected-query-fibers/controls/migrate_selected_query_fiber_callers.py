from pathlib import Path
import re
r = Path(__file__).resolve().parents[1]
w = r / 'selected-query-fibers'
for p in w.rglob('*.rs'):
    if 'target' in p.relative_to(w).parts: continue
    s = p.read_text()
    edits = []
    for match in re.finditer(r'CurvePointDefinition2::PolynomialFiber\s*\{', s):
        start = match.end(); depth = 0; end = start
        while end < len(s):
            ch = s[end]
            if ch in '{[(': depth += 1
            if ch in '}])':
                if depth == 0: break
                depth -= 1
            end += 1
        block = s[start:end]
        field = re.search(r'\bparameter\s*:', block)
        if not field: continue
        pos = field.end(); stop = pos; depth = 0
        while stop < len(block):
            ch = block[stop]
            if ch in '{[(': depth += 1
            if ch in '}])': depth -= 1
            if ch == ',' and depth == 0: break
            stop += 1
        expression = block[pos:stop].strip()
        if ('BezierParameter2::' in expression and '_' not in expression.split('::')[-1]) or expression == 'base()' or expression.startswith('root(vec!['):
            # Pattern matches with a wildcard retain the same type assertion
            # below; only construction expressions receive a conversion.
            if re.search(r'\b_\b', expression): continue
            assert not expression.endswith('.into()')
            suffix = len(block[pos:stop]) - len(block[pos:stop].rstrip())
            edits.append((start + stop - suffix, '.into()'))
    for at, addition in reversed(edits): s = s[:at] + addition + s[at:]
    if edits:
        p.write_text(s)
        print(p.relative_to(w), len(edits))
def edit(name, old, new):
    p = w / name; s = p.read_text(); assert s.count(old) == 1, (name, old)
    p.write_text(s.replace(old, new, 1))
for name in ['crates/hypercurve/tests/selected_polynomial_points.rs', 'crates/hyperbrep/src/persistence/planar_points.rs']:
    edit(name, 'parameter: base,\n        root:', 'parameter: base.into(),\n        root:') if name.startswith('crates/hypercurve') else edit(name, 'parameter: base,\n            root:', 'parameter: base.into(),\n            root:')
edit('crates/hypercurve/tests/polynomial_query_fibers.rs', '        parameter,\n        root:', '        parameter: parameter.into(),\n        root:')
for name, kind, indent in [('crates/hypercurve/tests/support/polynomial_sections.rs','Exact','        '),('crates/hypercurve/tests/support/polynomial_curves.rs','Algebraic','            ')]:
    edit(name, f'CurvePointDefinition2::PolynomialFiber {{\n{indent}    parameter: BezierParameter2::{kind}(_),\n{indent}    ..\n{indent}}}', f'CurvePointDefinition2::PolynomialFiber {{ parameter, .. }}\n{indent}    if matches!(parameter.as_bezier_parameter(), Some(BezierParameter2::{kind}(_)))')
edit('crates/hypercurve/tests/support/polynomial_curves.rs', 'matches!(base, BezierParameter2::Algebraic(_))', 'matches!(base.as_bezier_parameter(), Some(BezierParameter2::Algebraic(_)))')
edit('crates/hypercurve/src/polynomial_point/selected_fiber.rs',
'''                    if crate::classify::compare_reals(&root.lower, exact, &strict) != Some(Ordering::Equal)
                        || crate::classify::compare_reals(&root.upper, exact, &strict) != Some(Ordering::Equal) {
                        return Err(FieldError::InvalidSelector);
                    }''',
'''                    for endpoint in [&root.lower, &root.upper] {
                        match crate::classify::compare_reals(endpoint, exact, &strict) {
                            Some(Ordering::Equal) => {}
                            Some(_) => return Err(FieldError::InvalidSelector),
                            None => return Err(FieldError::Uncertain(UncertaintyReason::Predicate)),
                        }
                    }''')
# The external witness stays semantically identical on both API revisions.
p = r / 'controls/polynomial_query_fibers_tests.rs'
s = p.read_text(); assert '        parameter,\n        root:' in s
p.write_text(s.replace('        parameter,\n        root:', '        parameter: parameter.into(),\n        root:'))
