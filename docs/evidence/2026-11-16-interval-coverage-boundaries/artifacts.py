from pathlib import Path
import subprocess,json,sys,time,os,hashlib,shutil
from artifact_sizes import native
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);label=sys.argv[1];assert not(s/(label+'-artifacts.json')).exists();target=Path('/mnt/development/.interval-refactor-build/interval-coverage-review-release');art=Path('/mnt/development/.interval-refactor-build/interval-coverage-review-artifacts');art.mkdir(exist_ok=True);head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip();env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'8','CARGO_NET_OFFLINE':'true'};rows=[]
for name in ['trigonometry','tangent','fractional_power','trig_cost']:
 kind='example' if name=='trig_cost' else 'test';cmd=['cargo','+1.95.0',*(['build'] if kind=='example' else ['test','--no-run']),'--locked','-p','hyperinterval','--all-features','--release','--'+kind,name,'--message-format=json'];start=time.time()
 with (s/f'{label}-{name}-build.log').open('w') as log:code=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
 row={'name':name,'kind':kind,'command':cmd,'head':head,'exit_code':code,'elapsed':time.time()-start};rows.append(row);(s/(label+'-artifacts.json')).write_text(json.dumps(rows,indent=2)+'\n');assert code==0
 matches=[]
 for line in(s/f'{label}-{name}-build.log').read_text().splitlines():
  try:d=json.loads(line)
  except json.JSONDecodeError:continue
  if d.get('reason')=='compiler-artifact' and d.get('executable') and d['target']['name']==name:matches.append(d['executable'])
 assert len(matches)==1;dest=art/(label+'-'+name);shutil.copyfile(matches[0],dest);dest.chmod(0o755);row['size']=native(dest)
 if kind=='test':
  done=subprocess.run([str(dest)],cwd=r,env=env,capture_output=True,text=True,timeout=180);(s/f'{label}-{name}-run.log').write_text(done.stdout+done.stderr);row['runtime_exit_code']=done.returncode;assert done.returncode==0
 else:row['runtime_scope']='Not timed under competing load; existing executable preserved and compared by full artifact/code hashes.'
 row['lock_sha256']=hashlib.sha256((r/'Cargo.lock').read_bytes()).hexdigest();(s/(label+'-artifacts.json')).write_text(json.dumps(rows,indent=2)+'\n');print(label,name,row['size']['file'],row['size']['text'],flush=True)
