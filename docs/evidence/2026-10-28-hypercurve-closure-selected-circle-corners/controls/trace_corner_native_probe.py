from pathlib import Path
import json
import subprocess

root=Path(__file__).resolve().parents[1]
source=(root/'selected-circle-corners').resolve()
target=(root/'empty-native-replay').resolve()
record=root/'controls/corner-native-trace-prepared.json'
assert not record.exists()
assert json.loads((root/'controls/corner-native-priority-candidate1/result.json').read_text())['exit_code']==-15
# Remove the unproved dispatch variant before instrumenting the original candidate.
relative='crates/hypercurve/src/bezier_offset/algebraic_chord.rs'
(target/relative).write_bytes((source/relative).read_bytes())
path=target/'crates/hypercurve/src/curve_fillet.rs'
text=path.read_text()
start=text.index('    fn collapsed_selected_circle_fillet_reuses_constrained_contacts_and_support()')
end=text.index('\n    #[test]',start)
body=text[start:end]
changes={
    '                        assert_eq!(result.certainty, crate::CurveCertainty::Certified);':'                        eprintln!("NATIVE_STAGE fillet complete");\n                        assert_eq!(result.certainty, crate::CurveCertainty::Certified);',
    '                        for contact in &contacts {':'                        eprintln!("NATIVE_STAGE path joins complete");\n                        for contact in &contacts {',
    '                        let edited_region = region(edited);':'                        eprintln!("NATIVE_STAGE contact equality complete");\n                        let edited_region = region(edited);\n                        eprintln!("NATIVE_STAGE region complete");',
    '                        assert_eq!(difference.certainty, crate::CurveCertainty::Certified);':'                        eprintln!("NATIVE_STAGE booleans complete");\n                        assert_eq!(difference.certainty, crate::CurveCertainty::Certified);',
}
for old,new in changes.items():
    assert body.count(old)==1;body=body.replace(old,new)
path.write_text(text[:start]+body+text[end:])
path=target/'crates/hypercurve/src/bezier_offset.rs';text=path.read_text()
start=text.index('pub(crate) fn algebraic_chord_point_coordinate_order(')
end=text.index('\npub(',start+1)
body=text[start:end]
old='        match common_point_linear_order(first, second, &a, &b, policy)? {'
assert body.count(old)==1
body=body.replace(old,'''        eprintln!("NATIVE_QUERY coordinate enter {:?} {:?}", core::mem::discriminant(&first.0), core::mem::discriminant(&second.0));
        let trace_result = common_point_linear_order(first, second, &a, &b, policy)?;
        eprintln!("NATIVE_QUERY coordinate leave {trace_result:?}");
        match trace_result {''')
path.write_text(text[:start]+body+text[end:])
path=target/'crates/hypercurve/src/bezier_offset/rational_form.rs';text=path.read_text()
old='''        CurvePointData2::AlgebraicCuspChordDerived(point) => {
            match derived_circle_point_form(point, numerator, denominator, policy)? {'''
assert text.count(old)==1
text=text.replace(old,'''        CurvePointData2::AlgebraicCuspChordDerived(point) => {
            eprintln!("NATIVE_QUERY derived enter");
            let trace_result = derived_circle_point_form(point, numerator, denominator, policy)?;
            eprintln!("NATIVE_QUERY derived leave");
            match trace_result {''')
path.write_text(text)
record.write_text(json.dumps({'files':['crates/hypercurve/src/curve_fillet.rs','crates/hypercurve/src/bezier_offset.rs','crates/hypercurve/src/bezier_offset/rational_form.rs'],'diagnostic_only':True,'all_original_assertions_unchanged':True,'native_dispatch_variant_restored':True},indent=2)+'\n')
with (root/'controls/corner-native-trace-controller.log').open('w') as log:
 p=subprocess.Popen(['python3',str(root/'controls/run_corner_native_probe.py'),'corner-native-trace1'],stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
print({'controller_pid':p.pid})
