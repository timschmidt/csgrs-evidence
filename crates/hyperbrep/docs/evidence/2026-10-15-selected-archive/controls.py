import os, subprocess, json, hashlib, difflib, time
from pathlib import Path
root=Path('/mnt/development/csgrs'); out=Path('/tmp/hyperbrep-selected-archive-evidence'); controls=out/'controls'; controls.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
mutants=[
('trust-singleton', 'crates/hypercurve/src/bezier_parameter.rs', '        if count != 1 {\n            return Err(CurveError::InvalidBezierAlgebraicParameter);\n        }', '        if false && count != 1 {\n            return Err(CurveError::InvalidBezierAlgebraicParameter);\n        }', ['--test','selected_topology','selected_archive_rejects_forged_roots_sources_charts_and_incidence'], 'accepted no root in bracket'),
('ignore-archive-traversal', 'crates/hyperbrep/src/persistence.rs', '            if reversed {\n                Ok(curve.reversed()', '            if false && reversed {\n                Ok(curve.reversed()', ['--test','selected_topology','planar_selected_rational_pcurves_survive_model_reflection'], 'FAILED'),
('hide-source-self-contact', 'crates/hyperbrep/src/topology/wire_geometry.rs', '    if !matches!(source.geometry(), Some(CurveGeometry2::Line(_))) {', '    if false && !matches!(source.geometry(), Some(CurveGeometry2::Line(_))) {', ['--lib','reassembly_does_not_hide_a_source_without_injectivity_evidence'], 'left: 1'),
]
results=[]
for name,relative,before,after,args,expected in mutants:
    path=root/relative;original=path.read_text();assert original.count(before)==1,(name,original.count(before))
    mutated=original.replace(before,after,1)
    (controls/(name+'.patch')).write_text(''.join(difflib.unified_diff(original.splitlines(True),mutated.splitlines(True),fromfile='a/'+relative,tofile='b/'+relative)))
    print('running control',name,flush=True); started=time.time()
    try:
        path.write_text(mutated)
        cmd=['cargo','test','--offline','--locked','-p','hyperbrep','--all-features']+args+['--','--nocapture']
        with (controls/(name+'.log')).open('w') as log:run=subprocess.run(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT)
        log=(controls/(name+'.log')).read_text()
        assert run.returncode==101 and 'test result: FAILED' in log and expected in log,(name,log[-4000:])
        results.append(dict(name=name,command=cmd,exit_code=run.returncode,elapsed_seconds=time.time()-started,expected_failure=expected,restored_sha256=hashlib.sha256(original.encode()).hexdigest(),source=relative))
    finally:
        path.write_text(original)
        assert hashlib.sha256(path.read_bytes()).hexdigest()==hashlib.sha256(original.encode()).hexdigest()
    (out/'controls.json').write_text(json.dumps(results,indent=2)+'\n')
    print(name,'rejected by assertion; source restored',flush=True)
print('all controls rejected',flush=True)
