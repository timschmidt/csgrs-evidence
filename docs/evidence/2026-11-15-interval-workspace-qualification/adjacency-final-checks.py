import pathlib,subprocess,json,os,time
s=pathlib.Path(__file__).resolve().parent
cwd='/mnt/development/csgrs-workspace-qualification'
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/workspace-qualification',CARGO_BUILD_JOBS='12',CARGO_TERM_COLOR='never')
name='authored_carrier_adjacency_matches_partitioned_cycles_without_numeric_dispatch'
commands=[('range-replay-final',['cargo','+stable','test','--locked','-p','hypercurve','--all-features','--lib','fresh_process_reconstructs_native_controls_and_replays_range_proof']),('adjacency-all-features-final',['cargo','+stable','test','--locked','-p','hypercurve','--all-features','--lib',name]),('adjacency-no-default-final',['cargo','+stable','test','--locked','-p','hypercurve','--no-default-features','--lib',name]),('adjacency-clippy-final',['cargo','+stable','clippy','--locked','-p','hypercurve','--all-targets','--all-features','--','-D','warnings']),('adjacency-final-fmt',['cargo','+stable','fmt','--all','--','--check']),('adjacency-final-diff',['git','diff','--check'])]
results=[]
for name,args in commands:
 start=time.time();print('START '+name,flush=True)
 with (s/(name+'.log')).open('w') as log:
  r=subprocess.run(args,cwd=cwd,env=env,stdout=log,stderr=subprocess.STDOUT)
 row=dict(name=name,command=args,returncode=r.returncode,elapsed_seconds=time.time()-start,cwd=cwd,production_guard_applied=False,pending_extraction_applied=True)
 results.append(row);(s/'adjacency-final-checks.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(row),flush=True)
 if r.returncode:break
