"""Deliberate faults must fail tests at runtime; restore each source in finally."""
import difflib, hashlib, json, os, subprocess, time
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent/'controls';out.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
check='self.nodes[1].minimum == count && self.nodes[1].maximum == count'
cases=[
 ('ignore-overlap','rectangular_cover.rs',check,'self.nodes[1].minimum == count',['--lib','topology::validation::rectangular_cover_tests::sweep_matches_independent_cell_counts_for_every_two_by_two_subset']),
 ('ignore-gap','rectangular_cover.rs',check,'self.nodes[1].maximum == count',['--lib','topology::validation::rectangular_cover_tests::sweep_matches_independent_cell_counts_for_every_two_by_two_subset']),
 ('restore-quarter-grid','cylinder.rs','u_values.len() < 2 || v_values.len() < 2','u_values.len() != 5 || v_values.len() < 2',['--test','periodic_cylinder','full_period_seam_and_unequal_side_partitions_survive_replay']),
]
rows=[]
for name,file,old,new,target in cases:
 path=root/'crates/hyperbrep/src/topology/validation'/file;original=path.read_text();assert original.count(old)==1
 changed=original.replace(old,new);before=hashlib.sha256(original.encode()).hexdigest()
 (out/(name+'.patch')).write_text(''.join(difflib.unified_diff(original.splitlines(True),changed.splitlines(True),fromfile=str(path.relative_to(root)),tofile=str(path.relative_to(root)))))
 cmd=['cargo','test','--offline','--locked','-p','hyperbrep',*target,'--','--exact'];started=time.time()
 try:
  path.write_text(changed);run=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True)
 finally:
  path.write_text(original);assert hashlib.sha256(path.read_bytes()).hexdigest()==before
 log=run.stdout+run.stderr;(out/(name+'.log')).write_text(log)
 rejected=run.returncode!=0 and 'test result: FAILED' in log and 'could not compile' not in log
 rows.append(dict(name=name,command=cmd,exit_code=run.returncode,rejected_at_runtime=rejected,source_restored=True,source_sha256=before,elapsed_seconds=time.time()-started))
 (out/'results.json').write_text(json.dumps(rows,indent=2)+'\n');assert rejected,log
 print(name,'rejected and restored',flush=True)
