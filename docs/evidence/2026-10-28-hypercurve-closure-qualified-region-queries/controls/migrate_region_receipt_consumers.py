from pathlib import Path
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
c = root / 'controls'
checkout = root / 'qualified-region-queries'
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files, patch = e.source_snapshot()
run = c / 'qualified-region-queries-qualification-query4'
assert before == json.loads((run / 'source-after.json').read_text())
assert json.loads((run / 'results.json').read_text())[-1]['exit_code'] == 101
baseline = c / 'qualified-region-query-existing-receipts-baseline1'
assert before == json.loads((baseline / 'source-after.json').read_text())
assert json.loads((baseline / 'results.json').read_text())[0]['exit_code'] == 101
(c / 'qualified-region-query-consumer-migration-before.patch').write_bytes(patch)
p = checkout / 'crates/hypercurve/tests/hypercurve_curve_region_promotion.rs'
s = p.read_text()
old = 'assert_eq!(decided(area), Some(Real::from(34)));'
assert s.count(old) == 1
p.write_text(s.replace(old, 'assert_eq!(area.value, Some(Real::from(34)));'))
p = checkout / 'tests/receipt_composition.rs'
s = p.read_text()
old = '''    /// The union of the unit square with its copy translated by `1 + zero`,
    /// and a strict rebuild of its boundary without retained facts.'''
new = '''    /// The union of the unit square with its copy translated by `1 + zero`,
    /// and an explicitly adopted model of its retained boundary. Strict proofs
    /// about the adopted model do not certify fidelity to the original union.'''
assert s.count(old) == 1
s = s.replace(old, new)
old = '''        let rebuilt = CurveRegion2::try_from_boundary_paths(
            &union.boundary_paths().unwrap(),
            FillRule::NonZero,
        )
        .unwrap();'''
new = '''        assert!(matches!(
            union.boundary_paths(),
            Err(ExactCurveError::Blocked(reason))
                if reason.reason() == hypercurve::UncertaintyReason::Predicate
        ));
        let paths = hypercurve::evaluate_under(hypercurve::PredicatePolicy::APPROXIMATE_512, || {
            union.boundary_paths()
        });
        assert_eq!(paths.certainty(), hypercurve::CurveCertainty::Approximate512Consumed);
        let paths = paths.into_unverified().unwrap();
        // Intentional adoption: this control represents the retained boundary
        // as a new model, without claiming replay of the original source.
        let rebuilt = CurveRegion2::try_from_boundary_paths(&paths, FillRule::NonZero).unwrap();'''
assert s.count(old) == 1
s = s.replace(old,new)
start = s.index('    #[test]\n    fn region_receipts_are_local_and_reuse_reports_the_terminal()')
end = s.index('    #[test]\n    fn and_then_keeps_an_approximate_dependency_and_map_cannot_record_work()', start)
replacement = '''    fn assert_inherited_topology_blocker(error: csgrs::errors::ValidationError) {
        assert_eq!(error.kind(), csgrs::errors::ValidationErrorKind::Undecided);
        assert!(matches!(error,
            csgrs::errors::ValidationError::ExactCurve(ExactCurveError::Blocked(reason))
                if reason.reason() == hypercurve::UncertaintyReason::Predicate
        ));
    }

    #[test]
    fn region_receipts_are_local_and_reuse_reports_the_terminal() {
        let (union, rebuilt) = approximate_region();
        for context in [GeometryContext::STRICT, GeometryContext::APPROXIMATE_512, GeometryContext::STRICT] {
            let inside = curve::contains_xy_with_context(&union, Real::one(), half(), &context);
            let moved = curve::try_translated_with_context(&union, Real::from(5), Real::zero(), &context);
            let extruded = curve::try_extrude(&union, Real::one(), &context);
            if context == GeometryContext::STRICT {
                assert_inherited_topology_blocker(inside.unwrap_err());
                assert_inherited_topology_blocker(moved.unwrap_err());
                assert_inherited_topology_blocker(extruded.unwrap_err());
            } else {
                let inside = inside.unwrap();
                assert_eq!(inside.certainty, GeometryCertainty::Approximate512Consumed);
                assert_eq!(inside.value, Some(true));
                let moved = moved.unwrap();
                assert_eq!(moved.certainty, GeometryCertainty::Approximate512Consumed);
                let moved_query = curve::contains_xy_with_context(&moved.value, Real::from(6), half(), &context).unwrap();
                assert_eq!((moved_query.certainty, moved_query.value), (GeometryCertainty::Approximate512Consumed, Some(true)));
                assert_inherited_topology_blocker(curve::contains_xy_with_context(&moved.value, Real::from(6), half(), &GeometryContext::STRICT).unwrap_err());
                let extruded = extruded.unwrap();
                assert_eq!(extruded.certainty, GeometryCertainty::Approximate512Consumed);
                assert_eq!(extruded.value.construction_evidence().predicate_certainty(), None);
                assert!(extruded.value.construction_evidence().source_history_missing());
            }
            // Certified relative to the explicitly adopted retained boundary.
            let inside = curve::contains_xy_with_context(&rebuilt, Real::one(), half(), &context).unwrap();
            assert_eq!((inside.certainty, inside.value), (GeometryCertainty::Certified, Some(true)));
            let moved = curve::try_translated_with_context(&rebuilt, Real::from(5), Real::zero(), &context).unwrap();
            assert_eq!(moved.certainty, GeometryCertainty::Certified);
        }
    }

'''
s = s[:start] + replacement + s[end:]
old = '''        // The strict extrusion alone is a certified local proof.
        let local =
            curve::try_extrude(&moved.value, Real::one(), &GeometryContext::STRICT).unwrap();
        assert_eq!(local.certainty, GeometryCertainty::Certified);
        let chained = moved
            .clone()
            .and_then(|region| {
                curve::try_extrude(&region, Real::one(), &GeometryContext::STRICT)
            })
            .unwrap();
        assert_eq!(chained.certainty, GeometryCertainty::Approximate512Consumed);
        assert_eq!(chained.value, local.value);
        // A map keeps the receipt it was given but cannot see its closure's
        // decisions, here a strict area query.
        let mapped = moved.clone().map(|region| region.filled_area().unwrap());
        assert_eq!(mapped.certainty, GeometryCertainty::Approximate512Consumed);'''
