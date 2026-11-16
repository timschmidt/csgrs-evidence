fn main() -> Result<(), hyperspatial::Error> {
use hyperspatial::*;
let mut context = Context::new(PredicatePolicy::STRICT, Limits::default());
let ellipsoid = Ellipsoid::wgs84(&mut context)?;
let a = ellipsoid.equatorial_radius().as_metres();
let b = ellipsoid.polar_radius().as_metres();
let ratio = (a / b)?;
let parameter = Real::one() - &ratio * &ratio;
let quadrant = Length::metres(b * Real::elliptic_e_complete(&parameter)?);
let half_pi = (Real::pi() / Real::from(2))?;
let endpoint = half_pi.elliptic_e(&parameter)?;
assert!(quadrant.as_metres().certified_rational_interval(-64).is_some());
assert!(endpoint.certified_rational_interval(-128).is_some());
Ok::<(), hyperspatial::Error>(())
}
