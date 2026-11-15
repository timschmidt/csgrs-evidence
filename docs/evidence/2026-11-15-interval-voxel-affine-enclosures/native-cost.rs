use hyperreal::{Real,Rational};
use hyperlattice::interval::hyperinterval::{DyadicBudget,DyadicInterval};
use hypervoxel::{CellBounds,ExactAffineTransform};
use std::{hint::black_box,time::Instant};
#[path="../../hyperlattice-interval/conformance/allocations.rs"]
mod allocations;
fn main() {
 for name in ["integer","rational","algebraic","undecided"] {
  let k=match name {"rational"=>Real::from(Rational::fraction(1,3).unwrap()),"algebraic"=>Real::from(2).sqrt().unwrap(),"undecided"=>(Real::e()+Real::one()).sin()-Real::e().sin()*Real::one().cos()-Real::e().cos()*Real::one().sin(),_=>Real::from(2)};
  let transform=ExactAffineTransform::new([[k.clone(),0.into(),0.into()],[0.into(),k.clone(),0.into()],[0.into(),0.into(),k]],[3.into(),0.into(),0.into()]);
  let source=CellBounds{min:[0.into(),0.into(),0.into()],max:[1.into(),1.into(),1.into()]};
  let run=||{let mut budget=DyadicBudget::new(16384,1_000_000_000_000);let result=transform.enclose_bounds(black_box(&source),-24,&mut budget).unwrap();black_box((result,1_000_000_000_000-budget.remaining_work()))};
  drop(run());let ((result,work),allocs,bytes)=allocations::measure(run);
  assert_eq!(result.source(),&source);
  let lanes=result.bounds().lanes().unwrap();
  let mut check=DyadicBudget::new(16384,1_000_000_000_000);
  let expected=match name {"integer"=>2,"rational"|"algebraic"=>0,_=>0};
  assert!(DyadicInterval::new(3.into(),(3+expected).into(),0).unwrap().subset_of(&lanes[0],&mut check).unwrap());
  assert!(lanes[0].subset_of(&DyadicInterval::new(2.into(),6.into(),0).unwrap(),&mut check).unwrap());
  println!("complete,{name},{allocs},{bytes},{work}");drop(result);
  for sample in 0..5 {let now=Instant::now();for _ in 0..128{drop(run());}println!("timing,{name},{sample},128,{}",now.elapsed().as_nanos());}
 }
}
