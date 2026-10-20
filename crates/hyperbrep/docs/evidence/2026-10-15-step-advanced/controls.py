"""Each deliberate advanced-import fault must fail at runtime; restore source in finally."""
import difflib, hashlib, json, os, subprocess, time
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent/'controls';out.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
cases=[
 ('ignore-line-incidence','curves.rs','if !same_vector(site, &delta, &(self.velocity.clone() * &parameter))? {','if !same_vector(site, &delta, &(self.velocity.clone() * &parameter))? && false {','step_advanced','every_surface_curve_representation_and_explicit_topological_identity_is_checked'),
 ('ignore-alternate-sense','curves.rs','            || order(site, &scale, &Real::zero())? != Ordering::Greater','            || false','step_advanced','every_surface_curve_representation_and_explicit_topological_identity_is_checked'),
 ('ignore-master','curves.rs','pcurves[0].as_ref().expect("nonempty associations")','&line','step_advanced','differing_surface_curve_parameters_keep_exact_master_and_alternate_maps'),
 ('drop-source-map','curves.rs','for pcurve in pcurves.iter().flatten() {','for pcurve in pcurves.iter().flatten().take(1) {','step_advanced','independent_advanced_boxes_retain_explicit_topology_and_all_curve_parameters'),
 ('ignore-edge-sense','curves.rs','return Err(site.invalid("edge same_sense disagrees with source curve parameters"));','// Deliberate fault: accept contradictory edge sense.','step_advanced','every_surface_curve_representation_and_explicit_topological_identity_is_checked'),
 ('ignore-bound-order','faces.rs','            ordered.reverse();','            // Deliberate fault: preserve the wrong order.','step_advanced','independent_advanced_boxes_retain_explicit_topology_and_all_curve_parameters'),
]

rows=[]
for name,file,old,new,test,target in cases:
    path=root/'crates/hyperbrep-io/src/step/advanced'/file;original=path.read_text();assert original.count(old)==1,(name,old)
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
