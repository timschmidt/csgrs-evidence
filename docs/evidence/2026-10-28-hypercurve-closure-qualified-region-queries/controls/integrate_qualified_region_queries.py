from pathlib import Path
import copy
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
checkout = (root / 'qualified-region-queries').resolve()
rows = json.loads((controls / 'qualified-region-query-fix2/results.json').read_text())
assert len(rows) == 10 and all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before = e.source_snapshot()[0]
assert before == json.loads((controls / 'qualified-region-query-fix2/source-after.json').read_text())
path = checkout / 'crates/hypercurve/tests/qualified_region_queries.rs'
assert not path.exists()
prefix = '''use hypercurve::{
    Curve2, CurveCertainty, CurvePath2, CurveRegion2, FillRule, Point2,
    PredicatePolicy, QuadraticBezier2, Real, RegionPointLocation,
};

fn point(x: i32, y: i32) -> Point2 {
    Point2::new(x.into(), y.into())
}
'''
path.write_text(prefix + ''.join((controls / name).read_text() for name in [
    'qualified-region-query-tests.rs', 'qualified-region-query-extra-tests.rs', 'qualified-region-query-controls.rs'
]))
path = checkout / 'crates/hypercurve/qualification/capabilities.json'
catalog = json.loads(path.read_text())
base = next(row for row in catalog['fixtures'] if row['id'] == 'empty_region_topology_replay_observes_inherited_approximation')
cases = [
    ('qualified_empty_membership_queries_retain_topology_receipts', 'classification', 'Scalar and batch membership of an independently interior source point and exterior control.'),
    ('qualified_empty_area_queries_retain_topology_receipts', 'evaluation', 'Signed and filled area, including repeated cached queries.'),
    ('qualified_empty_role_queries_retain_topology_receipts', 'classification', 'Material/hole roles, counts and boundary profiles.'),
    ('qualified_empty_native_view_retain_topology_receipts', 'representation', 'Borrowed native contours through strict cache trials and authorized approximate fallback.'),
    ('qualified_empty_material_components_retain_topology_receipts', 'restriction_reconstruction', 'Existing empty material decomposition preserves inherited qualification.'),
    ('qualified_empty_side_and_fact_queries_retain_topology_receipts', 'classification', 'Filled-side and native structural facts preserve their normalization dependency.'),
    ('qualified_empty_bounds_keep_topology_receipts', 'evaluation', 'Empty bounds validate before returning the absence of a finite box.'),
    ('qualified_empty_similarity_keeps_native_lowering_receipt', 'transforms', 'Native similarity lowering retains the topology receipt on the returned carrier.'),
    ('qualified_nonempty_queries_and_components_retain_topology_receipts', 'classification', 'Qualified union with an exact disjoint square, cached queries and separately reconsumed material components.'),
    ('exact_region_queries_remain_certified_across_policy_changes', 'classification', 'Canonical empty and rational square queries and similarity remain certified under all three requested policies.'),
]
for name, stage, detail in cases:
    row = copy.deepcopy(base)
    exact = name.startswith('exact_')
    row.update(id=name, target='qualified_region_queries', test=name,
        owner='CurveRegion2 query policy validation and native cache/similarity consumers',
        properties=['P9','P12','P14','P19'],
        domain=('Exact canonical empty and rational square controls. ' if exact else 'Existing symbolic positive-height cap regularized approximately to empty; not an algebraic-domain restriction. ') + detail,
        families=['Line','QuadraticBezier'], origins=['authored','generated'],
        policies=['STRICT','APPROXIMATE_512'],
        semantics='Strict/approximate/strict policy replay; no geometric approximation is introduced by a query.',
        claims=([{'stage':stage,'outcome':'exact_success','assertion':detail}] if exact else [
            {'stage':stage,'outcome':'qualified_approximation','assertion':'Authorized query observes and retains inherited topology qualification. ' + detail},
            {'stage':stage,'outcome':'undecided','assertion':'STRICT keeps a typed Predicate blocker before and after authorized cached consumption.'}]),
        oracle='The source quadratic cap has x=2t, y=2*h*t*(1-t), h=2^-1024 by the sine-addition identity, area 2*h/3>0 and interior point (1,h/4). The independent positive sign is checked after construction. Exact square controls have bounds [4,6]^2 and area4.',
        timeout_seconds=120)
    assert not any(other['id'] == name for other in catalog['fixtures'])
    catalog['fixtures'].append(row)
assert len(catalog['fixtures']) == 271
path.write_text(json.dumps(catalog, indent=2) + '\n')
subprocess.run(['cargo','+1.99.1','fmt','--all'], cwd=checkout, check=True)
subprocess.run(['git','add','-N','crates/hypercurve/tests/qualified_region_queries.rs'], cwd=checkout, check=True)
e.save_json(controls / 'qualified-region-query-integrated.json', {
    'before':before, 'after':e.source_snapshot()[0], 'tests':10,
    'expected_hypercurve':2931, 'expected_suites':95, 'capability_rows':271,
    'original_eight_probe_assertions_preserved':True, 'epoch':time.time(),
})
print('Integrated ten query acceptance tests; final qualification still required.')
