fn main() -> Result<(), hyperspatial::Error> {
use hyperlattice::Complex;
use hyperspatial::*;
let value = Complex::new("0.5".parse()?, "0.5".parse()?).atanh()?;
// Compare mathematical values with certified bounds; Real equality is structural.
let expected = (Real::from(5).ln()? / Real::from(4))?;
let [lo, hi] = (value.re.clone() - expected).certified_rational_interval(-160).unwrap();
let bound = "1e-35".parse::<Real>()?.exact_rational().unwrap();
assert!(lo >= -bound.clone() && hi <= bound);
assert_eq!(value.im, (Real::from(2).atan()? / Real::from(2))?);
let mut context = Context::new(PredicatePolicy::STRICT, Limits::default());
let axis = &value.re * &value.re + Real::from(2);
let ellipsoid = Ellipsoid::from_axes(
    Length::metres(axis), Length::metres(Real::one()), &mut context,
)?;
assert_eq!(ellipsoid.receipt().certainty(), Certainty::Exact);
Ok::<(), hyperspatial::Error>(())
}
