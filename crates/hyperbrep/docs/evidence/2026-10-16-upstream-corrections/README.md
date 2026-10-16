# Concurrent upstream corrections

This merge integrates `f1dab2248` (exact Hilbert trimming) and `72cd216cc`
(typed gear/airfoil failures) into `brep`, whose first parent is the qualified
analytic STEP export increment `5027ba731`. Both histories are preserved.
[premerge.json](premerge.json), [contract.md](contract.md) and
[integration.json](integration.json) pin the parents, ownership and checks.

The merge applied without conflicts. All eight relevant BREP/dependency crate
trees were unchanged before this integration's local documentation was added.
The root agent rules, properties and admission protocol match both parents.
Manifests and lockfiles did not change. The root property ledger matches
upstream outside its HyperBRep current-work entry. Both parked stashes remain
intact; neither has been restored.

## Guidance for subsequent BREP development

The new root gear, rack and NACA airfoil entry points return typed failures;
contextual forms preserve `GeometryOutcome`, and solid gear wrappers aggregate
receipts. These changes preserve the existing sampled sets, resolutions and
NACA coefficient values. They do not certify fidelity to analytic source shapes.

Hilbert infill now exposes native `CurvePathRegionTrim2` records through
`hilbert_paths[_with_context]`, including source/selected parameters and contact
evidence. Its geometry-only string projection is fallible and does not approximate
selected endpoints. Its domain is orders 1–10 with nonnegative padding; padding
insets grid bounds and is not a clearance guarantee. Invalid, undecided,
unsupported and successful empty outcomes remain distinguishable.

Future BREP consumers must preserve these failures and native trim records.
The [development plan](../../DEVELOPMENT_PLAN.md#implementation-scope-and-concurrent-development)
records the concrete integration guidance and continued BREP/IO ownership.
The upstream contracts mention separately pending native work in another thread;
these two commits do not contain or admit that work. No surrounding
implementation repair was necessary for this integration.

## Qualification on the merged source

All 24 commands in [attempts.json](attempts.json) pass, with identical relevant
source hashes before/after each command and against [final-source.json](final-source.json).
[qualify.py](qualify.py) records the feature configurations and external timeouts;
[manifest.json](manifest.json) summarizes the actual scopes.

| Check | Observed result |
| --- | --- |
| BREP/IO all features | 424 tests pass in debug and 424 in release |
| BREP/IO minimal features | 416 tests pass in release |
| BREP/IO strict lint and docs | All-target Clippy in both configurations and warning-denied rustdoc pass |
| Examples and independent STEP reader | Five release examples pass; OCCT 7.9.3.1 accepts seven analytic exports with expected topology and floating-point mass properties |
| Fuzz targets | Compile; no runtime campaign credited |
| WASM | 30 probe groups run in Wasmtime 38.0.0 with zero imports |
| New upstream acceptance tests | All 15 pass with curve-only features and all 15 with all features |
| Root lint/docs/callers | All-feature release all-target Clippy, warning-denied docs, one doctest, both changed benches and the changed example build pass |
| Formatting and whitespace | Workspace formatting passes; staged code/documentation whitespace is audited separately from preserved raw evidence |
| Retained benchmark build | Exact preceding build command succeeds; all ten measured executables match byte-for-byte |

Counts overlap across configurations. The BREP suites retain the explicit
uniform-scaling frontier test; their passing count does not mean that unsupported
workflow now succeeds. Independent floating-point STEP interoperability does not
prove exactness or full EXPRESS/AP conformance. WASM uses workspace path
dependencies and does not establish a shipped JavaScript/package consumer.

## Retained performance and artifact evidence

[retained-artifacts.json](retained-artifacts.json) verifies the feature sets,
sizes and SHA-256 digests of all ten executables against the preceding
[analytic export campaign](../2026-10-16-step-analytic-export/manifest.json).
All seven complete analytic STEP files also match the preceding artifacts
byte-for-byte. No fresh timing campaign was run: the existing 115-case corpus
and eight new workload measurements describe those same executables under
their original conditions. All adverse samples and earlier timing exceptions
remain historical evidence; binary identity does not establish new-host costs
or a general speedup.

The [final audit](audit.json) verifies local documentation links, JSON, open
gates, exact imported paths and preservation of the shared ledger. Inherited
raw evidence with whitespace diagnostics is retained byte-for-byte and recorded
separately from code/documentation checks. A preliminary record-generation
attempt used an invalid Git index-directory query; it failed before generating
the manifest. The corrected generator compares indexed file changes against
the pinned parent. No implementation or validation result changed.

The audit initially assumed every imported file equaled upstream. The root
README also retains this branch's earlier three-line BREP introduction. The
corrected audit independently recomputes that clean three-way merge and checks
all other imported paths byte-for-byte against upstream; it does not discard
either parent's documentation.

All 28 work-package gates remain open. Native analytic similarity transport
still needs frames, dimensions, charts, pcurves and certificates transported
coherently; other analytic/spline/void/assembly exchange and the broader CAD
operations remain plan work. This scoped integration does not claim full
workspace/pre-push, published-package/MSRV/binding, runtime fuzz/ASan/lexicase,
coverage, formal-verification or internal resource-bound admission. No push.
