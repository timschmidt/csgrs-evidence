from pathlib import Path
import subprocess,os,time,json,shutil,hashlib,sys
s=Path(__file__).parent;label=sys.argv[1];manifest='/tmp/interval-refactor/profile-owned-intervals/profile-probe/Cargo.toml';target=Path('/mnt/development/.interval-refactor-build/profile-typed-fraction/profile');art=Path('/mnt/development/.interval-refactor-build/profile-owned-intervals/maps');art.mkdir(exist_ok=True,parents=True)
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'};cmd=['cargo','+1.95.0','rustc','--locked','--release','--manifest-path',manifest,'--','-C','link-arg=-Wl,-Map='+str(s/(label+'.map'))];start=time.monotonic()
with (s/(label+'-map-build.log')).open('w') as out:p=subprocess.run(cmd,env=env,stdout=out,stderr=subprocess.STDOUT)
row={'command':cmd,'cwd':os.getcwd(),'exit_code':p.returncode,'seconds':time.monotonic()-start}
if p.returncode==0:
 dest=art/(label+'-machine-profile-probe');shutil.copy2(target/'release/machine-profile-probe',dest);row.update({'path':str(dest),'bytes':dest.stat().st_size,'sha256':hashlib.sha256(dest.read_bytes()).hexdigest()})
 with (s/(label+'-values.log')).open('w') as out:subprocess.run([str(dest)],stdout=out,stderr=subprocess.STDOUT,check=True)
(s/(label+'-map-build.json')).write_text(json.dumps(row,indent=2)+'\n');print(json.dumps(row));sys.exit(p.returncode)
