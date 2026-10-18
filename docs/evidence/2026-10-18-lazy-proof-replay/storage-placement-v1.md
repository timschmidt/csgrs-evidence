# Storage placement for the lazy-proof validation

The initial diagnostic used the previous 16/72/32-GiB root/Disk B/tmp
allowances. It completed without a resource stop. Root retention now has
less than 5 MiB of headroom under its unchanged allowance. Disk B still
has about 285 MiB under the user's 72-GiB limit.

Keep root at 16 GiB and Disk B at 72 GiB. Place new command logs, phase
receipts and the raw archive under Disk B/lazy-proof-validation-v1. The
archive will remain on this persistent volume, with its hash and exact
location committed in the repository evidence. It will not be embedded
as another large Git blob. This changes evidence placement, not its
contents or verification. Portable release evidence remains a separate
open requirement. Existing archives and closed files are unchanged.

The user already authorized tmp validation. Increase the agent-selected
tmp storage-only cap from 32 to 40 GiB, keeping the original free-space
baseline of 67,482,746,880 bytes. The 96-MiB cumulative log counter now
adds new Disk B logs to all prior root-volume logs; it is not reset.
Time limits, fixtures, policies, memory limits and two build jobs remain
unchanged. No computation or performance comparison receives more time
or memory. tmp artifacts remain volatile.
