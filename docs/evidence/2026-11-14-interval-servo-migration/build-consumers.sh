#!/usr/bin/env bash
set -euo pipefail
stage=/tmp/interval-refactor/servo-migration
build=/mnt/development/.interval-refactor-build
for name in baseline candidate; do
 cargo +1.88.0 build --release --manifest-path "$stage/clock-$name/Cargo.toml" --target-dir "$build/servo-clock-$name" > "$stage/clock-$name-build.log" 2>&1
 cargo +1.88.0 build --release --manifest-path "$stage/foc-$name/Cargo.toml" --target-dir "$build/servo-foc-$name" > "$stage/foc-$name-build.log" 2>&1
 cargo +1.88.0 build --release --target wasm32-unknown-unknown --manifest-path "$stage/foc-$name/wasm/Cargo.toml" --target-dir "$build/servo-wasm-$name" > "$stage/wasm-$name-build.log" 2>&1
done
