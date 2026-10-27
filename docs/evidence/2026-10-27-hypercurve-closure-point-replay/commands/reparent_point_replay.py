from pathlib import Path
import hashlib, importlib.util, json, subprocess, sys, time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-point-replay')
parent_checkout=Path('/tmp/hypercurve-closure-chord-replay')
old='2eb55c5dd5a17dd7b9fb5731ea02b0ac62b38431'
record=json.loads((root/'chord-replay-final-commit.json').read_text())
new=record['commit']
assert record['clean']
assert not (root/'point-replay-parent-transition.json').exists()
def git(*args,cwd=checkout):
 return subprocess.check_output(['git',*args],cwd=cwd,text=True).strip()
assert git('rev-parse','HEAD')==old
assert git('branch','--show-current')=='hypercurve-point-replay'
assert git('rev-parse','HEAD',cwd=parent_checkout)==new
assert not git('status','--porcelain',cwd=parent_checkout)
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py')
evidence=importlib.util.module_from_spec(spec);spec.loader.exec_module(evidence)
before,files,patch=evidence.source_snapshot()
evidence.save_json(root/'point-replay-pre-reparent-source.json',before)
evidence.save_json(root/'point-replay-pre-reparent-files.json',files)
(root/'point-replay-pre-reparent.patch').write_bytes(patch)
for name in before['untracked_inputs']:
 dest=root/'point-replay-pre-reparent-inputs'/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes((checkout/name).read_bytes())
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
assert git('branch','--show-current')=='hypercurve-point-replay'
evidence.save_json(root/'point-replay-post-reparent-source.json',after)
evidence.save_json(root/'point-replay-post-reparent-files.json',afterfiles)
(root/'point-replay-post-reparent.patch').write_bytes(afterpatch)
result={'old':old,'new':new,'receipt_files':receipts,'all_non_receipt_bytes_unchanged':True,'before':before,'after':after,'recorded_epoch':time.time()}
evidence.save_json(root/'point-replay-parent-transition.json',result)
print(json.dumps({'old':old,'new':new,'all_non_receipt_bytes_unchanged':True}))
