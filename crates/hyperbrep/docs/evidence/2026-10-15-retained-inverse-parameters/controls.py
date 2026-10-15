from pathlib import Path
import difflib
import hashlib
import json
import subprocess

root = Path('/mnt/development/csgrs')
out = Path('/tmp/hyperbrep-retained-controls')
out.mkdir(exist_ok=False)
source = root/'crates/hyperbrep/src/geometry/location.rs'
original = source.read_text()
relative = str(source.relative_to(root))
controls = [
    ('materialize-root', 'if incident {', 'if incident {\n                    if parameter.scalar().is_none() { return Err(GeometryError::UnrepresentableParameter); }', 'spatial_queries_retain_selected_roots_in_each_projection'),
    ('ignore-third-coordinate', 'if incident {', 'if incident || parameter.scalar().is_none() {', 'selected_root_incidence_replays_the_remaining_spatial_coordinate'),
    ('discard-authored-chart', 'local.affine_image(&span, domain.start())?', 'local.affine_image(&span, domain.start())?.affine_image(&Real::one(), &-domain.start().clone())?', 'nurbs_queries_preserve_nonunit_charts_and_deduplicate_seams'),
]
records=[]
try:
    for name, old, new, test in controls:
        assert original.count(old)==1,(name,original.count(old))
        mutated=original.replace(old,new,1)
        source.write_text(mutated)
        patch=''.join(difflib.unified_diff(original.splitlines(True),mutated.splitlines(True),fromfile='a/'+relative,tofile='b/'+relative))
        (out/(name+'.patch')).write_text(patch)
        args=['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','retained_parameters',test,'--','--exact']
        with (out/(name+'.log')).open('w') as log:
            result=subprocess.run(args,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        source.write_text(original)
        log=(out/(name+'.log')).read_text()
        assert result.returncode==101,(name,log)
        assert 'test result: FAILED. 0 passed; 1 failed;' in log,(name,log)
        records.append({'name':name,'args':args,'exit_code':result.returncode,'source':relative,'retained_source_sha256':hashlib.sha256(original.encode()).hexdigest(),'mutated_source_sha256':hashlib.sha256(mutated.encode()).hexdigest(),'log':name+'.log','patch':name+'.patch'})
        print(name+': focused assertion rejected mutant',flush=True)
finally:
    source.write_text(original)
    (out/'controls.json').write_text(json.dumps(records,indent=2)+'\n')
