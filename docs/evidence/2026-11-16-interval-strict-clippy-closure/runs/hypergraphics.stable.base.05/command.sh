cargo clippy --locked --all-targets --all-features -- -D warnings
cargo clippy --locked --all-targets --no-default-features -- -D warnings
cargo clippy --manifest-path fuzz/Cargo.toml --bins -- -D warnings

