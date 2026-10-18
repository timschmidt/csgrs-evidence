# Final-validation log storage

All twelve complete report replays passed byte and parsed-value comparison.
Retained logs currently occupy 66,037,309 bytes. The original 64 MiB
allowance leaves 1,071,555 bytes, while the corresponding completed scalar
and downstream log sets occupy 5,665,648 bytes. The latter is a conservative
planning estimate, including interrupted-build overhead, not a measured final
integration size. The file-level measurements and hashes are in the contract.

Raise only the cumulative validation-log storage allowance to 96 MiB before the
final run. The counter is not reset and every prior raw log remains retained.
This subordinate storage limit was agent-selected; the original root-volume
baseline and 16 GiB containment remain enforced. The approved 72 GiB Disk B
limit and recorded 12 GiB /tmp allowance also remain fixed. Workloads, fixtures,
resolution, policies, materialized outputs, time, child memory and job limits
are unchanged. No successful operation under a smaller log budget is claimed.

The final checks use new helper versions that record this storage migration.
This changes evidence retention only, not the mathematical or resource contract
of the geometry workloads. No historical log is compressed, moved or rewritten.
