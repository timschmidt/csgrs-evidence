from pathlib import Path
import subprocess,json,os,hashlib,re
s=Path(__file__).parent;r=Path('/mnt/development/csgrs');source=json.loads((s/'SOURCE.json').read_text());baseline=json.loads((s/'BASELINE.json').read_text())['csgrs']
assert json.loads((s/'QUALIFICATION.json').read_text())['source_commit']==source['commit']
def git(*args,env=None):return subprocess.check_output(['git',*args],cwd=r,env=env)
assert git('rev-parse','HEAD').decode().strip()==source['base']==baseline['head']
assert git('diff','--binary')==b''
original=git('diff','--cached','--binary');assert hashlib.sha256(original).hexdigest()==baseline['staged_sha256'];(s/'pending-before.patch').write_bytes(original)
before=git('write-tree').decode().strip();index=Path('/tmp/interval-refactor/taylor-noise-integration.index');assert not index.exists();env=os.environ|{'GIT_INDEX_FILE':str(index)}
git('read-tree',before,env=env)
git('apply','--cached','--3way',str(s/'candidate.patch'),env=env)
combined=git('write-tree',env=env).decode().strip();patch=git('diff','--binary',before,combined);(s/'integration.patch').write_bytes(patch)
git('apply','--cached','--3way','-R',str(s/'candidate.patch'),env=env)
assert git('write-tree',env=env).decode().strip()==before;index.unlink()
# Predict and compare the pending diff against the new HEAD before mutation.
predicted=git('diff','--binary',source['commit'],combined)
def normalize(patch):
 text=patch.decode();text=re.sub(r'^index .+\n','',text,flags=re.M);return re.sub(r'^@@ [-+0-9, ]+ @@.*$','@@',text,flags=re.M)
assert normalize(original)==normalize(predicted)
(s/'pending-after.patch').write_bytes(predicted)
row=dict(before_index=before,combined_index=combined,exact_reversal=True,source_commit=source['commit'],pending_before_sha256=hashlib.sha256(original).hexdigest(),pending_after_sha256=hashlib.sha256(predicted).hexdigest(),pending_changes_identical_except_blob_ids_and_hunk_metadata=True)
(s/'integration-preflight.json').write_text(json.dumps(row,indent=2)+'\n')
git('apply','--index',str(s/'integration.patch'))
assert git('write-tree').decode().strip()==combined
branch=git('symbolic-ref','HEAD').decode().strip();git('update-ref',branch,source['commit'],source['base'])
assert git('status','--porcelain=v1').decode()==baseline['status']
assert git('diff','--binary')==b''
assert git('diff','--cached','--binary')==predicted
(s/'INTEGRATION.json').write_text(json.dumps(row|dict(branch=branch,status=baseline['status']),indent=2)+'\n');print(json.dumps(row,indent=2))
