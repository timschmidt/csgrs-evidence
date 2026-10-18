# Lazy certificates and native trigonometric sign proofs

Baseline fb62da439e0fcb4e292032488a7596ec2107dd18. Owners: Hyperreal's
borrowed optional-payload access and Computable's rational-pi trigonometric
construction. Properties P1-P7, P18-P20, P26-P27, P35-P39.

First reproduce valid lazy-query panics and loss of a nonzero witness in
reciprocal products on unchanged production. Mathematical oracle: for
0 < q < 1/2, sin(pi*q) and tan(pi*q) are strictly positive, so their
products with their reciprocals are exactly one. Neither cache warming
nor a Real class tag is a proof for an unchecked trigonometric argument.

Candidate direction: borrow existing payloads and reconstruct absent named
certificates using the shared certificate implementation. Restore the
previous full lazy-query and strict-predicate fixtures, including all 21
named recipes, null/omitted payloads and signed scaling. Preserve the
original automatic-equality workflow as open; the separately recorded
explicit normal-form workflow must still require Some(1).

At the native graph layer preserve the sign justified by a checked rational
argument in the open principal interval. Reuse that construction from
public sine/tangent recipes and certificate reconstruction. Do not publish
the same sign for zero, endpoints, poles or out-of-range inputs. Preserve
existing graph structure and serialized bytes. Verify independent bounds,
cold/warm schedules, scaling/division/addition and reciprocal composition.
Existing graphs must stay borrowed; cache and representation layouts must
not grow. No global cache or primitive-conversion allocation is proposed.

Reproduce failures before production edits. After final edits run full
scalar configurations and affected predicate, SVG and circuit consumers,
strict lints/docs/formatting and compiler-floor checks. Retain previous
hard cases, malformed ingress findings and the rejected cache designs.
Record cost on matched completed controls without claiming a general
speedup. Construction proof availability may increase; no definite fact
may contradict its mathematical argument or lose an available proof.

Initial diagnostic containment is unchanged: root 16 GiB, Disk B 72 GiB,
tmp 32 GiB, cumulative logs 96 MiB, 8 GiB child address space, two jobs,
focused 60 seconds and compile/full suite 1800 seconds. All original
baselines and closed artifacts remain. A fresh full Cargo target will
require a separately recorded storage migration before starting it.
No new internal bound on arbitrary coefficient or graph size is claimed.
Hypervoxel is excluded. No push or complete release claim.
