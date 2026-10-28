from pathlib import Path
import importlib.util
import json
import re
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root=Path(__file__).resolve().parents[1]
controls=root/'controls'
source=(root/'empty-native-replay').resolve()
target=(root/'selected-circle-corners').resolve()
record=controls/'corner-native-fix2-promoted.json'
assert not record.exists()
for name,expected in [('corner-native-priority-candidate2',1),('corner-native-priority-candidate2-points',54)]:
    folder=controls/name
    result=json.loads((folder/'result.json').read_text())
    assert result['exit_code']==0 and result['source_stable']
    assert re.search(r'test result: ok\. '+str(expected)+r' passed; 0 failed; 0 ignored;', (folder/'original-test.log').read_text())
    assert json.loads((folder/'source-before.json').read_text())==json.loads((folder/'source-after.json').read_text())
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,path/'scripts/successive-operations.py')
    result=importlib.util.module_from_spec(spec);spec.loader.exec_module(result);return result
old=module('old',target);new=module('new',source)
baseline=json.loads((controls/'selected-circle-corners-qualification-corner3/source-before.json').read_text())
assert old.source_snapshot()[0]==baseline
candidate,candidate_files,_=new.source_snapshot()
assert candidate==json.loads((controls/'corner-native-priority-candidate2-points/source-before.json').read_text())
old_files={row[0]:row for row in old.source_snapshot()[1]}
new_files={row[0]:row for row in candidate_files}
assert old_files.keys()==new_files.keys()
changed=[name for name in old_files if old_files[name]!=new_files[name]]
assert changed==['crates/hypercurve/src/bezier_offset.rs'],changed
for relative in changed:(target/relative).write_bytes((source/relative).read_bytes())
subprocess.run(['cargo','+1.99.1','fmt','--all'],cwd=target,check=True)
assert old.source_snapshot()[0]==candidate and old.source_snapshot()[1]==candidate_files
contract=controls/'selected-circle-corners-contract.json'
data=json.loads(contract.read_text())
data['native_priority_regression']={'reproduced_revision':baseline,'original_unchanged_test':'curve::curve_fillet::tests::collapsed_selected_circle_fillet_reuses_constrained_contacts_and_support','qualified_parent_test_seconds':42.32,'old_candidate_full_suite_interrupted_seconds':3576.8174591064453,'first_metric_dispatch_variant':'did not restore native behavior; rejected and restored','trace':'corner-native-trace1 enters common_point_linear_order(AlgebraicCuspChord,Endpoint) at reversed Boolean stage','retained_fix':'Similarity/Endpoint wrappers use the existing joint-point-field hint; native selected-circle predicates keep priority. The hint decides dispatch only.','candidate_test_seconds':29.33,'selected_point_cases':54,'performance_scope':'One completed original-test run per source; no statistical or universal speed claim. Interrupted attempts are not completed geometry or resource exhaustion.','fresh_full_qualification_required':True}
contract.write_text(json.dumps(data,indent=2)+'\n')
driver=controls/'qualify_increment.py';text=driver.read_text()
needle="if args.increment == 'selected-circle-corners':\n    for name in [\n"
assert text.count(needle)==1
text=text.replace(needle,needle+"        'curve::curve_fillet::tests::collapsed_selected_circle_fillet_reuses_constrained_contacts_and_support',\n")
driver.write_text(text)
result={'previous_source':baseline,'candidate':candidate,'changed_files':changed,'all_original_assertions_unchanged':True,'diagnostics_removed':True,'qualification_attempt':'corner4','epoch':time.time()}
record.write_text(json.dumps(result,indent=2)+'\n')
with (controls/'selected-circle-corners-qualification-corner4-controller.log').open('w') as log:
    p=subprocess.Popen(['python3',str(driver),'selected-circle-corners','--attempt','corner4'],stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
result['qualification_controller_pid']=p.pid;record.write_text(json.dumps(result,indent=2)+'\n');print(result)
