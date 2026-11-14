use hypercurve::{Point2,RationalBezier2,PredicatePolicy,evaluate_under,CurveCertainty,interval_ranges::prepare_rational_bezier_ranges};
use hyperreal::{Real,dispatch_trace};
use hypersolve::expression_program::ExpressionBudget;
fn main() {
 for policy in [PredicatePolicy::STRICT,PredicatePolicy::APPROXIMATE_512] {
  for recorded_warm in [false,true] {
   for shared_one in [false,true] {
    let n=257;
    let one=if shared_one {Real::one()}else{Real::from(1)};
    let curve=RationalBezier2::try_new((0..=n).map(|i|Point2::new((Real::from(i)/Real::from(n)).unwrap(),Real::from(i32::from(i==n)))).collect(),vec![one.clone();n as usize+1]).unwrap();
    let t=(Real::from(1)/Real::from(2)).unwrap();
    let evaluate=|| {let o=evaluate_under(policy,||curve.point_at(&t));assert_eq!(o.certainty(),CurveCertainty::Certified);o.certified().unwrap().unwrap()};
    let warm=if recorded_warm {dispatch_trace::with_recording(evaluate)}else{evaluate()};
    dispatch_trace::reset();let expected=dispatch_trace::with_recording(evaluate);let baseline=dispatch_trace::take_trace();assert_eq!(expected,warm);
    let prepared=prepare_rational_bezier_ranges(&curve,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap();std::hint::black_box(prepared);
    dispatch_trace::reset();let actual=dispatch_trace::with_recording(evaluate);let after=dispatch_trace::take_trace();assert_eq!(expected,actual);
    println!("policy={policy:?} recorded_warm={recorded_warm} shared_one={shared_one} before={} after={} equal={}",baseline.rational.temporary_rationals,after.rational.temporary_rationals,baseline==after);
    assert_eq!(baseline,after);
   }
  }
 }
}
