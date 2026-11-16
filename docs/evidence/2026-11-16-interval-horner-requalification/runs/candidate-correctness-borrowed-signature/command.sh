cargo test -p hypersolve --lib interval_migration --features dispatch-trace --locked -- --nocapture
cargo test -p hyperinterval --no-default-features --features rational,serde,dispatch-trace --test rational --locked
cargo clippy -p hyperinterval -p hypersolve --all-targets --no-default-features --features hyperinterval/rational,hyperinterval/serde,hypersolve/dispatch-trace --locked -- -D warnings
