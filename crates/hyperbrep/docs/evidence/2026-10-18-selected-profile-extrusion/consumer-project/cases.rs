#[path = "../../../../../hypercurve/tests/support/retained_bezier_images.rs"]
mod curves;
#[path = "../../../../../hyperbrep-io/tests/support/selected_profiles.rs"]
mod exchange;
#[path = "../../../../tests/support/selected_profiles.rs"]
mod native;

fn cases() -> [(&'static str, fn()); 11] {
    [
        (
            "selected_boolean_profiles_extrude_and_replay",
            native::selected_boolean_profiles_extrude_and_replay,
        ),
        (
            "selected_profile_paths_share_native_image_admission",
            native::selected_profile_paths_share_native_image_admission,
        ),
        (
            "selected_profile_edits_and_slab_booleans_preserve_exact_material",
            native::selected_profile_edits_and_slab_booleans_preserve_exact_material,
        ),
        (
            "selected_profiles_keep_holes_and_disconnected_components",
            native::selected_profiles_keep_holes_and_disconnected_components,
        ),
        (
            "selected_profiles_transport_exactly_and_reject_damaged_archives",
            native::selected_profiles_transport_exactly_and_reject_damaged_archives,
        ),
        (
            "partial_height_profile_contacts_keep_boundary_and_overlap_distinct",
            native::partial_height_profile_contacts_keep_boundary_and_overlap_distinct,
        ),
        (
            "selected_profile_step_vertices_remain_explicitly_unencodable",
            || {
                exchange::selected_profile_step_vertices_remain_explicitly_unencodable(
                    native::profile,
                    native::replay,
                )
            },
        ),
        (
            "selected_quadratic_image_keeps_the_complete_curve_and_original_roots",
            curves::selected_quadratic_image_keeps_the_complete_curve_and_original_roots,
        ),
        (
            "nonmonotone_native_image_preserves_its_entire_parameterized_polynomial",
            curves::nonmonotone_native_image_preserves_its_entire_parameterized_polynomial,
        ),
        (
            "unavailable_higher_degree_views_do_not_replace_selected_evidence",
            curves::unavailable_higher_degree_views_do_not_replace_selected_evidence,
        ),
        (
            "selected_weighted_curve_images_preserve_exact_quotients",
            curves::selected_weighted_curve_images_preserve_exact_quotients,
        ),
    ]
}
