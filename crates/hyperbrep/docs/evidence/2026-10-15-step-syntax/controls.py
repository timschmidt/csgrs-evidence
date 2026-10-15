import os, subprocess, json, hashlib, difflib, time
from pathlib import Path
root=Path('/mnt/development/csgrs'); out=Path('/tmp/hyperbrep-step-syntax-evidence'); controls=out/'controls'; controls.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
mutants=[('skip-value-limit', 'crates/hyperbrep-io/src/part21/parser.rs', 'self.limits.values,', 'usize::MAX,', 'hyperbrep-io', ['--test', 'part21', 'every_resource_accepts_its_boundary_and_rejects_a_smaller_allowance'], 'panicked'), ('skip-exponent-limit', 'crates/hyperbrep-io/src/part21/number.rs', 'limits.exponent, 0)?;', 'usize::MAX, 0)?;', 'hyperbrep-io', ['--test', 'part21', 'scalar_conversion_has_separate_inclusive_digit_and_exponent_limits'], 'panicked'), ('accept-duplicate-identifiers', 'crates/hyperbrep-io/src/part21/parser.rs', 'if pair[0].0 == pair[1].0 {', 'if false && pair[0].0 == pair[1].0 {', 'hyperbrep-io', ['--test', 'part21', 'duplicate_ids_and_id_overflow_fail_without_sparse_allocation'], 'panicked'), ('discard-complex-components', 'crates/hyperbrep-io/src/part21/writer.rs', 'for component in &exchange.records[entity.components.clone()] {', 'for component in &exchange.records[entity.components.start..entity.components.start + 1] {', 'hyperbrep-io', ['--test', 'part21', 'complex_instances_forward_references_and_unknown_records_are_retained'], 'panicked')]
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
