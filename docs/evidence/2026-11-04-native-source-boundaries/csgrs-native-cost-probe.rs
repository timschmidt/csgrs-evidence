pub use synaps_cad::compiler;
mod old { include!("/tmp/csgrs-native-cost-old.rs"); }
use std::{hint::black_box,time::Instant};
#[allow(dead_code)]
struct OldLayout {
 positions:Vec<[f32;3]>, normals:Vec<[f32;3]>, indices:Vec<u32>,color:Option<[f32;3]>,part:usize,evidence:compiler::PartEvidence,
}
fn main(){
 eprintln!("layout old={} new={} native={}",std::mem::size_of::<OldLayout>(),std::mem::size_of::<compiler::MeshData>(),std::mem::size_of::<csgrs::TriangleMesh>());
 for (name,code) in [
  ("cube","cube(10);"),
  ("sphere-24","sphere(r=8,$fn=24);"),
  ("drilled","difference(){cube([12,12,8]);translate([3,3,-1])cube([6,6,10]);}"),
  ("rotated-cylinder","rotate([0,45,0]) cylinder(h=40,r=8,$fn=8);"),
 ] {
  let parsed=openscad_rs::parse(code).unwrap();let mut eval=compiler::Evaluator::new();let mut parts=eval.eval_source_file(&parsed);assert_eq!(parts.len(),1);let mesh=parts.remove(0).0.try_into_triangle_mesh().unwrap();
  let before=old::triangle_mesh_to_mesh_data(&mesh).unwrap();let after=compiler::geometry::conversions::triangle_mesh_to_mesh_data(&mesh).unwrap();
  assert_eq!(before.positions.len(),after.positions.len());
  let mut changed_positions=0;let mut max_position_delta=0.0_f32;
  for (a,b) in before.positions.iter().flatten().zip(after.positions.iter().flatten()) {
   assert!(a.is_finite()&&b.is_finite());changed_positions+=usize::from(a.to_bits()!=b.to_bits());max_position_delta=max_position_delta.max((a-b).abs());
  }
  eprintln!("fixture={name} changed_position_components={changed_positions} max_position_delta={max_position_delta}");assert_eq!(before.indices,after.indices);assert_eq!(before.evidence,after.evidence);assert_eq!(before.source.positions,after.source.positions);
  let mut changed=0;let mut max_delta=0.0_f32;
  for (a,b) in before.normals.iter().flatten().zip(after.normals.iter().flatten()){ assert!(a.is_finite()&&b.is_finite());changed+=usize::from(a.to_bits()!=b.to_bits());max_delta=max_delta.max((a-b).abs()); }
  eprintln!("fixture={name} triangles={} changed_normal_components={changed} max_normal_delta={max_delta}",mesh.triangles.len());
  for _ in 0..2{black_box(old::triangle_mesh_to_mesh_data(&mesh).unwrap());black_box(compiler::geometry::conversions::triangle_mesh_to_mesh_data(&mesh).unwrap());}
  for pair in 0..20 {for new in if pair%2==0{[false,true]}else{[true,false]} {
   let now=Instant::now();let output=if new {compiler::geometry::conversions::triangle_mesh_to_mesh_data(&mesh)}else{old::triangle_mesh_to_mesh_data(&mesh)}.unwrap();black_box(output);
   println!("{name}\t{pair}\t{}\t{}",if new{"native"}else{"float-shim"},now.elapsed().as_nanos());
  }}
 }
}
