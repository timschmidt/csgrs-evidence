from pathlib import Path
import subprocess,json,time,shutil,hashlib
p=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor');state=json.loads((p/'SOURCE_FINAL.json').read_text());paths=[v['path'] for v in state['paths']];target=Path('/tmp/interval-refactor/taylor-old-target');bins=Path('/tmp/interval-refactor/taylor-binaries');rows=[]
def git(*args):return subprocess.check_output(['git',*args],cwd=r)
assert not git('status','--porcelain')
head=git('rev-parse','HEAD').decode().strip();assert head==json.loads((p/'retained-source.json').read_text())['commit']
def build(label):
 for project,exe in [('old-native-cost','dyadic-evolution-cost-probe'),('old-native-semantic','evolution-semantic-probe')]:
  name=label+'-'+project;cmd=['cargo','+1.95.0','build','--release','--locked','--manifest-path',str(p/project/'Cargo.toml'),'--target-dir',str(target)];start=time.monotonic()
  with (p/(name+'-build.log')).open('w') as log:q=subprocess.run(cmd,cwd=r,stdout=log,stderr=subprocess.STDOUT)
  assert q.returncode==0
  dest=bins/name;shutil.copy2(target/'release'/exe,dest);digest=hashlib.sha256(dest.read_bytes()).hexdigest();recorded=json.loads((p/(label.replace('pristine-','')+'-'+project+'-binary.json')).read_text());assert digest==recorded['sha256'],(name,digest,recorded)
  row=dict(name=name,command=cmd,cwd=str(r),returncode=q.returncode,seconds=time.monotonic()-start,path=str(dest),bytes=dest.stat().st_size,sha256=digest,original_build_hash_matches=True);rows.append(row);(p/'pristine-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,digest,flush=True)
  if project=='old-native-semantic':
   out=subprocess.check_output([str(dest)]);assert out==(p/'baseline-old-native-semantic.log').read_bytes();(p/(name+'.log')).write_bytes(out)
try:
 subprocess.run(['git','restore','--source',state['base'],'--worktree','--',*paths],cwd=r,check=True)
 for path in paths:
  base=subprocess.run(['git','show',state['base']+':'+path],cwd=r,capture_output=True)
  if base.returncode==0:assert (r/path).read_bytes()==base.stdout
  else:assert not (r/path).exists()
 build('pristine-baseline')
finally:
 subprocess.run(['git','restore','--worktree','--',*paths],cwd=r,check=True)
 assert not git('status','--porcelain')
 for row in state['paths']:assert hashlib.sha256((r/row['path']).read_bytes()).hexdigest()==row['sha256']
build('pristine-final')
assert git('rev-parse','HEAD').decode().strip()==head
