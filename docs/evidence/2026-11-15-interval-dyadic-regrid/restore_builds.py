from pathlib import Path
import subprocess,os,time,json,hashlib,shutil
s=Path(__file__).parent;a=Path('/mnt/development/.interval-refactor-build/regrid-identity-artifacts');base=Path('/mnt/development/.interval-refactor-build');rows=[]
jobs=[
 ('owner',base/'profile-typed-fraction/owner',['-p','hyperinterval','--all-features','--release','--examples'],''),
 ('dynamics',base/'profile-typed-fraction/owner',['-p','hyperdynamics','--release','--features','adaptive-taylor,taylor-evolution,coordinates,qr-evolution','--benches'],'dynamics-'),
 ('external',base/'external-dynamics',['--release','--manifest-path','scripts/validated-dynamics/Cargo.toml'],None),
 ('successive',base/'regrid-successive',['--release','--bench','successive_operations'],'')]
for label,target,args,prefix in jobs:
 command=['cargo','+1.95.0','build','--locked',*args,'--message-format=json'];env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'};start=time.monotonic()
 with (s/('restored-'+label+'-build.jsonl')).open('w') as out,(s/('restored-'+label+'-build.log')).open('w') as err:p=subprocess.run(command,env=env,stdout=out,stderr=err)
 (s/('restored-'+label+'-build.json')).write_text(json.dumps({'command':command,'target':str(target),'exit_code':p.returncode,'seconds':time.monotonic()-start},indent=2)+'\n');assert p.returncode==0,label
 for line in (s/('restored-'+label+'-build.jsonl')).read_text().splitlines():
  x=json.loads(line)
  if x.get('reason')!='compiler-artifact' or not x.get('executable'):continue
  name='external' if prefix is None else prefix+x['target']['name'];p=Path(x['executable']);b=a/('baseline-'+name);dest=a/('restored-'+name);shutil.copy2(p,dest)
  data=p.read_bytes();row={'name':name,'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),'baseline_identical':data==b.read_bytes()};rows.append(row)
 (s/'restored-binaries.json').write_text(json.dumps(rows,indent=2)+'\n');assert all(x['baseline_identical'] for x in rows),rows
 print(label,'restored byte-identical',flush=True)
assert len(rows)==25,len(rows)
with (s/'restored-external.stdout').open('w') as out:subprocess.run([str(a/'restored-external')],stdout=out,check=True)
assert (s/'restored-external.stdout').read_bytes()==(s/'whole.stdout').read_bytes()
with (s/'restored-external-oracle.json').open('w') as out:subprocess.run(['python3','scripts/validated-dynamics/validate.py',str(s/'restored-external.stdout')],stdout=out,check=True)
print('all 25 binaries restored; full external certificates and analytic oracle pass')
