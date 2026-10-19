# Bounded parameter encodings: verification

Baseline `2aaf10dea`, branch `hyperspatial`, 2026-10-19. This increment preserves
exact bounded-parameter identities through cold JSON/CBOR replay across all
22 scalar families, then consumes the recovered values in geodesy and local
frames without losing qualified input provenance. Hyperreal owns the domain
and identity proofs; Hyperspatial owns the downstream workflow and receipts.
The [native admission](../../../hyperreal/docs/admission-bounded-parameter-encodings.md)
and [spatial contract](../../docs/admission/e2-parameter-encodings.md) retain
failed variants, exact domains and resource obligations. No Thompson map,
selected inverse or external runtime backend is added.

[Commands](commands.json), [process exits](process-exits.json),
[source metadata](source-metadata.json), the [source freeze](source-freeze.json)
and [test counts](test-counts.json) identify the executions. All **741 frozen
paths** match the integrated target and remained unchanged during final
validation. The [integration record](integration.json) and
[root checks](root-validation.json) record fifteen passing checks after copying
the candidate. The [raw archive](raw-logs.tar.gz) includes source snapshots,
failed diagnostics, earlier frozen experiments, complete campaign inputs and
logs; the [manifest](raw-log-manifest.json) supplies sizes and SHA-256 hashes.
Later forward-map experiments are excluded from this increment.

## Completed checks

- Stable Rust 1.99.0 and minimum Rust 1.95.0 each pass **206 spatial executions
  in 51 suites** across no-default and all-feature configurations, including
  sixteen doctests. Both pass eight independent README source consumers,
  strict all-target Clippy, rustdoc, fuzz-target check/Clippy and benchmarks.
- Hyperreal passes **1,229 executions in 42 suites**, Hyperlattice **239/23**,
  Hyperlimit **366/19**, and affected Hypercurve suites **68/3**. Hyperreal's
  library passes **965 tests** on both compilers. The MSRV native checks also
  pass seven scalar integration suites (58 tests), three complex suites (33)
  and six predicate representation-inventory tests. The unchanged-source
  [preflight record](reused-preflight.json) identifies reused checks explicitly.
- All four primitive-cache configurations pass **640 executions in 128
  suites**, followed by strict Clippy. The two added spatial tests require
  **1,496 workflows**: 968 pair/sign/warming cases and 528 boundary/regime/time
  cases. Their exact ECEF/local-frame assertions and inherited qualification
  remain unchanged in each configuration. Optimized test runs retain debug
  assertions and overflow checks.
- Both compilers pass strict all-target/all-feature Clippy for Hyperreal,
  Hyperlattice, Hyperlimit and Hyperspatial. Native documentation and spatial
  WASM check/Clippy pass. WASM compilation does not establish a JavaScript
  binding or published distribution.
- [Stable](bench.json), [MSRV](bench-msrv.json) and
  [standalone](bench-standalone.json) proof benchmarks each complete **220 rows
  and 2,200 accepted evaluations**. Three exact zero certificates are materialized and checked after timing. Cold payload reconstruction and
  retained-certificate reuse have distinct timing boundaries; shared constants
  may already be warm. The earlier affected spatial/scalar/complex benchmarks
  also pass. No external-library speed ratio is inferred.
- The [standalone measurement](benchmark-resources.json) takes **0.729099
  seconds**, peaks at **19,380 KiB RSS** and uses a **2,662,224-byte executable**,
  SHA-256 `03c545055081dd0451953a4ca8fd847dcf5bc606c8cb6a52f4e8c8a45c5da4da`.
  This includes native proof and development serialization work and excludes
  compilation; it is not an allocation count or production-only binary size.
- [Directed selection](directed-report.json) completes **176 cases in 22
  independent representation buckets**, retaining **43 selected inputs** with
  no failures. The [ASan campaign](asan.json) advances **INITED 267 → DONE
  11,268** in 61 seconds, with 219 supplied and 740 final corpus files, 669
  active entries, 628 MiB final RSS and no new failure artifacts. Short ignored
  inputs also count as runs. The existing ten-second per-input and 2,048 MiB
  RSS limits are external containment, not native work/heap guarantees.

[Coverage](coverage.json) passes all fourteen independent 95% line floors:

