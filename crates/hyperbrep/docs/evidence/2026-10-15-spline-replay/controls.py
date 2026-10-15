import os, subprocess, json, hashlib, difflib, time
from pathlib import Path
root=Path('/mnt/development/csgrs'); out=Path('/tmp/hyperbrep-spline-replay-evidence'); controls=out/'controls'; controls.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
mutants=[('trust-spline-endpoints', 'crates/hyperbrep/src/topology/validation/image.rs', '        if curve_parameterizations_equal(&actual, &expected)? {', '        if true || curve_parameterizations_equal(&actual, &expected)? {', 'hyperbrep', ['--test', 'spline_replay', 'matching_trim_endpoints_do_not_certify_a_changed_spline_interior'], 'assertion failed'), ('ignore-span-direction', 'crates/hypercurve/src/curve_injectivity.rs', '                    ) == Some(direction)', '                    ).is_some_and(|order| order == direction || order != Ordering::Equal)', 'hypercurve', ['--test', 'curve_injectivity', 'individually_injective_spans_do_not_certify_backtracking_or_disconnected_images'], 'assertion failed'), ('ignore-exact-joins', 'crates/hypercurve/src/curve_injectivity.rs', '                if compare_reals(', '                if false && compare_reals(', 'hypercurve', ['--test', 'curve_injectivity', 'individually_injective_spans_do_not_certify_backtracking_or_disconnected_images'], 'assertion failed'), ('permit-approximate-joins', 'crates/hypercurve/src/curve_injectivity.rs', '        let policy = CurveContext::STRICT;', '        let policy = crate::policy::principal_context();', 'hypercurve', ['--test', 'curve_injectivity', 'provisional_near_joins_do_not_author_an_injectivity_certificate'], 'assertion')]
results=[]
for name,relative,before,after,package,args,expected in mutants:
    path=root/relative;original=path.read_text();assert original.count(before)==1,(name,original.count(before))
    mutated=original.replace(before,after,1)
    (controls/(name+'.patch')).write_text(''.join(difflib.unified_diff(original.splitlines(True),mutated.splitlines(True),fromfile='a/'+relative,tofile='b/'+relative)))
    print('running control',name,flush=True); started=time.time()
    try:
        path.write_text(mutated)
        cmd=['cargo','test','--offline','--locked','-p',package,'--all-features']+args+['--','--nocapture']
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
