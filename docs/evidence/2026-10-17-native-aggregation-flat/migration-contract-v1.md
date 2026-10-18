# Explicit readiness artifact migration for aggregation semantics

Review of readiness.rs identifies CHECK_IMPLEMENTATION_VERSION as the version
of shared execution and geometry-uncertainty reporting semantics. Correcting
lost source diagnostics and accepting native regions without finite reports
changes that contract. Before candidate execution, extend the five-file repair
with a readiness version migration from 21 to 22, README documentation, and
only the check_version fields in the six existing Hypercircuit fast-DRC JSON
fixtures. No check status, finding, geometry, threshold or workload may change
in those fixtures. Preserve baseline bytes and verify the exact field delta.

The complete ordinary report comparison must retain both raw outputs. Require
repeat determinism separately within each version and require candidate bytes
to equal baseline bytes with only the declared check_version 21-to-22 tokens
changed. Independently compare the complete parsed report after that same
explicit field migration. This is a semantic/API repair, not a performance-only
change or an unchanged-serialization claim. Additional report differences fail
the compatibility gate and require independent review. Exact KiCad ingress and
the cache proposal remain excluded. All other contract-v1.md gates stand.