| Scope | Covered / executable lines | Coverage |
| --- | ---: | ---: |
| Hyperspatial | 1875 / 1902 | 98.58% |
| Inverse isometric, physical lines | 136 / 140 | 97.14% |
| Complete changed Real atan2 functions, physical lines | 42 / 43 | 97.67% |
| Deferred atan constructor, physical lines | 13 / 13 | 100.00% |
| Carlson | 232 / 235 | 98.72% |
| Forward Legendre | 137 / 138 | 99.28% |
| Inverse Legendre | 170 / 178 | 95.51% |
| Jacobi and log-argument helper | 234 / 237 | 98.73% |
| Complex Jacobi/epsilon | 103 / 103 | 100.00% |
| Shared square quotient | 40 / 40 | 100.00% |
| Native relation helpers | 870 / 897 | 96.99% |
| Complex elementary / atanh | 36 / 37 | 97.30% |
| New parameter-domain helper | 156 / 157 | 99.36% |
| Complete changed shared-ring functions, physical lines | 101 / 103 | 98.06% |

The coverage driver passes **1,127 executions in 37 suites**. Hyperspatial
measures 2,576/2,754 regions and 201/201 functions. These are the named
production subsets, not whole-Hyperreal or whole-Hyperlattice coverage. No
existing denominator was merged away or reduced to admit the new helpers.
Stable branch coverage and the 100% target remain open.

LLVM 23.1.1 reports 708 missing-profile/hash-mismatch records during the
combined-object export; the preceding increment already retained this class
of warning (741 records). The retained audit finds 121 unique names, all with
hash zero in the warning and matching nonzero-hash records in the merged
profile. None names Hyperspatial or the ring recognizer. This is consistent
with this compiler's [unused coverage-record construction](https://github.com/rust-lang/rust/blob/b940084d7eb6a299eb4bfeb8e34901bc051e7ac4/compiler/rustc_codegen_llvm/src/coverageinfo/mapgen/covfun.rs#L56),
which distinguishes unused copies from the instrumented definitions. The
additional `llvm-cov --dump` diagnostic printed all 708 records then terminated
with SIGSEGV; that tool failure is retained. Repeating ordinary export exits
zero and reproduces all 34 reported per-file metrics exactly. The focused
helper measurement independently agrees. No warning suppression or denominator
change was introduced, and warning-free LLVM diagnostics are not claimed.

## Preserved meaning and failed experiments

For 0 <= m < 1, r=sqrt(m/(1-m)) must recover h=1/(1+r*r)=1-m. For -1<v<1,
a=v/sqrt(1-v*v) must recover a/sqrt(1+a*a)=v. For -1<=u<=1, tau=asin(u) must
recover sin(tau)=u. Principal-root signs are part of the proof; squaring alone
does not choose a branch. Cold decoded fields must re-prove domain obligations
without trusting serialized flags or substituting numerical closeness.

Before integration, the four public tests are reproduced against clean
`2aaf10dea`: three fail on Pi certificates and the boundary test passes.
The retained native investigation includes missing root-atom proofs, exhausted
degree attempts, an invalid cold-root fixture assumption, loss of serialized
domain evidence, and a parallel-test shared-constant-cache assumption. One
intermediate strategy also breaks two existing complex-Jacobi norm workflows.
The final implementation runs the original native strategy first and only
then tries root completion with the **same remaining** node/work budget.
Clearing strategy-local atom identities never replenishes that budget.

The additional zero proof partitions a residual as P-Q with P,Q nonnegative
and proves P²=Q² under admitted relations. Exact polynomial division may
remove a common factor when the remaining quotient is provably one; it does
not assert that the discarded factor is nonzero. Admitted rational root
squares collapse during multiplication before the unchanged degree cap is
exceeded. Coefficient, atom, term, depth, work and cancellation guards remain.
Only a completed top-level proof publishes a reusable certificate; authoritative
expressions and serialized values remain unchanged, and no node tag is added.

Eighteen private guards and four public integration tests cover exact domains,
unknown/opposite branches, nonidentities, zero, limits, cancellation/recovery,
JSON/CBOR, concurrency and low/high/low precision. The spatial workflow then
requires exact equatorial ECEF and anchored ENU/NED identities and preservation
of qualified source provenance. The initial 133/157-line domain coverage miss
is retained; the missing arithmetic, coefficient-growth and zero-domain cases
were added instead of weakening its floor.

## Limits

Pedantic strict zizmor reports no findings; offline execution omits its
network-dependent audits. No push was made. The complete repository pre-push
matrix, hosted-only actions, published distribution, new bindings, connected
formal proof, physical model accuracy and native total-work/heap bounds remain
open. Finite coverage and sampled performance do not close those obligations.
