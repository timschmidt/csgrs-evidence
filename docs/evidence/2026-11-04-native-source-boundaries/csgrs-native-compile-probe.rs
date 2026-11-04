use std::time::Instant;
fn main(){ for run in 0..3 {
 let start=Instant::now();
 match synaps_cad::compiler::compile_scad_code(synaps_cad::compiler::DEFAULT_SCAD_CODE,0,None) {
  synaps_cad::compiler::CompilationResult::Success{parts,failed_parts,views,warnings} => {
   eprintln!("run={run} elapsed_ms={} parts={} triangles={} failed={} views={} warnings={:?}", start.elapsed().as_millis(),parts.len(),parts.iter().map(|p|p.source.triangles.len()).sum::<usize>(),failed_parts.len(),views.len(),warnings);
   for failed in &failed_parts{eprintln!("{}",failed.summary());}
   assert!(failed_parts.is_empty());assert!(!parts.is_empty());
  },other=>panic!("unexpected {other:?}")
 }
}}
