# Raw runner whitespace recovery

The staged check reported an extra terminal blank line in the immutable generated
runner copied into the prior evidence directory. An orchestration error started
commit af717ed75 despite that failed check. This follow-up reproduces and retains
the diagnostic, verifies all 26 committed blobs against their recorded hashes,
and rechecks the complete prior authored diff after the correction.

The runner remains byte-identical, including its original final newlines. A Git
attribute under docs/evidence disables only blank-at-EOF reporting for that one
raw artifact. Other whitespace checks remain enabled; ordinary authored files
have no new exemption. Exact SHA-256 identity remains mandatory for the artifact.
No executed helper or closed output directory was rewritten.

The attribute directory is already excluded from the root crate package. No
manifest, geometry, API, runtime test, policy, fixture or resource gate changed.
This is an evidence-handling correction, not further release qualification.
See the [contract](contract-v1.md), [recovery record](recovery-v1.json) and retained
original/corrected command output. Historical missing-artifact disclosures and
the active full properties goal remain unchanged.
