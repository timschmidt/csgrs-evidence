# Latest projection and WASM integration

Integrate upstream `99b88f707b04053de7f40a86d6d029e3c07460d9`, including
`3d335db43`, after the qualified BREP merge `d37855677e753d932aac95bde25b60888442f9b1`.
The update arrived during the preceding qualification. That completed checkpoint
and its original evidence remain intact. This integration makes no local runtime
changes; format boundaries and bindings remain owned by the concurrent upstream
work. The only merge conflict is the shared ledger, resolved by preserving
upstream bytes and adding the local BREP entry.

## Contract and affected consumers

P6, P17–P20 and P25–P30 require explicit boundary loss, topology scope, typed
failure and consumable results. P35–P39 govern qualification and retained costs.
The missing acceptance evidence is execution of the unchanged incoming tests
and generated bindings on the merged branch, not a new geometric algorithm.

OBJ and ASCII STL now spell the chosen finite binary64 values as exact
terminating decimals. Existing 17-place text is retained only where sufficient;
affected fractional text, lengths and checksums intentionally migrate. This
preserves the float projection, not every original native scalar. ASCII STL
import still quantizes coordinates to binary32. Binary STL validates the actual
projected triangle's nondegeneracy before publishing or caching bytes, including
distinct projected vertices that become collinear. This is a per-triangle
claim, separate from whole-mesh closed-PWN topology, manifoldness or analytic
source fidelity. The three preceding export defects are now corrected in their
stated domains; their historical failures remain visible.

`MeshJs.fromSTL(Uint8Array)` delegates to native strict closed-PWN import.
`GeometryIoError` replaces string exceptions for STL import/export, retaining
`code`, `format`, variant fields and a typed validation `cause` where present.
Malformed `fromArrays` input uses `GeometryError` with `invalid_input`.
Consumers use `message` for text and inspect codes directly. These host Error
objects outlive mesh handles and require no `free()`; the input buffer is not
retained. Update BREP-facing applications directly, without a string-error
compatibility adapter. This CSGRS binding is not a BREP binding release.

## Qualification scope before execution

Run the 24 native OBJ/STL/projection regressions in debug and release, targeted
warning-denied Clippy and format rustdoc; re-run the eleven BREP prism/STEP public
workflows. Run the exact upstream binding harness: existing certainty and export
JS consumers, all twelve new IO JS tests, the old TypeScript check, and the new
TypeScript consumer compiled and executed against generated declarations. Run
actual WASM-target Clippy and formatting. The tools are task-local: Node from its
official checksum-bound distribution, the Cargo-locked wasm-bindgen CLI and
TypeScript from the repository lock's integrity record.

BREP, BREP IO, all numerical/geometry dependency sources, their manifests and
locks are unchanged since the immediately preceding 512/504-test and 83-group
WASM qualification. Verify those source identities and retain that completed
evidence. Do not rerun a cost campaign or relabel its observations as measurements
of this new source; this merge is not a BREP optimization.

The upstream [projection record](../../../../../docs/evidence/2026-10-16-export-projection-contracts/progress-v1.md)
and [typed WASM record](../../../../../docs/evidence/2026-10-16-wasm-format-failures/progress-v1.md)
retain adverse costs, explicit text/error migrations, earlier failures and
qualification limits. First-call binary export becomes more expensive because
it performs a new projection proof. Per-coordinate decimal precision is bounded;
total work, heap retention and cancellation remain separate open contracts.
WASM linear memory is not a live Rust heap measurement. Deeper proof witnesses,
end-to-end construction provenance, other legacy WASM errors, published-package
validation, MSRV, full pre-push verification, and all 28 BREP work packages remain
open. The two BREP-inherited scalar failures and upstream native timing/storage
failures remain unadmitted. No push is part of this integration.

The current merged root documentation check with `obj-io,stl-io` and no default
features fails on the unconditional `curve` link at `src/lib.rs:4`. The
[failure record](root-docs-failure.json) binds the unchanged root library and
manifest to the preceding checkpoint; it does not claim an earlier execution
of that exact configuration. Retain this upstream-owned failure and the original
exit 101. A separate check with `curve` enabled exercises the documented root
API but does not waive the failing configuration. BREP documentation remains
qualified by the unchanged preceding integration.

## Completed qualification

The merged branch passes 24 native OBJ/STL/projection regressions in debug and release, targeted warning-denied Clippy and curve-enabled format documentation, and eleven BREP prism/STEP workflows. The actual upstream binding harness passes both preceding JavaScript consumers, all twelve new IO tests, the preceding TypeScript check and the new compiled/executed TypeScript consumer. Actual WASM-target Clippy and formatting pass. Counts overlap across configurations. BREP/dependency byte identity preserves the immediately preceding 512 all-feature, 504 minimal and 83 source-path WASM checks; those full suites are not claimed as newly executed here.

No local runtime correction is added. Exact text preserves the chosen finite binary64 projection; ASCII STL import still quantizes to binary32. Binary STL per-triangle nondegeneracy is separate from closed topology, manifoldness and analytic fidelity. Typed host errors preserve categories, not complete native proof witnesses or inherited construction intent. Earlier BREP costs, nineteen adverse timing rows, sixty allocation increases and two scalar zero-factor failures remain open. Upstream native timing/storage failures and all 28 BREP work packages remain open. The root no-curve rustdoc configuration fails on its unchanged curve link; the separate curve-enabled documentation check does not waive this upstream-owned failure. No new cost campaign, published-package, MSRV, whole-history, resource-bound, coverage, runtime-fuzz, formal-proof or full pre-push claim. No push.

The [manifest](manifest.json), [commands](commands.json), [binding artifacts](binding-artifacts.json), [retained generated bindings](bindings.tar.gz) and [final audit](audit.json) preserve the inputs and outcomes.
