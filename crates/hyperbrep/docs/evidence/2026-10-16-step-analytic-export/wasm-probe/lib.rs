#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/edge_images.rs"]
mod images;
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/edge_image_queries.rs"]
mod queries;
use analytic::cylinder;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/supplied_pcurves.rs"]
mod supplied;

#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/analytic_export.rs"]
mod analytic;
mod faceted;

#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    cylinder::closed_circle();
    cylinder::parameters();
    cylinder::representations();
    cylinder::oblique_frames();
    cylinder::units();
    cylinder::composition();
    cylinder::failures();
    cylinder::admission();
    images::parameterizations();
    images::faults();
    queries::parameter_and_radius_failures();
    queries::unresolved_is_not_success();
    queries::unsupported_is_not_endpoint_agreement();
    supplied::source_maps();
    supplied::representations();
    supplied::composition();
    supplied::failures();
    supplied::admission();
    analytic::imported_circles();
    analytic::frames_and_edits();
    analytic::planar_holes();
    analytic::units_and_occurrences();
    analytic::composition();
    analytic::failures_and_recovery();
    analytic::limits();
    assert_eq!(faceted::run_probe(), 5);
    30
}
