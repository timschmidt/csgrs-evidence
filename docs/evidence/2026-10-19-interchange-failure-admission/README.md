# E104: native interchange failures

PLY/glTF graphics construction and OBJ vertex-reference validation now retain
native failure categories and sources through IoError::Construction. Invalid
indices, proved degeneracy and undecided normals remain distinct. Geometry
failure leaves writer sinks untouched. The [contract](contract-v1.md) states
the input domain, owning layer and containment before implementation.

Four regression tests fail on the unchanged baseline; five success controls
pass, including independently derived geometry expectations. All nine pass after the repair. The seven original OBJ tests
also pass on the baseline. Their three error-variant assertions require the
explicit documented migration and now check native fields and causes in
addition to retaining original fixtures and diagnostic checks. The first probe
compile failure and initial candidate assertion failures remain preserved.

Independent decoded position/normal expectations, closed OBJ/glTF reimports,
strict topology, exact volume, empty composition, cache mutation/eviction,
concurrent output and stronger-proof retry supply semantic evidence. Six
successful PLY/glTF/OBJ artifacts also match the baseline byte for byte; this
comparison is separate from semantic validation. Cache recovery certifies the
normal calculation, not fidelity of tiny coordinates after finite projection.

All 251 minimal-feature tests pass at v2. A subsequent Clippy finding changes
only the independent glTF test decoder to as_chunks with an added no-remainder
assertion. All nine affected tests run again at v3. Default-feature IO/export
regressions, strict all-target Clippy, individual features, Rust 1.95 checks,
rustdoc, wasm32 compilation/Clippy and formatting run after that final edit. See the
[review](review-v1.json) and [command record](command-summary-v1.json) for actual
counts and configurations. No new foreign-runtime coverage is claimed: the
current C/JS bindings do not expose these format export APIs. The full default
runtime suite was not repeated; E103 records its prior-revision result.

The [adjacent findings](adjacent-findings-v1.json) remain open: glTF empty export,
PLY tiny-coordinate rounding, and scalar-adapter index conversion. Four cache
entries do not bound heap bytes; internal total-work and cancellation contracts
remain incomplete. There is no performance claim or Hypervoxel work. Current
source packages, public installation, complete provenance and the full plan
remain open. Historical missing artifacts were not reaudited. The
[checkpoint](checkpoint-v1.json) records exact evidence and these limitations.
