from pathlib import Path
import hashlib,json,os,subprocess,time
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-similarity-policy')
target=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-contact-admission')
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()=='4519ec554d0bffdae3c7f45ffaac4a688c7663de'
assert not subprocess.check_output(['git','status','--porcelain'],cwd=checkout,text=True).strip()
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'1'}
command=['cargo','build','--locked','--release','--all-features','-p','hypercurve','--message-format=json']
started=time.time()
with (root/'native-restriction-replay-baseline-build.jsonl').open('w') as out,(root/'native-restriction-replay-baseline-build.log').open('w') as log:
 result=subprocess.run(command,cwd=checkout,env=env,stdout=out,stderr=log)
assert result.returncode==0
artifacts=[json.loads(line) for line in (root/'native-restriction-replay-baseline-build.jsonl').read_text().splitlines()]
libs={filename for a in artifacts if a.get('reason')=='compiler-artifact' and a['target']['name']=='hypercurve' for filename in a['filenames'] if filename.endswith('.rlib')}
assert len(libs)==1
lib=Path(libs.pop());binary=root/'native-restriction-replay-baseline'
compile_command=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(root/'native-restriction-replay-baseline.rs'),'--crate-name','native_restriction_replay_baseline','-L','dependency='+str(target/'release/deps'),'--extern','hypercurve='+str(lib),'-o',str(binary)]
with (root/'native-restriction-replay-baseline-compile.log').open('w') as log:
 compiled=subprocess.run(compile_command,cwd=checkout,env=env,stdout=log,stderr=subprocess.STDOUT)
record={'revision':'4519ec554d0bffdae3c7f45ffaac4a688c7663de','build_command':command,'build_exit_code':result.returncode,'compile_command':compile_command,'compile_exit_code':compiled.returncode,'library':str(lib),'library_sha256':hashlib.sha256(lib.read_bytes()).hexdigest(),'source_sha256':hashlib.sha256((root/'native-restriction-replay-baseline.rs').read_bytes()).hexdigest()}
if compiled.returncode==0:
 with (root/'native-restriction-replay-baseline.log').open('w') as log:
  tested=subprocess.run([str(binary)],cwd=checkout,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 record.update({'test_exit_code':tested.returncode,'external_timeout_seconds':300})
record['elapsed_seconds']=time.time()-started
record['source_clean_after']=not subprocess.check_output(['git','status','--porcelain'],cwd=checkout,text=True).strip()
(root/'native-restriction-replay-baseline.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
