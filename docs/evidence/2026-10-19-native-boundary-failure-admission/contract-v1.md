# E103: native boundary failure retention

Previous goal turn: progress. E102 committed and verified the curve adapter
repair at 82f2f9444, with 907 Rust test executions and 33 native consumers.
Apply properties P6/P18/P25/P28/P29/P30/P35/P36/P39 and docs/admission.md.

Audit scope before implementation: four remaining string conversions in
ScalarMesh (two polyhedron routes, exact graphics export, point transforms)
and two mesh-validation conversions in curve modeling. Source inspection also
finds that Hypermesh GPU normals merge degenerate and undecided triangles into
TriangleNormalUnavailable. Reproduce actual operations on the pinned revision;
source inspection alone does not establish which public failures are reachable.

Ownership: Hypermesh owns exact graphics-buffer construction and normal
certification; Hyperlattice/Hyperreal own point-transform scalar failures;
CSGRS owns modeling and adapter category/source preservation. Reuse existing
representations and native conversions. Preserve known successful exact rows,
normal values, indices, topology and downstream composition. Distinguish
canonical empty buffers, malformed indices, proven degeneracy, undecided
predicates and actual scalar or resource failures. Preserve policy and source
chains; never make failed geometry look complete. Any new error variants or
ABI category changes require explicit migration documentation.

Use exact rational and retained symbolic fixtures, all applicable scalar
families, fresh and repeated graphics exports, and independent exact coordinate,
normal, area/volume and topology checks. Exercise real C/C++/Python consumers
where affected. Keep original full-scale fixtures, policies and hard regressions.
Do not fabricate kernel failures to claim public-path coverage; record any
unreproduced or private-helper-only route separately. No Hypervoxel work.

Retained E102 libraries are eligible for preliminary binding diagnostics only
after verifying their hashes and identical runtime sources/manifests. Fresh
builds supply final acceptance. Preserve every probe, failed attempt, source
pin and raw log. Public release, complete provenance and the full plan stay open.

Retain the existing 1 GiB physical free guard, root/tmp baselines, cumulative
200 MiB log ceiling, 8 GiB child address space, two Cargo jobs, 1800-second
build/full-check bounds and 60-second focused bounds. The selected artifact
volume has no retained quota. Sources and previous artifacts are read-only
during checks. Change only current_work in the ledger; preserve the protected
untracked checkpoint. Prior closed controls remain immutable.
