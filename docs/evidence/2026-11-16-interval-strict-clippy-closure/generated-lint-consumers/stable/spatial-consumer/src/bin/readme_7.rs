fn main() -> Result<(), hyperspatial::Error> {
use hyperspatial::*;
let v = (Real::pi() / (Real::one() + Real::pi()))?;
let a = (&v / (Real::one() - &v * &v).sqrt()?)?;
let decoded = (&a / (Real::one() + &a * &a).sqrt()?)?;
assert_eq!((decoded - v).exact_rational_normal_form(), Real::zero().exact_rational());
Ok::<(), hyperspatial::Error>(())
}
