from pathlib import Path
import importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-coefficient-roots'
receipts={'crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv'}
prepared=json.loads((c/'selected-coefficient-roots-admission-prepared.json').read_text());parent=json.loads((c/'selected-closure-integration-final-commit.json').read_text());run=c/'selected-coefficient-roots-qualification-final1'
qualification=json.loads((run/'complete.json').read_text());rows=json.loads((run/'results.json').read_text())
assert qualification['all_passed'] and qualification['groups']==len(rows)==25 and all(x['exit_code']==0 and x['source_stable'] for x in rows)
assert parent['user_checkout_unchanged'] and len(parent['checks'])==5 and all(x['exit_code']==0 for x in parent['checks'])
def git(*args):return subprocess.check_output(['git',*args],cwd=w,text=True).strip()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,_=e.source_snapshot();assert before==qualification['source'] and files==json.loads((run/'files-before.json').read_text())
assert git('rev-parse','HEAD')==prepared['base']
assert set(git('diff','--name-only','HEAD').splitlines())==set(prepared['working_changes'])
assert not git('ls-files','--others','--exclude-standard')
assert set(git('diff','--name-only',prepared['base'],parent['commit']).splitlines())==receipts
record=c/'selected-coefficient-roots-parent-alignment.json';assert not record.exists()
future='crates/hypercurve/FUTURE_WORK.md';old_future=(w/future).read_text();base_future=subprocess.check_output(['git','show',prepared['base']+':'+future],cwd=w,text=True)
assert old_future.startswith(base_future);own_entry=old_future[len(base_future):];assert '## Selected-coefficient root points' in own_entry
subprocess.run(['git','reset','--mixed',parent['commit']],cwd=w,check=True)
for name in receipts:
 content=subprocess.check_output(['git','show',parent['commit']+':'+name],cwd=w)
 (w/name).write_bytes(content+(own_entry.encode() if name==future else b''))
subprocess.run(['git','add','-N',*prepared['added_files']],cwd=w,check=True)
after,af,_=e.source_snapshot();assert [v for v in files if v[0] not in receipts]==[v for v in af if v[0] not in receipts]
assert set(git('diff','--name-only','HEAD').splitlines())==set(prepared['working_changes'])
assert not git('ls-files','--others','--exclude-standard')
result={'qualified':before,'aligned':after,'parent':parent['commit'],'code_parents':[parent['commit']],'evidence_parent':parent['evidence_commit'],'base':prepared['base'],'checkpoint':prepared['checkpoint'],'changed_since_qualification':sorted(receipts),'all_nonreceipt_bytes_unchanged':True,'source_reconstruction':'The frozen base is the integrated source checkpoint. Its finalized parent differs only in the three receipts. The qualified patch and all file hashes are retained; the selected-coefficient source checkpoint is also preserved.','predecessor_admission':parent,'epoch':time.time()}
e.save_json(record,result);e.save_json(c/'selected-coefficient-roots-aligned-files.json',af);print(json.dumps(result,indent=2))
