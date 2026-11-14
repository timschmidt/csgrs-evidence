# Reproduction

Use clean checkouts of source2611ab263ba58c5ce928374127d4bf2cc25e2c6d. The
candidate.patch records the five source changes against base50b16d. Do not apply
pending-before.patch: it records a separate unaccepted extraction.

Install the tool versions recorded in environment.json, tools.json and
cargo-hack-tool.json. Downloads are identified by upstream URL and checksum;
third-party archives/binaries are not part of this evidence record. Offline runs
require the registry cache already populated. Give each checkout its own target.

Run `bash scripts/release-check.sh --toolchain 1.95.0` and repeat with `stable`
(the recorded stable version is1.99.0). Recorded final/stable runs used
--allow-dirty before the isolated source commit; the clean run did not. All three
used CARGO_BUILD_JOBS=4 and CARGO_NET_OFFLINE=true after dependencies were fetched.
The script's disposable Cargo home shares public registry data and runs its cache
negative control; archive consumers must never resolve from live workspace paths.

The Python drivers in this record preserve exact command arguments and feature
sets. They use task-specific absolute paths: adapt paths in a new writable copy
of the record. Never run them as writers inside this frozen evidence directory.
Use focused-probe.py, fixed-package-probe.py and check-packaged-features.py for
archive-derived examples and all-feature checks. prepare-feature-workspace.py and
check-each-feature.py reproduce the locked individual feature matrix. The saved
manifests and locks document all dependencies. Capture-consumer drivers observe
the live release command before its cleanup trap; captures are evidence, not
permanent runnable temporary paths.

reproduce-packages.py regenerates artifacts from a second clean checkout with
--no-verify only for byte comparison. compare-packages.py verifies all21 raw
archive bytes against the first fully verified clean run and checks dirty/clean
checksum relationships. review-qualification.py checks the release and focused
logs. finalize.py checks integration and repository preservation; its baseline
assertions intentionally depend on the original repository states.

Run bash syntax, ShellCheck, workspace cargo fmt, repository budget and diff
checks after changes. Full pre-push commands and publication are separate gates.
