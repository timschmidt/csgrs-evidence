fn main() -> Result<(), hyperspatial::Error> {
use hyperlattice::Complex;
use hyperspatial::Real;

let parameter: Real = "0.5".parse()?;
let u: Real = "0.25".parse()?;
let real_epsilon = u.clone().jacobi_epsilon(&parameter)?;
let recovered = real_epsilon.inverse_elliptic_e(&parameter)?.elliptic_f(&parameter)?;
assert!((recovered - &u).exact_rational_normal_form().unwrap().is_zero());
let epsilon = Complex::new(u, "0.125".parse()?).jacobi_epsilon(&parameter)?;
assert!(epsilon.re.certified_rational_interval(-128).is_some());
assert!(epsilon.im.certified_rational_interval(-128).is_some());
Ok::<(), hyperspatial::Error>(())
}
