#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/oblique.rs"]
mod oblique;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/oblique_export.rs"]
mod oblique_export;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/sectors.rs"]
mod sectors;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/sector_export.rs"]
mod sector_export;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/coplanar.rs"]
mod coplanar;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/coplanar_export.rs"]
mod coplanar_export;
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/edge_images.rs"]
mod images;
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/edge_image_queries.rs"]
mod queries;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/seam_cuts.rs"]
mod seam;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/seam_export.rs"]
mod seam_export;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/similarity.rs"]
mod similarity;
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
    similarity::primitives();
    similarity::clipped_and_voids();
    similarity::selected_and_repeated();
    similarity::rejection_and_recovery();
    similarity::periodic_and_near();
    analytic::scaled_units();
    similarity::profile_families();
    for kind in 0..3 {
        seam::original(kind);
    }
    assert_eq!(seam::transforms(), 54);
    assert_eq!(seam::boundary_provenance(), 16);
    seam_export::failures_and_recovery();
    assert_eq!(seam::closed_boundary_provenance(), 2);
    for kind in 0..3 {
        for operation in 0..3 {
            coplanar::original(kind, operation);
        }
    }
    assert_eq!(coplanar::transforms().0, 54);
    coplanar::duplicate_carriers(0);
    coplanar::duplicate_carriers(2);
    assert_eq!(coplanar::circular_boundary_provenance(), 8);
    coplanar_export::failures_and_recovery();
    for kind in 0..5 { sectors::original(kind); }
    assert_eq!(sectors::transforms().0, 30);
    sectors::annular_partition();
    sector_export::failures_and_recovery();
    oblique::conic_queries();
    oblique::torus_band_workflow(&hyperbrep::Matrix4::identity(), &hyperbrep::Real::one());
    for scale in [oblique::q(1,1000),hyperbrep::Real::from(2).sqrt().unwrap()] {
        oblique::torus_band_workflow(&oblique::similarity(&scale,true),&scale);
    }
    oblique_export::failures_and_recovery();
    71
}
