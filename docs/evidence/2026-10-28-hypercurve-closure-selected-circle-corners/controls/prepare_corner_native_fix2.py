from pathlib import Path
import json
import subprocess

root=Path(__file__).resolve().parents[1]
source=(root/'selected-circle-corners').resolve()
target=(root/'empty-native-replay').resolve()
record=root/'controls/corner-native-fix2-prepared.json'
assert not record.exists()
assert json.loads((root/'controls/corner-native-trace1/result.json').read_text())['exit_code']==-15
for relative in ['crates/hypercurve/src/curve_fillet.rs','crates/hypercurve/src/bezier_offset.rs','crates/hypercurve/src/bezier_offset/rational_form.rs','crates/hypercurve/src/bezier_offset/algebraic_chord.rs']:
    (target/relative).write_bytes((source/relative).read_bytes())
path=target/'crates/hypercurve/src/bezier_offset.rs'
text=path.read_text()
old='''        // These wrappers can retain another mapped point or a lazy selected
        // endpoint. point_form_source pulls every wrapper back to the original
        // authority before alignment, including the unmapped base case above.
        CurvePointData2::Similarity(_) | CurvePointData2::Endpoint(_) => true,'''
new='''        // Pull wrappers back only when they retain a joint point field.
        // Native selected-circle contacts have their own cheaper predicates;
        // a lazy endpoint wrapper alone is not a reason to merge their fields.
        CurvePointData2::Similarity(_) | CurvePointData2::Endpoint(_) => {
            point_retains_joint_field(point)
        }'''
assert text.count(old)==1
path.write_text(text.replace(old,new))
record.write_text(json.dumps({'owner':'Hypercurve exact point-coordinate ordering dispatch','properties':['P12','P18','P20'],'finding':'The new unconditional Endpoint common-field order path diverts native selected-circle contacts into expensive field merging. The original unchanged unit regression passes on the qualified parent in42.658s and remains incomplete in the candidate full suite after3576.817s. The trace stops inside common_point_linear_order(AlgebraicCuspChord, Endpoint) on the first reversed Boolean stage.','change':'Use the existing joint-field provenance dispatch hint for Similarity and Endpoint wrappers. Keep unmapped polynomial base-case behavior and all original native fallbacks. No predicate value is inferred from the hint.','all_original_assertions_unchanged':True,'diagnostic_logging_removed':True,'first_variant_not_retained':True},indent=2)+'\n')
with (root/'controls/corner-native-fix2-controller.log').open('w') as log:
 p=subprocess.Popen(['python3',str(root/'controls/run_corner_native_probe.py'),'corner-native-priority-candidate2'],stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
print({'controller_pid':p.pid})
