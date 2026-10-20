# Upstream integration acceptance

Merge the fetched `be2a0c37bfe57799c62a36125a5cb883a5458f00` into `brep`
after the source-pinned conical STEP increment is committed. Preserve all
local BREP work and upstream corrections. No push is part of this checkpoint.

The normative `AGENTS.md`, `properties.md` and `docs/admission.md` did not
change between the previously incorporated upstream `99b88f707b` and this
fetch. Inspect the actual merged result before relying on that observation.

Hypercurve owns the new exact single-line stroke construction. HyperBRep
owns extrusion, complete face/edge validation, solid measures and Boolean
composition of the resulting boundary. HyperBRep IO owns STEP encoding and
reimport accounting. Do not copy the stroke algorithm into either BREP crate.
The unrelated mesh, DRC and facade changes remain their owners' work.

Relevant properties: P1, P6, P11, P12, P15, P17-P20, P24-P27, P35-P39.
The missing acceptance is a public consumer that takes the changed native
curve representation across the BREP/STEP boundary and continues modeling.

Use the original line from (0,0) to (3,4), half-width 1, both traversal
directions, and butt and round caps. Its length is exactly 5. Independent
profile areas are 10 and 10+pi; a height-3 extrusion has volumes 30 and
30+3*pi, and boundary areas 62 and 50+8*pi. Test boundary and strict interior/
exterior points, including offsets of 1/10^12. Translate by (7,-2,1), cold
serialize/reload, export/reimport, validate incidence, union/intersect the
original and imported solids, subtract to canonical empty and recover.

Run this same consumer before and after the merge. Retain all failures and
exact artifacts. Upstream explicitly allows native boundary subdivisions to
change while preserving the represented set. Any resulting topology/archive/
STEP byte change must therefore be recorded as a representation migration,
with independent geometric checks, rather than called a preserved checksum
or performance-only change. A baseline failure has no successful-work speed
comparison. Do not weaken a consumer assertion to make the merge pass.

After the merge, rerun affected native/IO suites in release with all and minimal
features, both native Clippy configurations, the upstream stroke controls,
the warning-denied standalone WASM consumer, docs and formatting. Inspect
dependency changes and broaden checks if a failure or new concern warrants
it. Preserve the preceding 81-slot diagnostic inventory and original STEP
artifacts through the affected public workflows. Source-pin every command;
preceding cone measurements do not qualify the merged revision automatically.

Record complete-work cost/resource observations for the new consumer separately
from the preceding cone campaign. No controlled-host speedup, full workspace,
pre-push, installed package, actual C/Python/JavaScript delivery, cancellation
or total-work/retained-memory claim follows from these local consumers. The
known unrelated zero-factor debug failures remain with their upstream owner.
