from pathlib import Path
import subprocess,json,hashlib,os
q=Path(__file__).parent;p=q;root=Path('/mnt/development/csgrs');candidate=Path('/mnt/development/csgrs-coordinates');combined=Path('/mnt/development/csgrs-coordinates-combined')
def git(*args,cwd=root,env=None):return subprocess.check_output(['git',*args],cwd=cwd,env=env)
s=json.loads((q/'SOURCE_FINAL.json').read_text());paths=[r['path'] for r in s['paths']];base=s['base'];head=git('rev-parse','HEAD',cwd=candidate).decode().strip()
assert head==json.loads((q/'source-commit.json').read_text())['head']
assert git('rev-parse','HEAD').decode().strip()==base
assert git('diff','--cached','--binary')==(p/'pending-main.patch').read_bytes()
assert git('diff','--binary')==b'' and git('ls-files','--others','--exclude-standard')==b''
assert git('status','--porcelain',cwd=candidate)==b''
subprocess.run(['git','merge-base','--is-ancestor',base,head],cwd=root,check=True)
for row in s['paths']:assert hashlib.sha256((candidate/row['path']).read_bytes()).hexdigest()==row['sha256']
for row in json.loads((q/'combined-state-final.json').read_text()):assert hashlib.sha256((combined/row['path']).read_bytes()).hexdigest()==row['sha256']
for name,count in [('final-qualification.json',15),('downstream-qualification.json',7),('post-test-qualification.json',4),('fuzz-status.json',5)]:
 rows=json.loads((q/name).read_text());assert len(rows)==count and all(row['returncode']==0 for row in rows)
old_tree=git('write-tree').decode().strip();original_paths=git('diff','--cached','--name-only').decode().splitlines();assert len(original_paths)==40
expected_pending=sorted(original_paths+['crates/hyperdynamics/fuzz/Cargo.lock'])
idx=Path('/tmp/interval-refactor/coordinates-retain-index');assert not idx.exists();env={**os.environ,'GIT_INDEX_FILE':str(idx)}
original={name:(root/name).read_bytes() if (root/name).exists() else None for name in paths};updated=False
try:
 for name in paths:
  target=root/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes((combined/name).read_bytes())
 git('read-tree',old_tree,env=env);git('add','--',*paths,env=env);tree=git('write-tree',env=env).decode().strip()
 pending=git('diff-tree','--no-commit-id','--name-only','-r',head,tree).decode().splitlines();assert pending==expected_pending
 untouched=set(original_paths)-set(paths);assert len(untouched)==37
 for name in untouched:assert git('rev-parse',old_tree+':'+name)==git('rev-parse',tree+':'+name)
 assert git('diff','--binary',env=env)==b''
 lock_name='crates/hyperdynamics/fuzz/Cargo.lock'
 a=git('show',head+':'+lock_name).decode();b=(root/lock_name).read_text()
 needle='name = "hyperdynamics"\nversion = "0.1.0"\ndependencies = [\n "hyperinterval",\n "hyperlattice-interval",\n'
 assert a.count(needle)==1 and b==a.replace(needle,needle+' "hyperlimit",\n')
 record=dict(added_pending_lock_delta='one hyperlimit edge; versions unchanged',before=base,source=head,old_index_tree=old_tree,combined_index_tree=tree,pending_paths=pending,unchanged_nonoverlapping_pending_blobs=len(untouched))
 (q/'retention-prepared.json').write_text(json.dumps(record,indent=2)+'\n')
 git('update-ref','-m','retain qualified exact state charts and preserve pending extraction','HEAD',head,base);updated=True
 git('read-tree',tree)
 assert git('diff','--binary')==b''
 assert git('diff','--cached','--name-only').decode().splitlines()==expected_pending
 assert git('ls-files','--others','--exclude-standard')==b''
 (q/'retention.json').write_text(json.dumps(record,indent=2)+'\n')
 (q/'pending-after.patch').write_bytes(git('diff','--cached','--binary'))
 print(json.dumps(record,indent=2))
except:
 if not updated:
  for name,data in original.items():
   if data is None:(root/name).unlink(missing_ok=True)
   else:(root/name).write_bytes(data)
 raise
finally:idx.unlink(missing_ok=True)
