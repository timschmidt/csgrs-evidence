# Changelog

## 0.1.0 (unreleased)

- Feed equations, corner limits and lookahead now have a geometry-independent
  Hyperdynamics owner, with complete source-owned join receipts. Hyperpath
  retains deprecated wrappers, native report aliases and axis-only restrictions.

- Exact metric-span jerk replay and monotonic transitions now live in Hyperdynamics;
  Hyperpath retains its geometry adapter and deprecated compatibility wrappers.

- Extract exact affine axis-limit selection and replay from Hyperpath.
