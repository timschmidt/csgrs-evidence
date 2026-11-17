use hypersolve::work_budget::{
    BudgetExceeded, CancellationToken, WorkBudget, WorkKind, WorkUsage, is_active,
    with_cancellable_budget,
};

#[unsafe(no_mangle)]
pub extern "C" fn verify_cancellation_boundary(case: u32) -> u32 {
    assert!(case <= 2);
    let token = CancellationToken::new();
    if case == 2 {
        token.cancel();
    }
    let invoked = std::cell::Cell::new(false);
    let outcome = with_cancellable_budget(WorkBudget::ZERO, &token, || {
        invoked.set(true);
        if case == 1 {
            token.cancel();
        }
        7_u32
    });
    assert!(invoked.get());
    assert_eq!(outcome.usage, WorkUsage::default());
    if case == 0 {
        assert_eq!(outcome.result, Ok(7));
    } else {
        assert_eq!(
            outcome.result,
            Err(BudgetExceeded {
                kind: WorkKind::Cancellation,
                limit: 0,
                used: 0,
                requested: 0,
            })
        );
    }
    assert!(!is_active());
    let fresh = CancellationToken::new();
    let retry = with_cancellable_budget(WorkBudget::ZERO, &fresh, || 11_u32);
    assert_eq!(retry.result, Ok(11));
    assert_eq!(retry.usage, WorkUsage::default());
    assert!(!is_active());
    1
}
