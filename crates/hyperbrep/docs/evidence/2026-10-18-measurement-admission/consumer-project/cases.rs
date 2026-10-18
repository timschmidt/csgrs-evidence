#[path = "../../../../../hyperbrep-io/tests/support/measurement_exchange.rs"]
mod exchange;
#[path = "../../../../tests/support/measurement_admission.rs"]
mod geometry;

fn cases() -> [(&'static str, fn()); 7] {
    [
        ("planar_spline_incidence_does_not_require_low_degree_root_solving", geometry::planar_spline_incidence_does_not_require_low_degree_root_solving),
        ("rational_prism_validity_does_not_require_a_closed_form_measurement", geometry::rational_prism_validity_does_not_require_a_closed_form_measurement),
        ("holes_components_and_affine_images_keep_optional_measurements", geometry::holes_components_and_affine_images_keep_optional_measurements),
        ("measurement_absence_survives_empty_identities_and_repeated_slab_cuts", geometry::measurement_absence_survives_empty_identities_and_repeated_slab_cuts),
        ("inward_and_damaged_archives_remain_invalid_without_volume", geometry::inward_and_damaged_archives_remain_invalid_without_volume),
        ("independent_quintic_step_admits_and_replays_without_measurement", exchange::independent_quintic_step_admits_and_replays_without_measurement),
        ("malformed_quintic_step_and_budget_failure_cannot_publish_geometry", exchange::malformed_quintic_step_and_budget_failure_cannot_publish_geometry),
    ]
}
