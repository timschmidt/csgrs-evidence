#[path = "original_fixture.rs"]
mod original;
pub use original::{ChainOutput, Fixture, fixture, validate};

use hyperlimit::PredicatePolicy;
use hypersolve::work_budget::{CancellationToken, WorkBudget, with_cancellable_budget};

pub fn operation(input: &Fixture, policy: PredicatePolicy) -> ChainOutput {
    #[cfg(feature = "cancel-retry")]
    {
        use hypersolve::work_budget::{BudgetExceeded, WorkKind};
        let token = CancellationToken::new();
        let cancelled = with_cancellable_budget(WorkBudget::UNLIMITED, &token, || {
            let output = original::operation(input, policy);
            original::validate(input.case, policy, &output);
            token.cancel();
            output
        });
        assert_eq!(
            cancelled.result.as_ref().err(),
            Some(&BudgetExceeded {
                kind: WorkKind::Cancellation,
                limit: 0,
                used: 0,
                requested: 0,
            }),
            "publication cancellation must discard completed output"
        );
        assert!(!hypersolve::work_budget::is_active());
    }
    let retry = CancellationToken::new();
    let completed = with_cancellable_budget(WorkBudget::UNLIMITED, &retry, || {
        original::operation(input, policy)
    });
    assert!(!hypersolve::work_budget::is_active());
    completed.result.expect("fresh uncancelled completion")
}
