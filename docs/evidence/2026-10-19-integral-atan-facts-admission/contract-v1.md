# E95: retained integral arctangent facts

Target: d5b16c26471768ff53a59fbce8285e288c447e2f. Owner: Hyperreal's
native inverse-trig argument readers and construction metadata. P2-P4,
P18-P19, P26-P27 and P35-P39 apply.

The verified target completes all 72 original observation cases but leaves
both exact sine-square and cosine-square identities undecided in all 48
native/Real JSON/CBOR import cases. Public Real certifies all 12 cases; public
Computable certifies eight non-unit cases. Four public Computable quarter-pi
cases remain a separately identified gap. Preserve all original cases and
every already-certified fact; this extension must resolve the 48 import cases.
Stronger additional facts are allowed, never weaker or contradictory ones.

IntegralAtan(n), n a nonzero integer, denotes principal atan(1/n). Recover
its exact rational argument in the shared reader, and identify the family
as inverse trigonometry in native construction metadata. Delegate to native
rational inversion and existing sin/cos/cot and pi/atan algebraic consumers.
Do not introduce a second trig kernel or rewrite the retained input graph.
Zero-denominator import remains a typed failure; a raw zero denominator must
not produce a new argument certificate.

Acceptance: exact independent identities for signed unit, ordinary and large
integer denominators; sine/cosine signs and squares; periodic and half-pi
compositions; native arithmetic/order consumers; cold/warm and concurrent
facts. Test native/Real JSON/CBOR, CBOR Values and collections, outer scales
including zero and sign reversal, and following arithmetic/cotangent. Preserve
the existing typed invalid-input tests. The new regression must fail against
the unchanged parent. Replay all 72 original observation cases without
removing the separate four public native quarter-turn cases.

Interchange migration: an operation consuming a newly recognized argument
may now produce an existing algebraic carrier instead of an opaque trig node.
This is an explicit representation change accompanying stronger proof, not a
performance-only change. The exact value and source IntegralAtan wire graph
must be preserved. Existing decoders use the same format and existing tags.
The 24 captured prior derived outputs must remain consumable from both JSON
and CBOR and enclose independent exact-source bounds. New derived outputs
must round-trip with their exact facts where represented, and serialize
deterministically. No topology or analytic-surface fidelity follows from this
scalar evidence.

After final edits run focused interchange tests, default/all-feature release
scalar suites and doctests, debug units, strict all-target Clippy, warning-denied
docs/fmt, affected predicate/curve/modeling consumers and Rust 1.95 checks.
Retain the original high-precision and ordinary strict-workflow fixtures.

After validation exits, measure the unchanged ordinary 17-row corpus at
100000 iterations and five alternating parent/candidate pairs. Add 96 native
rows: denominators 1 and 2 x public Computable, imported Computable, public
Real and imported Real x sine and cosine x p=0,-32,-128 x cold construction/
evaluation and warm evaluation. Each row has 10000 iterations and five pairs.
Every completed value must enclose independent MPFR square-root bounds;
oracle setup is excluded consistently. The matched contract is completed
scalar construction/evaluation with valid enclosures. Stronger exact identity
completion is reported separately, never an Unknown counted as a successful
exact proof. Preserve flags/dependencies, allocation/byte/peak/retained-memory
metrics, executable sizes and every unfavorable result. No general speedup
claim. A failed comparison is retained and classified, never hidden.

The separate public native quarter-pi gap, general domains, full-width
precision, fallible native evaluation/cancellation, internal resource bounds,
formal/exhaustive coverage, complete CI, shipped distribution and foreign
consumers remain open. Hypervoxel is excluded. No push.

Use the authorized artifact volume with no retained-artifact quota and a
1 GiB physical free guard. Preserve original root/Disk B/tmp baselines and
200 MiB cumulative logs. Child address space: 8 GiB; Cargo jobs: 2; query
limit: 60 seconds; compile/full checks: 1800 seconds. External containment
does not establish an internal work or heap bound. Preserve every attempt
and executed helper; hash every physical path independently.
