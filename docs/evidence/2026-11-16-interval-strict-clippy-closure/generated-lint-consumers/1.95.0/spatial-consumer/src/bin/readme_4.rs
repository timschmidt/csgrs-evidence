fn main() -> Result<(), hyperspatial::Error> {
use hyperlattice::Complex;
use hyperspatial::Real;

let parameter: Real = "-3".parse()?;
let argument = Complex::new("0.25".parse()?, "0.125".parse()?);
let (sn, cn, dn) = argument.jacobi_sncndn(&parameter)?;
let norm = &sn * &sn + &cn * &cn;
assert!(norm.re.exact_rational_normal_form().unwrap().is_one());
assert!(norm.im.exact_rational_normal_form().unwrap().is_zero());
assert!(dn.re.certified_rational_interval(-128).is_some());
assert!(dn.im.certified_rational_interval(-128).is_some());
Ok::<(), hyperspatial::Error>(())
}
