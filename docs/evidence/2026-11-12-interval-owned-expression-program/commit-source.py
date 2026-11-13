from pathlib import Path
import subprocess,os,tempfile,json,hashlib
root=Path('/mnt/development/csgrs'); out=Path('/tmp/interval-refactor/owned-expression-program')
def run(args,**kw): return subprocess.check_output(['git']+args,cwd=root,**kw)
meta=json.loads((out/'SOURCE_STATE.json').read_text()); assert run(['rev-parse','HEAD']).decode().strip()==meta['base']
for name in ['checks-final.json','qualification-final.json']: assert all(r['exit']==0 for r in json.loads((out/name).read_text()))
paths=[r['path'] for r in meta['files']]
for row in meta['files']: assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['sha256']
def add_serde(lock):
 parts=lock.split('[[package]]'); found=False
 for i,part in enumerate(parts):
  if part.startswith('\nname = "hypersolve"\n'):
   assert not found and '\n "serde",\n' not in part
   assert '\n "serde_json",\n' in part
   parts[i]=part.replace('\n "serde_json",\n','\n "serde",\n "serde_json",\n'); found=True
 assert found
 return '[[package]]'.join(parts)
clean_lock=add_serde(run(['show','HEAD:Cargo.lock']).decode())
assert add_serde(run(['show',':Cargo.lock']).decode())==(root/'Cargo.lock').read_text()
fd,index=tempfile.mkstemp(prefix='owned-expression-index-',dir='/tmp/interval-refactor');os.close(fd);os.unlink(index)
env=os.environ|{'GIT_INDEX_FILE':index}
try:
 run(['read-tree','HEAD'],env=env)
 run(['add','--']+paths,env=env)
 blob=run(['hash-object','-w','--stdin'],input=clean_lock.encode()).decode().strip()
 run(['update-index','--add','--cacheinfo','100644',blob,'Cargo.lock'],env=env)
 changed=set(run(['diff','--cached','--name-only'],env=env).decode().splitlines());assert changed==set(paths+['Cargo.lock'])
 run(['diff','--cached','--check'],env=env)
 with (out/'source-commit.log').open('wb') as log:
  subprocess.run(['git','commit','-m','feat(hypersolve): add owned replayable expression programs'],cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,check=True)
finally:
 Path(index).unlink(missing_ok=True)
run(['add','Cargo.lock'])
assert run(['diff','--cached','--binary','HEAD'])==(out/'dynamics-before.patch').read_bytes()
assert not run(['diff','--binary'])
commit=run(['rev-parse','HEAD']).decode().strip(); (out/'accepted-source.patch').write_bytes(run(['show','--format=fuller','--binary','HEAD']))
(out/'COMMIT.json').write_text(json.dumps({'source_commit':commit,'scope':'owned-expression-program prerequisite accepted; dynamics extraction and Phase 12 remain open','pending_dynamics_sha256':hashlib.sha256((out/'dynamics-before.patch').read_bytes()).hexdigest()},indent=2)+'\n')
print(commit)
