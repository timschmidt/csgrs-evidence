from pathlib import Path
import copy
import json
import subprocess
import time

root=Path(__file__).resolve().parents[1]
controls=root/'controls'
checkout=(root/'empty-native-replay').resolve()
record=controls/'empty-native-acceptance-integrated.json'
assert not record.exists()
probe=(controls/'empty-native-replay-tests.rs').read_text()
start=probe.index('    let zero =',probe.index('fn empty_region_export_keeps'))
end=probe.index('    let region = qualified.into_unverified();',start)+len('    let region = qualified.into_unverified();')
construction=probe[start:end]
assert probe.count(construction)==4
helper='\nfn qualified_empty_region() -> CurveRegion2 {\n'+construction.replace('    let region = qualified.into_unverified();','    qualified.into_unverified()')+'\n}\n'
probe=probe.replace(construction,'    let region = qualified_empty_region();')
old='    let source = SvgGeometry2::empty();'
new='''    let replay_input = std::env::var_os("HYPERCURVE_EMPTY_NATIVE_REPLAY_PATH");
    let source = match &replay_input {
        Some(path) => import_svg_document(&std::fs::read_to_string(path).unwrap()).unwrap(),
        None => SvgGeometry2::empty(),
    };'''
assert probe.count(old)==1;probe=probe.replace(old,new)
old='    assert!(import_svg_document(&changed_display).unwrap().is_empty());\n}'
new='''    assert!(import_svg_document(&changed_display).unwrap().is_empty());
    if replay_input.is_none() {
        let unique = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos();
        let file = std::env::temp_dir().join(format!("hypercurve-empty-native-{}-{unique}.svg", std::process::id()));
        std::fs::write(&file, &text).unwrap();
        let child = std::process::Command::new(std::env::current_exe().unwrap())
            .args(["canonical_empty_document_replays_before_further_operations", "--exact", "--nocapture"])
            .env("HYPERCURVE_EMPTY_NATIVE_REPLAY_PATH", &file)
            .output();
        let removed = std::fs::remove_file(&file);
        let child = child.unwrap();
        removed.unwrap();
        assert!(child.status.success(), "fresh-process empty replay failed: {child:?}");
    }
}'''
assert probe.count(old)==1;probe=probe.replace(old,new)
path=checkout/'crates/hypercurve/tests/svg_region_replay.rs';text=path.read_text()
assert 'fn canonical_empty_document_replays_before_further_operations' not in text
old='''    // Existing finite-bounds export policy remains explicit for a whole empty document.
    assert!(export_svg_document(&empty).is_err());'''
new='''    let exported = export_svg_document(&empty).unwrap();
    let replay = import_svg_document(&exported).unwrap();
    assert!(replay.is_empty());
    assert_eq!(export_svg_document(&replay).unwrap(), exported);'''
assert text.count(old)==1;text=text.replace(old,new)+helper+probe

root_test=r'''
#[test]
fn svg_adapter_replays_empty_results_and_preserves_qualification() {
    let center = Point2::new(Real::zero(), Real::zero());
    let start = Point2::new(Real::one(), Real::zero());
    let boundary = CurvePath2::try_new(vec![
        CircularArc2::try_from_center(start.clone(), start, center, false).unwrap().into(),
    ]).unwrap();
    let source = CurveRegion2::try_from_boundary_paths(&[boundary], FillRule::NonZero).unwrap();
    let erased = source.boolean_region(&source, BooleanOp::Difference).unwrap();
    for empty in [CurveRegion2::empty(), erased] {
        assert!(empty.is_empty());
        let text = export_svg(&empty, &[], &[]).unwrap();
        assert!(text.contains("data-hypercurve-path=\"5:484350350000000000000000\""));
        let (replay, wires, paths) = import_svg(&text).unwrap();
        assert!(replay.is_empty() && wires.is_empty() && paths.is_empty());
        assert_eq!(export_svg(&replay, &wires, &paths).unwrap(), text);
        let restored = replay.boolean_region(&source, BooleanOp::Union).unwrap();
        assert!(restored.boolean_region(&source, BooleanOp::Xor).unwrap().is_empty());
        assert!(replay.offset(Real::one(), &OffsetCornerStyle2::Round).unwrap().is_empty());
    }
    let qualified = hypercurve::provisional(|| {
        let zero = (Real::e() + Real::one()).sin()
            - Real::e().sin() * Real::one().cos()
            - Real::e().cos() * Real::one().sin();
        let start = Point2::new(Real::e().sin(), Real::zero());
        let end = Point2::new(Real::e().sin() + zero, Real::zero());
        let path = CurvePath2::try_new(vec![hypercurve::QuadraticBezier2::new(
            start, Point2::new(Real::zero(), Real::one()), end,
        ).into()]).unwrap();
        CurveRegion2::try_from_boundary_paths(&[path], FillRule::EvenOdd).unwrap()
    });
    assert_eq!(qualified.certainty(), hypercurve::CurveCertainty::Approximate512Consumed);
    let qualified = qualified.into_unverified();
    assert!(qualified.is_empty());
    assert!(matches!(
        export_svg(&qualified, &[], &[]),
        Err(csgrs::io::IoError::Construction {
            format: "SVG",
            source: csgrs::errors::ValidationError::ExactCurve(hypercurve::ExactCurveError::Blocked(reason)),
        }) if reason.reason() == hypercurve::UncertaintyReason::Predicate
    ));
}
'''
# The Rust text is raw; quotes need no Python escapes except inside Rust literals.
root_test=root_test.replace(r'\"data-hypercurve-path=', '"data-hypercurve-path=')
root_path=checkout/'tests/svg_region_replay.rs';root_text=root_path.read_text()
assert 'fn svg_adapter_replays_empty_results_and_preserves_qualification' not in root_text

