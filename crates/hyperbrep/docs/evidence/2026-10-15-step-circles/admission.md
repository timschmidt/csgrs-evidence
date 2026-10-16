# Direct analytic STEP circle/cylinder mapping

Target revision: `6ca4b653115821c5000e52032621ae30892d6e5e`, on the integrated
upstream contract. Owner: `hyperbrep-io::step::advanced` entity/parameter mapping;
HyperBRep retains all geometric and topological admission authority. Relevant
properties: P1–P3, P6, P8–P9, P15–P20, P25–P27, P30, P35–P39.

The missing acceptance case is an explicitly selected exact cylinder with two
single-vertex circular edges, a straight seam used twice, planar caps and a
cylindrical side. The original, hand-authored fixture uses radius 5, height 7
and seam coordinates (3,4), permitting independent exact incidence, area,
volume and membership assertions. It is separate from the unchanged OCCT
cylinder whose decimal seam is not exactly on its support. Record the failing
import on this revision before changing production code.

Admit direct CIRCLE/LINE spatial geometry on PLANE/CYLINDRICAL_SURFACE through
the ordinary native builder. Reuse native circle parameter location and complete
edge/pcurve image validation. Retain source frames, exact angular conversion,
topological sense, parameter endpoints and source IDs; unwrap face-local cylinder
charts continuously so two uses of the same seam remain distinct. No epsilon,
implicit healing, synthetic split vertex or display approximation is admissible.
The source parameter maps describe a fraction of the directed imported edge;
native angular domains are not the line's unit interval.

Existing planar SURFACE_CURVE master and alternate representations remain fully
checked. Curved SURFACE_CURVE/SEAM_CURVE, general splines and arbitrary support
surfaces are later mappings, with typed unsupported results in this increment.
Do not silently discard a supplied representation to admit a direct circle.
Closed edges use exactly one period; distinct coincident vertices are not welded.

Exercise clockwise/reversed/rotated and non-cardinal frames, units, multiple
bodies, source accounting, limits, near-incidence errors, split/reflection,
archive replay, Boolean/empty continuation and actual WASM execution. The exact
faceted writer must reject curved output honestly; no curved STEP export or
whole-document round-trip claim is made. Independent floating-point readers
check interoperability separately from native exact acceptance.

Freeze the existing complete advanced/faceted import benchmark executables
before production edits. Compare preserved completed output, source maps,
allocations and size with matched settings; new successful curved imports have
absolute costs, not a speedup over the old unsupported result. Record unfavorable
rows. Existing import/solver limits do not bound all scalar work, heap bytes or
cancellation; use external timeouts and disclose this open resource contract.
No complete work-package, release, coverage, formal or fuzz campaign gate closes
from this increment alone.

The expanded current-source tests reveal two closure failures after successful
import: exact quarter-turn evaluation of the non-cardinal source circle becomes
undecided, and native replay after splitting that circle becomes undecided.
`focused-3.log` and `focused-trace-1.log` retain both failures without changing
the asserted workload. Investigate the shared scalar inverse-trigonometric proof
first (P2/P7/P18): the current recognizer handles integer pi shifts of atan but
not general half-integer shifts. Add exact signed rational/quarter-turn and
scalar-replay controls, reproduce their failure before changing Hyperreal, freeze
scalar benchmark controls, and re-run affected native/curve consumers. Do not
replace the non-cardinal source or accept Unknown in the new workflow.

The replay trace localizes the second failure to the native cylindrical face's
whole-image tangent proof. Its exact angular parameter is retained as
`a*(1+q) - (a-2*pi)*q`, with `a = atan(4/3)` and
`q = (pi-2*pi)/(2*pi) = -1/2`. The leaf-only rational query cannot certify that
composite coefficient. `replay-scalar-before-2.log` reproduces the minimized
failure without constructor simplification or approximation; attempt 1 selected
zero tests and is not reproduction evidence. The candidate scalar fix reuses
the existing bounded Laurent rational certificate after both leaf coefficient
paths in the inverse-tangent linear recognizer. Recognition failure stays
optional and does not publish a false fact. This is an exact supported-domain
extension, with no new carrier or serialization tag. Performance and downstream
qualification remain required before retention; the local recognition budget
does not establish an operation-wide work, memory or cancellation contract.

An intermediate experiment anchored each native circle at its first vertex.
It did not fix replay (`focused-5.log`) and adds a parameter-frame conversion.
Reject it: retain the original source frame and native interval, reversing
traversal through the native curve API when required. `focused-7.log` passes
all seven new workflow groups and seven existing planar groups in that form
after the scalar certificate fix. `focused-6.log` belongs to the earlier
anchored candidate and is not the final representation's qualification.

`benchmark-v1` rejects the broad rational-coefficient fallback despite its
passing focused tests: the complete existing corpora retain their output
receipts, but frustum replay costs 1.384127 times baseline and retained arc
witness replay 1.653519 times baseline. Preserve its patch, new files and all
completed comparisons. Its unrelated full scalar catalogue was interrupted
during the baseline's million-bit GCD cases; no scalar comparison from that
attempt is credited. A narrower candidate leaves the general linear recognizer
unchanged and projects one existing bounded Laurent normal form only after the
trigonometric quarter-turn recognizer fails. Its supported coefficient domain
is explicitly rational constant plus rational pi plus a rational multiple of
one retained atan argument; nonrational coefficients, unrelated atoms and
other pi powers remain unsupported. Requalify the complete BREP/arc/import
corpora and the named affected scalar benchmark groups before retention.

A final representation review identifies missing acceptance for the negative
normal-alignment branch and a non-cardinal cylinder axis. The owning mapping is
`advanced::surfaces`, with native frame/image validation authority (P8/P17–P19).
`axis_variants.py` retains five full source variants: independently reversed
circle, cylinder and cap axes, plus the exact 3-4-5 rotation
`(x,y,z) -> (x,(3*y-4*z)/5,(4*y+3*z)/5)`, and a rational-coordinate source with
axis `(0,1,1)`, reference `(1,1,0)`, and height `7*sqrt(2)` whose normalized
frame and atan argument require exact quadratic radicals. The independent reader accepts all five
with the prescribed topology, area and volume (`axis-occt-read.json`). Add their
native exact/replay assertions without changing production semantics; any newly
observed failure must be retained and resolved at its owner.

The first final qualification reproduces a Rust 1.99 deprecation in Hyperlimit's
allocation example: `AtomicUsize::fetch_update` fails the required `-D warnings`
Clippy check (`predicates-clippy-1.log`). The example owns the saturating live-byte
counter, not predicate semantics (P36/P37). Replace that update with the same
relaxed compare/exchange primitives already used by the adjacent peak counter;
this avoids requiring a newer atomic API than the root's declared Rust 1.95.
Re-run strict Clippy and the actual example. No predicate algorithm or policy
changes, and a compiler check is the missing acceptance for this maintenance fix.

The narrower candidate's first complete geometry series preserves every receipt,
but its native case-median ratio is 1.256921 (maximum 1.340681); the arc maximum
is 1.142480 for a ten-iteration cached query. All three original pairs remain in
`benchmark-v2`. Raw native processes show a common timing shift: both first
processes take about 33 CPU seconds, while later baseline/candidate processes
take about 26 seconds; the second candidate crosses between those levels.
This observation does not establish a cause or authorize dropping samples.
Before retention, perform exactly one further complete three-pair replication
of native, arc and closed-edge corpora, retaining its source identity and all
observations separately. Report the initial and replicated results and the
pooled six-pair observation; do not sample repeatedly until a timing gate passes.
