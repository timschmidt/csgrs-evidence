cargo test --locked -p alumina-interface-core --lib
cargo clippy --locked -p alumina-interface-core --all-targets --no-deps -- -D warnings
cargo clippy --locked -p alumina-interface-core --target wasm32-unknown-unknown --no-deps -- -D warnings
