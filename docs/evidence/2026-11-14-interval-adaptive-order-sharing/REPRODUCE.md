# Reproduce the unretained experiment

Base: ba7961399a623523afc29ec9966b954772f2391b.
Macro candidate: CANDIDATE.json; typed replacement: TYPED-CANDIDATE.json.
Both source commits remain on the local interval-adaptive-order-sharing branch.
The complete deltas are macro-candidate.patch and typed-candidate.patch.

Use a new checkout and mutable evidence destination. Do not run scripts directly
from a frozen record. Scripts contain this machine's absolute worktree/build paths;
copy them and replace those paths. The factor-control.py and implementation scripts
are historical transformations, not idempotent reproduction drivers; preserve the
current checkout before using them. Do not overwrite immutable binary snapshots.

Compile with cargo +1.95.0 bench --locked -p hyperdynamics --all-features --no-run.
The baseline observer in baseline-observer.rs captures full original order-three
and adaptive artifacts. The candidate test adaptive_preparation_baseline asserts
fixed dispatch/work counts and prints complete reports. Compare the eighteen
PREP/PREP_TRACE/PREP_WORK/REPORT/TRACE/WORK lines independently of harness output.
The fixed golden fixture was captured before production edits.

run-default-benchmarks.py and run-controlled-timing.py document the macro campaigns.
run-typed-controlled-timing.py documents the typed four-sweep campaign. CPU affinity,
executable hashes, command lines, sample counts and raw estimates/sample JSON are
retained. The controlled runs use one fixed executable path and disabled ASLR.
Host clocks and unrelated activity are not controlled. The adverse-separation
screen is observational, not a simultaneous statistical proof of all regressions.

run-shared-benchmark.py measures six complete adaptive workloads from the typed
snapshot; common original field/controller setup is excluded equally, while all
demanded Taylor preparation, proofs, report materialization and destruction are
included. prepare-cost-probe.py creates an external allocation/work probe using
the same benchmark helpers. Requested bytes exclude allocator overhead, common
inputs and process memory. Repeated measurements assert allocation-scope balance.

finish-unretained.py records diagnostic owner tests, strict Clippy and the actual
example. Its results do not establish downstream, packaged, stable-toolchain,
WASM, fuzz, coverage, coordinated release or full pre-push qualification. The
candidate is not integrated, and no push/publication is authorized by this record.
