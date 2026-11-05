from pathlib import Path
import os,subprocess,tempfile,json,hashlib,shutil
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');repo=Path('/tmp/csgrs-research-evidence');record='docs/evidence/2026-11-04-research-r24-fidelity';dest=repo/record;parent='26f019be868b12227a498daa65cf2cbb18b13b2e';branch='research-r24-fidelity-2026-11-04'
h=json.loads(Path('/tmp/csgrs-r24-final-source-hashes.json').read_text());assert all(hashlib.sha256((root/p).read_bytes()).hexdigest()==v for p,v in h.items())
assert dest.is_dir();assert (dest/'candidate.patch').read_bytes()==subprocess.check_output(['git','-C',str(root),'diff','--binary','HEAD'])
shutil.copyfile(__file__,dest/'seal-retry.py')
p=dest/'README.md';s=p.read_text();note='\nThe first seal reached the temporary-filesystem quota while writing its full\nGit index. seal-retry.py uses an ignored build-directory index instead; the\nvalidated payload and parent are unchanged. Only the new record is committed.\n'
if note not in s:p.write_text(s+note)
fd,index=tempfile.mkstemp(prefix='r24-evidence-index-',dir=root/'target');os.close(fd);Path(index).unlink();env={**os.environ,'GIT_INDEX_FILE':index}
def git(*args):return subprocess.check_output(['git','-C',str(repo),*args],env=env,text=True).strip()
try:
 git('read-tree',parent);git('add','--sparse',record);tree=git('write-tree');changes=git('diff-tree','--no-commit-id','--name-status','--no-renames','-r',parent,tree).splitlines();count=sum(1 for p in dest.rglob('*') if p.is_file());assert len(changes)==count and all(x.startswith('A\t'+record+'/') for x in changes)
 commit=git('commit-tree',tree,'-p',parent,'-m','Qualify retained parallel fidelity, native BRep replay and proof costs');git('update-ref','refs/heads/'+branch,commit);print(json.dumps({'branch':branch,'commit':commit,'files':count},indent=2))
finally:Path(index).unlink(missing_ok=True)
