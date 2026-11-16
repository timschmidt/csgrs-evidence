fn main() -> Result<(), hyperspatial::Error> {
use std::sync::Arc;
use hyperspatial::*;

let mut context = Context::new(PredicatePolicy::STRICT, Limits::default());
let surface = Arc::new(Ellipsoid::wgs84(&mut context)?);
let origin = GeodeticPosition::new(
    Latitude::new(Angle::degrees(Real::zero()), &mut context)?,
    Longitude::unrolled(Angle::degrees(Real::zero())),
    Length::metres(Real::zero()),
    surface,
    ReferenceFrame::fixed("example:static-earth")?,
    InputProvenance::new("mathematical example", InputAccuracy::ExactModel),
    &mut context,
)?;
let ecef = origin.to_ecef(&mut context)?;
assert_eq!(ecef.coordinates().x, Real::from(6_378_137));
let local = LocalFrame::new(&origin, LocalAxes::Enu, &mut context)?;
let zero = local.to_local_position(&ecef, &mut context)?;
assert_eq!(zero.coordinates().x, Real::zero());
assert_eq!(zero.receipt().certainty(), Certainty::Exact);
let inverse = ecef.to_geodetic_closest(
    origin.ellipsoid().clone(), PoleMeridian::Reject, &mut context,
)?;
assert_eq!(inverse.height().as_metres(), &Real::zero());
assert!(matches!(inverse.source(), GeodeticSource::EcefClosest { .. }));
let projection = SphericalMercator::web_mercator(
    origin.reference().clone(), LongitudePolicy::WrapSigned, &mut context,
)?;
let projected = projection.project(&origin, &mut context)?;
let geographic = projection.unproject(&projected, &mut context)?;
assert_eq!(geographic.height().as_metres(), &Real::zero());

// The native inverse scalar and ellipsoidal Mercator share the exact equation.
// For b/a=3/5 and sin(phi)=3/5, psi=ln(2)-(4/5)*atanh(12/25).
let ratio = (Real::from(3) / Real::from(5))?;
let psi = Real::from(2).ln()? - (Real::from(4) / Real::from(5))?
    * (Real::from(12) / Real::from(25))?.atanh()?;
let phi = psi.inverse_isometric_latitude(&ratio)?;
let latitude = Latitude::new(Angle::radians(phi.clone()), &mut context)?;
let tolerance: Real = "1e-30".parse()?;
let tolerance = tolerance.exact_rational().unwrap();
let [lo, hi] = (phi.sin() - ratio).certified_rational_interval(-128).unwrap();
assert!(lo >= -tolerance.clone() && hi <= tolerance);
let oblate = Arc::new(Ellipsoid::from_axes(
    Length::metres(5.into()), Length::metres(3.into()), &mut context,
)?);
let recovered = GeodeticPosition::new(
    latitude, origin.longitude().clone(), Length::metres(Real::zero()), oblate,
    origin.reference().clone(),
    InputProvenance::new("inverse equation example", InputAccuracy::ExactModel), &mut context,
)?;
let ellipsoidal = EllipsoidalMercator::new(
    recovered.ellipsoid().clone(), recovered.reference().clone(),
    MercatorParameters::greenwich(LongitudePolicy::Unrolled), &mut context,
)?;
let projected = ellipsoidal.project(&recovered, &mut context)?;
// Fresh projected ingress exercises the inverse rather than source replay.
let fresh = ellipsoidal.position(
    projected.coordinates().clone(),
    InputProvenance::new("exact projection example", InputAccuracy::ExactModel), &mut context,
)?;
let recovered = ellipsoidal.unproject(&fresh, &mut context)?;
let recovered_ecef = recovered.to_ecef(&mut context)?;
let recovered_frame = LocalFrame::new(&recovered, LocalAxes::Enu, &mut context)?;
assert_eq!(recovered_frame.to_local_position(&recovered_ecef, &mut context)?
    .receipt().certainty(), Certainty::Exact);
Ok::<(), hyperspatial::Error>(())
}
