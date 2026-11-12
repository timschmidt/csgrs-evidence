from pathlib import Path
import os,subprocess,json,time,shutil,hashlib,re,csv,statistics
root=Path('/tmp/interval-refactor/interface-measurements');repo=Path('/mnt/development/alumina-interface');project=Path('/mnt/development/csgrs/crates/hyperinterval/conformance/alumina-measurements');target=Path('/tmp/interval-refactor/measurement-adoption-target');bins=Path('/tmp/interval-refactor/interface-measurement-binaries')
paths=['Cargo.toml','Cargo.lock','crates/alumina-interface-core/Cargo.toml','crates/alumina-interface-core/src/boundary.rs'];saved={p:(repo/p).read_bytes() for p in paths};lock=(project/'Cargo.lock').read_bytes();rows=[];commands=[]
env=os.environ|{'CARGO_TARGET_DIR':str(target)}
def command(cmd,log):
 start=time.monotonic()
 with (root/log).open('w') as f:p=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=env)
 commands.append({'command':cmd,'environment':{'CARGO_TARGET_DIR':str(target)},'log':log,'exit_code':p.returncode,'seconds':time.monotonic()-start});(root/'native-adoption-commands.json').write_text(json.dumps(commands,indent=2)+'\n')
 assert p.returncode==0,log

def build(tag,locked):
 base=['cargo','+1.95.0'];manifest=['--manifest-path',str(project/'Cargo.toml')]
 command(base+['build','--locked' if locked else '--offline','--release',*manifest,'--features','probes','--bins'],tag+'-build.log')
 for name in ['cost','probe']:
  source=target/'release'/name;dest=bins/(tag+'-'+name);shutil.copy2(source,dest);data=dest.read_bytes();rows.append({'revision':tag,'name':name,'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),'path':str(dest)})
  with (root/(tag+'-'+name+'-sections.txt')).open('w') as f:subprocess.run(['size','-A',str(dest)],stdout=f,check=True)
 command(base+['rustc','--locked','--release',*manifest,'--features','probes','--bin','probe','--','--emit=llvm-ir'],tag+'-llvm.log')
 path=max((target/'release/deps').glob('probe-*.ll'),key=lambda p:p.stat().st_mtime_ns);data=path.read_bytes();shutil.copy2(path,bins/(tag+'-probe.ll'));functions=[];active=None
 for line in data.decode().splitlines():
  if line.startswith('define '):active={'name':re.search(r'@("[^"]+"|[^ (]+)\(',line).group(1),'body_lines':0}
  elif active is not None:
   if line=='}':functions.append(active);active=None
   elif line.strip() and not line.lstrip().startswith(';'):active['body_lines']+=1
 ir={'sha256':hashlib.sha256(data).hexdigest(),'bytes':len(data),'definitions':len(functions),'body_lines':sum(f['body_lines'] for f in functions),'functions':functions};(root/(tag+'-ir.json')).write_text(json.dumps(ir,indent=2)+'\n')
 print(tag,'built',flush=True)
try:
 for path in paths:(repo/path).write_bytes(subprocess.check_output(['git','-C',str(repo),'show','HEAD:'+path]))
 build('adopt-baseline',False)
finally:
 for path,data in saved.items():(repo/path).write_bytes(data)
 (project/'Cargo.lock').write_bytes(lock)
 (root/'adoption-restoration.json').write_text(json.dumps({p:hashlib.sha256((repo/p).read_bytes()).hexdigest() for p in paths},indent=2)+'\n')
 assert all((repo/path).read_bytes()==data for path,data in saved.items())
build('adopt-final',True)
(root/'native-adoption-artifacts.json').write_text(json.dumps(rows,indent=2)+'\n')
outputs=[]
for index in range(8):
 a=subprocess.check_output([str(bins/'adopt-baseline-probe'),str(index)],text=True);b=subprocess.check_output([str(bins/'adopt-final-probe'),str(index)],text=True);assert a==b
 outputs.append({'fixture':index,'exact_output':a})
(root/'native-adoption-outputs.json').write_text(json.dumps(outputs,indent=2)+'\n')
records=[]
for repeat in range(6):
 for tag in (['adopt-baseline','adopt-final'] if repeat%2==0 else ['adopt-final','adopt-baseline']):
  filename=f'paired-{repeat}-{tag}.csv'
  with (root/filename).open('w') as f:subprocess.run([str(bins/(tag+'-cost'))],stdout=f,check=True)
  data=list(csv.DictReader((root/filename).open()));assert len(data)==160
  for row in data:
   assert row['completed']=='512' and row['allocation_calls']==row['allocated_bytes']=='0'
   records.append(row|{'revision':tag,'repeat':repeat})
summary=[]
for fixture in range(8):
 def median(tag):return statistics.median(int(r['elapsed_ns'])/512 for r in records if r['fixture']==str(fixture) and r['revision']==tag)
 a,b=median('adopt-baseline'),median('adopt-final');summary.append({'fixture':fixture,'samples_per_revision':120,'baseline_ns':a,'final_ns':b,'final_over_baseline':b/a})
(root/'native-adoption-cost.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
