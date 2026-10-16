#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/edge_images.rs"]
mod images;
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/edge_image_queries.rs"]
mod queries;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/analytic_cylinder.rs"]
mod fixture;

#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    fixture::closed_circle();
    fixture::parameters();
    fixture::representations();
    fixture::oblique_frames();
    fixture::units();
    fixture::composition();
    fixture::failures();
    fixture::admission();
    images::parameterizations();
    images::faults();
    queries::parameter_and_radius_failures();
    queries::unresolved_is_not_success();
    queries::unsupported_is_not_endpoint_agreement();
    13
}
