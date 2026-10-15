"""Restore each deliberate semantic fault in finally, and require a runtime test failure."""
import difflib,hashlib,json,os,subprocess,time
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent/'controls';out.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
rows=[]
cases=[
 ('wrong-si-scale','units.rs','scale *= Real::from(10);','scale *= Real::from(100);','step','faceted_boxes_map_exact_units_shared_edges_and_source_ownership'),
 ('ignore-bound-reversal','faceted.rs','if !forward {','if false {','step','reversed_bound_preserves_the_authored_face_and_bad_sense_is_rejected'),
 ('discard-second-body','faceted.rs','for value in items {','for value in items.take(1) {','step','faceted_boxes_map_exact_units_shared_edges_and_source_ownership'),
 ('discard-inner-bounds','faceted.rs','.face(&surface, orientation, &outer, &holes)','.face(&surface, orientation, &outer, &[])','step','inner_bounds_and_oblique_planes_construct_complete_exact_solids'),
 ('omit-scale-admission','units.rs','if observed.is_err() || observed.is_ok_and(|bits| bits > self.limits.unit_scale_bits) {','if false {','step_units','resolved_scale_growth_is_admitted_before_multiplication'),
]
for name,file,old,new,test,target in cases:
    path=root/'crates/hyperbrep-io/src/step'/file;original=path.read_text();assert original.count(old)==1,(name,old)
    changed=original.replace(old,new);before=hashlib.sha256(original.encode()).hexdigest()
    (out/(name+'.patch')).write_text(''.join(difflib.unified_diff(original.splitlines(True),changed.splitlines(True),fromfile=str(path.relative_to(root)),tofile=str(path.relative_to(root)))))
    cmd=['cargo','test','--offline','--locked','-p','hyperbrep-io','--test',test,target,'--','--exact']
    started=time.time()
    try:
        path.write_text(changed)
        run=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True)
    finally:
        path.write_text(original)
        assert hashlib.sha256(path.read_bytes()).hexdigest()==before
    log=run.stdout+run.stderr;(out/(name+'.log')).write_text(log)
    rejected=run.returncode!=0 and 'test result: FAILED' in log and 'could not compile' not in log
    rows.append(dict(name=name,command=cmd,exit_code=run.returncode,rejected_at_runtime=rejected,source_restored=True,source_sha256=before,elapsed_seconds=time.time()-started))
    (out/'results.json').write_text(json.dumps(rows,indent=2)+'\n')
    assert rejected,log
    print(name,'rejected and restored',flush=True)
