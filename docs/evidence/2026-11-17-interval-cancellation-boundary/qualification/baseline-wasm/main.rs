use hypersolve::work_budget::{CancellationToken, WorkBudget, WorkKind, with_cancellable_budget};
fn main() {
    let token = CancellationToken::new();
    let outcome = with_cancellable_budget(WorkBudget::UNLIMITED, &token, || {
        token.cancel();
        7_u32
    });
    println!("{outcome:?}");
    assert!(
        matches!(outcome.result, Err(error) if error.kind == WorkKind::Cancellation),
        "cancellation must be observed before publishing an uninstrumented result"
    );
}
