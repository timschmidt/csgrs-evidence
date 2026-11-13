from pathlib import Path
import subprocess,json,hashlib,os
p=Path(__file__).parent;stage=p.parent;root=Path('/mnt/development/csgrs');candidate=Path('/mnt/development/csgrs-taylor')
def git(*args,cwd=root,env=None):return subprocess.check_output(['git',*args],cwd=cwd,env=env)
source=json.loads((p/'SOURCE_FINAL.json').read_text());combined=json.loads((p/'combined-state.json').read_text());paths=[r['path'] for r in source['paths']]
base=source['base'];head=git('rev-parse','HEAD',cwd=candidate).decode().strip()
assert git('rev-parse','HEAD').decode().strip()==base
assert git('diff','--cached','--binary')==(stage/'pending-main.patch').read_bytes()
assert git('status','--porcelain',cwd=candidate)==b''
subprocess.run(['git','merge-base','--is-ancestor',base,head],cwd=root,check=True)
for row in source['paths']:assert hashlib.sha256((candidate/row['path']).read_bytes()).hexdigest()==row['sha256']
for row in combined:assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['combined_sha256']
for name,count,key in [('final-qualification.json',15,'returncode'),('downstream-qualification.json',11,'exit')]:
 rows=json.loads((p/name).read_text());assert len(rows)==count and all(row[key]==0 for row in rows)
old_tree=git('write-tree').decode().strip();original_paths=git('diff','--cached','--name-only').decode().splitlines();assert len(original_paths)==40
idx=Path('/tmp/interval-refactor/taylor-retain-index');assert not idx.exists();env={**os.environ,'GIT_INDEX_FILE':str(idx)}
try:
 git('read-tree',old_tree,env=env);git('add','--',*paths,env=env);tree=git('write-tree',env=env).decode().strip()
 pending=git('diff-tree','--no-commit-id','--name-only','-r',head,tree).decode().splitlines();assert pending==original_paths
 for name in set(original_paths)-set(paths):assert git('rev-parse',old_tree+':'+name)==git('rev-parse',tree+':'+name)
 assert git('diff','--binary',env=env)==b''
 record=dict(before=base,source=head,old_index_tree=old_tree,combined_index_tree=tree,pending_paths=pending,unchanged_nonoverlapping_pending_blobs=37)
 (p/'retention-prepared.json').write_text(json.dumps(record,indent=2)+'\n')
 git('update-ref','-m','retain qualified Taylor source with pending extraction preserved','HEAD',head,base)
 git('read-tree',tree)
 assert git('diff','--binary')==b''
 assert git('diff','--cached','--name-only').decode().splitlines()==original_paths
 assert git('ls-files','--others','--exclude-standard')==b''
 (p/'retention.json').write_text(json.dumps(record,indent=2)+'\n')
 (p/'pending-after.patch').write_bytes(git('diff','--cached','--binary'))
 print(json.dumps(record,indent=2))
finally:idx.unlink(missing_ok=True)
