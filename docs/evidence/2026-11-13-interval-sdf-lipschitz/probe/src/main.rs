mod allocations;
use std::{hint::black_box,time::Instant};
use hyperreal::Real;
use hyperlattice::{Matrix4,Vector3};
use hyperlimit::{Point3,PredicatePolicy,compare_reals};
use hypersdf::{Sdf,SdfExpr};
fn point(x:i32,y:i32,z:i32)->Point3 {Point3::new(x.into(),y.into(),z.into())}
fn measure<T>(name:&str,mut run:impl FnMut()->T) {
    for _ in 0..8 {drop(black_box(run()));}
    let s=allocations::measure(32,&mut run);
    println!("ALLOC|{name}|{}|{}|{}|{}|{}|{}",s.allocations,s.deallocations,s.reallocations,s.allocated_bytes,s.peak_live_bytes,s.live_bytes);
    assert_eq!(s.live_bytes,0);
    for repeat in 0..5 {
        let start=Instant::now();for _ in 0..128 {drop(black_box(run()));}
        println!("TIME|{name}|{repeat}|128|{}",start.elapsed().as_nanos());
    }
}
fn main(){
 let lo=point(0,0,0);let hi=point(2,3,0);
 let mut shrink=Matrix4::identity();shrink.0[0][0]=(Real::one()/Real::from(2)).unwrap();
 let mut shear=Matrix4::identity();shear.0[0][1]=2.into();
 for (name,expr,minimum) in [
 ("linear",SdfExpr::linear(Vector3([3.into(),4.into(),0.into()]),0.into()),Real::from(5)),
 ("arithmetic",SdfExpr::x().mul_expr(SdfExpr::y()),Real::zero()),
 ("translated",SdfExpr::linear(Vector3([3.into(),4.into(),0.into()]),0.into()).translate(point(1,2,3)),Real::from(5)),
 ("affine-scale",SdfExpr::x().affine_transform(shrink).unwrap(),Real::from(2)),
 ("affine-shear",SdfExpr::x().affine_transform(shear).unwrap(),Real::from(5).sqrt().unwrap())
 ] {
  let sdf=Sdf::new(expr);let report=sdf.lipschitz_cell(&lo,&hi);assert!(report.is_certified());
  let status=match compare_reals(report.bound.as_ref().unwrap(),&minimum,PredicatePolicy::STRICT).value(){Some(std::cmp::Ordering::Less)=>"incorrect",Some(_)=>"certified-bound",None=>"undecided-check"};
  println!("ROW|{name}|status={status}|report={report:?}");
  measure(name,||sdf.lipschitz_cell(&lo,&hi));
 }
}
