"""Retain the full elevated-tensor Boolean target alongside the layer regression.
Run only after the serial final campaign has finished. Restore the exact test
source even on failure; this probe never qualifies an unsupported result.
"""
from pathlib import Path
import subprocess
p=Path('crates/hyperbrep/src/boolean_kernel.rs');s=p.read_text()
a=s.index('    fn selected_flat_tensor_trims_keep_their_surface_parameterization()')
b=s.index('\n    #[test]',a);part=s[a:b]
needle='        let mut builder = ArenaModelBuilder::new();'
assert part.count(needle)==1
probe='''        let (container, container_solid) = crate::construction::cuboid(p(-1,-1,-1),p(2,2,2)).unwrap();
        let solid = model.solids().next().unwrap().0;
        let graph = intersection_graph(&model,solid,&container,container_solid).unwrap();
        graph.stitch_selected_faces(BooleanOperation::Intersection).unwrap();
'''
log=Path('/tmp/hyperbrep-selected-spline-full-graph-first.log')
try:
 p.write_text(s[:a]+part.replace(needle,probe+needle)+s[b:])
 with log.open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--lib','boolean_kernel::tests::selected_flat_tensor_trims_keep_their_surface_parameterization','--','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
 print('full elevated-tensor Boolean probe status',r.returncode)
finally:
 p.write_text(s)
assert p.read_text()==s
