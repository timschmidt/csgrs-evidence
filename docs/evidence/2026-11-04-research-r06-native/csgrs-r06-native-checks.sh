#!/bin/bash
set -e
export CCACHE_DISABLE=1 CARGO_INCREMENTAL=0 CARGO_TARGET_DIR=/tmp/csgrs-research-target
cargo fmt --all -- --check > /tmp/csgrs-r06-native-fmt.log 2>&1
cargo +stable clippy --offline --locked --all-features --all-targets -p hypercurve -p hyperbrep -p hyperbrep-io -- -D warnings > /tmp/csgrs-r06-native-clippy.log 2>&1
cargo +1.95.0 clippy --offline --locked --all-features --all-targets -p hypercurve -p hyperbrep -p hyperbrep-io -- -D warnings > /tmp/csgrs-r06-native-msrv.log 2>&1
RUSTDOCFLAGS='-D warnings' cargo doc --offline --locked --all-features --no-deps -p hypercurve -p hyperbrep -p hyperbrep-io > /tmp/csgrs-r06-native-doc.log 2>&1
cargo test --offline --locked --release --all-features -p hypercurve -p hyperbrep -p hyperbrep-io --doc > /tmp/csgrs-r06-native-doctests.log 2>&1
cargo test --offline --locked --release --no-default-features -p hypercurve --test polynomial_vertical_components --test polynomial_empty_axis > /tmp/csgrs-r06-native-minimal.log 2>&1
