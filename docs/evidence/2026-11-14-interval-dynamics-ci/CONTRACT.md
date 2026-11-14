# Hyperdynamics continuous qualification

Owner: repository CI/distribution, P35-P39 and admission's shipped-user-path;
Phase14 whole-stack feature qualification. At current retained3adf18482, no
workflow names Hyperdynamics. Workspace checks use default features, and the
workspace test crate list omits it. Feature-gated field, Taylor, reachability
and coordinate algorithms therefore lack their own continuous runtime gate.
Static workflow inspection plus a default-feature execution are the missing
acceptance witness; existing one-off logs do not close continuous qualification.

Add a dedicated workflow with MSRV1.95/stable feature-isolated target checks,
no-feature/all-feature tests, strict Clippy, docs, release tests and fuzz-target
compilation. Reuse the actual current package/tests without weakening any fixture
or success requirement. Preserve isolated feature compilation (not only all-features
unification), execute benchmark smoke tests with test mode, and record exact
commands/results. All dependency-owner paths must trigger this workflow.

This changes no mathematical implementation or operation order. No performance
claim follows. Use a clean isolated checkout; preserve main's41 pending paths,
Interface's8 pending paths and39 frozen stages. Run every new local workflow
validation command plus repository-wide zizmor --pedantic --strict-collection.
Hosted action execution, platforms not declared by this workflow and entire
repository pre-push validation remain separate. No push/publication.
