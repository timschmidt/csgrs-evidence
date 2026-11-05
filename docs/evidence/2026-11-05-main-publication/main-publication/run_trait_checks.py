from pathlib import Path
import hashlib,json,os,subprocess,time
HERE=Path(__file__).resolve().parent
REPO=HERE.parents[1]
ROOT=Path('/tmp/csgrs-main-qualified-20261105')
inputs=json.loads((HERE/'source-inputs.json').read_text())
revision=json.loads((HERE/'source-contract.json').read_text())['revision']
for compiler,target in [('1.95.0','target/research-closeout-builds/1.95.0-normal'),('1.99.1','target/research-closeout-release/1.99.1-normal')]:
    assert all(hashlib.sha256((ROOT/p).read_bytes()).hexdigest()==h for p,h in inputs.items())
    log=HERE/('default-curve-traits-'+compiler+'.log')
    command=['cargo','+'+compiler,'test','--locked','-p','hypercurve','--test','curve_carrier_traits']
    env=dict(os.environ,CCACHE_DISABLE='1',CARGO_INCREMENTAL='0',CARGO_BUILD_JOBS='2',CARGO_TARGET_DIR=str(REPO/target))
    started=time.time();print('START',compiler,flush=True)
    with log.open('w') as stream:
        completed=subprocess.run(command,cwd=ROOT,env=env,stdout=stream,stderr=subprocess.STDOUT)
    assert all(hashlib.sha256((ROOT/p).read_bytes()).hexdigest()==h for p,h in inputs.items())
    row={'name':'default-curve-traits-'+compiler,'revision':revision,'source_inputs':len(inputs),'source_unchanged':True,'command':command,'target_dir':target,'started':started,'seconds':time.time()-started,'exit_code':completed.returncode,'log':str(log.relative_to(REPO)),'log_sha256':hashlib.sha256(log.read_bytes()).hexdigest()}
    with (HERE/'supplemental-results.jsonl').open('a') as stream:stream.write(json.dumps(row)+'\n')
    print('END',compiler,completed.returncode,flush=True)
    completed.check_returncode()
