from pathlib import Path
import importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
parent=Path('/tmp/hypercurve-closure-point-replay')
child=Path('/tmp/hypercurve-closure-circle-replay')
base=json.loads((root/'chord-replay-final-commit.json').read_text())['commit']
assert not child.exists() and not (root/'circle-replay-fork.json').exists()
def snapshot(checkout,name):
 spec=importlib.util.spec_from_file_location(name,checkout/'scripts/successive-operations.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module.source_snapshot()
source,files,patch=snapshot(parent,'parent_evidence')
assert source['revision']==base
assert source==json.loads((root/'point-replay-final-source-before.json').read_text())
(root/'circle-replay-parent-candidate.patch').write_bytes(patch)
with (root/'circle-replay-worktree.log').open('w') as out:
 subprocess.run(['git','worktree','add','-b','hypercurve-circle-replay',str(child),base],cwd=parent,stdout=out,stderr=subprocess.STDOUT,check=True)
subprocess.run(['git','apply','--binary','-'],input=patch,cwd=child,check=True)
for name in source['untracked_inputs']:
 dest=child/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes((parent/name).read_bytes())
actual,actualfiles,_=snapshot(child,'child_evidence')
assert actual==source and actualfiles==files
assert snapshot(parent,'parent_evidence_after')[0]==source
(root/'circle-replay-fork.json').write_text(json.dumps({'parent_checkout':str(parent),'child_checkout':str(child),'source':source,'source_files':files,'all_source_bytes_equal':True,'recorded_epoch':time.time()},indent=2)+'\n')
print(json.dumps({'child_checkout':str(child),'base':base,'all_source_bytes_equal':True,'parent_unchanged':True}))
