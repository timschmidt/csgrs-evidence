from pathlib import Path
import importlib.util, json, os, signal, subprocess, sys, time
sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'selected-field-root-discovery'
record = c / 'selected-field-root-discovery-baseline2'
record.mkdir()
spec = importlib.util.spec_from_file_location('e',w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json',before)
e.save_json(record / 'files-before.json',files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
original = c / 'selected-field-root-discovery-frontier1'
(record / 'original.rs').write_bytes((original / 'original.rs').read_bytes())
(record / 'support').mkdir()
(record / 'support/recursive_quadratic.rs').write_bytes((original / 'support/recursive_quadratic.rs').read_bytes())
env = {**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2',
       'RUST_TEST_THREADS':'1','CARGO_TARGET_DIR':str(r.parent / 'hypersolve-selected-field-root-discovery-admission')}
rows = []
def run(name,command,timeout):
    start = time.time()
    with (record / (name+'.log')).open('w') as log:
        process = subprocess.Popen(command,cwd=w,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
        e.save_json(record / 'active.json',{'pid':process.pid,'name':name,'command':command,'epoch':start})
        try: code = process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid,signal.SIGKILL);process.wait();code='external_timeout'
    after,af,_ = e.source_snapshot()
    row = {'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-start,
           'external_timeout_seconds':timeout,'source_stable':before==after}
    rows.append(row); e.save_json(record / 'results.json',rows)
    e.save_json(record / 'source-after.json',after); e.save_json(record / 'files-after.json',af)
    print(row,flush=True); assert before==after
    return code
assert run('build',['cargo','test','--locked','--release','-p','hypersolve','--all-features',
    '--test','selected_polynomial_fields','--no-run','--message-format=json'],3600)==0
artifacts=[]
for line in (record / 'build.log').read_text().splitlines():
    try: artifacts.append(json.loads(line))
    except json.JSONDecodeError: pass
libs={name:Path(next(f for row in artifacts if row.get('reason')=='compiler-artifact'
    and row['target']['name']==name for f in row['filenames'] if f.endswith('.rlib')))
    for name in ['hyperreal','hyperlimit','hypersolve']}
binary=record / 'original'
command=['rustc','+1.98.1','--edition=2024','--test','-C','opt-level=3',str(record / 'original.rs'),
         '-L','dependency='+str(libs['hypersolve'].parent),'-o',str(binary)]
for name,path in libs.items(): command += ['--extern',name+'='+str(path)]
assert run('compile',command,300)==0
for name in ['selected_field_simple_root_discovery_control','selected_field_repeated_root_discovery_frontier',
             'selected_field_elliptic_contact_discovery_frontier']:
    run(name,[str(binary),name,'--exact','--nocapture'],300)
assert [row['exit_code'] for row in rows]==[0,0,101,101,0]
e.save_json(record / 'complete.json',{'source':before,'all_expected_outcomes_reproduced':True,
    'libraries':{name:{'path':str(path),'sha256':e.digest_file(path)} for name,path in libs.items()},
    'epoch':time.time(),'scope':'Fresh target-checkpoint baseline, unchanged original witnesses: simple and repeated discovery remain incomplete; original elliptic contact control passes.'})
