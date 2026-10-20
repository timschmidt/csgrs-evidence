#[path = "../../../../tests/support/selected_procedural_profiles.rs"]
mod acceptance;
#[path = "../../../../../hyperbrep-io/tests/support/selected_procedural_profiles.rs"]
mod step_acceptance;
fn cases() -> [(&'static str, fn()); 12] {
    [
        (
            "selected_profile_domains_retain_endpoints_and_projection",
            acceptance::selected_profile_domains_retain_endpoints_and_projection,
        ),
        (
            "selected_profile_domains_reverse_transform_and_replay",
            acceptance::selected_profile_domains_reverse_transform_and_replay,
        ),
        (
            "full_clipped_parallel_cap_constructs_and_replays",
            acceptance::full_clipped_parallel_cap_constructs_and_replays,
        ),
        (
            "selected_chord_charts_keep_original_boundary",
            acceptance::selected_chord_charts_keep_original_boundary,
        ),
        (
            "selected_origin_lines_retain_source_and_replay",
            acceptance::selected_origin_lines_retain_source_and_replay,
        ),
        (
            "selected_profile_solids_split_both_edge_directions",
            acceptance::selected_profile_solids_split_both_edge_directions,
        ),
        (
            "selected_profile_solids_reflect_and_replay",
            acceptance::selected_profile_solids_reflect_and_replay,
        ),
        (
            "selected_profile_solids_continue_slab_booleans",
            acceptance::selected_profile_solids_continue_slab_booleans,
        ),
        (
            "selected_profile_archives_reject_forged_proofs_and_recover",
            acceptance::selected_profile_archives_reject_forged_proofs_and_recover,
        ),
        (
            "selected_profiles_keep_holes_components_and_reversal",
            acceptance::selected_profiles_keep_holes_components_and_reversal,
        ),
        (
            "selected_profiles_preserve_certainty_and_budget_recovery",
            acceptance::selected_profiles_preserve_certainty_and_budget_recovery,
        ),
        (
            "selected_procedural_profiles_fail_step_with_attribution_and_native_recovery",
            selected_procedural_profiles_fail_step_with_attribution_and_native_recovery,
        ),
    ]
}

fn selected_procedural_profiles_fail_step_with_attribution_and_native_recovery() {
    step_acceptance::selected_procedural_profiles_fail_step_with_attribution_and_native_recovery(
        &acceptance::clipped_parallel_cap(),
    );
}
