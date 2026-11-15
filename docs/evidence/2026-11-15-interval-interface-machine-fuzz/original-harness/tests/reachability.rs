use alumina_interface_fuzz::{Outcome, machine_lowering, machine_profile};
#[test]
fn structured_profiles_reach_exact_facts_and_invalid_cases_stay_distinct() {
    for micro in [0, 1, 7, 15, 31] {
        assert_eq!(machine_profile(&[0, 0, micro]), Outcome::Profiled);
    }
    assert!(matches!(
        machine_profile(&[64]),
        Outcome::InvalidConfiguration | Outcome::InvalidProfile
    ));
    assert_eq!(
        machine_profile(&[128, 0, 0, 1]),
        Outcome::InvalidConfiguration
    );
    assert_eq!(machine_profile(&[0; 65]), Outcome::SkippedOversize);
}
#[test]
fn lowering_reaches_real_cached_execution_and_rejects_too_small_budgets() {
    assert_eq!(machine_lowering(&[0, 0, 15]), Outcome::Replayed);
    assert_eq!(
        machine_lowering(&[0, 0, 15, 0, 0, 1]),
        Outcome::BudgetRejected
    );
    assert_eq!(
        machine_lowering(&[0, 0, 15, 0, 0, 0, 0, 0, 1]),
        Outcome::LoweringRejected
    );
}

#[test]
fn fresh_process_reaches_lowering_without_warm_parent_state() {
    let output = std::process::Command::new(std::env::current_exe().unwrap())
        .args([
            "--exact",
            "lowering_reaches_real_cached_execution_and_rejects_too_small_budgets",
            "--nocapture",
        ])
        .output()
        .unwrap();
    assert!(
        output.status.success(),
        "{}",
        String::from_utf8_lossy(&output.stderr)
    );
    assert!(String::from_utf8_lossy(&output.stdout).contains("1 passed"));
}
