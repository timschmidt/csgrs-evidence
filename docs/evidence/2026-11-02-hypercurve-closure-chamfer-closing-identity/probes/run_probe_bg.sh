#!/bin/bash
# usage: run_probe_bg.sh NAME BODY_FILE LOG [SECONDS]
# Builds a temporary probe test from the disappearance-chain helpers, removes
# the source before running, and runs the binary under a time limit.
set -u
W=/home/tim/Documents/GitHub/workspace/csgrs-closure-work/m4-sweep
name=$1; body=$2; log=$3; limit=${4:-900}
cd "$W" || exit 1
trap 'rm -f "crates/hypercurve/tests/$name.rs"' EXIT
python3 - "$name" "$body" <<'PY'
import sys
name, body = sys.argv[1], open(sys.argv[2]).read()
src = open('crates/hypercurve/tests/disappearance_chains.rs').read()
head = src[:src.index('/// Eroding a disk past its radius')]
open(f'crates/hypercurve/tests/{name}.rs', 'w').write(
    '#![cfg(feature = "svg")]\n' + head.replace('mod support;', 'mod support;\n// TEMPORARY probe (not for commit).') + body)
PY
export CARGO_TARGET_DIR=/home/tim/Documents/GitHub/workspace/csgrs/target/m4-cancellation
nice -n 15 cargo +1.99.1 test -j 4 --locked --release -q -p hypercurve --all-features --test "$name" --no-run > "$log" 2>&1 || { echo "build failed" >> "$log"; exit 1; }
rm -f "crates/hypercurve/tests/$name.rs"
bin=$(ls -t "$CARGO_TARGET_DIR"/release/deps/"$name"-* | grep -v '\.d$' | head -1)
timeout "$limit" "$bin" --ignored --nocapture --test-threads=1 ${FILTER:-} >> "$log" 2>&1
echo "exit $?" >> "$log"
