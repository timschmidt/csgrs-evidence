from pathlib import Path
import subprocess,json,os,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs')
source=json.loads((s/'SOURCE.json').read_text());baseline=json.loads((s/'BASELINE.json').read_text())['csgrs']
for label in ['msrv','stable']:
 q=json.loads((s/(label+'-qualification.json')).read_text())
 assert q['source_commit']==source['commit'] and q['client_count']==27
 assert q['counts']=={'Packaging':21,'Verifying':21,'Documenting':21}
def git(*args,env=None):return subprocess.check_output(['git',*args],cwd=r,env=env)
assert git('rev-parse','HEAD').decode().strip()==source['base']==baseline['head']
assert not git('diff','--binary')
original=git('diff','--cached','--binary');assert hashlib.sha256(original).hexdigest()==baseline['staged_sha256']
before=git('write-tree').decode().strip();index=Path('/tmp/interval-refactor/release-docs-arguments-integration.index');assert not index.exists();env=os.environ|{'GIT_INDEX_FILE':str(index)}
git('read-tree',before,env=env)
git('apply','--cached',str(s/'candidate.patch'),env=env)
combined=git('write-tree',env=env).decode().strip()
git('apply','--cached','-R',str(s/'candidate.patch'),env=env)
assert git('write-tree',env=env).decode().strip()==before;index.unlink()
assert git('diff','--binary',source['commit'],combined)==original
row={'before_index':before,'combined_index':combined,'exact_reversal':True,'source_commit':source['commit'],'pending_patch_sha256':hashlib.sha256(original).hexdigest(),'pending_patch_byte_identical':True}
(s/'integration-preflight.json').write_text(json.dumps(row,indent=2)+'\n')
git('apply','--index',str(s/'candidate.patch'))
assert git('write-tree').decode().strip()==combined
branch=git('symbolic-ref','HEAD').decode().strip();git('update-ref',branch,source['commit'],source['base'])
assert git('status','--porcelain').decode()==baseline['status']
assert not git('diff','--binary')
assert git('diff','--cached','--binary')==original
(s/'INTEGRATION.json').write_text(json.dumps(row|{'branch':branch,'status':baseline['status']},indent=2)+'\n')
print('candidate integrated; all pending changes preserved byte for byte')
