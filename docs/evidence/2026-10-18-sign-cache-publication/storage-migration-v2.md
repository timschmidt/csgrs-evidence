# Measured temporary-storage continuation

The unchanged Hypercircuit build completed in 384.987002006 seconds. Freezing its
47 executables required 812,019,256 bytes. The helper checked the 8 GiB allowance
after that batch and stopped with an assertion before any circuit test ran.
The retained files use 9,298,964,480 bytes relative to the original baseline;
the observed overshoot was 709,029,888 bytes. This copy-batch checking gap is a
validation-harness limitation, not successful containment within 8 GiB. The exact
resource observation and every copied executable hash are retained.

Continue under the existing user authorization for /tmp with a 12 GiB cumulative
storage allowance, preserving the original 67,482,746,880-byte baseline. The
observed retained set plus remaining lint, documentation, compiler-floor and
integration artifacts requires more than the earlier estimates. The new boundary
still leaves 54,597,844,992 bytes free. This changes storage containment only;
original workloads, fixtures, precision, command times, child address-space,
job count, host-memory and log limits, root baseline and approved Disk B ceiling
remain fixed. No previous artifact or adverse result is removed.

Resume the 46 circuit test binaries from their already frozen copies. The source
and copied executables are verified before each command. New harness versions
reuse byte-identical frozen copies and preflight each additional copy with a
structured storage-exhaustion diagnostic. Prepared but unexecuted checks use new
versions recording this migration. This is not a claim of completion under the
original 5 GiB or intermediate 8 GiB storage contracts.
