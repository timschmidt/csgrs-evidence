# Machine-profile ingress module and interval-only experiments

All seven variants are rejected. No production source from this record is
retained. The fifteen-phase interval-refactor goal remains active.

## Scope and source identity

Primary CSGRS is f5ba9ce9be2a5ad8c589a5cbc2e2a983d6313914. Its difference
from isolated source 3e4382664d50a7734d3fbef33b0a5da0c5ac22ef is ledger/index
only. Interface source is ff668ca39d5e1ecee91b438b20eca806f3a26f29.
The pending 41-path extraction and eight Interface edits were excluded from
these experiments and preserved. BASELINE.json and RESTORED-STATE.json record
the patch digests. The initial untracked scalar test in the isolated cost
tree was this experiment's missing-API witness, not unrelated user work.

Hyperreal owns canonical rational reduction; Hyperinterval owns the closed
nominal-plus/minus set; Interface owns units, nominal values, configuration
identity and machine validation. See each variant's CONTRACT.md for its
pre-edit hypothesis. Relevant P1, P3-P6, P8-P10, P17-P20, P27, P31-P33 and
P36-P37 contracts are unchanged. Arbitrary finite rational nominal values and
the full unsigned numerator/nonzero denominator domain remain required. No
bounded-work guarantee is introduced for arbitrary rational arithmetic.

## Rejected variants

| Variant | Decisive observation |
| --- | --- |
| New typed scalar wrapper in child module | borrowed_ops 6,463,088 to 6,463,208 bytes (+120); .text +48, GOT +8, relocations +24 |
| Same-module include | borrowed_ops 6,463,216 bytes (+128); .text +48 |
| Scalar wrapper through existing public ingress | borrowed_ops 6,463,128 bytes (+40) |
| Interval-only infallible constructor | profile 806,000 to 806,440 bytes (+440) |
| Inline only new interval entry | profile 806,408 bytes (+408) |
| Static invariant panic instead of formatting scalar Problem | profile 806,136 bytes (+136) |
| Interval entry propagating existing scalar Result | native 805,904 bytes (-96), WASM 1,064,948 bytes (+40): rejected |

Fresh baseline borrowed_ops exactly reproduces the previous artifact's hash.
For the child-module variant, disassembly and relocations show an existing
Rational::fraction direct five-byte reducer call becoming a six-byte indirect
GOT call. Existing functions consequently grow. Preserving their source lines
does not preserve compiler linkage or artifact size. Same-module inclusion
also fails the gate. The later interval-only variants leave Hyperreal source
entirely unchanged.

The inline infallible interval variant links a new Problem Debug formatter and
associated data through expect. Removing that formatting reduces the overhead
but the static panic variant still grows. The final scalar-result design
returns the existing hyperreal::Problem; Interface's original Arithmetic cause
mapping preserves it. Input types establish nonnegative radius and nonzero
denominator; all valid constructions still must succeed exactly. No unsafe,
substituted result, suppressed error, weakened test or new error variant was
used. Full final source and patches are retained in interval-scalar-result.

## Final scalar-result qualification

The final owner source passes three new tests and four existing rational tests
in debug, release and ASan builds. The tests include 7,497 independently
cross-multiplied small endpoint cases, 35 full-width unsigned boundary pairs,
a 1,200-digit nominal, Debug equivalence, zero radius and subsequent exact
operations. The Interface migration tests cover 7,497 normalized wire cases,
subsequent division/positive-lower decisions, typed invalid input precedence,
and fresh-process cold/warm traces under STRICT and APPROXIMATE_512. Three
migration tests pass. The final full Interface run passes 201 unit tests, one
integration test and one compile-fail doctest. Final affected-owner Clippy with
-D warnings and rustdoc with warning denial pass. Logs and command records
are retained. The final Rustdoc sentence change does not change executable
production statements; the separate trace run precedes that sentence only.

Native full profile fields, complete identities and raw allocation totals match
baseline. The harness contains six successful profiles and one expected typed
invalid profile. Native .text shrinks 441,831 to 441,719 bytes; the union of all
defined sized function ranges shrinks 438,574 to 438,468. Aliases/overlaps are
counted once, and unsized symbols are reported separately. The final attributed
successive_operations artifact is 21,930,560 bytes in both cases, with
byte-identical .text; complete binary hashes differ due to embedded source
identity. Its runtime campaign was not run after the WASM failure.

WASM replay matches every corresponding native transcript, rejects invalid
indices and performs zero host calls. Its 40-byte growth fails the unchanged
size gate. Recorded Wasmtime fuel increases by 132 for each successful profile
and 30 for the expected invalid profile. Fuel is an interpreter work metric,
not a browser latency measurement. The native size reduction does not waive
this regression. No final scalar, measurement or successive-operation runtime
campaign was executed, and no full benchmark, coverage, MSRV, browser, release
or pre-push acceptance is claimed.

## Frozen dependencies and restoration

The shared profile/WASM harness, pinned locks and baseline raw transcripts are
in the preceding immutable record docs/evidence/2026-11-13-interval-machine-profile,
evidence commit f1d491d7627331dcb4b3a46ef1568e92049fd60c. Current builds used
--frozen with external Cargo target directories; the preceding record's digest
is verified unchanged. immutable-stages-verified.json also verifies six other
prior stages. None was modified. ELF inspection was read-only.

All three isolated worktrees are restored cleanly. Restored validation passes
four rational tests, 199 Interface unit tests, one integration test, one
doctest, and workspace formatting in both repositories. Main retains the same
41 staged paths and no unstaged edits; Interface retains the same eight edits;
firmware remains clean. No push was attempted. Compiler executables are moved
outside this source/log record with hashes and original paths recorded in
excluded-compiler-artifacts.json. Source, unfavorable results, build attribution
and all acceptance logs remain. Archive/ledger registration is metadata only,
not implementation completion.
