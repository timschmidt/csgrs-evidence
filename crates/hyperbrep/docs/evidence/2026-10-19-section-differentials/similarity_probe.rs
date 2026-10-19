use hyperbrep::*;
use hypercurve::{PolynomialCurveSet2,RationalMap2,Similarity2};
use hypersolve::{BivariatePolynomial,AlgebraicFiberRootIsolationConfig};
use hypersolve::bivariate_topology::{BivariateCurveDomain,BivariateTopologyConfig,decompose_bivariate_curve};
fn q(n:i32,d:i32)->Real {(Real::from(n)/Real::from(d)).unwrap()}
fn p(rows:Vec<Vec<Real>>)->BivariatePolynomial {BivariatePolynomial::new(rows)}
fn cases()->[(&'static str,fn());1] {[("similarity_differentials",run_similarity_differentials)]}
fn run_similarity_differentials() {
 let f=p(vec![vec![q(7,16),(-1).into(),1.into()],vec![(-1).into()],vec![1.into()]]);
 let graph=decompose_bivariate_curve(&f,&BivariateCurveDomain{first:[0.into(),1.into()],second:[0.into(),1.into()]},BivariateTopologyConfig::default()).unwrap();
 let set=PolynomialCurveSet2::from_topology(graph,AlgebraicFiberRootIsolationConfig::default()).unwrap();
 assert_eq!(set.curves().len(),2);
 let map=RationalMap2::new([p(vec![vec![0.into()],vec![1.into()]]),p(vec![vec![0.into(),1.into()]])],p(vec![vec![1.into()],vec![1.into()]]));
 let turn=Similarity2::try_from_real_affine(0.into(),(-2).into(),2.into(),0.into(),7.into(),(-11).into()).unwrap();
 let shear=RationalMap2::new([p(vec![vec![0.into(),2.into()],vec![1.into()]]),p(vec![vec![0.into(),1.into()]])],p(vec![vec![1.into()]]));
 for (i,source) in set.curves().iter().enumerate() {
  let rotated=source.rational_image(&map).unwrap().transform_similarity(&turn).unwrap();
  assert!(rotated.polynomial_branch().unwrap().image_transform().is_some());
  let transformed=rotated.rational_image(&shear).unwrap();
  assert!(transformed.polynomial_branch().unwrap().image_transform().is_none());
  assert_eq!(transformed.polynomial_branch().unwrap().rational_maps().len(),3);
  for (name,curve,expected_x) in [
   ("rotated",rotated,if i==0 {[q(2,9),q(-152,27),q(304,27)]} else {[q(2,3),q(40,9),q(-80,9)]}),
   ("composed",transformed,if i==0 {[2.into(),(-8).into(),16.into()]} else {[q(22,9),q(56,27),q(-112,27)]}),
  ] {
   let expected_y=[q(8,9),q(-32,27),q(64,27)];
   let jets=curve.derivatives_at(&q(1,2).into(),3).unwrap();
   for k in 0..3 {
    assert!(jets[k].represented_coordinates().is_none());
    assert_eq!(jets[k].compare_linear_form(&1.into(),&0.into(),&expected_x[k]).unwrap(),std::cmp::Ordering::Equal);
    assert_eq!(jets[k].compare_linear_form(&0.into(),&1.into(),&expected_y[k]).unwrap(),std::cmp::Ordering::Equal);
   }
   let spatial=Curve3::planar_image(curve,Point3::origin(),Vector3::new([1.into(),0.into(),2.into()]),Vector3::new([0.into(),1.into(),3.into()])).unwrap();
   let mut builder=ModelBuilder::new();builder.curve(spatial.clone()).unwrap();let model=builder.finish().unwrap();let archive=model.to_json().unwrap();
   if let Some(dir)=std::env::var_os("HYPERBREP_SECTION_DIFFERENTIAL_ARTIFACT_DIR") {std::fs::create_dir_all(&dir).unwrap();std::fs::write(std::path::Path::new(&dir).join(format!("similarity-{name}-{i}.json")),&archive).unwrap();}
   let replay=RawModel::from_json(&archive,&ArchiveLimits::default()).unwrap().validate().unwrap();assert_eq!(replay.to_json().unwrap(),archive);
   for curve in [spatial,replay.curves().next().unwrap().geometry().clone()] {
    let frame=curve.planar_geometry().unwrap();let t:Parameter=((q(1,2)-frame.source_offset)/frame.source_scale).unwrap().into();
    let mut factor=Real::one();
    for k in 0..3 {factor*=frame.source_scale;let v=curve.derivative_at(&t,k+1).unwrap();assert_eq!(v.compare_coordinate(Axis::X,&(&expected_x[k]*&factor)).unwrap(),std::cmp::Ordering::Equal);assert_eq!(v.compare_coordinate(Axis::Y,&(&expected_y[k]*&factor)).unwrap(),std::cmp::Ordering::Equal);assert_eq!(v.compare_linear_form(&Vector3::new([(-2).into(),(-3).into(),1.into()]),&0.into()).unwrap(),std::cmp::Ordering::Equal);}
   }
  }
 }
}
