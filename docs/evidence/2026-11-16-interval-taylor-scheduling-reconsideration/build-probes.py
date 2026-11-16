from pathlib import Path
import subprocess,os,sys,shutil,json,time
s=Path(__file__).parent;label=sys.argv[1]
art=Path('/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts');art.mkdir(parents=True,exist_ok=True)
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/profile-typed-fraction/owner','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
rows=[]
for package,name in [('coefficients-probe','coefficients-clone-probe'),('timing-probe','coefficients-timing-probe'),('probe','flow-wrapping-probe')]:
 # Obtain the package name from its manifest, avoiding assumptions about old probe names.
 import tomllib
 manifest=s/package/'Cargo.toml';name=tomllib.loads(manifest.read_text())['package']['name']
 if not (manifest.parent/'Cargo.lock').exists():subprocess.run(['cargo','+1.95.0','generate-lockfile','--offline','--manifest-path',str(manifest)],env=env,check=True)
 command=['cargo','+1.95.0','build','--locked','--release','--manifest-path',str(manifest)]
 start=time.monotonic()
 with (s/(label+'-'+package+'-build.log')).open('w') as log:p=subprocess.run(command,env=env,stdout=log,stderr=subprocess.STDOUT)
 row={'command':command,'exit_code':p.returncode,'seconds':time.monotonic()-start};rows.append(row)
 (s/(label+'-probe-builds.json')).write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0,row
 shutil.copy2(Path(env['CARGO_TARGET_DIR'])/'release'/name,art/(label+'-'+package))
 print(label,package,flush=True)
