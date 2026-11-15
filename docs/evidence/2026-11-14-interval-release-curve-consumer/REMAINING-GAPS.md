# Remaining release scope

Inspected scripts/release-check.sh and the 21 release manifests at
90bf46b37b73b88938090012db1d563c7eca2cd6. The retained change adds one maintained
archive consumer; it does not close Phase 14.

- Documentation is built from the workspace before archive extraction. The
  script applies docs.rs feature settings, but not arbitrary rustdoc-args.
  In particular, HyperDRC metadata declares `--cfg docsrs`. The wording in
  docs/RELEASE.md now says feature configuration and workspace source explicitly.
- The external consumer and FFI builds resolve their own lockfiles. They audit
  archive paths after building; they do not promise third-party version identity
  with the workspace's qualified lockfile. This stage does not change that
  existing release contract or claim dependency reproducibility for those builds.
- Hypersdf's all-features configuration enables the unreleased Hypervoxel
  adapter. Packaging uses the already-declared workspace resolution overlay.
  That is not evidence this optional dependency chain is publishable. No
  HyperBrep, HyperBrep IO, Hypervoxel or Hyperspatial release is added.
- The 27 clients cover the existing pipeline plus the native curve range
  example. They are not universal feature, topology, geometry closure, platform,
  browser, HIL or documentation qualification.
- Hosted jobs, publication and the full pre-push matrix are not executed by
  this stage. No push or publication is performed.
