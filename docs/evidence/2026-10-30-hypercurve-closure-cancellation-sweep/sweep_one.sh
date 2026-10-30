#!/bin/bash
# Usage: sweep_one.sh <binary> <probe-name>. One cancellation probe with stack sampling when stuck.
S=/tmp/claude-1000/-home-tim-Documents-GitHub-workspace-csgrs/8cd25168-f43b-472e-9cc0-d4310351812c/scratchpad/sweep
bin=$1; name=$2; log=$S/$name.log
WAIT=${WAIT:-20}
CANCEL_AFTER_SECONDS=$WAIT $bin cancel_probe_$name --ignored --exact --nocapture > $log 2>&1 &
pid=$!
waited=0
while kill -0 $pid 2>/dev/null && [ $waited -lt $((WAIT + 30)) ]; do sleep 1; waited=$((waited+1)); done
n=0
while kill -0 $pid 2>/dev/null && [ $n -lt 3 ]; do
  gdb -p $pid -batch -ex "thread apply all bt 80" 2>/dev/null | grep -E "^#" | grep -v "std::\|core::\|alloc::\|__\|clone3\|start_thread\|libc" | sed -E 's/ \(.*//; s/^#[0-9]+ +0x[0-9a-f]+ in //' > $S/$name-bt$n.txt
  n=$((n+1)); sleep 5
done
if kill -0 $pid 2>/dev/null; then kill -9 $pid; echo "PROBE $name STUCK >30s after cancellation" >> $log; fi
wait $pid 2>/dev/null
grep -h "PROBE" $log
