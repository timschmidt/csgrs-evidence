#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/edge_image_queries.rs"]
mod fixture;
use hyperbrep::Real;

fn main() {
    let e = Real::e();
    let sine = e.clone().sin();
    let cosine = e.clone().cos();
    let pythagorean = &sine * &sine + &cosine * &cosine - Real::one();
    let one = Real::one();
    let addition = (e.clone() + &one).sin()
        - e.clone().sin() * one.clone().cos()
        - e.cos() * one.sin();
    let rational_addition = Real::from(3).sin()
        - Real::one().sin() * Real::from(2).cos()
        - Real::one().cos() * Real::from(2).sin();
    for (name, phase) in [
        ("original_pythagorean", pythagorean),
        ("addition_e_one", addition),
        ("addition_one_two", rational_addition),
    ] {
        println!("{name}: exact_normal_form={:?}; zero_status={:?}",
            phase.exact_rational_normal_form(), phase.zero_status());
        let candidate = fixture::cylinder(Real::one(), phase, Real::tau());
        for policy in [hypercurve::PredicatePolicy::STRICT,
            hypercurve::PredicatePolicy::APPROXIMATE_512,
            hypercurve::PredicatePolicy::STRICT] {
            let result = hypercurve::evaluate_under(policy, || candidate.check());
            println!("{name}: policy={policy:?}, result={result:?}");
        }
    }
}
