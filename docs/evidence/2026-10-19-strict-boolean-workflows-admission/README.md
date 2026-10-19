# E97: independent exact-set workflow acceptance

The new named corpus protects already-supported strict modeling behavior.
Nine box configurations and five affine frames exercise 45 workflows, each
with 21 independently audited outputs. An exact rational grid/ray oracle
checks represented-set equality, separately from native certified PWN
validation. Same-volume wrong-set controls and a forced ray retry run in
every frame. Production algorithms and APIs are unchanged.

The [review](review-v1.json) records the finite domain, proof argument,
checks, resource observations and limitations. All 129 selected Cargo test
results pass across two feature configurations, including 50 new tests in
each; these are overlapping configurations, not 129 distinct new tests.
Formatting, matching strict Clippy and Rust 1.95 target checks also pass.
The [contract](contract-v1.md) predates editing and the
[checkpoint](checkpoint-v1.json) pins the source and retained evidence.

This strengthens acceptance evidence; it does not expand the runtime domain,
prove manifoldness for touching/XOR outputs, certify analytic fidelity or
earlier approximate intent, or complete the shipped-user-path and broader
properties plan. Failed observation and harness attempts are preserved.
Historical missing artifacts were not reaudited or recovered.
