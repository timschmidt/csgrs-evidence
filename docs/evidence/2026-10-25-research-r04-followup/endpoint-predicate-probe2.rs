use csgrs::curve;
use hypercurve::{FiniteProjectionOptions, OffsetCornerStyle2, BooleanOp};
use hyperlimit::{PredicatePolicy,Sign};
use hyperreal::Real;
#[test]
fn repeated_native_endpoint_is_a_zero_determinant() {
    let polygon=curve::circle(Real::from(15),40).unwrap();
    let outer=polygon.offset(Real::one(),&OffsetCornerStyle2::Round).unwrap();
    let inner=polygon.offset(Real::from(-1),&OffsetCornerStyle2::Round).unwrap();
    let wall=outer.boolean_region(&inner,BooleanOp::Difference).unwrap();
    let profiles=wall.boundary_profiles().unwrap();
    let (material,holes)=profiles[0].sample_to_linear_contours(&FiniteProjectionOptions::try_new(1e-3).unwrap()).unwrap();
    let native = |p: &hypercurve::Point2| hyperlimit::Point2::new(p.x().clone(),p.y().clone());
    let a = &native(material.segments()[0].start());
    let mut misses=0;
    for i in 0..holes[0].segments().len() {
        let b=&native(holes[0].segments()[i].start());
        let c=&native(holes[0].segments()[(i+1)%holes[0].segments().len()].start());
        let signs=[hyperlimit::orient2(a,b,c,PredicatePolicy::STRICT),hyperlimit::orient2(a,b,b,PredicatePolicy::STRICT),hyperlimit::orient2(c,b,a,PredicatePolicy::STRICT),hyperlimit::orient2(c,b,b,PredicatePolicy::STRICT)];
        eprintln!("R04_ENDPOINT {i} same={} signs={signs:?} relation={:?}",b==&b.clone(),hyperlimit::classify_segment_intersection(a,b,c,b,PredicatePolicy::STRICT));
        for sign in [signs[1],signs[3]] {if sign.value()!=Some(Sign::Zero){misses+=1;}}
    }
    assert_eq!(misses,0);
}
