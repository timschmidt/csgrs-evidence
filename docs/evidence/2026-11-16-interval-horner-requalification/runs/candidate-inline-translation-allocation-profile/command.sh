cargo build -p hypersolve --example allocation_profile --release --locked --message-format=json
HYPERSOLVE_INTERVAL_MIGRATION=1 "$CARGO_TARGET_DIR/release/examples/allocation_profile" 32
