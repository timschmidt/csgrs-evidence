#!/bin/bash
set -u
W=/home/tim/Documents/GitHub/workspace/csgrs-closure-work/m4-sweep
S=/tmp/claude-1000/-home-tim-Documents-GitHub-workspace-csgrs/8cd25168-f43b-472e-9cc0-d4310351812c/scratchpad
cd $W || exit 1
trap 'rm -f crates/hypercurve/src/bezier_offset/zz_probe.rs; git checkout -q crates/hypercurve/src/bezier_offset.rs' EXIT
cp $S/probes/offset_probe.rs crates/hypercurve/src/bezier_offset/zz_probe.rs
printf '\n#[cfg(test)]\nmod zz_probe;\n' >> crates/hypercurve/src/bezier_offset.rs
CARGO_TARGET_DIR=/home/tim/Documents/GitHub/workspace/csgrs/target/m4-cancellation timeout ${1:-1200} nice -n 10 cargo +1.99.1 test -j 8 --locked --release -q -p hypercurve --all-features --lib zz_probe -- --ignored --nocapture 2>&1 | grep -E "PROBE|^error|panicked" -A4 | cut -c1-${2:-300}
