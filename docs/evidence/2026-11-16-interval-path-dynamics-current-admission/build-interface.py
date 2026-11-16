from pathlib import Path
import subprocess,json,os,sys,shutil,time,hashlib
s=Path(__file__).parent;label=sys.argv[1];tree=Path('/mnt/development/interval-profile-static/alumina-interface');art=Path('/mnt/development/.interval-refactor-build/path-dynamics-current-admission/artifacts');env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/clock-migration-interface','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
rows=[]
for mode in ['release','symbols']:
 build_env=env if mode=='release' else env|{'CARGO_PROFILE_RELEASE_STRIP':'none'}
 command=['cargo','+1.95.0','test','--locked','--release','-p','alumina-interface-core','--lib','--no-run','--message-format=json'];start=time.monotonic();prefix=label+'-interface-'+mode
 with (s/(prefix+'-build.jsonl')).open('w') as out,(s/(prefix+'-build.log')).open('w') as err:p=subprocess.run(command,cwd=tree,env=build_env,stdout=out,stderr=err)
 row={'mode':mode,'command':command,'cwd':str(tree),'env':{k:build_env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE']+(['CARGO_PROFILE_RELEASE_STRIP'] if mode=='symbols' else [])},'exit_code':p.returncode,'seconds':time.monotonic()-start}
 if p.returncode==0:
  data=[json.loads(l) for l in (s/(prefix+'-build.jsonl')).read_text().splitlines()];exes=[x['executable'] for x in data if x.get('reason')=='compiler-artifact' and x.get('target',{}).get('name')=='alumina_interface_core' and x.get('executable')];assert len(exes)==1
  dest=art/prefix;shutil.copy2(exes[0],dest);row.update(path=str(dest),file=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
 rows.append(row);(s/(label+'-interface-builds.json')).write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True);assert p.returncode==0
