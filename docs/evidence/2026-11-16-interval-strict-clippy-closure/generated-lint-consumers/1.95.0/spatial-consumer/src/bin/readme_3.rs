fn main() -> Result<(), hyperspatial::Error> {
use hyperspatial::Real;

let parameter: Real = "0.5".parse()?;
let integral_value: Real = "0.75".parse()?;
let amplitude = integral_value.clone().jacobi_amplitude(&parameter)?;
let rectifying = integral_value.clone().inverse_elliptic_e(&parameter)?;
assert!(amplitude.certified_rational_interval(-128).is_some());
assert!(rectifying.certified_rational_interval(-128).is_some());
assert_eq!(amplitude.elliptic_f(&parameter)?, integral_value);
assert_eq!(rectifying.elliptic_e(&parameter)?, integral_value);
let (sn, cn, dn) = integral_value.jacobi_sncndn(&parameter)?;
assert!((&sn * &sn + &cn * &cn).exact_rational_normal_form().unwrap().is_one());
assert!(dn.certified_rational_interval(-128).is_some());
let _positive_reciprocal = dn.inverse_ref()?;
Ok::<(), hyperspatial::Error>(())
}
