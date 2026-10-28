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
checkout = r / 'qualified-region-queries'
parser = argparse.ArgumentParser()
parser.add_argument('--attempt', default='baseline2')
parser.add_argument('--case', action='append')
args = parser.parse_args()
record = c / ('polynomial-operation-frontier-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('e', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files, patch = e.source_snapshot()
committed = json.loads((c / 'qualified-region-queries-recovered-final-commit.json').read_text())
assert before['revision'] == committed['commit'] and not patch and not before['untracked_inputs']
resource = c / 'qualified-region-query-resource-final5'
attribution = json.loads((resource / 'attribution.json').read_text())
old_files = json.loads((resource / 'files-before.json').read_text())
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
assert [row for row in files if row[0] not in receipts] == [row for row in old_files if row[0] not in receipts]
library = Path(attribution['library'])
assert hashlib.sha256(library.read_bytes()).hexdigest() == attribution['library_sha256']
artifacts = [json.loads(row) for row in (resource / 'build.jsonl').read_text().splitlines()]
solver = Path(next(f for row in artifacts if row.get('reason') == 'compiler-artifact' and row['target']['name'] == 'hypersolve' for f in row['filenames'] if f.endswith('.rlib')))
e.save_json(record / 'source-before.json', before)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
test = record / 'original.rs'
test.write_bytes((checkout / 'crates/hypercurve/tests/polynomial_region_admission.rs').read_bytes() + (c / 'polynomial-operation-frontier-tests.rs').read_bytes())
binary = record / 'original'
compile_command = ['rustc', '+1.98.1', '--edition=2024', '--test', '--cfg', 'feature="svg"', '-C', 'opt-level=3', str(test), '--crate-name', 'polynomial_operation_frontier', '-L', 'dependency='+str(library.parent), '-L', 'dependency='+str(solver.parent), '--extern', 'hypercurve='+str(library), '--extern', 'hypersolve='+str(solver), '-o', str(binary)]
commands = [('compile', compile_command)]
for name in (args.case or ['parabola_control','elliptic_control','parabola_offset','parabola_chamfer','parabola_fillet','elliptic_offset','elliptic_chamfer','elliptic_fillet']):
    commands.append((name,[str(binary),'polynomial_operation_frontier_'+name,'--exact','--nocapture']))
rows=[]
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
e.save_json(record/'attribution.json',{'source':before,'library_build':attribution,'all_nonreceipt_files_identical_to_library_source':True,'solver':str(solver),'solver_sha256':hashlib.sha256(solver.read_bytes()).hexdigest(),'test_sha256':hashlib.sha256(test.read_bytes()).hexdigest(),'cargo_builds_started':0,'note':'Read-only library reuse after parent commit changed three documentation receipts only. Probe compiles and runs externally; no Cargo cache is mutated.'})
e.save_json(record/'contract.json',{'owner':'Hypercurve polynomial branch corner/offset construction and the shared CurveRegion2 arrangement','properties':['P12','P17','P18','P19','P20'],'plan':'A4, with M1/M5/M6 composition, evidence, replay and resource obligations','domain':'Selected parabola cap y^2=x, 0<=x<=1/4; selected elliptic cap y^2=1+x^3, -1<=x<=0. Both have rational corner endpoints and regular supporting branches, with explicit branch selectors and source domains.','operations':'Nonzero round offset, TrimOnly circular fillet and Euclidean chord-setback chamfer, radius/setbacks 1/64.','independent_control':'Existing parabola source point/domain assertions, plus elliptic cap source admission, branch count, orientation and exact points from -1<=x<=0 and y^2<=1+x^3.','limits':'This records completion/blocker outcomes, not a complete acceptance proof, performance result or uniform total-work bound. External timeout is not typed geometric resource exhaustion. Broader algebraic endpoints/fields, singular germs, candidate selection, exact replay and finite output compositions remain required.','next_acceptance':'Preserve selected supports and cuts; prove chord setbacks from original corners, retained endpoint incidence and topology; consume the output with reconstruction, Booleans, supported transforms, exact replay and another corner/offset operation. Keep generated algebraic endpoints and nonrational cases.','epoch':time.time()})
