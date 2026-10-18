# Required opaque scalar payload

Real deserialization now rejects an Irrational class without its Computable
payload, including null, omitted fields, and a zero outer scale. The common
implementation protects direct Serde, JSON/CBOR convenience readers, CBOR
Value conversions, enclosing collections and downstream SVG exact-coordinate
ingress. Convenience readers retain the typed Problem::ParseError outcome.
Valid symbolic certificates still permit lazily omitted payloads.

Six new public-boundary tests fail on unchanged production; two valid controls
pass. All eight pass after repair. The downstream SVG regression passes, as
do the 20 existing SVG tests and the predicate serialization matrix. A retained
baseline library independently confirms the SVG fixture previously decoded
successfully, so this regression exercises the scalar invariant rather than
merely invalid CBOR syntax.

The final actual source passes 934 default and 1,049 all-feature scalar tests,
817 debug units, 24/29 scalar doctests, the complete 365-test predicate suite,
and the circuit interchange targets named in review-v1.json. Formatting,
the named strict Clippy/docs configurations, and Rust 1.95 all-target
all-feature/minimal checks for Hyperreal/Hyperlimit/Hypercurve pass.
No existing test, policy, fixture or ignore marker was weakened.

An interchange-only circuit Clippy check exposed imports of geometry-only
APIs in curved_outline. A separate target reproduces the same failure with
committed scalar sources. Gate those imports and their geometry-only helper;
all test bodies and existing test gates are byte-identical. The two
interchange, four geometry, and five all-feature curved-outline tests pass,
including the original DRC/CAM assertions. The full scalar and affected
consumer checks were repeated after this final configuration edit.


The initial test-only integer-width compile error and all diagnostic output
are retained. Known exact bounds verify valid values and downstream translation.
JSON/CBOR byte identity after cache warming is a separate assertion.

This is a narrow structural repair. A present graph encoding sqrt(-1) still
decodes and panics during refinement, reproduced again after this repair.
General mathematical-domain and symbolic-certificate validation remain open.
The affine subtraction candidate remains withheld. Full native workloads,
all bindings, distribution and the complete pre-push workflow matrix were not
rerun here; no push or performance claim is made.

Every new physical artifact has an independent hash. Generated Cargo outputs
and compiled artifacts remain physically retained; source, protocols and raw
logs are archived. These experiment roots are now closed. Original baselines
and current 16/72/24-GiB root/Disk B/tmp ceilings remain; cumulative logs stay
at 96 MiB. Temporary artifacts are volatile. Historical missing files were
neither reaudited nor recovered. Hypervoxel and full-plan completion remain
outside this admission.
