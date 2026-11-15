use hyperreal::{Rational, Real};
use hypersolve::real_interval::RealInterval;
use std::hint::black_box;
fn main() {
    for case in 0..12 {
        let (lower, upper, precision) = match black_box(case) {
            0 => (Real::from(2), Real::from(3), Some(-64)),
            1 => (Real::from(-1), Real::from(4), Some(-16)),
            2 => (Real::zero(), Real::zero(), Some(-8)),
            3 => (Real::from(-4), Real::from(-1), Some(-8)),
            4 => (Real::from(2), Real::from(3), Some(1)),
            5 => (Real::from(2), Real::from(3), None),
            6 => (Real::from(2).sqrt().unwrap(), Real::from(3).sqrt().unwrap(), Some(-32)),
            7 => (Real::from(Rational::fraction(1,3).unwrap()), Real::from(Rational::fraction(7,3).unwrap()), Some(-40)),
            8 => (Real::from(9), Real::from(16), Some(0)),
            9 => (Real::from(2), Real::from(3), Some(-512)),
            10 => (Real::from(Rational::fraction(9,4).unwrap()), Real::from(Rational::fraction(25,4).unwrap()), Some(-128)),
            _ => (Real::from(Rational::from_bigint(num_bigint::BigInt::from(1u8)<<512usize)), Real::from(Rational::from_bigint((num_bigint::BigInt::from(1u8)<<513usize)+3)), Some(-32)),
        };
        let result=black_box(RealInterval{lower,upper}).nonnegative_square_root(black_box(precision));
        let output=result.as_ref().map(|r|(&r.lower,&r.upper));
        let orders=result.as_ref().map(|r|[hyperlimit::PredicatePolicy::STRICT,hyperlimit::PredicatePolicy::APPROXIMATE_512].map(|policy|format!("{:?}",hyperlimit::compare_reals(&r.lower,&r.upper,policy))));
        println!("{}",serde_json::json!({"case":case,"output":output,"orders":orders}));
    }
}
