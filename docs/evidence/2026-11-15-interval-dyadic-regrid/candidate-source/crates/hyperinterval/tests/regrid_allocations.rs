#![cfg(feature = "dyadic")]
use hyperinterval::{DyadicBudget, DyadicInterval};

#[path = "../../hyperlattice-interval/conformance/allocations.rs"]
mod allocations;

#[test]
fn finer_grid_identity_does_not_expand_mantissas() {
    const CHILD: &str = "DYADIC_REGRID_ALLOCATION_CHILD";
    if std::env::var_os(CHILD).is_none() {
        let output = std::process::Command::new(std::env::current_exe().unwrap())
            .args([
                "--exact",
                "finer_grid_identity_does_not_expand_mantissas",
                "--nocapture",
            ])
            .env(CHILD, "1")
            .output()
            .unwrap();
        assert!(
            output.status.success(),
            "{} {}",
            String::from_utf8_lossy(&output.stdout),
            String::from_utf8_lossy(&output.stderr)
        );
        return;
    }
    for (lower, upper, exponent) in [
        (-7, 9, -3),
        (1, 1, 0),
        (-9, -1, 3),
        (0, 0, 0),
        (0, 7, 0),
        (4, 12, i32::MAX),
    ] {
        let source = DyadicInterval::new(lower.into(), upper.into(), exponent).unwrap();
        let (_, _, stored) = source.bounds().unwrap();
        for precision in [
            stored,
            stored.saturating_sub(64),
            stored.saturating_sub(4096),
        ] {
            let (_, clone_calls, clone_bytes) = allocations::measure(|| source.clone());
            let mut budget = DyadicBudget::new(8192, 1_000_000);
            let (result, calls, bytes) =
                allocations::measure(|| source.regrid(precision, &mut budget));
            assert_eq!(result.unwrap(), source);
            println!(
                "{lower},{upper},{exponent} grid={precision} clone={clone_calls}/{clone_bytes} regrid={calls}/{bytes}"
            );
            assert!(
                calls <= clone_calls && bytes <= clone_bytes,
                "identity regrid expanded temporary mantissas"
            );
        }
    }
}
