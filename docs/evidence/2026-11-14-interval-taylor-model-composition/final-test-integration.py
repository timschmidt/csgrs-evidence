from pathlib import Path
import subprocess,json,hashlib,os,shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs');w=Path('/mnt/development/csgrs-taylor-model-composition')
def git(*args,cwd=r,env=None):return subprocess.check_output(['git',*args],cwd=cwd,env=env)
m=json.loads((s/'SOURCE.json').read_text());old=m['commit'];baseline=json.loads((s/'BASELINE.json').read_text())['csgrs']
assert git('rev-parse','HEAD').decode().strip()==old
assert git('diff','--binary')==b''
assert hashlib.sha256(git('diff','--cached','--binary')).hexdigest()==baseline['staged_sha256']
assert git('diff','--name-only',cwd=w).decode().splitlines()==['crates/hypersolve/tests/program_taylor_composition.rs']
assert git('diff','--cached',cwd=w)==b''
shutil.copy2(s/'SOURCE.json',s/'SOURCE_INITIAL.json')
shutil.copy2(s/'INTEGRATION.json',s/'INTEGRATION_INITIAL.json')
shutil.copy2(s/'candidate.patch',s/'candidate-initial.patch')
git('add','crates/hypersolve/tests/program_taylor_composition.rs',cwd=w)
git('commit','-m','Cover shifted outer centers in Taylor composition',cwd=w)
new=git('rev-parse','HEAD',cwd=w).decode().strip()
patch=git('diff','--binary',old,new);(s/'final-test.patch').write_bytes(patch)
aggregate=git('diff','--binary',m['base'],new);(s/'candidate.patch').write_bytes(aggregate)
idx=Path('/tmp/interval-refactor/taylor-composition-final.index');assert not idx.exists()
env=os.environ|{'GIT_INDEX_FILE':str(idx)};before='07dddb7cde561458d9103087ddc1de9cf9ceec73'
git('read-tree',before,env=env)
git('apply','--cached',str(s/'candidate.patch'),env=env)
combined=git('write-tree',env=env).decode().strip()
git('apply','--cached','-R',str(s/'candidate.patch'),env=env)
assert git('write-tree',env=env).decode().strip()==before
idx.unlink()
git('apply','--index',str(s/'final-test.patch'))
assert git('write-tree').decode().strip()==combined
branch=git('symbolic-ref','HEAD').decode().strip();git('update-ref',branch,new,old)
assert git('status','--porcelain').decode()==baseline['status']
assert git('diff','--binary')==b''
pending=hashlib.sha256(git('diff','--cached','--binary')).hexdigest();assert pending==baseline['staged_sha256']
m.update(commit=new,initial_source_commit=old,patch_sha256=hashlib.sha256(aggregate).hexdigest(),followup='test only; production, documentation and benchmark sources unchanged')
(s/'SOURCE.json').write_text(json.dumps(m,indent=2)+'\n')
(s/'INTEGRATION.json').write_text(json.dumps(dict(before_index=before,combined_index=combined,recovered_index=before,exact_reversal=True,source_commit=new,initial_source_commit=old,branch=branch,pending_sha256=pending,status=baseline['status']),indent=2)+'\n')
print(new)
