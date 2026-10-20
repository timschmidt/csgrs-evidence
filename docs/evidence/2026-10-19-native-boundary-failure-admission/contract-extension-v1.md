# E103 extension before implementation

The baseline proved an additional affected consumer under P4/P19/P25:
AttributedMesh stores errors in an Arc<OnceLock<Result<...>>>. A triangle with
height pi minus its -1024-bit lower rational enclosure first fails export.
After proving the same height positive at -1100 bits, native export succeeds
but the sidecar still returns its old error. This is an actual public operation,
not an injected cache failure. Retain only successful immutable exact buffers;
clones and metadata remapping may share successes. Authored normals retain their
existing rendering-only contract. Test cold/warm/stronger proof, repeated calls,
clone/map sharing, independent geometry after mutation, and concurrent callers.
No cache reset/disable API exists for this per-carrier cache; entry and heap-byte
bounds are not introduced. One success per shared carrier lives with its owners.

Hypermesh owns the distinction between proven degeneracy, undecided normals,
and scalar normalization errors. Preserve the scalar cause and Eq on GpuMeshError.
The scalar owner, hyperreal::Problem, currently derives only PartialEq despite
all variants being reflexive unit error tags. Add Eq there so the native error
can retain Problem without weakening its existing trait or duplicating tags.
This is an additive scalar trait contract; it changes no numeric algorithm.

CSGRS carries native GPU causes through ValidationError and AdapterError. Native
index errors and proven degeneracy remain invalid; undecided errors retain that
category. Resource failures retain resource classification. Attribute projection
failure remains a separate native variant; it alone does not prove malformed
source geometry. Point arithmetic delegates existing Problem conversion and
makes no new claim about closed-mesh unboundedness. Record Rust variant/signature
and ABI-category migration explicitly. AttributedMesh exports return owned errors
so a transient error need not be retained to provide a borrowed reference.

Baseline private helper coverage proves both mesh-query causes are flattened.
Current public translated/rotated curve construction probes succeeded; do not
claim public failure coverage for those helpers. False validation results retain
their existing modeled geometry failure, without inventing a native cause.

Baseline public test v1 made one incorrect control expectation: a rational
noninteger normal reports Hyperreal(NotAnInteger), not NotExactInteger (which
applies when exact rational extraction fails). Preserve that observed API in v2;
the independent exact normal rows, fixture, and rejection remain required. The
v1 raw failure and orchestrator assertion are retained, not counted as a product
regression. V2 must reproduce the five actual public regressions before edits.

All other E103 scope, policies, original fixtures, resource contracts, archival
requirements and exclusions remain in force. Run affected native GPU/scalar
checks, full root minimal/default suites, attributed configuration, FFI and real
C/C++/Python consumers, strict Clippy, compiler-floor checks and formatting after
the final edit. Public release and full provenance remain open.
