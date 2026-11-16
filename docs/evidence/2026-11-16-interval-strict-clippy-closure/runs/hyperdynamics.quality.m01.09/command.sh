cargo +"$DYNAMICS_RUST" clippy --locked -p hyperdynamics --all-targets --no-default-features -- -D warnings
cargo +"$DYNAMICS_RUST" clippy --locked -p hyperdynamics --all-targets --all-features -- -D warnings

