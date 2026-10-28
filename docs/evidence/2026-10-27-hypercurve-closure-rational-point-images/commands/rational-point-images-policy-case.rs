
#[cfg(test)]
mod tests {
    use super::*;
    use crate::{Axis2, BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval, BezierParameterPolynomial, CurveCertainty, Real};
    use std::cmp::Ordering;

    fn source() -> CurvePoint2 {
        let alpha=BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(vec![(-1).into(),0.into(),0.into(),0.into(),0.into(),0.into(),0.into(),2.into()]).unwrap(),
            BezierParameterInterval::try_new((Real::from(3)/Real::from(4)).unwrap(),1.into()).unwrap(),
        ).unwrap();
        crate::CurveParameter2::from(BezierParameter2::Algebraic(alpha))
            .affine_point(1.into(),0.into(),0.into(),0.into()).unwrap()
    }
    fn identity() -> RationalMap2 {
        RationalMap2::new([
            BivariatePolynomial::new(vec![vec![0.into()],vec![1.into()]]),
            BivariatePolynomial::new(vec![vec![0.into(),1.into()]]),
        ],BivariatePolynomial::new(vec![vec![1.into()]]))
    }
    #[test]
    fn rational_point_images_retain_qualification_through_identity_queries() {
        let source=source();
        // A synthetic already-qualified dependency exercises provenance even
        // when the local map and consumed equality are exact identities.
        let qualified=CurvePoint2(CurvePointData2::RationalImage(std::sync::Arc::new(RationalPointImage2 {
            source:source.clone(),map:identity(),policy:CurveContext::APPROXIMATE_512,
        })));
        assert!(qualified.definition().is_err());
        for query in [
            qualified.coincides_with_with_policy(&qualified,&CurveContext::STRICT).map(|v|v.map(|_|())),
            qualified.compare_coordinate_with_policy(&qualified,Axis2::X,&CurveContext::STRICT).unwrap().map(|v|v.map(|_|())),
        ] {
            assert!(matches!(query.into_value(),Classification::Uncertain(UncertaintyReason::Unsupported)));
        }
        let exact=crate::provisional(||source.rational_image(&identity()).unwrap()).into_value();
        assert!(exact.definition().is_ok());
        let approved=qualified.compare_coordinate_with_policy(&qualified,Axis2::X,&CurveContext::APPROXIMATE_512).unwrap();
        assert_eq!(approved.value,Classification::Decided(Ordering::Equal));
        assert_eq!(approved.certainty,CurveCertainty::Approximate512Consumed);
        let fresh=exact.compare_coordinate_with_policy(&exact,Axis2::X,&CurveContext::APPROXIMATE_512).unwrap();
        assert_eq!(fresh.certainty,CurveCertainty::Certified);
    }
}
