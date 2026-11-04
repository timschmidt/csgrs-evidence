use hypercurve::{PolynomialCurveSet2, RationalMap2, Real, Point2, Curve2};
use hypersolve::{BivariatePolynomial, bivariate_topology::{BivariateCurveDomain,decompose_bivariate_curve}};
fn p(rows:&[&[i32]])->BivariatePolynomial { BivariatePolynomial::new(rows.iter().map(|r|r.iter().copied().map(Real::from).collect()).collect()) }
fn curves(equation:BivariatePolynomial)->PolynomialCurveSet2 { PolynomialCurveSet2::from_topology(decompose_bivariate_curve(&equation,&BivariateCurveDomain {first:[(-2).into(),2.into()],second:[(-1).into(),2.into()]},Default::default()).unwrap(),Default::default()).unwrap() }
fn main(){
 let a=curves(p(&[&[0,1],&[],&[-1]]));
 let b=curves(p(&[&[-1,2]]));
 let image=a.curves()[0].rational_image(&RationalMap2::new([p(&[&[0,1],&[1]]),p(&[&[0,1]])],p(&[&[1]]))).unwrap();
 // The invertible shear (x,y)->(x+y,y) has two contacts with y=1/2:
 // source x=+-sqrt(1/2), world X=1/2+-sqrt(1/2). No poles occur.
 let half=(Real::one()/Real::from(2)).unwrap();
 let line=Curve2::try_line(Point2::new((-2).into(),half.clone()).into(),Point2::new(2.into(),half).into()).unwrap();
 for (label,other) in [("native_polynomial",&b.curves()[0]),("authored_line",&line)] {
 print!("{label}: ");
 match image.intersect_curve(other) {
  Ok(result)=>println!("complete={}, contacts={}, overlaps={}",result.is_complete(),result.contacts().len(),result.overlaps().len()),
  Err(error)=>println!("{error:?}"),
 }
 }
}
