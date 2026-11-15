# Current interval boundary witnesses and coverage

Disposition: retain nine tests in CSGRS source commit
36a091faed15475b730af9b1601ce7ef185e72f0. Production source, crate manifest,
workspace lock and every existing assertion remain unchanged. The complete
15-phase goal remains active. This record closes missing conformance witnesses,
not full coverage or migration/release acceptance.

## Reproduced gap and retained tests

ADMISSION.md identifies the owner, domain and properties before edits. Fresh
Rust 1.95.0 instrumentation of all-feature library and integration tests measured
4,658/4,740 production lines. The new tests exercise:

- Owned rational endpoint extraction, exact reconstruction and subsequent addition.
- Positive empty product/quotient composition, including invalid counterparts that
  must remain typed failures even when paired with empty operands.
- Empty integer products at every supported storage width and subsequent use.
- Empty fixed rescaling/reflection, invalid scale and zero-denominator precedence.
- Empty affine proposals and strict float enclosures with nonfinite arguments.
- Exact neighboring float endpoints versus touching endpoints and further affine use.
- Empty/singleton split and extended function chains with zero/one expectations.
- Empty rational trigonometric images at extreme requested grids and zero budget.
- Distinct public error messages and preserved typed scalar Error::source.

The witnesses use exact set identities, independent integer/rational expectations
and exact special values. They do not use wrappers around one algorithm as their
only oracle. All prior assertions and hard cases are preserved. The new witnesses
pass on the unchanged production implementation; this is missing test coverage,
not a claimed behavior repair. One initial test-only import used the wrong public
float type names; its E0432 log remains, followed by the corrected passing run.

## Measurements and limitations

| Native production metric | Baseline | With new witnesses |
| --- | ---: | ---: |
| Lines | 4658/4740 (98.270%) | 4688/4740 (98.903%) |
| Regions | 9270/9891 (93.722%) | 9320/9891 (94.227%) |
| Reported functions | 493/494 | 494/494 |

The source denominator is identical. Raw reports include all Hyperinterval src
files. Only the two cfg(test) modules ieee_tests.rs and dyadic_quotient_tests.rs
are removed from the separately named production subtotal. No uncovered production
path is excluded. Generic/macro instantiations can produce reported misses not
represented by a single zero-count LCOV line; retain both formats and their
original counts. Fifty-two reported production lines remain uncovered. Some
locations are explicit unreachable guards or platform-specific rejection; others
need further analysis and witnesses. No blanket unreachability claim is made.

Both exports warn about16 mismatched profile functions. The diagnostic dump
identifies every mismatch as Rug's OptRational::parts, hash0, outside the owner
production denominator. The diagnostic command exits0; its raw stdout/stderr are
retained. Native branch counters are absent: neither branch coverage nor universal
correctness follows from these metrics. Reported 100% function coverage is limited
to the instrumented function denominator, not arbitrary generic instantiations.

## Qualification

checks.json records10 successful commands: all-target/all-feature tests,
no-default tests, strict Clippy at all-feature and no-default boundaries, release
witnesses, warning-denying docs, examples/benches checking, workspace formatting,
Rust1.88 primitive witnesses and stable all-feature witnesses. feature-checks.json
records7 successful isolated feature runs for integer, fixed, proposal float,
strict float, dyadic, rational and rational+dyadic. Main-tree focused witnesses,
workspace formatting and repository budget checks pass after integration.

Fresh full instrumented baseline and candidate suites pass. Coverage/compile
runtimes are not performance measurements. Production-unchanged.json binds every
production source file and the crate manifest/workspace lock to accepted parent
2e6787fb61b4339cd864b34d18112cc668229f8d. This test-only change does not modify
consumer code, executable algorithms, predicate order, dependencies or policies;
no downstream performance claim or fresh broad benchmark/fuzz/HIL/pre-push campaign
is made. No CI configuration changes occur. The earlier full fuzz and platform
records are not relabeled as new execution.

The primary41 staged extraction paths remain byte-identical. Interface's eight
pending files and clean firmware remain unchanged. All67 preceding frozen stages
verify. No push/publication occurs. Source integration and final-state receipts
record these checks rather than relying on the prose alone.

## Reproduction and retained artifacts

Use accepted parent plus source.patch, or the recorded source commit, at the
isolated source path in commands. coverage.py builds/runs with fresh profile
paths and instrument-coverage, then uses the matching Rust toolchain's llvm-profdata
and llvm-cov. inspect_coverage.py derives the explicit production subtotal and
uncovered LCOV lines. checks.py and feature_checks.py retain exact commands,
working directories, compiler versions and feature scopes.

Run writers only in a writable copy. Large coverage exports, LCOV and merged
profdata are losslessly gzip-compressed in this record; decompress the named
.gz file to its original name before reusing the analysis commands. All original
sizes/hashes are in compressed-artifacts.json. The bulky unmerged profile archives
remain outside the record at paths/hashes in raw-profile-storage.json; the initial
packer applied gzip twice to those tar files, so decompress two gzip layers then
untar if those individual profiles are needed. Merged profdata, exports, source
patch, exact commands and logs remain archived and suffice to reproduce the
reported aggregate from the matching instrumented objects, or rerun from source.
Instrumented executable objects remain in the build directory outside evidence.
