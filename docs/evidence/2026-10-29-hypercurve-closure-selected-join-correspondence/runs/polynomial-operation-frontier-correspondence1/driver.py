from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
checkout = r / 'selected-join-correspondence'
parser = argparse.ArgumentParser()
parser.add_argument('--attempt', default='correspondence1')
parser.add_argument('--case', action='append')
args = parser.parse_args()
record = c / ('polynomial-operation-frontier-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('e', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files, patch = e.source_snapshot()
qualification = c / 'selected-join-correspondence-qualification-final1'
assert json.loads((qualification / 'complete.json').read_text())['all_passed']
alignment=json.loads((c/'selected-join-correspondence-parent-alignment.json').read_text())
assert before==alignment['aligned']
assert alignment['qualified']==json.loads((qualification/'source-before.json').read_text())
assert files==json.loads((c/'selected-join-correspondence-aligned-files.json').read_text())
target = r.parent / 'hypersolve-selected-join-correspondence-admission'
env = {**os.environ, 'CARGO_TARGET_DIR':str(target), 'CARGO_BUILD_JOBS':'2', 'RUSTUP_TOOLCHAIN':'1.98.1'}
build_command = ['cargo','build','--locked','--release','--all-features','-p','hypercurve','--message-format=json']
started=time.time()
with (record/'build.jsonl').open('w') as out, (record/'build.log').open('w') as log:
    built=subprocess.run(build_command,cwd=checkout,env=env,stdout=out,stderr=log,timeout=3600)
assert built.returncode==0
assert e.source_snapshot()[0]==before
build_row={'name':'build','command':build_command,'exit_code':built.returncode,'elapsed_seconds':time.time()-started,'source_stable':True,'settings':{key:env[key] for key in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','RUSTUP_TOOLCHAIN']}}
artifacts=[json.loads(row) for row in (record/'build.jsonl').read_text().splitlines()]
def library_for(name):
    return Path(next(f for row in artifacts if row.get('reason')=='compiler-artifact' and row['target']['name']==name for f in row['filenames'] if f.endswith('.rlib')))
library,solver=library_for('hypercurve'),library_for('hypersolve')
attribution={'source':before,'library':str(library),'library_sha256':hashlib.sha256(library.read_bytes()).hexdigest(),'build':build_row}
e.save_json(record / 'source-before.json', before)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
test = record / 'original.rs'
test.write_bytes((checkout / 'crates/hypercurve/tests/polynomial_region_admission.rs').read_bytes() + (c / 'polynomial-operation-frontier-tests.rs').read_bytes())
binary = record / 'original'
compile_command = ['rustc', '+1.98.1', '--edition=2024', '--test', '--cfg', 'feature="svg"', '-C', 'opt-level=3', str(test), '--crate-name', 'polynomial_operation_frontier', '-L', 'dependency='+str(library.parent), '-L', 'dependency='+str(solver.parent), '--extern', 'hypercurve='+str(library), '--extern', 'hypersolve='+str(solver), '-o', str(binary)]
commands = [('compile', compile_command)]
for name in (args.case or ['parabola_control','elliptic_control','parabola_offset','parabola_chamfer','parabola_fillet','elliptic_offset','elliptic_chamfer','elliptic_fillet','elliptic_algebraic_control','elliptic_algebraic_chamfer']):
    commands.append((name,[str(binary),'polynomial_operation_frontier_'+name,'--exact','--nocapture']))
rows=[build_row]
for name,command in commands:
    started=time.time()
    with (record/(name+'.log')).open('w') as log:
        process=subprocess.Popen(command,cwd=checkout,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
        e.save_json(record/'active.json',{'pid':process.pid,'name':name,'command':command,'epoch':started})
        try:
            code=process.wait(timeout=120)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid,signal.SIGKILL)
            process.wait()
            code='external_timeout'
    after,after_files,_=e.source_snapshot()
    row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'external_timeout_seconds':120,'source_stable':before==after}
    rows.append(row)
    e.save_json(record/'results.json',rows)
    e.save_json(record/'source-after.json',after)
    e.save_json(record/'files-after.json',after_files)
    print(row,flush=True)
    assert row['source_stable']
    if name=='compile': assert code==0
assert hashlib.sha256(library.read_bytes()).hexdigest()==attribution['library_sha256']
e.save_json(record/'attribution.json',{'source':before,'library_build':attribution,'all_files_identical_to_library_source':True,'solver':str(solver),'solver_sha256':hashlib.sha256(solver.read_bytes()).hexdigest(),'test_sha256':hashlib.sha256(test.read_bytes()).hexdigest(),'cargo_builds_started':1,'note':'Current selected-field correspondence source built after all 24 qualification groups and receipt-only parent alignment. Non-receipt files match the qualified source exactly. External probes reuse those attributed artifacts; no other Cargo process uses this cache.'})
e.save_json(record/'contract.json',{'owner':'Hypercurve polynomial branch corner/offset construction and the shared CurveRegion2 arrangement','properties':['P12','P17','P18','P19','P20'],'plan':'A4, with M1/M5/M6 composition, evidence, replay and resource obligations','domain':'Includes Boolean-generated elliptic corner y=1/2, x^3+3/4=0, x<0. Selected parabola cap y^2=x, 0<=x<=1/4; selected elliptic cap y^2=1+x^3, -1<=x<=0. The original two caps have rational corner endpoints and regular supporting branches, with explicit branch selectors and source domains.','operations':'Nonzero round offset, TrimOnly circular fillet and Euclidean chord-setback chamfer, radius/setbacks 1/64.','independent_control':'Existing parabola source point/domain assertions, plus elliptic cap source admission, branch count, orientation and exact points from -1<=x<=0 and y^2<=1+x^3.','limits':'This records completion/blocker outcomes, not a complete acceptance proof, performance result or uniform total-work bound. External timeout is not typed geometric resource exhaustion. Broader algebraic endpoints/fields, singular germs, candidate selection, exact replay and finite output compositions remain required.','next_acceptance':'Preserve selected supports and cuts; prove chord setbacks from original corners, retained endpoint incidence and topology; consume the output with reconstruction, Booleans, supported transforms, exact replay and another corner/offset operation. Keep generated algebraic endpoints and nonrational cases.','epoch':time.time()})

expected={'build':0,'compile':0,'parabola_control':0,'elliptic_control':0,'elliptic_algebraic_control':0}
assert len(rows)==12 and all(row['exit_code']==expected.get(row['name'],101) for row in rows)
e.save_json(record/'complete.json',{'source':before,'source_stable':True,'controls_passed':3,'unsupported_operations':7,'all_expected_outcomes_reproduced':True})
