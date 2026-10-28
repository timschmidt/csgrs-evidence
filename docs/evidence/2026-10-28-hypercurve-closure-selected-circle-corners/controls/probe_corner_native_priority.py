from pathlib import Path
import hashlib
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
checkout = (root / 'empty-native-replay').resolve()
record = root / 'controls/corner-native-priority-candidate1'
record.mkdir()
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before = e.source_snapshot()[0]
assert before == json.loads((root/'controls/selected-circle-corners-qualification-corner3/source-before.json').read_text())
path = checkout / 'crates/hypercurve/src/bezier_offset/algebraic_chord.rs'
old = path.read_text()
needle = '''            && [&start, &end].into_iter().any(|point| {
                point_retains_joint_field(point) || matches!(&point.0, CurvePointData2::Endpoint(_))
            })'''
assert old.count(needle) == 1
path.write_text(old.replace(needle, '            && [&start, &end].into_iter().any(|point| point_retains_joint_field(point))'))
source, files, patch = e.source_snapshot()
e.save_json(record/'source-before.json',source)
e.save_json(record/'files-before.json',files)
(record/'candidate.patch').write_bytes(patch)
e.save_json(record/'contract.json',{'owner':'Hypercurve algebraic chord metric construction dispatch','properties':['P12','P18','P20'],'baseline':before,'hypothesis':'Restrict the added common-field displacement attempt to retained joint-field endpoints, preserving the pre-existing native selected-circle path. The original collapsed-selected-circle test is unchanged. The full corner candidate is not edited.','timing_scope':'External complete-test time and process RSS under the same test; no performance claim from incomplete runs.'})
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':str(root.parent/'hypercurve-selected-circle-regions-admission'),'CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CCACHE_DIR':str(root.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(root.parent/'hypercurve-admission-ccache/tmp')}
command=['cargo','test','--locked','--release','--all-features','-p','hypercurve','--lib','curve::curve_fillet::tests::collapsed_selected_circle_fillet_reuses_constrained_contacts_and_support','--','--exact','--nocapture']
started=time.time()
with (record/'original-test.log').open('w') as log:
    process=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=checkout,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
    e.save_json(record/'active.json',{'pid':process.pid,'started_epoch':started,'command':command})
    try: code=process.wait(timeout=7200)
    except subprocess.TimeoutExpired:
        os.killpg(process.pid,signal.SIGKILL);process.wait();code='external_timeout'
after,after_files,_=e.source_snapshot()
e.save_json(record/'source-after.json',after)
e.save_json(record/'files-after.json',after_files)
row={'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'source_stable':source==after,'external_timeout_seconds':7200,'settings':{k:env[k] for k in ['RUSTUP_TOOLCHAIN','CARGO_TARGET_DIR','CARGO_BUILD_JOBS','RUST_TEST_THREADS']}}
e.save_json(record/'result.json',row)
print(row,flush=True)
