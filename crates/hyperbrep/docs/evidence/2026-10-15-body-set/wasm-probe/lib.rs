#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/body_sets.rs"]
mod cases;
#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    cases::empty_identities_continue();
    cases::disconnected_accumulation_removal_and_bridge();
    cases::overlapping_selections_follow_union_semantics();
    cases::unselected_bodies_never_reappear();
    cases::holes_symbolic_coordinates_and_cavities();
    cases::selected_parameters_survive_collection();
    cases::failures_are_atomic_and_empty_does_not_admit_raw_models();
    cases::exact_gap_and_ambient_policy_survive_composition();
    cases::selection_identity_covers_curved_sweeps();
    9
}
