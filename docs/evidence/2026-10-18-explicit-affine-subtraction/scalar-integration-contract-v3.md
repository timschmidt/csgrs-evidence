# Scalar integration qualification

After the all-feature scalar and predicate units pass, compile the all-feature Hyperreal library and
its simple CLI in a fresh direct-rustc output directory. Compile and execute
every top-level Rust integration-test file under crates/hyperreal/tests,
unchanged, with the same complete feature configuration and pinned dependencies
as the all-feature unit build. Pin Cargo package metadata and the newly built
CLI path explicitly for tests using compile-time Cargo variables. No test file
may be omitted, modified, filtered, or silently skipped by this harness.

Retain all parent and nested process summaries and all failures. This is direct
compiler validation, not Cargo, documentation, minimum-compiler, Clippy or
distribution validation. Native full-workload and report gates remain open.
Every new command retains the original 1800-second suite/compile ceiling,
8-GiB child address-space limit, and unchanged storage/log baselines.

The unchanged curve unit suite may run concurrently with this independent
scalar integration process. There are at most two validation child commands;
each retains its original limit and all shared storage/log limits apply.
The completed allocation pairs remain isolated. No test timing comparison or
speedup claim will use this concurrent qualification.

The inventory contains 23 top-level test files. The v2 setup mistakenly
required 24 and stopped before compiling or running a test. The complete
source inventory now also matches the prior qualified Cargo target inventory.
All original files are included; the failed setup and empty directories remain.
