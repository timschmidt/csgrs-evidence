# Root package evidence boundary

Owner: CSGRS package/distribution metadata. Properties P37/T12 and the shipped
user path in docs/admission.md. The previous root package inventory stopped at
180 seconds without output; no package membership claim was established.
The current committed tree contains 530,131 files, including 444,997 historical
evidence files totaling 9,504,833,764 Git blob bytes. This is a Git inventory,
not yet a Cargo package inventory.

Reproduce Cargo's actual package inventory on the current revision before
changing package metadata. The new diagnostic allows 900 wall seconds because
the previous inventory was incomplete. A completion here must not be credited
as passing the earlier 180-second resource allowance or as a speedup. Preserve
the previous stop and every new failure. Do not alter geometry or performance
workload contracts.

If Cargo includes historical docs/evidence contents, propose an explicit root
package exclusion for that directory. This is an intentional source-distribution
content change, not a performance-only optimization. Every evidence file remains
in the repository and in its original physical output roots. Mathematical
evidence produced or consumed by library APIs is outside this change's scope.

Acceptance requires complete before/after Cargo inventories: exactly the named
historical-evidence paths may disappear; every other previously listed path
must remain. Preserve source/test/example/benchmark bytes and referenced
compile-time assets. Generated Cargo manifests intentionally reflect the new
exclusion. No API, policy, geometry, certainty or runtime provenance changes.
Verify metadata, formatting, whitespace, and affected source/asset membership.
Do not claim archive assembly, package build, external consumer completion,
MSRV, feature/binding qualification, or release readiness from file lists.

Use fresh roots target/properties/package-evidence-boundary and
/run/user/1000/csgrs-package-evidence-boundary-v1. Reuse only the frozen prior
audit runner's definitions, with explicit new paths and resource constants;
retain the generated runner as a separate immutable physical file. Retain all
stdout/stderr bytes as gzip streams plus commands, toolchain and source pins.

External containment: 900 seconds per command, 8 GiB child address space,
at least 2 GiB host available memory, 512 MiB repository-filesystem free and
256 MiB runtime-filesystem free. Stop at 256 MiB raw command output, 12 MiB
compressed logs, or 16 MiB fresh runtime output. Control and committed evidence
have a separate 16 MiB planning allowance. Monitored limits may overshoot
between observations and are not internal Cargo bounds. No compile or crate
archive assembly is authorized by this diagnostic plan; later qualification
will use a separately declared fresh root and adequate capacity.

The full properties plan, unpublished dependency graph, original cache proposal,
and complete external-consumer/release acceptance remain open.
