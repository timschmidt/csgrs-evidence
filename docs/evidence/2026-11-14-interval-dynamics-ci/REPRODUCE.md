# Reproduction

Check out source c633925421f6924d8aa3be9433000eec2cce80f3 cleanly. The retained
candidate.patch contains only two workflow files. Pending patches record separate
unaccepted extraction work and must not be applied for this qualification.

Install Rust1.95.0 and the recorded stable1.99.0, with rustfmt and Clippy. Install
cargo-hack0.6.46 with --locked. Run each shell body in the quality job of
.github/workflows/hyperdynamics.yml with DYNAMICS_RUST set to each compiler.
Local validation reused installed toolchains; install-msrv-hack.log separately
records a successful minimum-compiler build of the pinned feature driver.

run-workflow.py reads the final YAML and records every validation command, exit
and raw log. It deliberately skips installation and hosted checkout/cache action
steps. Copy this record into a new writable directory and adapt its absolute
checkout/target paths; do not execute writers in frozen evidence. Original runs
used CARGO_BUILD_JOBS=4, CARGO_NET_OFFLINE=true and one target directory per
compiler. Populate the registry cache before reproducing offline commands.
PyYAML6.0.3 supplies YAML parsing. qualify.py verifies feature coverage, executed
test suites, equal debug/release counts and equality to the final YAML commands.
check-workflow.py verifies the trigger dependency closure and baseline omission.

Run Zizmor1.32.0 with --pedantic --strict-collection from the checkout root. The
recorded default offline scan has no findings but does not perform network-only
audits. Run workspace formatting, shell-body parsing, repository budget and diff
checks. environment.json records tool versions. The source commit changes no
production code, so timing, coverage and runtime equivalence claims beyond these
executed suites are not inferred. Hosted actions and full pre-push checks remain
separate gates.
