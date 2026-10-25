
#[cfg(test)]
mod r14_prepared_point_acceptance {
    use super::*;
    #[test]
    fn positive_scaling_preserves_all_point_signs_and_owned_coefficients() {
        let fraction=|n:i64,d:i64|(Real::from(n)/Real::from(d)).unwrap();
        let points=[fraction(-13,7),fraction(-3,2),fraction(-1,3),Real::zero(),fraction(1,13),fraction(1,3),fraction(1,2),fraction(2,3),Real::one(),fraction(9,7),fraction(13,3)];
        let mut signs=[0_usize;3];
        for degree in 0..=7_i64 {
            for salt in 0..24_i64 {
                let source=(0..=degree).map(|i| if (i+salt)%5==0 {Real::zero()} else {fraction((7*i+5*salt+3)%13-6,(i+salt)%7+1)}).collect::<Vec<_>>();
                for scale in [1,-1,13] {
                    let coefficients=source.iter().map(|c| c*Real::from(scale)).collect::<Vec<_>>();
                    let prepared=IntegerPolynomial::new(&coefficients).unwrap();
                    let expected=points.iter().map(|x|real_sign(&Real::eval_poly(&coefficients,x),&CurveContext::STRICT)).collect::<Vec<_>>();
                    drop(coefficients);
                    for (point,expected) in points.iter().zip(expected) {
                        let actual=prepared.sign_at(point);
                        assert_eq!(actual,expected,"degree={degree} salt={salt} scale={scale}");
                        signs[match actual.unwrap(){RealSign::Negative=>0,RealSign::Zero=>1,RealSign::Positive=>2}]+=1;
                        assert_eq!(prepared.sign_at(point),actual);
                    }
                }
            }
        }
        assert!(signs.iter().all(|n|*n>0));
        assert!(IntegerPolynomial::new(&[]).is_none());
        assert!(IntegerPolynomial::new(&[Real::e(),Real::one()]).is_none());
        assert!(IntegerPolynomial::new(&[Real::one()]).unwrap().sign_at(&Real::from(2).sqrt().unwrap()).is_none());
    }
}
