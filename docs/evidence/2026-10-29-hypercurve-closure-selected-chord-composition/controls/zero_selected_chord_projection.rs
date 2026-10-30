use hypercurve::{Curve2,CurvePath2,CurvePointDefinition2,CurveRegion2,SvgGeometry2,Real,export_svg_document};
use hypersolve::{BivariatePolynomial,IsolatedRootInterval};
fn p(rows:&[&[i32]]) -> BivariatePolynomial {BivariatePolynomial::new(rows.iter().map(|r|r.iter().copied().map(Real::from).collect()).collect())}
fn main() {
 let a=CurvePointDefinition2::PolynomialFiber {equation:p(&[&[-2,0,0,1]]),parameter:Real::zero().into(),root:IsolatedRootInterval {lower:1.into(),upper:2.into(),exact_root:None,distinct_root_count:1}}.into_point().unwrap();
 let epsilon=(0..10).fold((Real::one()/Real::from(2_u128.pow(100))).unwrap(),|v,_| &v* &((Real::one()/Real::from(2_u128.pow(100))).unwrap()));
 let b=CurvePointDefinition2::Similarity {source:a.clone(),transform:hypercurve::Similarity2::try_from_real_affine(1.into(),0.into(),0.into(),1.into(),epsilon.clone(),epsilon).unwrap()}.into_point().unwrap();
 let source=Curve2::try_line(a,b).unwrap();
 let export=|curve| export_svg_document(&SvgGeometry2::new(CurveRegion2::empty(),vec![],vec![CurvePath2::try_new(vec![curve]).unwrap()]));
 eprintln!("source export: {:?}",export(source.clone()).map(|s|s.len()));
 let point=CurvePointDefinition2::ChordDisplacement {source:source.clone(),origin:None,at_end:false,distance:Real::zero(),translation:[0.into(),0.into()],left_normal:true}.into_point().unwrap();
 let line=Curve2::try_line(point,source.end()).unwrap();
 eprintln!("zero displacement export: {:?}",export(line).map(|s|s.len()));
}
