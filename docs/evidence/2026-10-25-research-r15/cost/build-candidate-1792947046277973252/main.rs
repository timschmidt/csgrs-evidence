use hypercurve::{
    BezierParameter2, BezierParameterPolynomial, Curve2, CurvePath2, CurvePoint2,
    CurveRegion2, FillRule, LineSeg2, Point2, PredicatePolicy, RationalBezier2,
    Real, evaluate_under,
};
fn p(x: i32, y: i32) -> Point2 { Point2::from_values(x,y) }
fn main() {
    let source_parameter = BezierParameterPolynomial::try_new_power_basis(
        vec![-Real::one(), Real::zero(), Real::from(2)],
    ).unwrap().isolate_unit_interval_roots().unwrap().remove(0);
    assert!(matches!(source_parameter, BezierParameter2::Algebraic(_)));
    let point = |positive: bool, height: i32| {
        let curve = Curve2::from(RationalBezier2::try_new(
            vec![p(0,height),p(if positive {1} else {-1},height)],
            vec![Real::one();2],
        ).unwrap());
        curve.point_at(&source_parameter.clone().into()).unwrap()
    };
    let points: [CurvePoint2;4] = [point(false,0),point(true,0),point(true,1),point(false,1)];
    let path = CurvePath2::try_new((0..4).map(|i|Curve2::try_line(points[i].clone(),points[(i+1)%4].clone()).unwrap()).collect()).unwrap();
    let region = CurveRegion2::try_from_boundary_paths(&[path], FillRule::NonZero).unwrap();
    println!("region loops={} retained={}",region.len(),region.has_algebraic_fragments());
    let source=Curve2::from(LineSeg2::try_new(p(-1,0),p(1,0)).unwrap());
    let result=evaluate_under(PredicatePolicy::STRICT,|| source.trim_inside_region_with_parameters(&region));
    println!("certainty={:?}",result.certainty());
    let fragments=result.certified().unwrap().unwrap();
    println!("fragments={}",fragments.len());
    let [fragment]=fragments.as_slice() else {panic!("one interval")};
    let width=(Real::one()/Real::from(2)).unwrap().sqrt().unwrap();
    assert!(fragment.curve().start().coincides_with(&Point2::new(-width.clone(),Real::zero()).into()).unwrap());
    assert!(fragment.curve().end().coincides_with(&Point2::new(width,Real::zero()).into()).unwrap());
    for contact in fragment.start_boundary_contacts().iter().chain(fragment.end_boundary_contacts()) {
        println!("contact carrier={} fragment={} point={}",contact.carrier().carrier_index(),contact.carrier().fragment_index(),contact.point().is_some());
    }
}
