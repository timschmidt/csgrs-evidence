"""Each deliberate export fault must fail at runtime; restore source in finally."""
import difflib, hashlib, json, os, subprocess, time
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent/'controls';out.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
cases=[
    ('silence-nonterminating','number.rs','return Err(site.error(WriteErrorKind::NonTerminatingDecimal));','break;','step_write','strict_writer_diagnoses_nonrepresentable_coordinates_units_and_limits'),
    ('drop-hole','faceted.rs','for wire in face.inner() {','for wire in face.inner().take(0) {','step_write','native_faceted_solids_export_every_body_hole_and_source_use_exactly'),
    ('drop-body','faceted.rs','sources.iter().enumerate()','sources.iter().take(1).enumerate()','step_write','native_faceted_solids_export_every_body_hole_and_source_use_exactly'),
    ('reverse-sense','faceted.rs','out.reference(plane)?;\n            out.put(",.T.")','out.reference(plane)?;\n            out.put(",.F.")','step_write_geometry','native_edits_shear_reflection_and_large_translations_keep_exact_oriented_geometry'),
    ('wrong-source-segment','faceted.rs','                    segment,','                    segment: segment + 1,','step_write_geometry','exact_output_units_preserve_inch_grid_and_nearby_distinct_bodies'),
    ('ignore-byte-limit','error.rs','if observed > limit {','if observed > limit && resource != WriteResource::OutputBytes {','step_write_limits','output_counts_are_inclusive_and_rejections_can_be_retried'),
]
rows=[]
for name,file,old,new,test,target in cases:
    path=root/'crates/hyperbrep-io/src/step/write'/file;original=path.read_text();assert original.count(old)==1,(name,old)
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
