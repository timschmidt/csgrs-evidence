# Exact procedural parallel pcurve replay

From `9fc5e55c4157cea39482b1af70029e99678a4cd4` on `brep`, including
upstream `540074a8c05ccc676d7c70b8f0093f98804b81d9`, this increment preserves
analytic parallels exactly in native pcurve archives. It is a prerequisite to
the still-open nonlinear parallel-cap spatial extrusion.

Hypercurve owns `CurveAnalyticParallel2` and `Curve2::analytic_parallel()`:
a borrowed source, signed distance, ascending range and traversal view for
direct parallels and analytic selected-fiber subdivisions. BRep owns the new
archive record, metadata accounting and references into its existing selected
parameter graph. Strict loading uses Hypercurve's complete interval admission;
it never trusts a serialized regularity bit or fits replacement geometry.
The format adds a family tag to version 9; existing-family bytes are unchanged.
There is no compatibility shim or new STEP representation.

The [contract](contract.md) records the failure and owner before implementation.
[Proofs](proofs.md) distinguish exact current definitions, topology, selected
root authority and earlier source intent. [Decisions](ideas.md) retain rejected
approaches; [next domains](next-domains.md) describe the spatial work.

## Final qualification

| Check | Result |
| --- | --- |
| BRep + IO release, all/minimal features | 639 / 631 passed |
| New debug acceptance | 7 passed |
| Hypercurve integration / retained-boundary / winding / successor | 351 / 165 / 4 / 62 passed |
| Affected all-target Clippy and rustdoc | Passed with warnings denied |
| Nine STEP examples; formatting; fuzz-target compilation | Passed |
| Actual zero-import WASM consumers | 7 + 11 + 7 + 9 + 14 + 138 = 186 groups passed |
| Previous deterministic files | 337 byte-identical, including 8 typed STEP error records |
| New native pcurve archives | 25, identical in two fresh processes |
| Original seven-profile diagnostic | Six native completions; nonlinear parallel cap remains unsupported |

The seven groups exercise independently derived arch values, complete source
definitions, polynomial and homogeneous rational sources, zero-weight controls,
selected cubic roots and affine charts, reversed subdivision, cusp endpoints,
archive-to-path/region composition, reflected similarities, exact `1e-12`
boundary distinctions, forged payloads and resource admission/recovery.
The planar cap test uses native straight closing segments. The original full
extrusion fixture with quadratic straight segments remains unchanged separately.

[Qualification](qualification-summary.json), [attempts](attempts.json),
[consumer identities](consumers.json), [preserved files](artifact-preservation.json)
and [original profile results](original-profiles.json) bind results to fixed
source. External native consumers also pass, including eight original full
workflows, all 24 prism and 81 continuation outcomes and the preserved old-path
controls. Twenty original prism OCCT reader cases were rerun; earlier quintic
observations apply only to identical bytes. [Failed attempts](attempt-review.md)
remain recorded. All final test suites have zero failed or ignored cases.

## Costs and limits

Three alternating pairs preserve all 33 preceding consumer groups in 24 processes, with original assertions, iterations and outcomes. Time ratios range 0.979430–1.065905; 0 exceed the 10% review marker and 5 increase allocation calls or requested bytes. Seven new complete acceptance groups have absolute costs from three processes. Every slower and adverse observation is retained. This finite shared-host comparison does not rerun the historical 192-case catalogue or establish a general speedup, significance or an internal resource bound.

[Costs](costs.md) include checks and output materialization inside timing.
[Resource observations](resource-review.json) and [environment](environment.json)
retain every slower row, allocation request, process RSS, harness size and
finite archive observation. External timeouts contain tests; they do not bound
internal work. The earlier unequal-hole rejection cost remains open.

This admits unattached pcurve models and supported planar continuation, not spatial offset edges, complete edge/pcurve correspondence or parallel-cap extrusion. Full authoring history, general selected fields, arbitrary shell intersections, broader metrics and exact STEP encoding of irrational Cartesian vertices remain open. Local strict replay does not certify an earlier approximate source intent. No operation-wide work, coefficient-growth, retained-heap or cancellation bound is added. Source-path consumers do not establish registry installation, MSRV or production bindings. Coverage/formal verification, runtime fuzz/ASan/lexicase campaigns, full pre-push qualification and all 28 work packages remain open/in-progress. No push. Supporting-crate work remains with its owner; unrelated concurrent-thread breakage is untouched. Qualification is pinned to upstream 540074a8c and unchanged source.

The [source reconstruction record](source-reconstruction.json) preserves every
checked epoch, including failed candidates. The [manifest](manifest.json) binds
source, evidence and public documentation. The [final audit](final-audit.json)
checks counts, outputs, raw cost arithmetic, ledger ownership and protected
stashes. Prior evidence and other owners' ledger bytes remain unchanged.

The [staged whitespace record](staged-whitespace.json) retains seven EOF blank
line observations in raw Cargo logs. Every non-log staged file passes the
whitespace check. Raw output is preserved; the full staged check is not
represented as passing.
