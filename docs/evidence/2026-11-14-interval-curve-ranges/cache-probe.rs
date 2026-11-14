use hypercurve::{Point2,RationalBezier2,interval_ranges::prepare_rational_bezier_ranges};
use hyperreal::{Real,dispatch_trace};
use hypersolve::expression_program::ExpressionBudget;
fn main() {
 let n=257;
 let curve=RationalBezier2::try_new((0..=n).map(|i|Point2::new((Real::from(i)/Real::from(n)).unwrap(),Real::from(i32::from(i==n)))).collect(),vec![Real::one();n as usize+1]).unwrap();
 let t=(Real::one()/Real::from(2)).unwrap();
 for pass in 0..3 {
  if pass==2 {let prepared=prepare_rational_bezier_ranges(&curve,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap();std::hint::black_box(prepared);}
  dispatch_trace::reset();
  let point=dispatch_trace::with_recording(||curve.point_at(&t).unwrap());
  let trace=dispatch_trace::take_trace();
  println!("POINT{pass}={point:?}");println!("TRACE{pass}={trace:?}");
 }
}
