# Review status after native-cache probe

The original debug owner run on b84d2107e was deliberately terminated after
reproducing a native dispatch side effect. Its 1836 observed passing tests and
SIGTERM are preserved in owner-superseded.json; this is not a completed suite.

The source now borrows an already-cached native basis or constructs its own
basis with the existing Bernstein conversion kernel. It never populates the
native geometry cache. The degree257 external probe confirms identical points
and full native traces before/after preparation (cache-probe-after.json).
The old probe and its differing traces remain preserved.

Four added witnesses cover homogeneous zero weights, constant C1 curves with
zero tangent, cold/warm/failed cache preparation, and unchanged degree257 native
dispatch under STRICT and APPROXIMATE_512. Focused tests are pending. Public C1
wording explicitly does not assert immersion, injectivity or nonzero tangents.

The allocation/timing workload starts with an existing native source and warmed
scalar caches. Native basis caches remain cold unless populated by a separate
native operation. Every adapter-owned basis conversion, graph/derivative
preparation, all16 range reports, native box projections, native broad-phase
comparisons and report destruction are inside scope. Source construction is
excluded. Results are not a universal speed claim.

Broad qualification, stable/WASM, downstream, packaging and performance remain
pending. The original candidate patch and SOURCE metadata are preserved as
*-initial files. Main and sibling changes remain untouched.

The first review test run passed11 tests and failed the new fixed-count witness:
query construction was inside recording, unlike the external probe. Moving it
outside preserved the count assertion but exposed prior libtest-worker scalar
cache state (2568 versus2567). The exact same witness passes alone. External
policy probes, including separate query construction, pass in fresh processes.
The witness now launches a fresh child process before comparing both policies;
the original count2567, gcd751 and full TraceSnapshot equality remain required.
A certainty assertion was added. No arithmetic/cache implementation was changed
to obtain a passing trace. Logs for every failed test expectation remain intact.

The intermediate validation driver completed the actual consumer test and run,
then was stopped during Clippy to keep final evidence tied to one source.
review-driver-superseded.json records owned processes and completed commands.
The fresh-process witness and all final qualification commands remain pending.

All12 focused witnesses passed on565f3d0c. Actual consumer test/run and strict
all-feature/all-target Clippy passed. Strict rustdoc found one unescaped[0,1]
link in the newly added comment. Revisionc6c43e095 fixes only that comment;
qualified-* repeats checks on this final candidate. Initial package logs refer
to565f3d0c; package-final/ verifies new archives fromc6c43e095. The initial cost
build also predates the comment correction and must be rebuilt before reporting.

A later dependency audit found that generate-lockfile advanced autocfg,
num-bigint, num-integer and num-iter in the standalone allocation probe. The
original successful counts remain at cost-summary.json, with their actual lock
and metadata. They are superseded for candidate retention. cost-final/ starts
from the repository lockfile and permits only the external-root lock adjustment;
metadata confirms every dependency version belongs to the checked-in lock.
The corrected probe is building. Qualification and timing gates now require
its result. No production source or running owner test has been changed.
The standalone cache probes remain matched before/after diagnostics with their
own lockfile; native cache/trace behavior is independently asserted by the
repository-locked debug and release all-feature unit witnesses.

The corrected repository-locked allocation probe completed successfully: five
identical observations per row across six rows, zero tracked live bytes after
destruction, identical native arithmetic work, and reduced graph work, allocation
count, requested bytes, peak live bytes and output live bytes for shared
preparation in all three cases. Authoritative results are cost-final/summary.json.
The earlier counts remain superseded. Timing and full validation are pending.

Final disposition: all twelve qualified commands, repository-locked allocation
measurements and all three timing gates passed. Integration and all five
main-checkout checks passed. STATUS.md, QUALIFICATION.json, INTEGRATION.json and
FINAL-REPOSITORIES.json are the final records. Earlier pending statements above
are the chronological review history, not the final disposition. No phase or
whole-goal completion is claimed.
