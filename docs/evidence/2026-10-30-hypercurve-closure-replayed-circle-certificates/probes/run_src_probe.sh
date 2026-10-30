#!/bin/bash
set -u
W=/home/tim/Documents/GitHub/workspace/csgrs-closure-work/m4-sweep
S=/tmp/claude-1000/-home-tim-Documents-GitHub-workspace-csgrs/8cd25168-f43b-472e-9cc0-d4310351812c/scratchpad
cd $W && git stash -q || exit 1
python3 $S/probes/classify_patch.py crates/hypercurve/src/classify.rs
python3 $S/probes/intern_patch.py crates/hypercurve/src/svg/exact.rs
cp $S/probes/svg_probe.rs crates/hypercurve/src/svg/zz_probe.rs
printf '\n#[cfg(test)]\nmod zz_probe;\n' >> crates/hypercurve/src/svg.rs
CARGO_TARGET_DIR=/home/tim/Documents/GitHub/workspace/csgrs/target/m4-cancellation nice -n 15 cargo +1.99.1 test -j 4 --locked --release -q -p hypercurve --all-features --lib zz_probe -- --ignored --nocapture 2>&1 | grep -E "PROBE|^error|panicked" -A5 | cut -c1-${1:-260}
rm crates/hypercurve/src/svg/zz_probe.rs; git checkout -q crates/hypercurve/src/svg.rs crates/hypercurve/src/classify.rs crates/hypercurve/src/svg/exact.rs; git stash pop -q; git status --short | head -3