new = '''        assert_inherited_topology_blocker(
            curve::try_extrude(&moved.value, Real::one(), &GeometryContext::STRICT).unwrap_err()
        );
        let strict_chain = moved.clone().and_then(|region| {
            curve::try_extrude(&region, Real::one(), &GeometryContext::STRICT)
        });
        assert_inherited_topology_blocker(strict_chain.unwrap_err());
        let local = curve::try_extrude(&moved.value, Real::one(), &GeometryContext::APPROXIMATE_512).unwrap();
        assert_eq!(local.certainty, GeometryCertainty::Approximate512Consumed);
        let chained = moved.clone().and_then(|region| {
            curve::try_extrude(&region, Real::one(), &GeometryContext::APPROXIMATE_512)
        }).unwrap();
        assert_eq!(chained.certainty, GeometryCertainty::Approximate512Consumed);
        assert_eq!(chained.value, local.value);
        // A map preserves its existing receipt; it cannot turn a typed failure
        // from its closure into successful geometry or infer new decisions.
        let mapped = moved.clone().map(|region| region.filled_area());
        assert_eq!(mapped.certainty, GeometryCertainty::Approximate512Consumed);
        assert!(matches!(mapped.value, Err(ExactCurveError::Blocked(reason))
            if reason.reason() == hypercurve::UncertaintyReason::Predicate));
        let authorized = moved.clone().map(|region| {
            hypercurve::evaluate_under(hypercurve::PredicatePolicy::APPROXIMATE_512, || region.filled_area())
        });
        assert_eq!(authorized.certainty, GeometryCertainty::Approximate512Consumed);
        assert_eq!(authorized.value.certainty(), hypercurve::CurveCertainty::Approximate512Consumed);
        assert_eq!(authorized.value.into_unverified().unwrap(), Some(Real::from(2)));'''
assert s.count(old) == 1
s = s.replace(old,new)
p.write_text(s)
p = checkout / 'docs/MIGRATIONS.md'
s = p.read_text()
needle = '## Exact empty SVG documents\n'
addition = '''The CSGRS receipt-composition fixtures apply the same rule to boundary
readback, translation, extrusion and `GeometryOutcome::and_then`/`map`.
Strict source claims remain blocked; authorized operations retain the
approximation receipt and their original geometry expectations. Their
separate strict reconstruction control explicitly adopts the extracted
boundary as a new model. Its local proofs do not establish fidelity to the
original approximate construction. Meshes with missing source history keep
that missing-history marker rather than claiming certified ancestry.

'''
assert s.count(needle) == 1
p.write_text(s.replace(needle,addition+needle))
subprocess.run(['cargo','+1.99.1','fmt','--all'],cwd=checkout,check=True)
after,new_files,_=e.source_snapshot()
old_map={r[0]:r[1:] for r in files}
changed=sorted(r[0] for r in new_files if old_map.get(r[0])!=r[1:])
assert changed==['crates/hypercurve/tests/hypercurve_curve_region_promotion.rs','docs/MIGRATIONS.md','tests/receipt_composition.rs']
e.save_json(c/'qualified-region-query-consumer-migration-applied.json', {'before':before,'after':after,'changed_paths':changed,'production_bytes_unchanged':True,'epoch':time.time(),'contract':'Preserve original construction data and authorized geometry expectations; require inherited certainty and typed strict failure. Explicitly distinguish an adopted retained-boundary model from source fidelity. The Certified-only miter helper is bypassed only after asserting Approximate512Consumed; expected area remains34.'})
print(json.dumps(after,sort_keys=True))
