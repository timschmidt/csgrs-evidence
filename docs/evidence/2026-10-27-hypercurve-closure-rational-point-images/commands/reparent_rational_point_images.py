from pathlib import Path
import hashlib, importlib.util, json, subprocess, sys, time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-rational-point-images')
parent_checkout=Path('/tmp/hypercurve-closure-circle-differentials')
old='78c661a8ae94ea15c0140355e6865076aca2d44d'
record=json.loads((root/'circle-differentials-final-commit.json').read_text())
new=record['commit']
assert record['clean']
assert not (root/'rational-point-images-parent-transition.json').exists()
qualification=json.loads((root/'rational-point-images-final-results.json').read_text())
assert len(qualification)==18 and all(row['exit_code']==0 and row['source_stable'] for row in qualification)
def git(*args,cwd=checkout):
 return subprocess.check_output(['git',*args],cwd=cwd,text=True).strip()
assert git('rev-parse','HEAD')==old
assert git('branch','--show-current')=='hypercurve-rational-point-images'
assert git('rev-parse','HEAD',cwd=parent_checkout)==new
assert not git('status','--porcelain',cwd=parent_checkout)
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py')
evidence=importlib.util.module_from_spec(spec);spec.loader.exec_module(evidence)
before,files,patch=evidence.source_snapshot()
assert before==json.loads((root/'rational-point-images-final-source-before.json').read_text())
assert files==json.loads((root/'rational-point-images-final-files-after.json').read_text())
evidence.save_json(root/'rational-point-images-pre-reparent-source.json',before)
evidence.save_json(root/'rational-point-images-pre-reparent-files.json',files)
(root/'rational-point-images-pre-reparent.patch').write_bytes(patch)
for name in before['untracked_inputs']:
 dest=root/'rational-point-images-pre-reparent-inputs'/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes((checkout/name).read_bytes())
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
for name in receipts:
 assert (checkout/name).read_bytes()==subprocess.check_output(['git','show',old+':'+name],cwd=checkout)
for name in receipts:
 (checkout/name).write_bytes((parent_checkout/name).read_bytes())
subprocess.run(['git','reset','--mixed',new],cwd=checkout,check=True,stdout=subprocess.DEVNULL)
after,afterfiles,afterpatch=evidence.source_snapshot()
for name,mode,digest in files:
 if name not in receipts and mode in ['file','executable']:
  assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
assert git('rev-parse','HEAD')==new
assert git('branch','--show-current')=='hypercurve-rational-point-images'
evidence.save_json(root/'rational-point-images-post-reparent-source.json',after)
evidence.save_json(root/'rational-point-images-post-reparent-files.json',afterfiles)
(root/'rational-point-images-post-reparent.patch').write_bytes(afterpatch)
result={'old':old,'new':new,'receipt_files':receipts,'all_non_receipt_bytes_unchanged':True,'before':before,'after':after,'recorded_epoch':time.time()}
evidence.save_json(root/'rational-point-images-parent-transition.json',result)
print(json.dumps({'old':old,'new':new,'all_non_receipt_bytes_unchanged':True}))
