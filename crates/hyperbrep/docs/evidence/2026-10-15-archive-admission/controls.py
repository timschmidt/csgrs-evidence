import os, subprocess, json, hashlib, difflib, time
from pathlib import Path
root=Path('/mnt/development/csgrs'); out=Path('/tmp/hyperbrep-archive-admission-evidence'); controls=out/'controls'; controls.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
mutants=[('skip-byte-admission', 'crates/hyperbrep/src/persistence/limits.rs', 'check(ArchiveResource::InputBytes, json.len(), self.input_bytes)?;', 'check(ArchiveResource::InputBytes, json.len(), usize::MAX)?;', 'hyperbrep', ['--test', 'archive_limits', 'each_input_limit_accepts_its_boundary_and_allows_an_exact_retry'], 'panicked'), ('skip-depth-admission', 'crates/hyperbrep/src/persistence/limits.rs', 'check(ArchiveResource::NestingDepth, depth, self.nesting_depth)?;', 'check(ArchiveResource::NestingDepth, depth, usize::MAX)?;', 'hyperbrep', ['--test', 'archive_limits', 'unknown_fields_consume_limits_before_version_or_record_decoding'], 'panicked'), ('skip-token-admission', 'crates/hyperbrep/src/persistence/limits.rs', 'check(ArchiveResource::Tokens, tokens, self.tokens)?;', 'check(ArchiveResource::Tokens, tokens, usize::MAX)?;', 'hyperbrep', ['--test', 'archive_limits', 'unknown_fields_consume_limits_before_version_or_record_decoding'], 'panicked'), ('ignore-string-escapes', 'crates/hyperbrep/src/persistence/limits.rs', "b'\\\\' => index += 2,", "b'\\\\' => index += 1,", 'hyperbrep', ['--test', 'archive_limits', 'quoted_delimiters_and_escapes_do_not_inflate_structure_counts'], 'panicked')]
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