catalog_path=checkout/'crates/hypercurve/qualification/capabilities.json'
catalog=json.loads(catalog_path.read_text());base=next(row for row in catalog['fixtures'] if row['id']=='native_region_empty_operand')
base['oracle']='Canonical emptiness, exact union identity, further round offset and deterministic whole-empty-document native replay.'
cases=[
('canonical_empty_document_replays_before_further_operations','Canonical empty geometry, zero-root native graph, changed display path and a fresh child process.','exact_replay','successful_empty','A unit viewport adds no geometry; exact graph bytes, deterministic replay, Boolean identities and further empty offsets survive a fresh process.'),
('generated_empty_document_replays_with_valid_options_and_policy','A rectangle removed by self-difference; legal minimum extension bytes and zero definition depth, plus invalid export options.','exact_replay','successful_empty','Generated empty output replays under STRICT/APPROXIMATE_512-requested/STRICT without consuming approximation; invalid options remain invalid.'),
('empty_region_export_keeps_inherited_topology_qualification_with_a_stroke','An existing symbolic closure control outside the algebraic envelope, whose approximation-dependent topology regularizes to empty, alone and beside an exact stroke.','exact_replay','undecided','Strict native export retains a Predicate blocker for qualified emptiness even when another carrier supplies finite bounds.'),
('empty_region_projection_keeps_inherited_topology_qualification','The same approximation-dependent empty topology through finite region projection.','evaluation','qualified_approximation','Strict projection blocks; authorized projection returns empty profiles and keeps Approximate512Consumed, including after another strict attempt.'),
('empty_region_topology_replay_observes_inherited_approximation','The same qualified empty topology replayed by normalization and boundary reconstruction.','restriction_reconstruction','qualified_approximation','Strict replay blocks; approximate-requested empty normalization and boundary extraction preserve their inherited qualification.'),
('empty_region_exact_projection_keeps_inherited_topology_qualification','The same qualified empty topology through projection with exact profile ownership.','evaluation','qualified_approximation','Both strict attempts block; authorized exact-profile projection preserves the consumed topology qualification.'),
]
for test,domain,stage,outcome,assertion in cases:
    row=copy.deepcopy(base)
    row.update(id=test,target='svg_region_replay',test=test,owner='CurveRegion2 topology publication and replay; finite projection and native SVG consumers',domain=domain,policies=['STRICT','APPROXIMATE_512'],families=['Line','CircularArc','QuadraticBezier'],semantics='Empty geometry and inherited topology qualification are separate. Canonical exact empty results retain shared storage. Actual terminal consumption is retained before boundary removal, validated before shortcuts and observed during authorized replay. Native empty graphs and a unit display viewport do not add material.',claims=[{'stage':stage,'outcome':outcome,'assertion':assertion}],oracle='Independent empty-set identities, zero graph cardinalities, fresh-process replay, exact policy receipts and typed Predicate blockers; viewport and serialization equality are checked separately from set semantics.')
    if outcome=='qualified_approximation':row['claims'].append({'stage':stage,'outcome':'undecided','assertion':'STRICT cannot upgrade the inherited approximate topology to a certified empty result.'})
    if test=='generated_empty_document_replays_with_valid_options_and_policy':row['claims'].append({'stage':'resource_recovery','outcome':'invalid','assertion':'Non-finite tolerance, too few segments and extension bytes below the existing legal minimum are rejected before empty shortcuts.'})
    assert not any(other['id']==row['id'] for other in catalog['fixtures']);catalog['fixtures'].append(row)
assert len(catalog['fixtures'])==257
path.write_text(text)
root_path.write_text(root_text+root_test)
catalog_path.write_text(json.dumps(catalog,indent=2)+'\n')
subprocess.run(['cargo','+1.99.1','fmt','--all'],cwd=checkout,check=True)
record.write_text(json.dumps({'new_hypercurve_tests':6,'new_root_tests':1,'capability_rows':257,'original_positive_assertions_preserved':True,'original_empty_export_failure_replaced_by_exact_success_contract':True,'fresh_process_replay_added':True,'qualified_empty_construction_shared_in_tests':True,'epoch':time.time()},indent=2)+'\n')
print(record.read_text())
