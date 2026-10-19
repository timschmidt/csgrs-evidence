# Attempt review

Failed attempts remain in the raw record with their actual sources and logs.
A later successful run does not retroactively change those results.

- The initial selected-patch fixtures fail on eaa0cae54 because the public
  builders require a materialized parameter. The first feature patch admits
  both construction cases.
- Expanded fixtures initially used a private parameter constructor and an
  incorrect public classification signature. They now derive the same selected
  parameters through a public restricted profile and use CurvePoint2 plus
  RegionPointLocation. No production API was exposed solely for a fixture.
- A reflected extrusion reverses its surface u chart. The independent spatial
  sample was retained and the test follows the correct reflected/reversed
  parameter sign; the spatial edge chart remains independently checked.
- The nonorthogonal planar archive failed deterministic cold replay. The
  baseline consumer first had an incomplete copied fixture dependency; the
  completed baseline consumer reproduced the same failure on untouched eaa0.
  The BRep encoder now preserves unchanged pcurve definitions. Scalar or curve
  owner semantics were not weakened to make the archive pass.
- Strict Clippy found module_inception in the new shared fixture's outer
  `original` alias, which collided with a reused fixture's nested module. The
  outer alias is now `procedural`; there is no lint suppression. Both affected
  Clippy configurations and the final seven patch groups pass after that edit.
- A relocated artifact helper initially retained an external relative include!
  path. Its failure is recorded. Both baseline/candidate copies now point to
  their explicit source roots; preparation also handles such include! paths.
  Successful completed consumer projects were hash-checked and retained when
  resuming the remaining projects.

Full BRep/IO all-feature and minimal-feature suites were executed after the
final production edit and the optional artifact writer. The subsequent alias
rename changes no test body. Final focused fixtures, source-path consumers,
WASM execution and strict lints use that renamed fixture. Every qualification
command carries its exact source patch; documentation-only finalization is
recorded separately.

The first generic original-WASM invocation ran only `run_probe` (71 groups),
then correctly rejected the mismatch with 138. The original suite has nine
exports in one instance. Its unchanged export order and per-export counts are
now explicit in original-wasm-exports.json; the runner executes all of them.
The failed partial run is retained and never counted as the complete suite.

Final review caught a whole-file indentation rewrite in the shared property ledger. The final writer replaces only current_work.hyperbrep, retaining every surrounding byte from HEAD. The correction changes no implementation, fixtures or property values owned by other threads. Final diff and documentation checks were rerun.

- The staged whitespace check flagged two blank context lines in the saved
  unified source patch. Gzip storage preserves every qualified patch byte;
  decompressed SHA-256 equality was verified. Runtime source and fixtures
  are unchanged, and the original failing check remains recorded.
