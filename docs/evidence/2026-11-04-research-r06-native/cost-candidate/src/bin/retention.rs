include!("/tmp/csgrs-r06-cost-allocator.rs");
#[path="/tmp/csgrs-r06-native-cost-cases.rs"] mod cases;
fn main(){
 let mut reports=Vec::with_capacity(12);
 for cycle in 0..3 { for name in ["circle","cusp","circle-algebraic-columns"] {
  if name=="circle-algebraic-columns" && !cfg!(feature="candidate") { continue; }
  let start=LIVE.load(Ordering::Relaxed);
  let inputs=cases::cases();let case=inputs.iter().find(|c|c.name==name).unwrap();
  let input_bytes=LIVE.load(Ordering::Relaxed) as i128-start as i128;
  for _ in 0..20{let receipt=std::hint::black_box(cases::run(case));std::hint::black_box(&receipt.row);drop(receipt);}
  let after_20=LIVE.load(Ordering::Relaxed) as i128-start as i128;
  for _ in 20..100{let receipt=std::hint::black_box(cases::run(case));std::hint::black_box(&receipt.row);drop(receipt);}
  let after_100=LIVE.load(Ordering::Relaxed) as i128-start as i128;
  drop(inputs);let after_source_drop=LIVE.load(Ordering::Relaxed) as i128-start as i128;
  reports.push((cycle,name,input_bytes,after_20,after_100,after_source_drop));
 }}
 for r in reports{println!("{}\t{}\t{}\t{}\t{}\t{}",r.0,r.1,r.2,r.3,r.4,r.5);}
}
