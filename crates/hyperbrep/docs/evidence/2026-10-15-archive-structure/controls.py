import os, subprocess, json, hashlib, difflib, time
from pathlib import Path
root=Path('/mnt/development/csgrs'); out=Path('/tmp/hyperbrep-archive-structure-evidence'); controls=out/'controls'; controls.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
mutants=[('skip-record-admission', 'crates/hyperbrep/src/persistence/admission.rs', 'self.check(ArchiveResource::Records, self.records, self.limits.records)', 'self.check(ArchiveResource::Records, self.records, usize::MAX)', 'hyperbrep', ['--test', 'archive_structure', 'every_arena_record_is_charged_before_payload_decoding'], 'panicked'), ('skip-degree-admission', 'crates/hyperbrep/src/persistence/admission.rs', 'self.check(ArchiveResource::Degree, degree, self.limits.degree)', 'self.check(ArchiveResource::Degree, degree, usize::MAX)', 'hyperbrep', ['--test', 'archive_structure', 'every_spline_storage_family_is_admitted_before_its_invalid_scalars'], 'panicked'), ('skip-geometry-admission', 'crates/hyperbrep/src/persistence/admission.rs', 'self.limits.geometry_elements,', 'usize::MAX,', 'hyperbrep', ['--test', 'archive_structure', 'a_valid_nurbs_retries_after_degree_and_geometry_exhaustion'], 'panicked'), ('skip-topology-admission', 'crates/hyperbrep/src/persistence/admission.rs', 'self.limits.topology_references,', 'usize::MAX,', 'hyperbrep', ['--test', 'archive_structure', 'topology_lists_are_charged_before_index_decoding'], 'panicked'), ('omit-empty-row-headers', 'crates/hyperbrep/src/persistence/admission/shapes.rs', 'self.rows + self.elements', 'self.elements', 'hyperbrep', ['--test', 'archive_structure', 'empty_tensor_rows_and_declared_extreme_degree_cannot_bypass_admission'], 'panicked'), ('omit-inline-profile-record', 'crates/hyperbrep/src/persistence/admission/shapes.rs', 'budget.record()?;', '// Deliberately omit inline profile from the total.', 'hyperbrep', ['--test', 'archive_structure', 'detached_sources_roots_and_inline_profiles_share_one_total'], 'panicked')]
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
