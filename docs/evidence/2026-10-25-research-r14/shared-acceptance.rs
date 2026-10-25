
#[cfg(test)]
mod r14_preparation_acceptance {
    use super::*;

    fn fraction(n: i64, d: i64) -> Real {
        (Real::from(n) / Real::from(d)).unwrap()
    }

    #[test]
    fn midpoint_roots_declines_and_nonrational_fallbacks() {
        let linear = vec![Real::from(-1), Real::from(2)];
        let cases = [
            (vec![Real::zero()], linear.clone(), Real::zero(), Real::one(), Some(RealSign::Zero)),
            (vec![Real::from(3), Real::zero(), Real::zero()], linear.clone(), Real::zero(), Real::one(), Some(RealSign::Positive)),
            (vec![Real::from(-3)], linear.clone(), Real::zero(), Real::one(), Some(RealSign::Negative)),
            (linear.clone(), linear.clone(), Real::zero(), Real::one(), Some(RealSign::Zero)),
            (vec![Real::one()], linear.clone(), fraction(1,2), fraction(1,2), None),
            (vec![Real::one()], linear.clone(), fraction(1,4), fraction(1,4), None),
            (vec![Real::one()], linear.clone(), Real::zero(), fraction(1,4), None),
            (vec![Real::one()], linear.clone(), fraction(1,2), Real::one(), None),
            (vec![Real::one()], vec![Real::from(-2),Real::zero(),Real::one()], Real::one(), Real::from(2), Some(RealSign::Positive)),
            (vec![Real::zero(),Real::one()], vec![Real::one(),Real::from(3)], Real::from(-1), Real::zero(), Some(RealSign::Negative)),
            (vec![Real::zero(),Real::one()], linear.clone(), fraction(-3,2), fraction(5,3), Some(RealSign::Positive)),
            (vec![Real::one()], vec![-Real::e(),Real::one()], Real::from(2), Real::from(3), Some(RealSign::Positive)),
            (vec![Real::one()], vec![Real::from(-1),Real::one()], Real::zero(), Real::from(2).sqrt().unwrap(), Some(RealSign::Positive)),
            (vec![-Real::e(),Real::one()], linear, Real::zero(), Real::one(), Some(RealSign::Negative)),
        ];
        for (index,(filter,defining,start,end,expected)) in cases.into_iter().enumerate() {
            let interval=BezierParameterInterval{start,end};
            for policy in [CurveContext::STRICT,CurveContext::APPROXIMATE_512,CurveContext::STRICT] {
                for _ in 0..2 {
                    let actual=coprime_filter_sign_by_bisection(&filter,&defining,&interval,&policy).unwrap();
                    assert_eq!(actual,expected,"case {index}");
                }
            }
        }
    }

    fn parse_rational(text: &str) -> Real {
        let (n,d)=text.split_once('/').unwrap_or((text,"1"));
        (n.parse::<Real>().unwrap()/d.parse::<Real>().unwrap()).unwrap()
    }

    #[test]
    fn captured_leaf_outcomes() {
        let directory=std::env::var("R14_LEAF_DIRECTORY").unwrap();
        for name in ["leaf_0000.txt","leaf_0004.txt"] {
            let text=std::fs::read_to_string(std::path::Path::new(&directory).join(name)).unwrap();
            let lines=text.lines().collect::<Vec<_>>();
            let a=lines.iter().position(|line| *line=="filter").unwrap();
            let b=lines.iter().position(|line| *line=="defining").unwrap();
            let filter=lines[a+1..b].iter().map(|line|parse_rational(line)).collect::<Vec<_>>();
            let defining=lines[b+1..].iter().filter(|line|!line.is_empty()).map(|line|parse_rational(line)).collect::<Vec<_>>();
            let endpoints=lines.iter().find_map(|line|line.strip_prefix("interval ")).unwrap().split_whitespace().map(parse_rational).collect::<Vec<_>>();
            let interval=BezierParameterInterval{start:endpoints[0].clone(),end:endpoints[1].clone()};
            let start=std::time::Instant::now();
            let actual=coprime_filter_sign_by_bisection(&filter,&defining,&interval,&CurveContext::STRICT).unwrap();
            println!("R14_PILOT leaf={name} decision={actual:?} elapsed_ns={}",start.elapsed().as_nanos());
            assert_eq!(actual,if name=="leaf_0000.txt" {Some(RealSign::Positive)} else {None});
        }
    }
}
