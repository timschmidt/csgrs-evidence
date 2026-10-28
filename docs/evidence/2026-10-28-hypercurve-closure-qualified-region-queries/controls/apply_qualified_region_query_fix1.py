from pathlib import Path
import importlib.util
import json
import re
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
checkout = (root / 'qualified-region-queries').resolve()
record = controls / 'qualified-region-query-fix1-applied.json'
assert not record.exists()
for label, expected in [('qualified-region-query-baseline1', [0,101,101,101,101,0]), ('qualified-region-query-extra-baseline1', [0,101,101,101])]:
    rows = json.loads((controls / label / 'results.json').read_text())
    assert [r['exit_code'] for r in rows] == expected and all(r['source_stable'] for r in rows)
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec); spec.loader.exec_module(e)
before, _, patch = e.source_snapshot()
assert before == json.loads((controls / 'qualified-region-query-worktree-prepared.json').read_text())['copied_source']
(controls / 'qualified-region-query-fix1-before.patch').write_bytes(patch)
p = checkout / 'crates/hypercurve/src/bezier_region.rs'
text = p.read_text()
old = '''    pub(crate) fn validate_regularized_topology_replay(
        &self,
        operation: CurveOperation2,
        policy: &CurveContext,
    ) -> ExactCurveResult<()> {
        if let Some(retained) = self.data.normalized_policy() {
            policy
                .validate_retained_policy(retained)
                .map_err(|cause| ExactCurveError::invalid_unattributed(operation, cause))?;
            if retained != retained.strict_counterpart() {
                policy.observe_approximate_512();
            }
        }
        Ok(())
    }'''
new = '''    pub(crate) fn validate_regularized_topology_replay(
        &self,
        operation: CurveOperation2,
        policy: &CurveContext,
    ) -> ExactCurveResult<()> {
        self.validate_regularized_topology_policy(policy)
            .map_err(|cause| ExactCurveError::invalid_unattributed(operation, cause))
    }

    /// Every semantic query validates the normalization dependency before
    /// reading cached boundary facts or interpreting an empty collection.
    fn validate_regularized_topology_policy(&self, policy: &CurveContext) -> CurveResult<()> {
        if let Some(retained) = self.data.normalized_policy() {
            policy.validate_retained_policy(retained)?;
            if retained != retained.strict_counterpart() {
                policy.observe_approximate_512();
            }
        }
        Ok(())
    }'''
assert text.count(old) == 1
text = text.replace(old, new)
guarded = ['filled_side_is_left_with_area_cache', 'loop_roles_raw', 'native_line_arc_region', 'classify_curve_point_raw', 'classify_algebraic_point_with_boundary_contract', 'classify_point_raw', 'signed_area_raw', 'filled_area_raw']
for name in guarded:
    positions = [m.start() for m in re.finditer(r'(?m)^    (?:pub\(crate\) )?fn ' + name + r"(?:<'a>)?\(", text)]
    positions = [pos for pos in positions if pos > text.index('impl CurveRegion2 {\n    fn data_mut_for_construction')]
    assert len(positions) == 1, (name, positions)
    index = text.index('{', positions[0]) + 1
    text = text[:index] + '\n        self.validate_regularized_topology_policy(policy)?;' + text[index:]
old = '''        resolve_certified_operation(policy, |attempt| {
            let native = if points.iter().any(|point| point.coordinates().is_some())'''
new = '''        resolve_certified_operation(policy, |attempt| {
            self.validate_regularized_topology_policy(attempt)?;
            let native = if points.iter().any(|point| point.coordinates().is_some())'''
assert text.count(old) == 1; text = text.replace(old, new)
old = '''        if let Some(area) = self.data.signed_area_cache.certified() {
            return Ok(CurveOutcome::new(
                Classification::Decided(area.clone()),
                CurveCertainty::Certified,
            ));
        }
        resolve_certified_operation(policy, |attempt| self.signed_area_raw(attempt))'''
new = '''        resolve_certified_operation(policy, |attempt| {
            self.validate_regularized_topology_policy(attempt)?;
            if let Some(area) = self.data.signed_area_cache.certified() {
                return Ok(Classification::Decided(area.clone()));
            }
            self.signed_area_raw(attempt)
        })'''
assert text.count(old) == 1; text = text.replace(old, new)
p.write_text(text)
p = checkout / 'crates/hypercurve/src/bezier_retained_measure.rs'
text = p.read_text()
old = '''    pub fn bounds(&self) -> crate::ExactCurveResult<Option<Aabb2>> {
        if self.boundary_loops().is_empty() {'''
new = '''    pub fn bounds(&self) -> crate::ExactCurveResult<Option<Aabb2>> {
        let policy = crate::policy::principal_context();
        self.validate_regularized_topology_replay(crate::CurveOperation2::Classification, &policy)?;
        if self.boundary_loops().is_empty() {'''
assert text.count(old) == 1; text = text.replace(old, new)
old = '            self.bounds_with_policy(&crate::policy::principal_context()),'
assert text.count(old) == 1; text = text.replace(old, '            self.bounds_with_policy(&policy),')
p.write_text(text)
p = checkout / 'crates/hypercurve/src/transform.rs'
text = p.read_text()
old = '''            return Self::try_from_line_arc_region_raw(&transformed, policy)
                .map_err(|error| error.with_operation(CurveOperation2::Transformation));'''
new = '''            return Self::try_from_line_arc_region_raw(&transformed, policy)
                .map(|region| region.with_consumed_topology_policy(policy))
                .map_err(|error| error.with_operation(CurveOperation2::Transformation));'''
assert text.count(old) == 1; p.write_text(text.replace(old, new))
subprocess.run(['cargo', '+1.99.1', 'fmt', '--all'], cwd=checkout, check=True)
after, _, _ = e.source_snapshot()
record.write_text(json.dumps({'owner':'CurveRegion2 normalization policy before semantic queries and cached/native representations', 'properties':['P9','P12','P14','P19'], 'before':before, 'after':after, 'guarded_query_owners':guarded, 'additional_consumers':['scalar and mixed-point batches','cached signed area','public empty bounds','native similarity output'], 'original_test_assertions_preserved':True, 'active_parent_sources_unchanged':True, 'epoch':time.time()}, indent=2)+'\n')
print(record.read_text())

