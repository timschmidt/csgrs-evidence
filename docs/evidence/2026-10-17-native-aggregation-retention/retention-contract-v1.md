# Repeated aggregation: retained-memory acceptance probe

The new deferred report owner can retain earlier aggregate owners. Measure the
same completed finite workload in both variants before retention: accumulate
16, 64 and 256 copies of the exact unit square from canonical empty, validate
exact area one and interior membership, then materialize the complete authored
report with exactly N polygons. Measure requested live/peak Rust allocation
bytes before aggregation, after native composition, after complete report
materialization and after dropping the aggregate. These are allocated payload
bytes, not RSS or a heap-byte bound. Capture durations without claiming a
speedup from one run. Fresh processes avoid cross-case warming.

Compile the same standalone probe against the already-built, source-pinned
baseline and candidate libraries. Keep every case and failure. Use the existing
8 GiB process and filesystem/memory limits and 60 seconds per probe process.
No internal resource bound or cancellation support is inferred. A material
retained-memory regression or superlinear retained report growth must be
reviewed and resolved before calling the aggregation proposal admitted. Do not
reduce N, omit output materialization or replace these inputs with a failing
operation to obtain a favorable result.
