# Interface validation reproduction

Use the exact repository revisions in BASELINE.json and SOURCE.json, Rust 1.95.0,
and both the original interface-pending.patch and the isolated candidate.patch.
The eight preexisting Interface migration files and the CSGRS staged extraction
are part of the tested combined source state, but are not part of this source
commit. The exact CSGRS staged patch is pending-after.patch in the prior record
docs/evidence/2026-11-14-interval-adaptive-taylor; its SHA-256 must match BASELINE.json. This record does not establish coordinated clean-checkout release readiness.
Copy frozen scripts to a new mutable stage and adjust absolute paths before running
any writer. Never run these drivers in an archived or frozen stage.

baseline-clippy.log reproduces the client large-enum and Boolean warnings.
baseline-browser-clippy.log uses the root package with --no-deps to expose its
three existing browser warnings independently of the client warnings. The exact
changed ownership contract and acceptance domain are in CONTRACT.md. Native wire
and worker JSON representations are preserved; the Rust Scan payload and Copy
contract intentionally change, documented in docs/CLIENT-MIGRATIONS.md.

qualify-final.py contains the final workspace test, native/browser strict Clippy,
client warnings-denied documentation, formatting and source-policy commands.
verify-preservation.py checks both formatted extracted helper bodies against the
original dedented bytes, the inherited eight-path patch, and untouched main repos
before integration. These checks do not constitute interactive browser execution.

check-hook.py executes the actual Trunk post-build hook on minimal valid WASM,
HTML and JS fixtures. Baseline fails the missing gzip requirements while its
Brotli outputs round-trip. Candidate and repeat fixtures produce byte-identical
outputs in separate directories; both compressor formats round-trip to their
original assets. The full application release command is:

    NO_COLOR=true RUSTUP_TOOLCHAIN=1.95.0 trunk build --release --locked --public-url /alumina-interface/

Use Trunk 0.21.14, wasm-opt and Brotli versions in environment.json, and the
installed wasm-tools version recorded in web-tool-installation.json. Set the
build-tools PATH and CARGO_TARGET_DIR from that environment record. NO_COLOR
must be true rather than this shell's inherited 1, which Trunk rejects before
building. validate-production.py runs every configured artifact validation and
checks all six gzip/Brotli round trips. Artifact hashes and sizes are retained;
compiled binaries and generated deployment assets stay outside the evidence repo.
No deployment or publication is performed.

prepare-probe.py/build-probes.py create external, locked release probes using
identical workload source and dependency versions for base and candidate. The
same prepared native request/response, full payload validation, retained machine
state, output ownership and destruction are measured. Separate clone workloads
include cloning, equality and destruction. PROBE_ALLOC measures 32 warm calls;
PROBE_TRANSCRIPT emits full wire/JSON/Debug values and all 4,536 snapshot cases.
semantic-equivalence.json excludes layout/time/allocation observations and compares
all semantic lines. Allocator epochs verify zero incremental live heap after drop;
preexisting machine/response/source and allocator overhead are excluded.

Only after every build/test/tool-install process finishes, measure.py alternates
base/candidate/candidate/base three times, copying the original hashed executable
to one common path. It pins CPU 0, disables ASLR and performs one million complete
operations per case after 32 warmups. Raw samples and binary section/symbol sizes
are retained, including adverse results. This is a bounded local screen, not an
external competitive benchmark, browser latency estimate or universal no-regression
claim. Browser-only helper extraction is checked for exact body preservation and
compilation, not measured interactive latency.

verify-prior-stages.py checks all 36 previously frozen evidence stages. Archive
verification checks the new record's committed blobs and addition-only scope;
main's pending staged/unstaged patches must survive integration byte-identically.
No full CSGRS pre-push matrix, HIL, live network credentials/device session,
interactive browser test, fuzz/coverage/sanitizer or hosted deployment is claimed.
