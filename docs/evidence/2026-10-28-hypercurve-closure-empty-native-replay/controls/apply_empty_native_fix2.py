from pathlib import Path
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
checkout = (root / 'empty-native-replay').resolve()
record = controls / 'empty-native-fix2-applied.json'
assert not record.exists()
rows = json.loads((controls / 'empty-native-composition-baseline1/results.json').read_text())
assert [r['exit_code'] for r in rows] == [0, 0, 101, 101, 0]
assert all(r['source_stable'] for r in rows)
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec); spec.loader.exec_module(e)
before, _, patch = e.source_snapshot()
(controls / 'empty-native-fix2-before.patch').write_bytes(patch)
p = checkout / 'crates/hypercurve/src/bezier_region.rs'
text = p.read_text()
needle = '''        // The identity keeps every retained carrier and its evidence; wrapping
'''
assert text.count(needle) == 1
text = text.replace(needle, '''        self.validate_regularized_topology_replay(CurveOperation2::Transformation, policy)?;
''' + needle)
needle = '''    pub(crate) fn has_regularized_filled_left_topology(&self, policy: &CurveContext) -> bool {
'''
assert text.count(needle) == 1
method = '''    /// Retains newly consumed dependencies on an otherwise unchanged normalized
    /// result. Exact identities keep their shared carrier. A changed policy
    /// gets independent caches while retaining the same boundary definitions,
    /// incidence, ownership, and filled-left normalization proof.
    pub(crate) fn with_consumed_topology_policy(self, policy: &CurveContext) -> Self {
        let Some(previous) = self.data.normalized_policy() else {
            return self;
        };
        let retained = policy.retained_object_policy_with_dependencies([previous]);
        if retained == previous {
            return self;
        }
        let mut data = CurveRegionData2::new(self.data.boundary_loops.clone());
        data.certified_loop_roles = self.data.certified_loop_roles.clone();
        data.state = CurveRegionState2::Normalized(retained);
        data.filled_side_is_left
            .certify(Arc::from(vec![true; data.boundary_loops.len()]));
        Self { data: Arc::new(data) }
    }

'''
text = text.replace(needle, method + needle)
p.write_text(text)
p = checkout / 'crates/hypercurve/src/curve_region_boolean.rs'
text = p.read_text()
for old, new in [
    ('boolean_trivial_region(self, other, operation)?', 'boolean_trivial_region(self, other, operation, policy)?'),
    ('boolean_trivial_region(&first, &second, operation)?', 'boolean_trivial_region(&first, &second, operation, policy)?'),
    *[(f'boolean_trivial_region(&first, &second, operations[{i}])?', f'boolean_trivial_region(&first, &second, operations[{i}], policy)?') for i in range(4)],
]:
    assert text.count(old) == 1, old
    text = text.replace(old, new)
old = '''                .regularized_region_raw(policy)
                .map_err(|error| error.with_operation(CurveOperation2::Boolean));'''
assert text.count(old) == 1
text = text.replace(old, '''                .regularized_region_raw(policy)
                .map(|region| region.with_consumed_topology_policy(policy))
                .map_err(|error| error.with_operation(CurveOperation2::Boolean));''')
old = '''fn boolean_trivial_region(
    first: &CurveRegion2,
    second: &CurveRegion2,
    operation: BooleanOp,
) -> ExactCurveResult<Option<CurveRegion2>> {
    if first.is_empty() || second.is_empty() {
        return empty_operand_result(first, second, operation).map(Some);
    }
    if first == second || first.has_equivalent_exact_boundary(second) {
        return identical_operand_result(first, operation).map(Some);
    }
    Ok(None)
}'''
new = '''fn boolean_trivial_region(
    first: &CurveRegion2,
    second: &CurveRegion2,
    operation: BooleanOp,
    policy: &CurveContext,
) -> ExactCurveResult<Option<CurveRegion2>> {
    first.validate_regularized_topology_replay(CurveOperation2::Boolean, policy)?;
    second.validate_regularized_topology_replay(CurveOperation2::Boolean, policy)?;
    let region = if first.is_empty() || second.is_empty() {
        empty_operand_result(first, second, operation)?
    } else if first == second || first.has_equivalent_exact_boundary(second) {
        identical_operand_result(first, operation)?
    } else {
        return Ok(None);
    };
    Ok(Some(region.with_consumed_topology_policy(policy)))
}'''
assert text.count(old) == 1
p.write_text(text.replace(old, new))
subprocess.run(['cargo', '+1.99.1', 'fmt', '--all'], cwd=checkout, check=True)
after, _, _ = e.source_snapshot()
record.write_text(json.dumps({'owner': 'CurveRegion2 normalization dependencies across Boolean identities and affine transforms', 'properties': ['P12', 'P17', 'P18', 'P19', 'P20'], 'baseline': 'empty-native-composition-baseline1', 'reproduced': 'Strict empty Boolean union discards a qualified operand; identity transform returns success without observing its retained topology. Round offset reentry already preserves the dependency.', 'change': 'Validate both Boolean operand receipts before shortcuts, retain consumed topology requirements on returned normalized carriers, and validate affine replay before identity. An exact unchanged policy reuses the existing Arc. Changing a policy copies retained boundary handles and ownership into separate policy caches; it does not reconstruct geometry or rerun arrangement.', 'before': before, 'after': after, 'epoch': time.time()}, indent=2) + '\n')
print(record.read_text())
