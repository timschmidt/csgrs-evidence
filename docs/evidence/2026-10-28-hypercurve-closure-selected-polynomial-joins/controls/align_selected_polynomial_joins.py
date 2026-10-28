from pathlib import Path
import importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-polynomial-joins';parent=r/'selected-polynomial-fields';record=c/'selected-polynomial-joins-parent-aligned.json'
assert not record.exists()
commit=json.loads((c/'selected-polynomial-fields-final-commit.json').read_text())['commit']
q=c/'selected-polynomial-joins-qualification-final1';complete=json.loads((q/'complete.json').read_text());assert complete['all_passed']
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,_=e.source_snapshot();assert before==complete['source'];assert files==json.loads((q/'files-before.json').read_text())
frontier=json.loads((c/'polynomial-operation-frontier-joins1/complete.json').read_text());assert frontier['source']==before and frontier['all_expected_outcomes_reproduced']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=parent,text=True).strip()==commit
assert not subprocess.check_output(['git','status','--porcelain'],cwd=parent,text=True).strip()
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
subprocess.run(['git','reset','--soft',commit],cwd=w,check=True)
for name in receipts:(w/name).write_bytes((parent/name).read_bytes())
subprocess.run(['git','add','--',*receipts],cwd=w,check=True)
expected={'crates/hypersolve/CHANGELOG.md','crates/hypersolve/src/selected_polynomial_field.rs','crates/hypersolve/src/selected_polynomial_field/join.rs','crates/hypersolve/tests/selected_polynomial_joins.rs'}
assert set(subprocess.check_output(['git','diff','--name-only','HEAD'],cwd=w,text=True).splitlines())==expected
assert not subprocess.check_output(['git','ls-files','--others','--exclude-standard'],cwd=w,text=True).strip()
after,af,_=e.source_snapshot();assert [row for row in files if row[0] not in receipts]==[row for row in af if row[0] not in receipts]
result={'before':before,'after':after,'parent_commit':commit,'all_nonreceipt_source_bytes_unchanged':True,'own_paths':sorted(expected),'epoch':time.time()};record.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
