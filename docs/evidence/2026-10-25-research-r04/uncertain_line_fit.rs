use hypercurve::{Real, Point2, Curve2, CurvePath2, CurveRegion2, CubicBezier2, QuadraticBezier2, FillRule, FiniteProjectionOptions};
fn p(x:i64,y:i64)->Point2 {Point2::from_values(x,y)}
fn main() {
 let a=Real::e();let b=Real::one();
 let z=(&a+&b).sin()-a.clone().sin()*b.clone().cos()-a.cos()*b.sin();
 let cap=CubicBezier2::new(p(0,0),p(0,2),p(2,2),p(2,0));
 let line=QuadraticBezier2::new(p(2,0),Point2::new(Real::one(),z),p(0,0));
 println!("line fit: {:?}",line.fit_exact_line_image());
 let path=CurvePath2::try_new(vec![Curve2::from(cap),Curve2::from(line)]).unwrap();
 let region=CurveRegion2::try_from_boundary_paths(&[path],FillRule::NonZero).unwrap();
 let options=FiniteProjectionOptions::try_new(1e-3).unwrap();
 println!("old finite path: {:?}",region.project_to_finite_profiles_exact(&options).map(|v|v.len()));
 let profiles=region.boundary_profiles().unwrap();
 println!("all-line query: {:?}",profiles[0].linear_contours().map(|v|v.is_some()));
 println!("new sampled path: {:?}",profiles[0].sample_to_linear_contours(&options).map(|_|true));
}
