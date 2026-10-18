# Explicit affine subtraction Cargo qualification

Parent: 0179a1b68621d48e1b5087d64d64493e0c3819c5.
Continue E76's exact affine subtraction domain at Hyperreal, under P1-P5,
P7-P9, P17-P20 and P35-P39. The baseline failures, six new assertions, all
original tests and both rejected constructor prototypes remain preserved.

The candidate has two production-file differences. New tests use a normal
module. Pinned rustfmt formats the new helper/test text. Its expression-block changes
are reviewed in helper-format-v2.patch; every acceptance test remains intact.
Verify the complete overlaid real module tree and all unchanged main inputs.
The production worktree remains unchanged during isolated qualification.

Use a new empty Cargo target and private writable Cargo bookkeeping. Bind
the retained registry index, archives and source directories read-only.
Copy the small native GMP cache independently; keep all previous targets
read-only. Disable automatic Cargo cache cleanup and use offline locked builds.
Record Cargo freshness, features and copied executable hashes. Freeze executed
binaries before later feature builds can replace an unversioned output.

Run scalar default/all-feature/debug tests, docs and strict Clippy. Qualify
Hyperlimit, Hypercurve, Hypermesh, CSGRS, HyperDRC and Hypercircuit through
their original complete target suites and original full native CPU/wall gates.
Keep all original fixture geometry, test bodies, policies and ignore markers.
Run compiler-floor checks and full report replay with the qualified baseline.
Review JSON/CBOR reader compatibility and explicit rational-carrier migration;
this is a representation improvement, not merely a performance-only claim.

Only after acceptance may the exact candidate be applied to main. Then verify
the actual source without overlays and rerun affected local/downstream checks.
An evidence update is not implementation admission. Distribution and the full
properties plan stay open until separately proved. Hypervoxel remains excluded.

Use the explicit temporary-artifact storage migration in storage-migration-v1.md.
Every original workload, time, memory, job, root, Disk B and log limit remains.
Scratch data goes in the new temporary root. No push or publication is planned.
