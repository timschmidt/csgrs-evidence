use hypercurve::{PredicatePolicy, LineSeg2, Point2, QuadraticBezier2, Real, WorkBudget, evaluate_with_budget};
fn main() {
 let source=LineSeg2::try_new(Point2::from_values(0,0),Point2::from_values(5,-3)).unwrap();
 let offset=source.offset_left((Real::one()/Real::from(2)).unwrap()).unwrap();
 let curve=QuadraticBezier2::from_line_segment(offset);
 let t=(Real::one()/Real::from(3).sqrt().unwrap()).unwrap();
 for budget in [WorkBudget::ZERO, WorkBudget {refinements:4096,promotions:128}] {
  let out=evaluate_with_budget(PredicatePolicy::STRICT,budget,||curve.split_at_exact(t.clone()));
  println!("usage={:?} exhausted={:?}",out.usage,out.result.as_ref().err());
 }
}
