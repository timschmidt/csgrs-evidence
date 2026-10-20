from pathlib import Path
import difflib
import hashlib
import json
import subprocess

root = Path('/mnt/development/csgrs')
out = Path('/tmp/hyperbrep-spatial-controls')
out.mkdir(exist_ok=False)
source = root/'crates/hyperbrep/src/geometry/point.rs'
original = source.read_text()
relative = str(source.relative_to(root))
controls = [
    ('require-materialization', 'if parameter.compare(&Parameter::from_real(self.domain().start().clone()))?', 'if parameter.try_real().is_none() { return Err(GeometryError::UnrepresentableParameter); }\n            if parameter.compare(&Parameter::from_real(self.domain().start().clone()))?', 'public_evaluation_retains_selected_images_and_authored_coordinate_views'),
    ('ignore-z-coordinate', 'for axis in [Axis::X, Axis::Y, Axis::Z] {', 'for axis in [Axis::X, Axis::Y] {', 'independent_curves_compare_selected_images_and_preserve_tiny_separation'),
    ('discard-transform-selector', '.point_at(&image.parameter)', '.point_at(&Parameter::from_real(Real::zero()))', 'affine_transform_composition_keeps_selected_points_exact'),
    ('copy-y-bounds-to-z', 'xz.max_y().clone()', 'xy.max_y().clone()', 'retained_point_bounds_enclose_all_coordinates_including_constant_projections'),
]
records = []
try:
    for name, old, new, test in controls:
        assert original.count(old) == 1, (name, original.count(old))
        mutated = original.replace(old, new, 1)
        source.write_text(mutated)
        (out/(name+'.patch')).write_text(''.join(difflib.unified_diff(original.splitlines(True), mutated.splitlines(True), fromfile='a/'+relative, tofile='b/'+relative)))
        args = ['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','retained_points',test,'--','--exact']
        with (out/(name+'.log')).open('w') as log:
            result = subprocess.run(args,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        source.write_text(original)
        log = (out/(name+'.log')).read_text()
        record = {'name':name,'args':args,'exit_code':result.returncode,'source':relative,'retained_source_sha256':hashlib.sha256(original.encode()).hexdigest(),'mutated_source_sha256':hashlib.sha256(mutated.encode()).hexdigest(),'log':name+'.log','patch':name+'.patch'}
        records.append(record)
        assert result.returncode == 101, (name,log)
        assert 'test result: FAILED. 0 passed; 1 failed;' in log, (name,log)
        print(name+': focused test rejected mutant',flush=True)
finally:
    source.write_text(original)
    (out/'controls.json').write_text(json.dumps(records,indent=2)+'\n')
