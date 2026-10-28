from pathlib import Path
import argparse
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
parser=argparse.ArgumentParser()
parser.add_argument('record')
parser.add_argument('--test',default='curve::curve_fillet::tests::collapsed_selected_circle_fillet_reuses_constrained_contacts_and_support')
parser.add_argument('--integration')
parser.add_argument('--package',default='hypercurve')
parser.add_argument('--filter')
args=parser.parse_args()
root=Path(__file__).resolve().parents[1]
checkout=(root/'empty-native-replay').resolve()
record=root/'controls'/args.record
record.mkdir()
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files)
(record/'candidate.patch').write_bytes(patch)
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':str(root.parent/'hypercurve-selected-circle-regions-admission'),'CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CCACHE_DIR':str(root.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(root.parent/'hypercurve-admission-ccache/tmp')}
command=['cargo','test','--locked','--release','--all-features','-p',args.package]
command+=['--test',args.integration] if args.integration else ['--lib',args.test,'--','--exact','--nocapture']
if args.integration and args.filter:
    command += [args.filter,'--','--exact','--nocapture']
started=time.time()
with (record/'original-test.log').open('w') as log:
    p=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=checkout,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
    e.save_json(record/'active.json',{'pid':p.pid,'started_epoch':started,'command':command})
    try:code=p.wait(timeout=7200)
    except subprocess.TimeoutExpired:
        os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
after,after_files,_=e.source_snapshot()
e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',after_files)
result={'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'source_stable':source==after,'external_timeout_seconds':7200,'settings':{k:env[k] for k in ['RUSTUP_TOOLCHAIN','CARGO_TARGET_DIR','CARGO_BUILD_JOBS','RUST_TEST_THREADS']}}
e.save_json(record/'result.json',result);print(result,flush=True)
