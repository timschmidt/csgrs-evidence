from pathlib import Path
import json,subprocess,os,time,hashlib,shutil,sys
assert Path.cwd() == Path('/mnt/development/csgrs'), 'Build cwd controls Cargo configuration; use the admitted CSGRS root.'
s=Path(__file__).parent;h=s;label=sys.argv[1];b=Path('/mnt/development/.interval-refactor-build/profile-typed-fraction');art=Path('/mnt/development/.interval-refactor-build/budget-radius-composition/artifacts');art.mkdir(parents=True,exist_ok=True)
env=os.environ|{'CARGO_TARGET_DIR':str(b/'profile'),'CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'};rows=[]
for kind,manifest,target,file in [('native','profile-probe',None,'machine-profile-probe'),('wasm','wasm-profile','wasm32-unknown-unknown','machine_profile_wasm.wasm')]:
 cmd=['cargo','+1.95.0','build','--locked','--release','--manifest-path',str(h/manifest/'Cargo.toml')]
 if target:cmd+=['--target',target]
 start=time.monotonic()
 with (s/(label+'-'+kind+'-build.log')).open('wb') as out:p=subprocess.run(cmd,env=env,stdout=out,stderr=subprocess.STDOUT)
 assert p.returncode==0,(kind,p.returncode)
 source=b/'profile';source=source/target if target else source;source=source/'release'/file
 dest=art/(label+'-'+file);shutil.copy2(source,dest)
 row={'kind':kind,'command':cmd,'returncode':p.returncode,'seconds':time.monotonic()-start,'path':str(dest),'bytes':dest.stat().st_size,'sha256':hashlib.sha256(dest.read_bytes()).hexdigest()};rows.append(row);(s/(label+'-builds.json')).write_text(json.dumps(rows,indent=2)+'\n');print(label,kind,'built',flush=True)
 if kind=='native':
  with (s/(label+'-profile-values.log')).open('wb') as out:subprocess.run([str(dest)],stdout=out,stderr=subprocess.STDOUT,check=True)
  row['size']=subprocess.check_output(['size',str(dest)],text=True)
 else:
  with (s/(label+'-wasm-replay.json')).open('wb') as out:subprocess.run(['/tmp/interval-refactor/tools/bin/python',str(h/'wasm-replay.py'),str(dest),str(s/(label+'-profile-values.log'))],stdout=out,stderr=subprocess.STDOUT,check=True)
 (s/(label+'-builds.json')).write_text(json.dumps(rows,indent=2)+'\n')
