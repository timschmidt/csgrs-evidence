from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-field-root-discovery'
receipts={'crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv'}
implementation={'crates/hypersolve/src/lib.rs', 'crates/hypersolve/tests/selected_polynomial_root_discovery.rs', 'crates/hypersolve/src/ordered_field_roots.rs', 'crates/hypersolve/src/work_budget.rs', 'crates/hypersolve/CHANGELOG.md', 'crates/hypersolve/src/root_sign.rs', 'crates/hypersolve/src/ordered_field_roots/complete.rs'}
prepared=json.loads((c/'selected-field-root-discovery-prepared.json').read_text());point=json.loads((c/'selected-polynomial-points-final-commit.json').read_text());run=c/'selected-field-root-discovery-qualification-final4';qualification=json.loads((run/'complete.json').read_text());rows=json.loads((run/'results.json').read_text())
assert qualification['all_passed'] and qualification['groups']==len(rows)==15 and all(row['exit_code']==0 and row['source_stable'] for row in rows)
assert point['user_checkout_unchanged'] and len(point['checks'])==5 and all(row['exit_code']==0 for row in point['checks'])
def git(*args):return subprocess.check_output(['git',*args],cwd=w,text=True).strip()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();assert before==qualification['source'] and files==json.loads((run/'files-before.json').read_text())
assert git('rev-parse','HEAD')==prepared['checkpoint']
assert set(git('diff','--name-only','HEAD').splitlines())==implementation
assert not git('ls-files','--others','--exclude-standard')
assert set(git('diff','--name-only',prepared['checkpoint'],point['commit']).splitlines())==receipts
record=c/'selected-field-root-discovery-parent-alignment.json';assert not record.exists()
seed_patch=subprocess.check_output(['git','diff','--binary',prepared['point_parent'],prepared['checkpoint']],cwd=w)
(c/'selected-field-root-discovery-seed.patch').write_bytes(seed_patch)
# This changes only the dedicated branch/index. All root discovery working files
# are retained and checked; only the finalized parent's three receipts are read.
subprocess.run(['git','reset','--mixed',point['commit']],cwd=w,check=True)
for name in receipts:(w/name).write_bytes(subprocess.check_output(['git','show',point['commit']+':'+name],cwd=w))
subprocess.run(['git','add','-N','crates/hypersolve/tests/selected_polynomial_root_discovery.rs','crates/hypersolve/src/ordered_field_roots/complete.rs'],cwd=w,check=True)
after,af,_=e.source_snapshot()
assert [row for row in files if row[0] not in receipts]==[row for row in af if row[0] not in receipts]
assert set(git('diff','--name-only','HEAD').splitlines())==implementation
assert not git('ls-files','--others','--exclude-standard')
result={'qualified':before,'aligned':after,'point_parent':point['commit'],'point_evidence':point['evidence_commit'],'checkpoint':prepared['checkpoint'],'seed_parent':prepared['point_parent'],'seed_patch_sha256':hashlib.sha256(seed_patch).hexdigest(),'changed_since_qualification':sorted(receipts),'all_nonreceipt_bytes_unchanged':True,'source_reconstruction':'Apply selected-field-root-discovery-seed.patch to seed_parent, then the qualified candidate.patch. File digests and checkpoint tree are retained. The finalized point parent changes only the three receipt files from that checkpoint.','epoch':time.time()}
e.save_json(record,result);e.save_json(c/'selected-field-root-discovery-aligned-files.json',af);print(result)
