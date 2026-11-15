# Reproduce the outstanding full-board native CI gate

Phase14 coordinated native qualification; P1/P4/P6/P10/P17-P20/P27/P36-P37.
First reproduce the unchanged HyperDRC KiCad smoke corpus/120-worker-second gate
on current accepted CSGRS, excluding unaccepted pending extraction. Do not change
fixtures, thresholds, scalar policy, predicates, ordering or spatial index.
No implementation is selected or edited yet. Current failure and measured owning
paths must justify any subsequent change and its acceptance witness. Prior
nonconsecutive adjacency shortcut is rejected; do not repeat it without new evidence.
Retain original typed outputs and exact evidence; all primary patches and68 prior
frozen stages must stay unchanged. No push/publication.

Current accepted-tree full-board witness fails at130.443995189 worker seconds
against unchanged120 seconds. Both tracked original archives were present and
hash-bound; the run did not skip inputs. No performance fix is claimed.

A distinct qualification defect was confirmed by source inspection: missing
archives, failed unzip and unavailable unzip all become Option::None and continue
past the full-workload tests. HyperDRC's package include list intentionally excludes
docs fixtures, so preserve optional missing assets for package-only tests. Introduce
an explicit required-fixture mode for native workspace CI, and fail every extraction
error when an asset is present. Owner is cfg(test) fixture loading and workflow
validation, not geometry. Before edits reproduce missing-required and unavailable
extractor cases in fresh child processes, plus malformed-archive handling. Positive
extraction and optional packaged absence remain controls. No original real archive,
smoke check,120-second threshold, policy or production executable body may change.
CI changes require whole-repository pedantic strict-collection Zizmor. Record the
still-failing real performance test separately from repaired validation behavior.

The original helper fails both new witnesses before repair: required missing
assets, an unavailable extractor, and a corrupt archive are silently skipped.
The final child-process corpus also covers an empty required-mode value and an
unavailable extractor with required mode absent. Optional missing input remains
an explicit skip; a valid synthetic archive retains its payload bytes exactly.
No process-global environment mutation is used.

Scope is the shared app smoke-test archive helper and the workspace test job.
The separate layer-level unzip_fixture_entry helper remains unchanged; these
app-level tests make missing/corrupt whole archives fail the full workspace job,
but this patch does not claim to harden every separately filtered fixture test.
Packaged-archive absence remains optional only at the repaired helper; no claim
that every existing packaged-crate test passes without external assets is made.
