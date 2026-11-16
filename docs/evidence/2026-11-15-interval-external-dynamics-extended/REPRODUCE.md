# Reproduction

Use a clean checkout of17fbc05837920ce39891beb8bd903c250c9699b9. The mathematical
kernel parent is0a4a09c6c11fe2bdf37cc6d59c4b9db393519bd4. Do not import main's
pending extraction or Interface's pending changes. Full changed sources and the
tracked patch are retained under source/ and implementation.patch; the two new
Python test files are in the source snapshot as well.

Follow scripts/validated-dynamics/README.md. CAPD remains externally pinned at
37057e5899bccaa6cd5701057b7e6ea5e232ef8b with its NATIVE backend. Use the recorded
capd-config flags; do not vendor third-party code or remove-frounding-math.
The same prebuilt pinned library passes all42 native tests in this stage.

Run the nine Python unit tests, standalone Rust1.95 Clippy/fmt, and the maintained
runner with--cpu0 --iterations100 --samples5 into a new nonexistent directory.
The runner builds the C++ adapter with warnings denied, validates all32 outcomes
before timing, executes ABBA, and verifies exact per-block output and timing
coverage. Then run check_rejections.py on the Hyperdynamics preflight transcript.
Every executed command and status is captured by check.py and campaign/commands.json.
Do not run these frozen drivers in place: copy them to a new writable staging
root and update their output/target directories first.

baseline/ is the original eight-case same-revision run. extended-preflight/
contains the initial pilot with the signed-zero serialization difference.
campaign/ alone supplies the new published latency/quality tables. The final
original-eight comparison binds exact raw certificate bytes in both solvers.
Source/binary hashes are in campaign/metadata.json and are checked against the
committed files in committed-artifact-check.json. Timing excludes serialization
and analytic checking; it includes retained native evidence, endpoint/tube
materialization and destruction. Fresh includes preparation, reuse excludes it.

To reproduce missing validation witnesses, put the two new test files beside
the old validator/runner at parent0a4a09c6c and run unittest discovery. The old
oracle lacks the new families and treats unknown kinds as an oscillator; the
old optimized-Python import accepts an empty corpus, and validate_samples is
absent. Missing-oracles and missing-runner-controls logs retain those failures.
