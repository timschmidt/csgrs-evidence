#[path = "/mnt/development/csgrs/target/hyperbrep-development/crates/hyperbrep/tests/support/procedural_revolution.rs"]
mod acceptance;
#[path = "/mnt/development/csgrs/target/hyperbrep-development/crates/hyperbrep-io/tests/support/procedural_revolution.rs"]
mod step_acceptance;
fn cases() -> [(&'static str,fn());10] { [
("full_parallel_cap_revolves_and_replays",acceptance::full_parallel_cap_revolves_and_replays),
("selected_parallel_cap_revolves_and_replays",acceptance::selected_parallel_cap_revolves_and_replays),
("procedural_revolution_reflection_reversal_and_exact_gaps",acceptance::procedural_revolution_reflection_reversal_and_exact_gaps),
("procedural_revolution_subdivision_keeps_shared_incidence",acceptance::procedural_revolution_subdivision_keeps_shared_incidence),
("procedural_revolution_retains_native_and_selected_cavities",acceptance::procedural_revolution_retains_native_and_selected_cavities),
("procedural_revolution_rejects_invalid_profiles_and_cavities",acceptance::procedural_revolution_rejects_invalid_profiles_and_cavities),
("procedural_revolution_certainty_budget_and_archive_recovery",acceptance::procedural_revolution_certainty_budget_and_archive_recovery),
("procedural_revolution_consumes_regions_holes_components_and_empty",acceptance::procedural_revolution_consumes_regions_holes_components_and_empty),
("unified_revolution_preserves_native_images_and_exact_volume",acceptance::unified_revolution_preserves_native_images_and_exact_volume),
("procedural_revolution_step_rejection_preserves_native_solid",step_boundary),
] }

fn step_boundary() { step_acceptance::procedural_revolution_step_rejection_preserves_native_solid(&acceptance::selected::clipped_parallel_cap()); }
