# Reproduction

Use a fresh writable staging directory; never execute writer scripts inside this
frozen evidence record. Source and base revisions are in SOURCE.json. Both are
local Git commits until separately published. Preserve BASELINE.json's unrelated
staged/unstaged work; use a clean checkout of the candidate for release validation.

The pre-edit negative witness uses the exact original documentation-loop fragment
in original-doc-loop.sh, inside negative-control.sh against negative-fixture. Its
Cargo source explicitly fails documentation without the requested docsrs cfg.
negative-control.log and negative-control.json retain that expected failure.

Run `python3 scripts/test-release-docs.py +1.95.0` and again with `+stable` from
the candidate. The maintained fixture documents real offline crates and inspects
rendered HTML. Its intentional broken-link, missing-package and unsupported-key
failures must remain failures. Ambient permissive warning flags are part of the
adverse input, not acceptance flags. The HTML header path contains spaces.

Run `bash scripts/release-check.sh --toolchain 1.95.0` and then with `stable`,
without --allow-dirty or --no-verify. The selected compiler must be installed;
current native C/C++, Go and TypeScript tooling (or the documented npx fallback)
must be available. run-release.py records exact environment, command, package
archive digests and clean VCS revisions, per-package documentation arguments and
27 client outcomes. Copy/adapt its repository and build paths before executing.
Its build roots and compiler artifacts are outside the evidence record; no
third-party archives or compiled binaries are redistributed here.

Strict shell lint requires `shellcheck -x scripts/release-check.sh` so the existing
sourced cache helper is followed. The initial invocation without -x reported only
that unresolved source; both invocation logs are retained. Run shell syntax,
formatting, diff and repository-budget checks as listed in final check records.

This repairs local documentation configuration transport. It does not emulate
docs.rs's hosted nightly/target/environment matrix, supply archive-only docs,
publish packages, accept the pending dynamics extraction, or establish completion
of any whole phase. No geometry/kernel runtime behavior or performance is changed.
