use synaps_cad::compiler::{Evaluator,geometry::Shape};
fn main() {
 let code="difference() { cylinder(h=40,r=8,$fn=8); rotate([0,0.000001,0]) cylinder(h=40,r=8,$fn=8); }";
 let file=openscad_rs::parse(code).unwrap();
 let mut eval=Evaluator::new();let shapes=eval.eval_source_file(&file);
 for (shape,_) in shapes {
  let Shape::TriangleMesh3D(mesh)=shape else {panic!("expected exact mesh")};
  eprintln!("triangles={} app={:?}",mesh.triangles.len(),synaps_cad::compiler::geometry::conversions::triangle_mesh_to_mesh_data(&mesh).err());
  for (i,t) in mesh.triangles.iter().enumerate(){
   let [a,b,c]=t.indices().map(|index|mesh.positions[index].to_f32_array_lossy().unwrap());
   let sub=|b:[f32;3],a:[f32;3]|[b[0]-a[0],b[1]-a[1],b[2]-a[2]];
   let u=sub(b,a);let v=sub(c,a);let n=[u[1].mul_add(v[2],-(u[2]*v[1])),u[2].mul_add(v[0],-(u[0]*v[2])),u[0].mul_add(v[1],-(u[1]*v[0]))];
   let sq=n[0].mul_add(n[0],n[1].mul_add(n[1],n[2]*n[2]));
   if !(sq>0.0&&sq.is_finite()) {eprintln!("triangle={i} projected={:?} {:?} {:?} n={n:?} sq={sq:?} pair_equal={:?}",a,b,c,[a==b,a==c,b==c]);}
  }
  match mesh.try_to_gpu_mesh_f32(){ Ok(gpu)=>eprintln!("native GPU success positions={} normals={} indices={}",gpu.positions.len(),gpu.normals.len(),gpu.indices.len()),Err(e)=>eprintln!("native GPU error={e:?}") }
 }
}
