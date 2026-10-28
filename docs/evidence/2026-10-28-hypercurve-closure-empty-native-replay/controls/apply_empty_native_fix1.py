from pathlib import Path
import importlib.util
import json
import sys
import time

sys.dont_write_bytecode=True
root=Path(__file__).resolve().parents[1]
controls=root/'controls'
checkout=(root/'empty-native-replay').resolve()
record=controls/'empty-native-fix1-applied.json'
assert not record.exists()
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before=e.source_snapshot()[0]
baseline=controls/'empty-native-final-baseline1'
assert before==json.loads((baseline/'source-before.json').read_text())
rows=json.loads((baseline/'results.json').read_text())
assert len(rows)==6 and rows[0]['exit_code']==0 and all(row['exit_code']==101 and row['source_stable'] for row in rows[1:])
changed=[]
def replace(relative,old,new,count=1):
    path=checkout/relative;text=path.read_text();assert text.count(old)==count,(relative,text.count(old),old)
    path.write_text(text.replace(old,new))
    if relative not in changed:changed.append(relative)

replace('crates/hypercurve/src/bezier_region.rs',
'''        let retained =
            policy.retained_object_policy_with_dependencies(self.data.normalized_policy());
        let data = self.data_mut_for_construction();''',
'''        let retained =
            policy.retained_object_policy_with_dependencies(self.data.normalized_policy());
        // Preserve the shared canonical empty when no qualification changed.
        // An approximate empty result needs its own retained topology receipt.
        if loop_count == 0 && self.data.normalized_policy() == Some(retained) {
            return Ok(self);
        }
        let data = self.data_mut_for_construction();''')
replace('crates/hypercurve/src/bezier_region.rs',
'''            policy
                .validate_retained_policy(retained)
                .map_err(|cause| ExactCurveError::invalid_unattributed(operation, cause))?;
        }
        Ok(())
    }

    /// Shares a successful, certified normalization''',
'''            policy
                .validate_retained_policy(retained)
                .map_err(|cause| ExactCurveError::invalid_unattributed(operation, cause))?;
            if retained != retained.strict_counterpart() {
                policy.observe_approximate_512();
            }
        }
        Ok(())
    }

    /// Shares a successful, certified normalization''')

relative='crates/hypercurve/src/curve_region_boolean.rs'
replace(relative,'''        if self.data.carriers.is_empty() {
            return Ok(CurveRegion2::empty());
        }''','''        if self.data.carriers.is_empty() {
            return CurveRegion2::empty()
                .with_regularized_filled_left_topology(&self.data.policy)
                .map_err(|cause| {
                    ExactCurveError::invalid_unattributed(CurveOperation2::Arrangement, cause)
                });
        }''')
replace(relative,'''        if arrangement_fragments.is_empty() {
            return Ok(CurveRegion2::default());
        }''','''        if arrangement_fragments.is_empty() {
            return CurveRegion2::empty()
                .with_regularized_filled_left_topology(&self.data.policy)
                .map_err(|cause| {
                    ExactCurveError::invalid_unattributed(CurveOperation2::Arrangement, cause)
                });
        }''')
replace(relative,'''        if loops.is_empty() {
            return Ok(CurveRegion2::empty());
        }''','''        if loops.is_empty() {
            return CurveRegion2::empty()
                .with_regularized_filled_left_topology(&self.data.policy)
                .map_err(|cause| {
                    ExactCurveError::invalid_unattributed(CurveOperation2::Boolean, cause)
                });
        }''')

replace('crates/hypercurve/src/finite_projection.rs',
'''    ) -> CurveResult<Classification<Vec<FiniteRegionProfile2>>> {
        if self.is_empty() {''',
'''    ) -> CurveResult<Classification<Vec<FiniteRegionProfile2>>> {
        match crate::ExactCurveError::classify_result(
            self.validate_regularized_topology_replay(crate::CurveOperation2::Evaluation, policy),
        )? {
            Classification::Decided(()) => {}
            Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
        }
        if self.is_empty() {''', count=2)

replace('crates/hypercurve/src/svg.rs',
'''/// their definitions. Unsupported retained definitions fail explicitly.
pub fn export_svg_document''',
'''/// their definitions. Unsupported retained definitions fail explicitly.
/// An exact empty document carries a zero-root native graph and uses a unit
/// display viewport. The viewport adds no filled geometry.
pub fn export_svg_document''')
replace('crates/hypercurve/src/svg.rs',
'''    let mut body = String::new();
    let bounds = exact_finite_bounds(geometry)?;

    if !geometry.region.is_empty() {
        let region = geometry
            .region
            .regularized_region_raw(&CurveContext::STRICT)
            .map_err(SvgError::Exact)?;''',
'''    let mut body = String::new();
    // Even an empty boundary can depend on qualified topology decisions.
    // Revalidate before choosing a display viewport or omitting its fill.
    let region = geometry
        .region
        .regularized_region_raw(&CurveContext::STRICT)
        .map_err(SvgError::Exact)?;
    let bounds = exact_finite_bounds(geometry, &region)?;

    if !region.is_empty() || (geometry.wires.is_empty() && geometry.paths.is_empty()) {''')
replace('crates/hypercurve/src/svg.rs',
'''fn exact_finite_bounds(geometry: &SvgGeometry2) -> SvgResult<[f64; 4]> {
    let policy = CurveContext::STRICT;
    let mut bounds = if geometry.region.is_empty() {
        None
    } else {
        match geometry
            .region
            .bounds_raw(&policy)''',
'''fn exact_finite_bounds(geometry: &SvgGeometry2, region: &CurveRegion2) -> SvgResult<[f64; 4]> {
    let policy = CurveContext::STRICT;
    let mut bounds = if region.is_empty() {
        None
    } else {
        match region
            .bounds_raw(&policy)''')
replace('crates/hypercurve/src/svg.rs',
'''    let bounds = bounds
        .ok_or_else(|| SvgError::Geometry("cannot serialize SVG without finite geometry".into()))?;''',
'''    let Some(bounds) = bounds else {
        // All carriers were checked above. This viewport is a display
        // convention for the empty set, not an added boundary or region.
        return Ok([0.0, 0.0, 1.0, 1.0]);
    };''')

after,files,patch=e.source_snapshot()
(controls/'empty-native-fix1.patch').write_bytes(patch)
record.write_text(json.dumps({'before':before,'after':after,'changed_files':changed,'fresh_baseline':'empty-native-final-baseline1','only_isolated_checkout_changed':True,'tests_not_yet_integrated':True,'epoch':time.time()},indent=2)+'\n')
print(record.read_text())
