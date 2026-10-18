# Matched native replay and allocation control

Compile baseline and candidate Hyperreal, Hyperlattice, Hyperlimit, Hypersolve
and Hypercurve from the same pinned source, compiler, dependencies and direct
rustc flags. Both builds use opt-level=3 and dispatch tracing (disabled during
allocation measurement); Hyperlimit enables std. Only the two recorded scalar
implementation files differ. These direct builds are not Cargo, all-feature,
package or distribution qualification.

Run the unchanged E75 native comparison probe (24 native coordinate pairs and
three symbolic controls; 81 result rows) on both builds. Run both builds on
the unchanged native_linear_stroke, native_linear_stroke_contracts and
point_equality_contract integration tests. Independent geometric identities
and topology/membership assertions remain in those files. Retain all outcomes.

Compile the repository's unchanged 20-representation allocation_profile on
each new scalar library. After builds and consumer tests, run five alternating
AB/BA process pairs, each with 64 complete original lifecycles per recipe.
Require identical labels, counts and successful completion; retain every row
including allocation growth. Counts describe Rust allocation requests and
payload, not allocator overhead, peak RSS or semantic correctness. Process
duration is not a per-operation speed claim. No concurrent validation workload
runs during those pairs.

Use new /tmp directories; preserve all earlier artifacts and baselines.
Compilation retains the 1800-second cap, focused probes and allocation
processes 60 seconds, existing consumer suites 1800 seconds. All previously
declared storage, log and memory limits remain unchanged. No exact importer,
native full-workload acceptance or performance admission follows from this
diagnostic replay alone.
