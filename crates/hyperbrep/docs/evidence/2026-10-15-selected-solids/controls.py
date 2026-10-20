import os, subprocess, json, hashlib, difflib, time
from pathlib import Path
root=Path('/mnt/development/csgrs'); out=Path('/tmp/hyperbrep-selected-solids-evidence'); controls=out/'controls'; controls.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
mutants=[('ignore-linear-form-side', 'crates/hyperbrep/src/geometry/point.rs', '                Ok(point\n                    .compare_coordinate(&Point2::new(rhs.clone(), Real::zero()).into(), Axis2::X)?)', '                point.compare_coordinate(&Point2::new(rhs.clone(), Real::zero()).into(), Axis2::X)?;\n                Ok(Ordering::Equal)', ['--test', 'retained_points', 'linear_forms_preserve_selected_roots_weights_and_nonunit_knot_charts'], 'right: Greater'), ('halve-planar-volume', 'crates/hyperbrep/src/topology/wire_geometry.rs', '    Ok(Real::from(2)\n        * Vector3::from(origin.clone()).dot(&u.cross(v))', '    Ok(Real::one()\n        * Vector3::from(origin.clone()).dot(&u.cross(v))', ['--test', 'selected_solids', 'all_cuboid_edges_replay_without_native_prism_bridges_and_preserve_affine_volume'], 'assertion `left == right` failed')]
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
