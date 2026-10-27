from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
parent=Path('/tmp/hypercurve-closure-chord-replay')
child=Path('/tmp/hypercurve-closure-point-replay')
base='2eb55c5dd5a17dd7b9fb5731ea02b0ac62b38431'
assert not child.exists() and not (root/'point-replay-fork.json').exists()
def snapshot(checkout,name):
 spec=importlib.util.spec_from_file_location(name,checkout/'scripts/successive-operations.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module.source_snapshot()
source,files,patch=snapshot(parent,'parent_evidence')
assert source['revision']==base
assert source==json.loads((root/'chord-replay-final-source-before.json').read_text())
(root/'point-replay-parent-candidate.patch').write_bytes(patch)
assert subprocess.check_output(['git','rev-parse','refs/heads/hypercurve-point-replay'],cwd=parent,text=True).strip()==base
with (root/'point-replay-worktree-attempt2.log').open('w') as out:
 subprocess.run(['git','worktree','add',str(child),'hypercurve-point-replay'],cwd=parent,stdout=out,stderr=subprocess.STDOUT,check=True)
subprocess.run(['git','apply','--binary','-'],input=patch,cwd=child,check=True)
for name in source['untracked_inputs']:
 dest=child/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes((parent/name).read_bytes())
actual,actualfiles,_=snapshot(child,'child_evidence')
assert actual==source and actualfiles==files
assert snapshot(parent,'parent_evidence_after')[0]==source
record={'parent_checkout':str(parent),'child_checkout':str(child),'source':source,'source_files':files,'all_source_bytes_equal':True,'recorded_epoch':time.time()}
(root/'point-replay-fork.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps({'child_checkout':str(child),'base':base,'all_source_bytes_equal':True,'parent_unchanged':True}))
