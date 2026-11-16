cargo fmt --all -- --check
cargo test --workspace --locked
cargo clippy --workspace --all-targets --no-deps --locked -- -D warnings
cargo clippy --workspace --target wasm32-unknown-unknown --no-deps --locked -- -D warnings
