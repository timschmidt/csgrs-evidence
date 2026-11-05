import hashlib,json,os,subprocess,time
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
TREE=ROOT/'target/brep-integration-review'
OUT=ROOT/'target/prepush-20261105/brep-fixed-source'
OUT.mkdir(exist_ok=True)
paths=sorted(set(subprocess.check_output(['git','ls-files','-c','-o','--exclude-standard'],cwd=TREE,text=True).splitlines()))
def fingerprints():
    return {p:hashlib.sha256((TREE/p).read_bytes()).hexdigest() for p in paths if (TREE/p).is_file() and (Path(p).suffix in {'.rs','.toml','.lock','.json','.svg','.step','.stp','.yaml','.yml'} or Path(p).name=='Cargo.lock')}
before=fingerprints()
(OUT/'source-before.json').write_text(json.dumps(before,indent=2)+'\n')
env=dict(os.environ,RUSTUP_TOOLCHAIN='1.99.1',CCACHE_DISABLE='1',CARGO_INCREMENTAL='0',CARGO_BUILD_JOBS='2',CARGO_TARGET_DIR=str(ROOT/'target/brep-merge-build'),TMPDIR='/tmp/csgrs-prepush-tmp-20261105')
commands=[
 ('fmt',['cargo','fmt','--all','--','--check']),
 ('clippy',['cargo','clippy','--locked','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','-p','csgrs','-p','csgrs-ffi','--all-targets','--all-features','--','-D','warnings']),
 ('resultants',['cargo','test','--locked','-p','hypersolve','--test','ordered_field_resultant','--test','ordered_field_resultants']),
 ('curve-full',['cargo','test','--locked','-p','hypercurve','--all-features','--','--test-threads=2']),
 ('brep-full',['cargo','test','--locked','-p','hyperbrep','--all-features','--','--test-threads=2']),
 ('io-full',['cargo','test','--locked','-p','hyperbrep-io','--all-features','--','--test-threads=2']),
 ('model-resource',['cargo','test','--locked','-p','csgrs','--all-features','--test','storage_failures']),
 ('ffi-resource',['cargo','test','--locked','-p','csgrs-ffi','--lib','unavailable_storage_has_a_distinct_stable_status']),
 ('docs',['cargo','doc','--locked','--no-deps','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--all-features']),
 ('wasm',['cargo','check','--locked','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--all-features','--target','wasm32-unknown-unknown']),
 ('fuzz-bins',['cargo','check','--locked','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins']),
 ('msrv',['cargo','check','--locked','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','-p','csgrs','-p','csgrs-ffi','--all-features']),
]
for name,command in commands:
    command_env=dict(env)
    if name=='docs': command_env['RUSTDOCFLAGS']='-D warnings'
    if name=='msrv':
        command_env['RUSTUP_TOOLCHAIN']='1.95.0'
        command_env['CARGO_TARGET_DIR']=str(ROOT/'target/brep-merge-msrv-build')
    started=time.time();log=OUT/(name+'.log');print('START',name,flush=True)
    with log.open('w') as f:
        f.write(json.dumps({'command':command,'cwd':str(TREE),'env':{k:command_env[k] for k in ['RUSTUP_TOOLCHAIN','CARGO_TARGET_DIR','CARGO_INCREMENTAL','CARGO_BUILD_JOBS']}})+'\n');f.flush()
        r=subprocess.run(command,cwd=TREE,env=command_env,stdout=f,stderr=subprocess.STDOUT)
    after=fingerprints();same=before==after
    row={'name':name,'command':command,'started':started,'seconds':time.time()-started,'exit_code':r.returncode,'source_unchanged':same,'source_count':len(before),'log':str(log.relative_to(ROOT)),'log_sha256':hashlib.sha256(log.read_bytes()).hexdigest()}
    with (OUT/'results.jsonl').open('a') as f:f.write(json.dumps(row)+'\n')
    print('END',name,'exit',r.returncode,'source_unchanged',same,flush=True)
    if r.returncode or not same:
        print('\n'.join(log.read_text(errors='replace').splitlines()[-20:]),flush=True)
        raise SystemExit(1)
(OUT/'source-after.json').write_text(json.dumps(fingerprints(),indent=2)+'\n')
