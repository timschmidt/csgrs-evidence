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
checkout = r / 'selected-coefficient-roots'
parser = argparse.ArgumentParser()
parser.add_argument('--attempt', default='polynomial-chamfer-baseline1')
parser.add_argument('--case', action='append')
args = parser.parse_args()
record = c / ('polynomial-operation-frontier-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('e', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files, patch = e.source_snapshot()
alignment=json.loads((c/'selected-coefficient-roots-parent-alignment.json').read_text())
assert before==alignment['aligned']
target = r.parent / 'hypercurve-selected-coefficient-roots-admission'
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
test.write_bytes((checkout / 'crates/hypercurve/tests/polynomial_region_admission.rs').read_bytes() + (c / 'polynomial-operation-frontier-tests.rs').read_bytes() + (c / 'polynomial-chamfer-sections-tests.rs').read_bytes())
binary = record / 'original'
compile_command = ['rustc', '+1.98.1', '--edition=2024', '--test', '--cfg', 'feature="svg"', '-C', 'opt-level=3', str(test), '--crate-name', 'polynomial_operation_frontier', '-L', 'dependency='+str(library.parent), '-L', 'dependency='+str(solver.parent), '--extern', 'hypercurve='+str(library), '--extern', 'hypersolve='+str(solver), '-o', str(binary)]
commands = [('compile', compile_command)]
for name in (args.case or ['parabola_control','elliptic_control','parabola_offset','parabola_chamfer','parabola_fillet','elliptic_offset','elliptic_chamfer','elliptic_fillet','elliptic_algebraic_control','elliptic_algebraic_chamfer','parabola_circle_section_control','elliptic_circle_section_control']):
    test_name = ('polynomial_chamfer_' if 'circle_section' in name else 'polynomial_operation_frontier_') + name
    commands.append((name,[str(binary),test_name,'--exact','--nocapture']))
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
e.save_json(record/'attribution.json',{'source':before,'library_build':attribution,'all_files_identical_to_library_source':True,'solver':str(solver),'solver_sha256':hashlib.sha256(solver.read_bytes()).hexdigest(),'test_sha256':hashlib.sha256(test.read_bytes()).hexdigest(),'cargo_builds_started':1,'note':'Private selected-coefficient source checkpoint built in an isolated cache for the original operation frontier and circle-section controls. No running qualified source or cache is changed.'})
e.save_json(record/'contract.json',json.loads((c/'polynomial-chamfer-construction-contract.json').read_text()))
e.save_json(record/'complete.json',{'source':before,'source_stable':True,'outcomes':{row['name']:row['exit_code'] for row in rows},'probe_count':len(rows)-2,'epoch':time.time()})
