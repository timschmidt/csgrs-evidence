
fn r18_capture_unknown(
    value: &Real,
    decisions: &DecisionContext,
    outcome: &hyperlimit::PredicateOutcome<Sign>,
) {
    use std::io::Write;
    static NEXT: std::sync::atomic::AtomicUsize = std::sync::atomic::AtomicUsize::new(0);
    let Ok(directory) = std::env::var("R18_CAPTURE_DIR") else { return; };
    let index = NEXT.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let captured = (|| -> std::io::Result<()> {
        if index >= 16 { return Err(std::io::Error::other("diagnostic capture count limit")); }
        let snapshot = value.r16_debug_graph_snapshot(10_000).map_err(std::io::Error::other)?;
        let text = snapshot.to_string();
        if text.len() > 32 * 1024 * 1024 { return Err(std::io::Error::other("diagnostic graph byte limit")); }
        let base = std::path::Path::new(&directory);
        let mut file = std::fs::OpenOptions::new().write(true).create_new(true)
            .open(base.join(format!("predicate-{index:04}.json")))?;
        file.write_all(text.as_bytes())?;
        file.sync_all()?;
        let mut context = std::fs::OpenOptions::new().write(true).create_new(true)
            .open(base.join(format!("predicate-{index:04}.context")))?;
        writeln!(context, "policy={:?}\noutcome={outcome:?}\n{}", decisions.policy(), std::backtrace::Backtrace::force_capture())?;
        context.sync_all()?;
        eprintln!("R18_CAPTURE {index} bytes={}", text.len());
        Ok(())
    })();
    if let Err(error) = captured {
        eprintln!("R18_CAPTURE_ERROR {index} {error}");
    }
}
