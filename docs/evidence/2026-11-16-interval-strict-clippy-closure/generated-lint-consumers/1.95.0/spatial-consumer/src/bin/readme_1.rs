fn main() -> Result<(), hyperspatial::Error> {
use hyperspatial::*;
let mut context = Context::new(PredicatePolicy::STRICT, Limits::default());
let chart = SphericalTransverseMercator::new(
    Length::metres(5.into()), ReferenceFrame::fixed("example:sphere")?,
    TransverseMercatorParameters::greenwich(TransverseLongitudePolicy::RejectOutsideChart),
    &mut context,
)?;
let source = GeodeticPosition::new(
    Latitude::new(Angle::degrees(30.into()), &mut context)?,
    Longitude::unrolled(Angle::degrees(2.into())), Length::metres(0.into()),
    chart.ellipsoid().clone(), chart.reference().clone(),
    InputProvenance::new("spherical example", InputAccuracy::ExactModel), &mut context,
)?;
let point = chart.project(&source, &mut context)?;
let fresh = chart.position(point.coordinates().clone(),
    InputProvenance::new("exact chart coordinates", InputAccuracy::ExactModel), &mut context)?;
let inverse = chart.unproject(&fresh, PoleMeridian::Reject, &mut context)?;
assert_ne!(inverse.receipt().certainty(), Certainty::Approximate);
let zone = UtmSelection::select(&source, &mut context)?;
assert_eq!(zone.zone().number(), 31);
assert_eq!(zone.hemisphere(), Hemisphere::North);
assert!(zone.parameters()?.receipt().is_some());
Ok::<(), hyperspatial::Error>(())
}
