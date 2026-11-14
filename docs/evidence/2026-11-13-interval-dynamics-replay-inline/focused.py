from pathlib import Path
import json,os,subprocess,time
p=Path(__file__).parent;tree=Path('/mnt/development/csgrs-dynamics-replay-inline');env=dict(os.environ,CARGO_BUILD_JOBS='4',CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/dynamics-replay-inline')
commands=[('native-controls',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--test','provider_errors','--test','metric_admission','--test','feed_join_admission']),('routing-controls',['cargo','+1.95.0','test','--locked','-p','hyperpath','--features','dispatch-trace','--lib','routing::']),('axis-controls',['cargo','+1.95.0','test','--locked','-p','hyperpath','--features','dispatch-trace','--test','axis_projection_migration']),('clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','-p','hyperpath','--all-targets','--all-features','--','-D','warnings'])]
results=[]
for name,command in commands:
 start=time.monotonic()
 with (p/(name+'.log')).open('w') as log:r=subprocess.run(command,cwd=tree,env=env,stdout=log,stderr=subprocess.STDOUT)
 results.append({'name':name,'command':command,'returncode':r.returncode,'seconds':time.monotonic()-start});(p/'focused-commands.json').write_text(json.dumps(results,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:raise SystemExit(r.returncode)
