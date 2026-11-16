cargo fmt --all -- --check
cargo clippy --locked -p alumina-interface-core --all-targets --no-deps -- -D warnings
