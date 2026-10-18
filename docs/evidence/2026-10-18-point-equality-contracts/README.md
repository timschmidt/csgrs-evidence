# Point equality acceptance tests

Three public `Point2` tests preserve the current exact-rational and symbolic
proof paths. They cover mixed coordinates in both axis positions, the exact
line identity `(0,0) + (1/n) * (n,m) = (1,m/n)`, and an unresolved symbolic zero
beside a known rational coordinate. Exact facts survive strict, approximate,
and strict policy selection. Refinement of the unresolved fixture does not
turn its conservative Boolean comparison into a proof of inequality.

The tests passed against the unchanged current production libraries before
experimentation and after integration. Final `cargo fmt --all -- --check`,
warning-denied compilation of the added test source, and all three tests pass.
The [review](review-v1.json) pins the libraries, commands, source and executable
bytes. No scalar or curve implementation change is admitted here. Optimization
experiments continue separately, with their targets and evidence still open.

The user authorized the [72 GiB Disk B allowance](retention-contract-v2.json).
It applies cumulatively from the original free-space baseline to new runner
processes. Root storage, time, memory, workload gates and log limits stay fixed;
earlier runs keep their original contracts.

The [raw archive](raw-evidence-v1.tar.gz) and
[member index](archive-members-v1.json.gz) preserve the two test runs and named
helpers. Both executable copies remain separately hash-pinned outside the
archive. This checkpoint closes only the individually listed paths; it does
not close the containing experimental control directory or any candidate build
target. Older history was not re-audited; the last audit recorded 921,794 missing
paths. Hypervoxel remains excluded. Public distribution, wider acceptance and
the full plan remain open; no push was made.
