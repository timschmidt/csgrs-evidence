from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import subprocess,json,os,time,hashlib,shutil,threading,tomllib
p=Path(__file__).parent;stage=p.parent;pair=Path('/mnt/development/interval-machine-profile');bins=Path('/tmp/interval-refactor/machine-profile-binaries');records=[];lock=threading.Lock()
rows=json.loads(p.joinpath('final-source.json').read_text());production=[r for r in rows if '/tests/' not in r['path']]
def run(name,cwd,cmd,target=None):
 env=os.environ.copy()
 if target:env['CARGO_TARGET_DIR']=str(target)
 start=time.monotonic()
 with p.joinpath(name+'.log').open('w') as f:q=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT)
 with lock:
  records.append(dict(name=name,cwd=str(cwd),command=cmd,target=str(target) if target else None,returncode=q.returncode,seconds=time.monotonic()-start));p.joinpath('boundary-commands.json').write_text(json.dumps(records,indent=2)+'\n')
 print(name,q.returncode,flush=True);assert q.returncode==0,name

def artifact(src,label):
 dest=bins/label;shutil.copy2(src,dest);p.joinpath(label+'-artifact.json').write_text(json.dumps(dict(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()),indent=2)+'\n');return dest

def native(variant):
 target=Path('/tmp/interval-refactor/machine-profile-cost-target');cwd=stage/'profile-probe'
 run(variant+'-raw-native-build',cwd,['cargo','+1.95.0','build','--release','--locked','--offline'],target)
 dest=artifact(target/'release/machine-profile-probe','unsigned-'+variant+'-raw-profile')
 run(variant+'-raw-native-values',cwd,[str(dest)])
 run(variant+'-symbols-build',cwd,['cargo','+1.95.0','rustc','--release','--locked','--offline','--bin','machine-profile-probe','--','-C','strip=none'],target)
 artifact(target/'release/machine-profile-probe','unsigned-'+variant+'-profile-symbols')

def wasm(variant):
 target=Path('/tmp/interval-refactor/machine-profile-wasm-target');cwd=stage/'wasm-profile'
 run(variant+'-wasm-build',cwd,['cargo','+1.95.0','build','--release','--locked','--offline','--target','wasm32-unknown-unknown'],target)
 artifact(target/'wasm32-unknown-unknown/release/machine_profile_wasm.wasm','unsigned-'+variant+'-profile.wasm')
try:
 for variant in ['baseline','candidate']:
  for row in production:
   root=pair/row['repo'];name=row['path'];data=subprocess.check_output(['git','show','HEAD:'+name],cwd=root) if variant=='baseline' else (p/'final-source'/row['repo']/name).read_bytes();(root/name).write_bytes(data)
  with ThreadPoolExecutor(max_workers=2) as executor:
   futures=[executor.submit(native,variant),executor.submit(wasm,variant)]
   errors=[]
   for future in futures:
    try:future.result()
    except BaseException as e:errors.append(e)
   if errors:raise errors[0]
  run(variant+'-wasm-replay',stage,['/tmp/interval-refactor/tools/bin/python',str(stage/'wasm-replay.py'),str(bins/('unsigned-'+variant+'-profile.wasm')),str(p/(variant+'-raw-native-values.log'))])
finally:
 for row in production:
  data=(p/'final-source'/row['repo']/row['path']).read_bytes();(pair/row['repo']/row['path']).write_bytes(data);assert hashlib.sha256(data).hexdigest()==row['sha256']
 print('typed candidate production sources restored',flush=True)
assert p.joinpath('baseline-raw-native-values.log').read_bytes()==p.joinpath('candidate-raw-native-values.log').read_bytes()
print('Native exact profiles, full identities and raw allocations match',flush=True)
