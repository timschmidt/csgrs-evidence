# Temporary validation storage migration

The CSGRS compilation in downstream-v1 was terminated by the retained-storage
monitor at 238.038506436 seconds with `tmp_net_consumption_5_gib`. It produced no
completed CSGRS test result. The completed Hyperlimit, Hypercurve and Hypermesh
suites remain valid, and their copied binaries and original logs are retained.

The original 5 GiB temporary-storage allowance was chosen by the agent from the
earlier rough build-size estimate. The user already authorized /tmp validation;
there is no explicit user ceiling of 5 GiB. Continue within that authorization
with an explicit 8 GiB cumulative storage allowance, preserving the original
67,482,746,880-byte free-space baseline. This leaves at least 58,892,812,288 bytes
of filesystem free space at the allowance boundary. No artifact is deleted.

This is a validation-storage migration, not successful completion under the
original 5 GiB contract. Preserve that failed containment result. The original
workload, fixtures, resolution, policies, 1,800-second command limits, 8 GiB child
address-space limit, two build jobs, host-memory reserve, log allowance, root
baseline and approved 72 GiB Disk B allowance remain unchanged. /tmp artifacts
remain volatile. Main source and the candidate patch are unchanged.

Continuation uses new immutable helpers and result paths. The existing open
candidate target may be reused because its source overlays are unchanged; all
previously executed copies are verified independently before further commands.
Compiler-floor, report replay and final integration must record this migration.
