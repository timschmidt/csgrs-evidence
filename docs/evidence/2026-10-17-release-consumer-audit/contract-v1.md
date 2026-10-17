# Release consumer audit contract

Owner: package/distribution metadata and public installation documentation.
Properties: P37 and T12, with the shipped-user-path acceptance boundary in
docs/admission.md. This audit does not alter geometry, policies or evidence.

Target: the current committed CSGRS 0.23.0 manifest and README. Missing acceptance
evidence: Cargo's actual package inventory and resolution of the documented
dependency in a clean project outside the workspace, without workspace patches.
Reproduce those findings before proposing a manifest or documentation change.
An offline cache miss does not establish public unavailability. Registry claims
require a successful current response from the official registry/index or a
successful index update followed by an explicit version-resolution diagnostic.

Use a fresh output root at /run/user/1000/csgrs-release-consumer-audit-v1 and
control files under target/properties/release-consumer-audit. Retain every
stdout/stderr byte in gzip streams, command/environment/timing/exit records,
public registry responses, source pins, failures and provisional findings.
Do not reuse a closed output root or modify any earlier evidence. No publish,
push, dependency download/build, archive assembly, or geometry run is intended.
Cargo metadata and lockfile resolution may access the registry and write only
the fresh Cargo home/consumer outputs; the package listing uses offline Cargo.

Containment: 180 seconds per diagnostic command, 8 GiB child address-space
limit, at least 2 GiB host available memory, 512 MiB repository-filesystem free
space and 256 MiB runtime-filesystem free space. Stop at 64 MiB raw command
output, 8 MiB compressed logs, or 24 MiB total fresh runtime output. These are
external monitored limits, not a claim about Cargo's internal memory bounds.
Control/evidence planning allowance is 8 MiB. Preserve interrupted output and
report resource exhaustion distinctly from a substantive package failure.

An exclusion change, if supported by the inventory, must identify its package
content migration. Preserve every previously listed file outside the named
exclusion, all Rust source/tests/examples and their referenced assets. Verify
the actual before/after Cargo inventory and required relative include paths.
Do not call a package list a packaged build or a release qualification.

A README correction must match the observed distribution and preserve its
Rust quickstart verbatim. Use existing README contract checks where executable;
source and formatting review cannot substitute for the remaining clean external
construct/transform/compose/certainty/topology/export/reimport acceptance run.
The cache proposal, full runtime qualification, MSRV and all feature/binding
release gates remain open unless independently executed and recorded.
