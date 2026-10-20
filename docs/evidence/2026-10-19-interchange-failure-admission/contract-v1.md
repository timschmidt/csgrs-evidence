# E104: preserve native interchange failure causes

Previous goal turn: progress. E103 is committed and verified at 291259adc.
Apply properties P4/P6/P18/P25/P27/P29/P30/P35/P36/P37/P39 and docs/admission.md.

Owning layer: the CSGRS format boundary owns failure conversion. Hypermesh
already distinguishes malformed indices, proved degenerate normals, undecided
normal predicates, and underlying scalar failures. Audit PLY/glTF graphics
construction and OBJ native index validation, reproducing actual public calls
on the pinned revision before editing. Reuse IoError::Construction and existing
ValidationError conversions; do not build another geometry validator.

Domain: native triangle carriers with exact rational and retained symbolic
coordinates; valid open render triangles and closed modeling meshes, malformed
indices, proved degeneracy, undecided zero, and a narrowly positive expression
that becomes provable after stronger refinement. Output is a complete format
String or typed error. write_* must not touch its sink on geometry failure;
ordinary stream IO failure may have written a prefix and remains StdIo.

Acceptance: native category, cause, context and diagnostics survive to public
format APIs and glTF scene-object construction. Independent normal/coordinate
and format-byte oracles cover supported success. Preserve deterministic output
for unchanged successful workloads; compare cold/warm/evicted/mutated/concurrent
cache states, returned String mutation, and stronger-proof failure recovery.
Exercise export/reimport/strict topology/composition on representable closed
geometry where supported. Record existing unsupported empties or lossy format
limitations explicitly, rather than claiming this cause-retention patch fixes
them. Keep source and display claims separate. No policy or fixture reduction.

Existing bindings expose STL, not the three affected format export APIs;
verify that inspection and compile affected feature sets. Do not claim actual
foreign-consumer coverage for an API the distribution does not expose. Public
source-package/release acceptance, complete provenance and the full plan stay
open. Reproduce adjacent index overflow and PLY fidelity findings separately;
do not silently expand implementation scope without an updated contract.

Caches retain four successful strings and owned input Arc identities per
thread, FIFO, without a heap-byte bound or reset/disable API; failures are not
cached. This patch changes neither key nor capacity nor normal policy. Internal
total-work/memory/cancellation bounds remain incomplete; tests use external
containment. No performance claim. No Hypervoxel edits/builds/packages.

Retain the 1 GiB physical free guard, original root/tmp baselines, cumulative
200 MiB log ceiling, 8 GiB child address space, two Cargo jobs, 1800-second
build/full-check and 60-second focused limits. Artifact volume quota is unlimited.
Sources and prior artifacts are read-only during checks. Only current_work may
change in the ledger. Protected untracked checkpoint remains untouched; closed
controls and all adverse results remain immutable and physically preserved.
