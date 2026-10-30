#!/bin/bash
# Usage: measure_latency.sh <label>. Runs the cancellation latency probe, samples stacks if slow.
S=/tmp/claude-1000/-home-tim-Documents-GitHub-workspace-csgrs/8cd25168-f43b-472e-9cc0-d4310351812c/scratchpad
label=$1; log=$S/latency-$label.log
cd /home/tim/Documents/GitHub/workspace/csgrs-closure-work/m4-cancellation
export CARGO_TARGET_DIR=/home/tim/Documents/GitHub/workspace/csgrs/target/m4-cancellation
cargo +1.99.1 test --locked --release -p hypercurve --test hypercurve_open_path_compositions --no-run > $log 2>&1 || { echo "build failed"; exit 1; }
bin=$(ls -t $CARGO_TARGET_DIR/release/deps/hypercurve_open_path_compositions-* | grep -v '\.d$' | head -1)
CANCEL_AFTER_SECONDS=${WAIT:-60} $bin measure_cancellation_latency_of_filleted_hyperbola_bevel_stroke --ignored --exact --nocapture >> $log 2>&1 &
pid=$!
sleep $(( ${WAIT:-60} + 30 ))
n=0
while kill -0 $pid 2>/dev/null && [ $n -lt 3 ]; do
  gdb -p $pid -batch -ex "thread apply all bt 80" 2>/dev/null | grep -E "^#" | grep -v "std::\|core::\|alloc::\|__\|clone3\|start_thread\|libc" | sed -E 's/ \(.*//; s/^#[0-9]+ +0x[0-9a-f]+ in //' > $S/latency-$label-bt$n.txt
  n=$((n+1)); sleep 10
done
if kill -0 $pid 2>/dev/null; then kill $pid; echo "STILL RUNNING after cancellation; killed" >> $log; fi
wait $pid 2>/dev/null
grep -E "MEASURE|STILL" $log
