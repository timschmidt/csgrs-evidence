use hypercurve::{BezierParameter2, BezierParameterRange2, Curve2, CurvePath2, FiniteProjectionOptions, Point2, QuadraticBezier2, Real};
fn q(n:i32,d:i32)->Real{(Real::from(n)/Real::from(d)).unwrap()}
fn main(){
 let source=QuadraticBezier2::new(Point2::new(0.into(),0.into()),Point2::new(q(1,2),0.into()),Point2::new(1.into(),0.into()));
 let curve=Curve2::try_analytic_parallel(source.parallel_left(q(1,4)).unwrap(),BezierParameterRange2::try_new(BezierParameter2::Exact(2.into()),BezierParameter2::Exact(3.into())).unwrap()).unwrap();
 let path=CurvePath2::try_new(vec![curve]).unwrap();
 let result=path.project_to_finite_polyline(&FiniteProjectionOptions::try_new(0.01).unwrap());
 println!("{result:?}");
 assert_eq!(result.unwrap().points(),&[[2.0,0.25],[3.0,0.25]]);
}
