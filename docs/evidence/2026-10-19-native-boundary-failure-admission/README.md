# E103: native boundary failures and graphics cache recovery

The six reproduced conversion routes now preserve native causes: mesh
polyhedron construction (with and without context), exact graphics export,
point transforms, and both curve mesh-validation helpers. Hypermesh separates
proven degenerate normals from undecided normals and retains scalar failures.
The [contract](contract-v1.md) and [extension](contract-extension-v1.md) state
ownership, domains, migrations and resource limits before implementation.

AttributedMesh now caches successful exact buffers only. The baseline proved
that native export could succeed after stronger scalar evidence while its
sidecar still returned the old cached failure. Repeated, concurrent and shared
metadata exports recover without replacing authoritative geometry. Owned GPU
errors replace borrowed errors; successful buffers remain borrowed.

All four scalar adapters preserve tested categories and causes. Independent
exact normal/coordinate expectations, mutation and eviction checks, the full
original strict-mode corpus, native GPU/scalar tests, FFI tests, attributed OBJ
consumption and 36 real C/C++/Python consumers supply acceptance evidence.
Strict Clippy, formatting and Rust 1.95 all-target checks also pass. See the
[review](review-v1.json) and [commands](command-summary-v1.json) for exact scope.

Undecided polyhedron/graphics ABI outcomes now report status 5 instead of 4;
invalid inputs remain 4. Failure publishes no output handle or buffer. ABI
signatures and numeric status values are unchanged. Private helper failures
are not evidence of public construction failure coverage; public translated
and rotated curve probes succeeded. GPU scalar exhaustion was not reproduced.
A baseline test expectation error and the first candidate's test-only compile
failure, a test-only Clippy finding and a crate-formatting mismatch are retained
with corrected controls and unchanged fixtures. The full minimal/root and scalar
runtime checks precede the final test-borrow and GPU-format-only edits; affected
GPU/root/FFI tests are rerun and release libraries rebuilt. Default-feature,
consumer and remaining checks use the final source pins.

PLY/glTF GPU error flattening remains an open follow-up. WASM host/target checks and the real JavaScript/TypeScript consumers pass;
Go consumers were not executed. No speedup is claimed. The
cache has no heap-byte bound. Current source packages, public installation,
complete provenance and the full plan remain open; Hypervoxel is out of scope.
Historical missing artifacts were not reaudited. The
[checkpoint](checkpoint-v1.json) retains hashes and these limits.
