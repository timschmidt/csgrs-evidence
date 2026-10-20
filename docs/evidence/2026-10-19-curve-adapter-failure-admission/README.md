# E102: typed curve adapter failures

Four Boolean adapters, revolve and profile extraction now retain native failures
through the existing structured conversion. The baseline reproduced three
regression failures: diagnostics survived as strings, but categories and causes
did not. The [contract](contract-v1.md) identifies ownership and the input domain.

Rust retains the native cause; undecided curve operations reach C as status 5
instead of generic status 4. Invalid inputs still report 4. Diagnostic text,
signatures and numeric status values remain unchanged. C output handles and
profile records remain untouched on failure. C++ and Python retain the category.

The repaired regressions pass for all four scalar families. Independent exact
areas and unit-cell truth tables validate Boolean meaning and downstream empty
composition. Full root tests in minimal-curve and default configurations, FFI
tests and release build, strict Clippy, formatting, Rust 1.95 all-target checks
and 33 real native consumers pass. The [review](review-v1.json) and
[commands](command-summary-v1.json) define the executed scope and limits.

This repair preserves failures; it does not make the undecided fixtures complete.
No unsupported or work-budget fixture was forced for the new tests. WASM curve
operations use the native carrier directly; the host feature check passed, but
the JavaScript runtime was not rerun. Go is unavailable on this host. No matched
performance benchmark or speedup is claimed. Full release, public installation,
complete curve provenance and the broader plan remain open. Hypervoxel remains
deferred, and historical missing artifacts were not reaudited. The
[checkpoint](checkpoint-v1.json) records the retained hashes and boundaries.
