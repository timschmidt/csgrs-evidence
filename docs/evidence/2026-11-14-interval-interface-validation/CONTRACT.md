# Restore strict Interface validation on Rust 1.95

Owner: Interface client owns decoded response events and worker snapshot validation.
Phase 8/14 downstream/whole-stack qualification, P6/P19/P30/P35-P37. Reproduce the two
Clippy failures on actual current source including its eight pending migration paths,
before editing. Main's41 staged paths and all sibling states persist.

NetworkUpdate::Scan currently copies a bounded full scan into a368-byte enum returned
on every response. Introduce owned indirection only for that largest payload, leaving
wire decoding, transaction validation, retained latest_scan, canonical bytes, response
errors, credentials redaction and worker JSON projections unchanged. No scan entries,
provenance or validation may be dropped. Status/mutation/retry updates remain heap-free.
Internal unpublished Rust API intentionally changes Scan(T) to Scan(Box<T>) and loses
Copy while preserving Clone/Eq/Debug. Document migration; this does not claim source
compatibility for arbitrary external Rust code. Repository callers and browser/native
checks must pass without weakening lint policy.

Simplify only the redundant Boolean grouping in ConfigurationWorkerSnapshot::validate.
Inputs are already-evaluated bool fields; preserve every accepted/rejected snapshot,
error cause, summary validation and canonical JSON. No predicate kernel/cache order
changes. Exhaustively test lifecycle, identity/summary and authorization combinations
with an independent relation oracle, including malformed summaries.

Acceptance: exact status/scan/mutation/retry transitions, full valid scan and canonical
payload, worker snapshot JSON, independent clones after machine reset, original
malformed/mismatched response behavior and redaction; existing client tests, strict
native/browser Clippy and relevant app checks. Measure completed transition throughput,
allocation/retained/type sizes, including scan indirection overhead, and unaffected
operations. No heap-free scan or unchanged Rust layout claim. Preserve all dirty source
and archived evidence.

Packaging scope added after current hook reproduction: the existing GitHub workflow
requires index.html.gz, alumina-interface.js.gz and alumina-interface_bg.wasm.gz, but
Trunk's current post-build hook produces only Brotli variants. Running the exact hook
on valid minimal WASM/HTML/JS fixtures confirms all three gzip artifacts are missing;
existing Brotli round trips pass. Owner is Interface release packaging, plan Phase14,
P19/P30/P37. Add deterministic gzip streams of the same post-optimization authoritative
assets, preserving originals and existing Brotli files. Test gzip/Brotli round-trip
identity and reproducibility across two staging directories, then run the actual
release pipeline and configured artifact checks where tools permit. No deployment.

Full browser Clippy exposes three additional preexisting findings, reproduced again
on the unchanged baseline app with -p alumina-interface --target wasm32 --no-deps:
one redundant Result or-pattern and two oversized browser functions. Owner is browser
worker/UI presentation, not numerical/protocol authority. Nest the unchanged Ok cases;
extract the existing capability-transfer arm into the corresponding private transfer
helper and the existing scan-widget block into a private UI helper. Preserve block
statements/branch order verbatim except indentation, use the same Ui without opening a
new scope, retain widget/action order, validation, diagnostics and credential erasure.
Record exact extracted-body equality. No lint suppressions, removed checks or policy
threshold changes. Native/workspace tests and full browser Clippy/build remain required;
source-body equality and compilation are not interactive browser execution evidence.
