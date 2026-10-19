#[path = "/mnt/development/csgrs/target/hyperbrep-development/crates/hyperbrep/tests/support/selected_revolution.rs"]
mod acceptance;
fn cases() -> [(&'static str, fn()); 8] {
[
("selected_meridian_patch_retains_latitudes_and_replays", acceptance::selected_meridian_patch_retains_latitudes_and_replays),
("selected_rotation_retains_points_and_angular_charts", acceptance::selected_rotation_retains_points_and_angular_charts),
("selected_revolution_supports_reversal_reflection_and_subdivision", acceptance::selected_revolution_supports_reversal_reflection_and_subdivision),
("selected_revolution_rejects_axis_contacts_and_invalid_domains", acceptance::selected_revolution_rejects_axis_contacts_and_invalid_domains),
("selected_revolution_archives_reject_wrong_images_and_recover", acceptance::selected_revolution_archives_reject_wrong_images_and_recover),
("selected_revolution_preserves_certainty_and_budget_recovery", acceptance::selected_revolution_preserves_certainty_and_budget_recovery),
("retained_rotation_closed_edges_split_and_replay", acceptance::retained_rotation_closed_edges_split_and_replay),
("selected_revolution_oblique_axes_tangencies_and_exact_gaps", acceptance::selected_revolution_oblique_axes_tangencies_and_exact_gaps),
]
}
