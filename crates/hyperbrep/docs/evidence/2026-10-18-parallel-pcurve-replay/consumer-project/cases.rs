#[path = "../../../../tests/support/parallel_pcurve_archive.rs"]
mod acceptance;

fn cases() -> [(&'static str, fn()); 7] {
    [
        ("nonlinear_parallel_pcurve_replays_exactly", acceptance::nonlinear_parallel_pcurve_replays_exactly),
        ("polynomial_and_rational_parallel_sources_replay", acceptance::polynomial_and_rational_parallel_sources_replay),
        ("selected_parallel_ranges_survive_replay_and_subdivision", acceptance::selected_parallel_ranges_survive_replay_and_subdivision),
        ("parallel_cusp_endpoints_remain_selected_on_replay", acceptance::parallel_cusp_endpoints_remain_selected_on_replay),
        ("replayed_parallel_pcurves_reenter_planar_modeling", acceptance::replayed_parallel_pcurves_reenter_planar_modeling),
        ("parallel_archives_reject_forged_definitions", acceptance::parallel_archives_reject_forged_definitions),
        ("parallel_archive_limits_and_exhaustion_recover", acceptance::parallel_archive_limits_and_exhaustion_recover),
    ]
}
