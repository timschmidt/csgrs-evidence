from pathlib import Path
import subprocess,os,time,json
s=Path(__file__).parent;root='/mnt/development/interval-profile-static/csgrs';env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/interval-coverage-closure-tests','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'};rows=[]
for feature in ['integer','fixed','float-proposal','float-enclosure','dyadic','rational','rational,dyadic']:
 cmd=['cargo','+1.95.0','test','--locked','-p','hyperinterval','--no-default-features','--features',feature,'--test','boundary_composition','--test','rational'];start=time.monotonic()
 with (s/('feature-'+feature.replace(',','-')+'.log')).open('w') as out:p=subprocess.run(cmd,cwd=root,env=env,stdout=out,stderr=subprocess.STDOUT)
 rows.append({'feature':feature,'command':cmd,'cwd':root,'exit_code':p.returncode,'seconds':time.monotonic()-start});(s/'feature-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(feature,p.returncode,flush=True)
 if p.returncode:raise SystemExit(p.returncode)
