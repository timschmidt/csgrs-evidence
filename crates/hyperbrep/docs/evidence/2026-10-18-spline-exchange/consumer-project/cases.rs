#[path = "../../../../../hyperbrep-io/tests/support/spline_exchange.rs"]
mod exchange;
#[path = "../../../../tests/support/spline_geometry.rs"]
mod geometry;

fn cases() -> [(&'static str, fn()); 9] {
    [
        ("retained_spline_profiles_complete_step_replay_and_repeated_cuts", exchange::retained_spline_profiles_complete_step_replay_and_repeated_cuts),
        ("independent_splines_retain_charts_weights_trims_units_and_modeling", exchange::independent_splines_retain_charts_weights_trims_units_and_modeling),
        ("invalid_spline_records_and_exhausted_limits_never_publish_a_body", exchange::invalid_spline_records_and_exhausted_limits_never_publish_a_body),
        ("spline_whole_images_ambiguous_trims_and_supplied_pcurves_are_checked", exchange::spline_whole_images_ambiguous_trims_and_supplied_pcurves_are_checked),
        ("spline_write_limits_units_and_exact_numeric_failures_are_explicit", exchange::spline_write_limits_units_and_exact_numeric_failures_are_explicit),
        ("spline_views_retain_weights_knots_and_reversed_subcurve_charts", geometry::spline_views_retain_weights_knots_and_reversed_subcurve_charts),
        ("planar_pcurves_prove_whole_image_and_retain_parameter_correspondence", geometry::planar_pcurves_prove_whole_image_and_retain_parameter_correspondence),
        ("extrusion_location_preserves_oblique_nonunit_direction_and_source_parameters", geometry::extrusion_location_preserves_oblique_nonunit_direction_and_source_parameters),
        ("extrusion_location_keeps_ambiguity_and_rejects_nontransverse_or_nonplanar_charts", geometry::extrusion_location_keeps_ambiguity_and_rejects_nontransverse_or_nonplanar_charts),
    ]
}
