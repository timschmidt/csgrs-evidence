from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent;tree=Path('/mnt/development/interval-profile-static/alumina-interface');env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/clock-migration-interface','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
commands={
 'interface-debug-tests':['cargo','+1.95.0','test','--locked','-p','alumina-interface-core'],
 'interface-clippy':['cargo','+1.95.0','clippy','--locked','-p','alumina-interface-core','--all-targets','--','-D','warnings'],
 'interface-fmt':['cargo','+1.95.0','fmt','--all','--','--check']}
rows=[]
for label,command in commands.items():
 start=time.monotonic()
 with (s/(label+'.log')).open('w') as out:p=subprocess.run(command,cwd=tree,env=env,stdout=out,stderr=subprocess.STDOUT)
 row={'label':label,'command':command,'cwd':str(tree),'exit_code':p.returncode,'seconds':time.monotonic()-start};rows.append(row);(s/'interface-qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True);assert p.returncode==0
