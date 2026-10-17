# Additional full-library qualification after the small-batch gate

The no-feature candidate executable, nine contracts, strict Clippy and complete
ten-size paired comparison passed without a decisive cost rejection. If the
full support matrix and allocation checks also complete, run the entire library
corpus without added filters in both no-feature and all-feature configurations.
These are functional checks, never latency measurements; they may overlap.
The final grouped cost check waits until all functional jobs are terminal.

No-feature tests use a new source mirror in the experiment's /dev/shm root.
All-feature compilation uses verified frozen Cargo dependencies and the exact
new candidate source, with identical feature flags, optimized compiler flags,
relative source paths and preserved tests. Its binary, source mirror, compiler
scratch and logs use a separate fresh repository output root:
`target/properties/circle-support-reuse-library-v1`.

This is an additional output placement and storage allowance, declared before
execution. It does not alter the earlier 4 MiB controls/evidence allowance or
write into any completed target. Reserve a separate 128 MiB planning allowance
for the new all-feature artifacts, and check before starting that allocating it
leaves at least 512 MiB free on the repository volume. Prior comparable outputs
retained about 75.4 MB. The shared supervisor checks the same 512 MiB repository
reserve during commands; the 128 MiB allowance is not a hard peak-byte bound.
Record final retained bytes and observed free-space samples. Keep 256 MiB of
/dev/shm user quota and filesystem reserve, 2 GiB host available memory, 8 GiB
address space and 1,800 seconds per command. No native workload limits change.

The source and feature/dependency proofs are recorded before compilation. Each
suite uses a fresh mirror for property-test persistence and preserves every
existing ignored test. Passing these library suites does not establish Cargo
Clippy matrix, integration/doc/example/bench, downstream, native report, binding
or external package acceptance. A fresh full Cargo build still requires a
larger writable volume; the previously requested directory is absent.
