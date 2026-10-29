from pathlib import Path
import argparse, importlib.util, json, os, re, signal, subprocess, sys, time
sys.dont_write_bytecode=True
p=argparse.ArgumentParser();p.add_argument('--attempt',required=True);args=p.parse_args()
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-field-root-discovery'
record=c/('selected-field-root-discovery-'+args.attempt);record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'1','CARGO_TARGET_DIR':str(r.parent/'hypersolve-selected-field-root-discovery-admission')}
rows=[]
def run(name,command,timeout):
    assert e.source_snapshot()[0]==source
    started=time.time();print('START',name,flush=True)
    with (record/(name+'.log')).open('w') as log:
        process=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=w,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
        e.save_json(record/'active.json',{'pid':process.pid,'name':name,'command':command,'epoch':started})
        try:code=process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:os.killpg(process.pid,signal.SIGKILL);process.wait();code='external_timeout'
    after,af,_=e.source_snapshot();row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'external_timeout_seconds':timeout,'source_stable':source==after};rows.append(row)
    e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);print(row,flush=True);assert source==after
    return code
assert run('compile',['cargo','test','--locked','--release','--all-features','-p','hypersolve','--test','selected_polynomial_root_discovery','--no-run','--message-format=json'],1800)==0
artifacts=[]
for line in (record/'compile.log').read_text().splitlines():
    try:artifacts.append(json.loads(line))
    except json.JSONDecodeError:pass
binary=next(row['executable'] for row in artifacts if row.get('reason')=='compiler-artifact' and row['target']['name']=='selected_polynomial_root_discovery' and row.get('executable'))
tests=re.findall(r'#\[test\]\s*fn (\w+)\(\)',(w/'crates/hypersolve/tests/selected_polynomial_root_discovery.rs').read_text())
for test in tests:run(test,[binary,test,'--exact','--nocapture'],300)
if all(row['exit_code']==0 for row in rows):
    run('predecessors',['cargo','test','--locked','--release','--all-features','-p','hypersolve','--lib','ordered_field','--','--nocapture'],1800)
    run('selected-fields',['cargo','test','--locked','--release','--all-features','-p','hypersolve','--test','selected_polynomial_fields','--test','selected_polynomial_joins','--test','selected_polynomial_bounds','--test','selected_polynomial_replay'],1800)
e.save_json(record/'complete.json',{'source':source,'all_passed':all(row['exit_code']==0 for row in rows),'groups':len(rows),'tests':tests,'epoch':time.time()})
