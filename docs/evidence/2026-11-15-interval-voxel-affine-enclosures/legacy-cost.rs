use hyperreal::{Real, Rational};
use hypervoxel::{CellBounds, ExactAffineTransform};
use std::{hint::black_box,time::Instant};
#[path="../../hyperlattice-interval/conformance/allocations.rs"]
mod allocations;
fn main() {
 for name in ["integer","rational","algebraic"] {
  let k=match name {"rational"=>Real::from(Rational::fraction(1,3).unwrap()),"algebraic"=>Real::from(2).sqrt().unwrap(),_=>Real::from(2)};
  let transform=ExactAffineTransform::new([[k.clone(),0.into(),0.into()],[0.into(),k.clone(),0.into()],[0.into(),0.into(),k.clone()]],[Real::from(3),Real::from(0),Real::from(0)]);
  let source=CellBounds{min:[0.into(),0.into(),0.into()],max:[1.into(),1.into(),1.into()]};
  let run=||black_box(transform.map_bounds(black_box(&source)).unwrap());
  drop(run());
  let (output,allocs,bytes)=allocations::measure(run);
  assert_eq!(output.min,[Real::from(3),Real::from(0),Real::from(0)]);
  assert_eq!(output.max,[Real::from(3)+k.clone(),k.clone(),k]);
  println!("complete,{name},{allocs},{bytes}");drop(output);
  for sample in 0..5 {let now=Instant::now();for _ in 0..4096 {drop(run());}println!("timing,{name},{sample},4096,{}",now.elapsed().as_nanos());}
 }
}
