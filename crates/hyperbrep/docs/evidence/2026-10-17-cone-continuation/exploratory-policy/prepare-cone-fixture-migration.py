"""Prepare explicit terminal-fixture migrations without editing the worktree."""
import hashlib
import json
from pathlib import Path
import re

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-17-cone-continuation/exploratory-policy/planned-updates'
OUT.mkdir(parents=True, exist_ok=True)
selection = {
    'crates/hypercurve/src/test_support.rs': ['terminally_unresolved_zero'],
    'crates/hypercurve/src/bezier_region/tests.rs': ['terminally_unresolved_zero'],
    'crates/hypercurve/src/curve.rs': ['boundary_cache_revalidates_approximate_internal_path_joins'],
    'crates/hypercurve/src/finite_projection.rs': ['terminally_equal_x_pair'],
    'crates/hypercurve/src/intersect.rs': ['line_arc_domain_exclusion_does_not_consume_unneeded_ordering', 'arc_endpoint_membership_survives_an_unresolved_other_endpoint'],
    'crates/hypercurve/src/native_region_tests.rs': ['unordered_native_arrangement_obeys_the_approximate_512_terminal', 'approximate_region_bounds_order_approximately_coincident_representations'],
    'crates/hypercurve/src/policy.rs': ['approximate_operation_runs_once_and_records_only_a_consumed_terminal'],
    'crates/hypercurve/src/rational_bezier_general.rs': ['injectivity_scope_retains_the_policy_of_axis_monotonicity'],
    'crates/hypercurve/src/segment.rs': ['sweep_membership_uses_a_decisive_half_plane', 'approximate_sweep_fragment_does_not_gain_certified_cache_facts'],
    'crates/hypercurve/src/bezier_offset/conversion_tests.rs': [
        'check_selected_fiber_rational_overlap',
        'selected_fiber_rational_component_publishes_its_isolated_endpoint',
        'selected_fiber_angle_query_observes_its_requested_policy',
        'assert_mapped_angle_query_policy',
        'retained_chord_coordinate_and_linear_queries_observe_requested_policy',
        'retained_chord_derived_queries_match_exact_affine_oracles_and_requested_policy',
        'mapped_circle_inverse_cache_retains_policy_without_strong_source_ownership',
        'mapped_circle_rational_cache_preserves_consumed_policy',
        'mapped_circle_diameter_cache_preserves_consumed_policy',
        'represented_circle_retained_point_incidence_observes_requested_policy',
        'selected_circle_partition_coalescing_obeys_terminal_policy',
        'selected_parallel_normal_circle_keeps_contacts_when_center_refines_to_exact',
    ],
    'crates/hypersolve/src/test_support.rs': ['terminal_zero'],
    'crates/hyperlimit/src/geometry/plane.rs': ['terminal_zero'],
    'crates/hyperlimit/src/resolve.rs': ['terminally_unresolved_zero'],
    'crates/hyperlimit/src/predicates/nd.rs': ['invalid_and_unresolved_nd_inputs_remain_explicit'],
}
for name in ['aabb', 'coplanar', 'filters', 'interval', 'order']:
    selection[f'crates/hyperlimit/src/predicates/{name}.rs'] = ['terminally_unresolved_zero']
for name in ['convex', 'distance', 'dop', 'halfspace', 'ring', 'segment', 'triangle', 'triangle_triangle']:
    selection[f'crates/hyperlimit/src/predicates/{name}.rs'] = ['terminal_zero']

def addition(indent):
    return '\n'.join(indent + line for line in [
        '(Real::e() + Real::one()).sin()',
        '    - Real::e().sin() * Real::one().cos()',
        '    - Real::e().cos() * Real::one().sin()',
    ]) + '\n'

sha = lambda b: hashlib.sha256(b).hexdigest()
records = []
for relative, functions in selection.items():
    path = ROOT / relative
    before = path.read_text()
    rewritten = []
    function = None
    sites = []
    for number, line in enumerate(before.splitlines(keepends=True), 1):
        match = re.match(r'\s*(?:pub(?:\([^)]*\))? )?fn (\w+)\(', line)
        if match:
            function = match[1]
        if function not in functions or '&sine * &sine + &cosine * &cosine' not in line:
            rewritten.append(line)
            continue
        indent = line[:len(line) - len(line.lstrip())]
        expr = '&sine * &sine + &cosine * &cosine'
        is_one = line.strip().endswith(expr + ';')
        assigned = re.match(r'\s*let (\w+) = ', line)
        name = assigned[1] if assigned else 'original'
        if not assigned:
            assert line.strip() == expr + ' - Real::one()', (relative, number, line)
            line = indent + 'let original = ' + line.strip() + ';\n'
        else:
            assert is_one or line.strip().endswith(expr + ' - Real::one();'), (relative, number, line)
        rewritten.append(line)
        rewritten.append(indent + '// Preserve the original identity as a newly certified proof case.\n')
        rewritten.append(indent + f'assert_eq!({name}.exact_rational_normal_form(), Some(hyperreal::Rational::{"one" if is_one else "zero"}()));\n')
        rewritten.append(indent + '// A separate angle-addition identity retains the terminal-policy control.\n')
        if relative.endswith('/src/test_support.rs'):
            assert not assigned
            rewritten.append(addition(indent))
        elif assigned:
            prefix = 'Real::one() + ' if is_one else ''
            rewritten.append(indent + f'let {name} = {prefix}crate::test_support::terminally_unresolved_zero();\n')
        else:
            rewritten.append(indent + 'crate::test_support::terminally_unresolved_zero()\n')
        sites.append(dict(function=function, line=number, original=line.strip(), value='1' if is_one else '0'))
    assert {r['function'] for r in sites} == set(functions), (relative, sites, functions)
    after = ''.join(rewritten)
    target = OUT / relative
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(after)
    records.append(dict(path=relative, before=sha(before.encode()), after=sha(after.encode()), sites=sites))

relative = 'crates/hyperlimit/src/test_support.rs'
path = ROOT / relative
before = path.read_text()
after = before + '''
/// An exact angle-addition zero outside the admitted normal-form frontier.
/// Terminal-policy tests must consume an actual unresolved decision.
pub(crate) fn terminally_unresolved_zero() -> Real {
''' + addition('    ') + '}\n'
target = OUT / relative
target.parent.mkdir(parents=True, exist_ok=True)
target.write_text(after)
records.append(dict(path=relative, before=sha(before.encode()), after=sha(after.encode()), sites=[]))
(OUT / 'proposal.json').write_text(json.dumps(dict(
    scope='Draft test-only fixture migration; not applied. Original identity constructors are retained with exact positive proof assertions. Mathematical zero/one values and all existing geometry, policy and cache assertions remain unchanged.',
    files=records), indent=2) + '\n')
print(json.dumps(dict(files=len(records), expression_sites=sum(len(r['sites']) for r in records))))
