# Wider unit qualification

After the matched replay and allocation processes finish, run a direct
all-feature Hyperreal unit build with the same six new public tests and both
scalar implementation overlays. Also build and run all Hyperlimit and
Hypercurve unit tests against the matched candidate libraries, with the same
dispatch-trace/std configurations recorded in the replay contract.

All original test bodies, policies, fixture resolutions and ignore annotations
remain unchanged. Record every test result and existing ignore. This exercises
scalar serialization configurations and the predicate and curve consumers,
but does not replace Cargo integration tests, docs, Clippy, full native workloads,
report migration, main-source integration or distribution validation.

Every compiler/dependency/source input is pinned. Use a fresh temporary output
directory, read-only earlier artifacts and the unchanged containment contract.
Builds and complete unit suites retain the 1800-second limit and 8-GiB child
address-space limit. No validation runs concurrently with allocation pairs.
