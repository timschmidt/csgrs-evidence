# Temporary validation-artifact storage migration

The user already authorized /tmp validation. Its previous 12 GiB retained
artifact cap was an agent-selected containment setting. Raise that allowance
explicitly to 24 GiB against the original 67,482,746,880-byte free-space
baseline; the new floor is 41,712,943,104 bytes. Do not reset the counter.

The fresh Cargo target, immutable executable copies, native cache copy and
later actual-main qualification must fit this allowance. Existing closed
targets and evidence remain untouched. Current physical capacity and host
memory are checked before and throughout execution.

Disk B remains capped at the user's approved 72 GiB. Root consumption remains
16 GiB and cumulative logs 96 MiB. Workloads, resolutions, policies, original
CPU/wall gates, 1800-second compile/suite limits, 60-second focused limits,
8-GiB per-child address space, two jobs, cancellation and reserves are unchanged.
This is a storage-only migration and provides no correctness, completion or
speedup evidence.
