use hyperbrep::*;
use hypercurve::{Curve2, CurveParameter2, NurbsCurve2, Point2 as Uv, RationalMap2};
use hypersolve::BivariatePolynomial;
fn q(n:i64,d:i64)->Real {(Real::from(n)/Real::from(d)).unwrap()}
fn p(rows:Vec<Vec<i32>>)->BivariatePolynomial {BivariatePolynomial::new(rows.into_iter().map(|r|r.into_iter().map(Real::from).collect()).collect())}
fn main() {
    let tensor=Surface::rational_bezier(vec![
        vec![Point3::origin(),Point3::new(1.into(),0.into(),0.into())],
        vec![Point3::new(0.into(),1.into(),0.into()),Point3::new(1.into(),1.into(),0.into())],
    ],vec![vec![Real::one();2];2]).unwrap();
    let source=Curve2::from(NurbsCurve2::try_new(1,
        vec![Uv::from_values(0,0),Uv::from_values(0,0),Uv::from_values(1,0),Uv::from_values(0,0)],
        vec![Real::one();4],vec![0.into(),0.into(),1.into(),2.into(),3.into(),3.into()]).unwrap());
    // In the spatial unit chart x(s)=0 on [0,1/3], 3s-1 on
    // [1/3,2/3], and 3-3s on [2/3,1]. Other coordinates vanish.
    let curve=Curve3::tensor_image(tensor,source).unwrap();
    let selector=Curve3::rational_bezier([-5,-7,-9,-11,-13,145].map(|n|Point3::new(q(n,5),0.into(),0.into())).to_vec(),vec![Real::one();6]).unwrap();
    let CurveParameterLocation::Parameters(roots)=selector.parameters_of(Point3::origin()).unwrap() else {panic!("selected root")};
    let query=selector.point_at(&roots[0]).unwrap();assert!(query.try_coordinates().is_none());
    let actual=curve.parameters_of(&query);
    println!("Exact proper spatial expectation [0,1/3] union {{1}}; actual {actual:?}");
    assert!(matches!(actual,Err(GeometryError::UnsupportedParameterLocation)));
    // The unit-abscissa branch y=sqrt(x) is nonrational; the original
    // denominator x-1/2 excludes precisely its parameter 1/2 after cancellation.
    let topology=hypersolve::bivariate_topology::decompose_bivariate_curve(
        &p(vec![vec![0,0,1],vec![-1]]),
        &hypersolve::bivariate_topology::BivariateCurveDomain {first:[0.into(),1.into()],second:[0.into(),1.into()]},
        hypersolve::bivariate_topology::BivariateTopologyConfig::default()).unwrap();
    let set=hypercurve::PolynomialCurveSet2::from_topology(topology,hypersolve::AlgebraicFiberRootIsolationConfig::default()).unwrap();
    assert_eq!(set.curves().len(),1);
    let branch=&set.curves()[0];
    let a:CurveParameter2=hypercurve::BezierParameterPolynomial::try_new_power_basis([-1,1,0,0,0,1].map(Real::from).to_vec()).unwrap().isolate_unit_interval_roots().unwrap()[0].clone().into();
    let independent=Curve2::from(hypercurve::LineSeg2::try_new(Uv::from_values(0,0),Uv::from_values(1,0)).unwrap()).point_at(&a).unwrap();
    let query=independent.rational_image(&RationalMap2::new([p(vec![vec![2]]),p(vec![vec![3]])],p(vec![vec![1]]))).unwrap();
    let map=RationalMap2::new([p(vec![vec![-2],vec![4]]),p(vec![vec![-3],vec![6]])],p(vec![vec![-1],vec![2]]));
    let actual=branch.rational_image_point_locations(&map,&query);
    println!("Exact selected implicit expectation [0,1/2) union (1/2,1]; actual {actual:?}");
    assert!(matches!(actual,Err(hypercurve::ExactCurveError::Blocked(b)) if b.reason()==hypercurve::UncertaintyReason::Unsupported));
}
