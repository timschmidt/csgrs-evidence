use hypercurve::{CurvePath2,CurveRegion2,PolynomialCurveSet2,Real,SvgGeometry2,export_svg_document,import_svg_document};
use hypersolve::{BivariatePolynomial,bivariate_topology::{BivariateCurveDomain,decompose_bivariate_curve}};
fn main(){
 let destination=std::path::Path::new("/tmp/csgrs-r06-native-svg-seeds");std::fs::create_dir_all(destination).unwrap();
 let domain=BivariateCurveDomain{first:[(-2).into(),2.into()],second:[(-2).into(),2.into()]};
 for (name,rows) in [("column",vec![vec![],vec![1]]),("axes",vec![vec![],vec![0,1]]),("powers",vec![vec![],vec![],vec![0,0,0,1]]),("isolated",vec![vec![],vec![0,0,1],vec![],vec![1]])] {
  let equation=BivariatePolynomial::new(rows.into_iter().map(|r|r.into_iter().map(Real::from).collect()).collect());
  let set=PolynomialCurveSet2::from_topology(decompose_bivariate_curve(&equation,&domain,Default::default()).unwrap(),Default::default()).unwrap();
  for (index,curve) in set.curves().iter().enumerate(){
   let document=SvgGeometry2::new(CurveRegion2::empty(),vec![],vec![CurvePath2::try_new(vec![curve.clone().reversed().unwrap()]).unwrap()]);
   let text=export_svg_document(&document).unwrap();assert_eq!(export_svg_document(&import_svg_document(&text).unwrap()).unwrap(),text);
   assert!(text.len()<=16*1024);std::fs::write(destination.join(format!("{name}-{index}.svg")),text).unwrap();
  }
 }
}
