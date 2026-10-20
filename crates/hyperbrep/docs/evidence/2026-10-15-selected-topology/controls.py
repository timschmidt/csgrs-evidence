from pathlib import Path
import difflib
import hashlib
import json
import subprocess

root = Path('/mnt/development/csgrs')
out = Path('/tmp/hyperbrep-selected-topology-controls')
out.mkdir(exist_ok=False)
controls = [
    ('wrong-spatial-vertex', 'crates/hyperbrep/src/topology/edit/edge.rs',
     '.point_at(&parameter)?', '.point_at(&Real::zero().into())?',
     'selected_split_preserves_both_incident_uses_and_shared_spatial_point'),
    ('require-scalar-cut', 'crates/hyperbrep/src/topology/edit/edge.rs',
     'let split_point = if let Some',
     'let parameter = Parameter::from_real(parameter.try_real().ok_or(GeometryError::UnrepresentableParameter)?.clone());\n        let split_point = if let Some',
     'selected_split_preserves_both_incident_uses_and_shared_spatial_point'),
    ('ignore-directed-source-chart', 'crates/hypercurve/src/curve.rs',
     'if self.source_traversal_is_reversed() {\n            (domain.end(), domain.start())',
     'if false {\n            (domain.end(), domain.start())',
     'selected_vertices_and_pcurves_survive_affine_transforms_and_reflection'),
    ('trust-affine-endpoints', 'crates/hyperbrep/src/topology/correspondence.rs',
     'if let Self::Affine { scale, offset } = self {\n            if let Some(value) = pcurve_parameter.try_real() {',
     '''if let Self::Affine { scale, offset } = self {
            let endpoints = match direction {
                Direction::Forward => [edge_domain.start(), edge_domain.end()],
                Direction::Reversed => [edge_domain.end(), edge_domain.start()],
            };
            if pcurve_parameter.compare(&pcurve.domain_start()?)? == std::cmp::Ordering::Equal { return Ok(endpoints[0].clone()); }
            if pcurve_parameter.compare(&pcurve.domain_end()?)? == std::cmp::Ordering::Equal { return Ok(endpoints[1].clone()); }
            if let Some(value) = pcurve_parameter.try_real() {''',
     'arbitrary_edits_cannot_reuse_subdivision_certificates'),
]
records = []
for name, relative, old, new, test in controls:
    source = root / relative
    original = source.read_text()
    assert original.count(old) == 1, (name, original.count(old))
    mutated = original.replace(old, new, 1)
    args = ['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','selected_topology',test,'--','--exact']
    try:
        source.write_text(mutated)
        (out/(name+'.patch')).write_text(''.join(difflib.unified_diff(original.splitlines(True), mutated.splitlines(True), fromfile='a/'+relative, tofile='b/'+relative)))
        with (out/(name+'.log')).open('w') as log:
            result = subprocess.run(args,cwd=root,stdout=log,stderr=subprocess.STDOUT)
    finally:
        source.write_text(original)
    record = {'name':name,'args':args,'exit_code':result.returncode,'source':relative,'retained_source_sha256':hashlib.sha256(original.encode()).hexdigest(),'mutated_source_sha256':hashlib.sha256(mutated.encode()).hexdigest(),'log':name+'.log','patch':name+'.patch'}
    records.append(record)
    (out/'controls.json').write_text(json.dumps(records,indent=2)+'\n')
    log = (out/(name+'.log')).read_text()
    assert result.returncode == 101, (name,log)
    assert 'test result: FAILED. 0 passed; 1 failed;' in log, (name,log)
    print(name+': focused test rejected mutant',flush=True)
