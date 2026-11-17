// Diagnostic only: expose the actual identity-table iteration before collection.
pub fn diagnostic_active_iteration() -> Vec<([usize; 6], u64)> {
    TRACE_STATE.with(|state| {
        state
            .borrow()
            .counts
            .iter()
            .map(|(key, count)| {
                (
                    [
                        key.layer.as_ptr() as usize,
                        key.layer.len(),
                        key.operation.as_ptr() as usize,
                        key.operation.len(),
                        key.path.as_ptr() as usize,
                        key.path.len(),
                    ],
                    *count,
                )
            })
            .collect()
    })
}
