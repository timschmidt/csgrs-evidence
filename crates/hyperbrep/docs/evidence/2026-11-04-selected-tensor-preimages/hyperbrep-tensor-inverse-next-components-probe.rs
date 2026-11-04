use hypercurve::{Curve2,CurveParameter2,CurvePoint2,Point2,NurbsCurve2,RationalMap2,Real};
use hypersolve::BivariatePolynomial;
fn p(rows:Vec<Vec<i32>>)->BivariatePolynomial {BivariatePolynomial::new(rows.into_iter().map(|r|r.into_iter().map(Real::from).collect()).collect())}
fn main() {
 let alpha:CurveParameter2=hypercurve::BezierParameterPolynomial::try_new_power_basis([-1,1,0,0,0,1].map(Real::from).to_vec()).unwrap().isolate_unit_interval_roots().unwrap()[0].clone().into();
 let seed=Curve2::from(hypercurve::LineSeg2::try_new(Point2::from_values(0,0),Point2::from_values(1,0)).unwrap());
 let zero:CurvePoint2=seed.point_at(&alpha).unwrap().rational_image(&RationalMap2::new([p(vec![]),p(vec![])],p(vec![vec![1]]))).unwrap();assert!(zero.coordinates().is_none());
 let source=Curve2::from(NurbsCurve2::try_new(1,vec![Point2::from_values(0,0),Point2::from_values(0,0),Point2::from_values(1,0),Point2::from_values(-1,0)],vec![Real::one();4],vec![0.into(),0.into(),1.into(),2.into(),3.into(),3.into()]).unwrap());
 let identity=RationalMap2::new([p(vec![vec![],vec![1]]),p(vec![vec![0,1]])],p(vec![vec![1]]));
 // The authored degree-one controls/knots prove C(t)=0 for 0<=t<=1,
 // C(t)=(t-1,0) for 1<=t<=2, and C(t)=(5-2t,0) for 2<=t<=3.
 // Its complete preimage of zero is [0,1] union {5/2}.
 let result=source.rational_image_point_locations(&identity,&zero);
 println!("independent exact expectation: [0,1] union {{5/2}}");println!("actual query result: {result:?}");
 assert!(matches!(result,Err(hypercurve::ExactCurveError::Blocked(b)) if b.reason()==hypercurve::UncertaintyReason::Unsupported));
}
