# Upstream format integration

Integrate upstream `c9410688b0c7854fba6c9a90f34cae5b3382318a` into the qualified
BREP prism checkpoint `1c7a72c49881b1754f044264ee36e8546b1ef991`. Native BREP,
BREP IO and their numerical/geometry dependencies are unchanged by this merge.
The only conflict is the shared property ledger: preserve every current upstream
entry and BREP's local `current_work.hyperbrep`. The
[merge review](merge-review.json) records that ownership decision.

## Contract before qualification

The incoming code belongs to CSGRS format boundaries, with Hypermesh owning
index resolution and closed-PWN topology validation. P6, P17–P20, P22, P25–P27
and P35–P39 govern the integration. This checkpoint adds no new format or BREP
algorithm; it checks composition with the exact upstream implementation and
updates downstream guidance. Existing acceptance tests are retained unchanged.

- OBJ validates every triangle index before serialization, preserving typed
  failure and leaving stream bytes untouched on error. This does not establish
  general mesh topology.
- Both STL encodings parse binary32 coordinates, exactly promote finite values,
  and retain strict native closed-PWN validation. Empty geometry remains a
  success. Invalid topology retains its native error cause. Disconnected, nested,
  inverted and multiply wound closed surfaces are within the stated domain.
- Closed PWN, manifoldness, and fidelity to an earlier exact or analytic source
  are separate claims. Imported STL must not become an exact analytic BREP
  merely because its mesh validates. Retain source qualification through future
  fitting, reconstruction, feature history and export/import operations.
- The `basic_shapes` example now correctly requires both `curve` and `stl-io`.
  Preserve feature declarations when checking downstream examples.

The missing integration gate is execution on this merged tree. Re-run BREP/IO
release tests with all and minimal features, both warning-denied Clippy target
matrices, rustdoc, fuzz-target compilation and the 83-group source-path WASM
consumer. Run both incoming format regression suites in debug and release,
their targeted Clippy configurations, and check the corrected example feature
combination. Formatting and source/ledger ownership are checked after the final
documentation edit. These checks are not the complete pre-push matrix.

## Evidence boundaries

The preceding [prism qualification](../2026-10-16-prism-continuation/README.md)
and complete cost campaign remain immutable historical evidence. Matching source
hashes justify carrying their scope forward; no new timing comparison or speedup
is inferred from this merge. All original receipt migrations, adverse costs,
inherited zero-factor failures and 28 open work-package gates remain visible.

Upstream's [fresh physical builds](../../../../../docs/evidence/2026-10-16-physical-build-requalification/progress-v1.md)
do not repair historical nested-FUSE identity failures or the 27,093 missing
artifact expectations. The 35 pending native files remain unadmitted; original
full-board and copper-neck runtime gates still fail. The
[OBJ](../../../../../docs/evidence/2026-10-16-obj-index-validation/progress-v1.md)
and [STL](../../../../../docs/evidence/2026-10-16-stl-native-validation/progress-v3.md)
records admit only their stated corrections. Tiny-coordinate text loss in OBJ
and ASCII STL, and binary STL projection collapsing faces, remain upstream-owned
export defects. Their failing diagnostics are not converted into passing gates.

Upstream measurements use Rust 1.98.1; this BREP integration uses the recorded
Rust 1.99 toolchain. These are separate evidence sets. Source and Cargo storage
remain the previously checked physical ext4/tmpfs locations; this is not a new
whole-history storage audit. Tests have external time limits, not new internal
work, retained-memory or cancellation guarantees. Release packaging, MSRV, actual
C/Python/JavaScript distribution consumers, runtime fuzz/ASan, coverage and formal
proof remain open. No push is part of this checkpoint.

## Completed integration

On the integrated tree, BREP/IO release tests pass 512 with all features and 504 with minimal features; neither configuration has failures or ignored tests. Both warning-denied all-target Clippy configurations, rustdoc and fuzz-target compilation pass. The unchanged source-path WASM consumer passes 83 groups with zero imports and retains the preceding binary hash. The incoming seven OBJ and eight STL regressions pass in both debug and release with obj-io,stl-io and no default features; targeted format Clippy and the curve,stl-io basic_shapes build/Clippy pass. Counts overlap across configurations and are not coverage metrics. Formatting passes.

No BREP, IO or numerical/geometry dependency runtime bytes change in this merge. The earlier prism correctness, exact representation migrations and 96-process costs remain source-bound historical evidence, with no new timing or speedup claim. Nineteen adverse timing rows, sixty allocation increases, the two inherited scalar zero-factor failures, upstream native timing gates and three format export defects remain open. Fresh physical validation does not repair historical nested-FUSE identity failures or missing artifacts. All 28 BREP work packages remain open; this is not full-workspace/pre-push, package/MSRV, binding distribution, resource-bound, coverage, fuzz-runtime or formal-proof admission. No push.

The [manifest](manifest.json), [complete command record](commands.json), [source comparison](source-comparison.json) and [final audit](audit.json) bind these statements to the merged inputs. The integration adds no new production workaround outside BREP.
