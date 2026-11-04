# Downstream API qualification and D04 documentation

Source revisions are in source-revisions.json; final implementations are cited
by commit, not copied as replacement trees. The app admission is
synaps-cad/docs/SIMPLIFICATION-API-ADMISSION.md at its recorded commit.

pre-span.patch is the uncommitted D01/D02 stage used to reproduce the lost span
and shifted palette, on app parent a63c4c9 and the recorded CSGRS source. The
unchanged failure.rs module needed by that stage is in the parent evidence
record 2026-11-04-expression-node-errors. All raw command logs retain failures,
ignored/filter counts and prototype compilation issues. The initial unfiltered
library run was stopped (exit 130) after new corrections superseded that source;
its two regression failures and additional old corpus failure remain in its log.

The configured CI command was actually executed with a 1200-second external
containment limit. It terminated normally with a failing test result (exit 101),
not external exhaustion: 59 passed, 2 failed, 2 ignored, 53 filtered, 800.90 s.
B exceeded its original cooperative cancellation deadline; the near-coincident
case failed at the f32 projection. Original assertions, inputs and workflow
exclusions are unchanged. Source/driver guards added afterward have separate
focused passing logs; this is not a final all-green CI claim. Stack snapshots
capture the verified owned B worker. The first snapshot lacked symbols; the
second supplied the exact executable explicitly. Namespace warnings remain;
no complete statistical profile or cause percentage is claimed.

The before/after views-only probe shows failures hidden as successful empty or
partial images before correction. The original custom benchmark driver, restored
from the stage patch and linked to the same compiler as the new driver, reports
checksum 0 for cube(-1); the corrected driver rejects that incomplete workload.
This is not evidence that old phases skipped ordinary lazy geometry: eval_source_file
already resolves it. The corrected positive smoke runs the unchanged authored
visual fixture, includes actual projection and reports one arrangement; no matched
speedup claim is made.

visuals/ contains actual OpenSCAD 2021.01 and production-compiler renders of the
same source, and an actual native app window captured by its recorded process ID.
The app used isolated /tmp XDG settings with no persisted keys configured; its
selected model-discovery URL pointed to a deliberately unavailable local endpoint. Only that test window
was captured. It was stopped after inspection (exit 130). The badge and Boolean
visuals predate only the empty/preview-helper guard changes, which do not alter
the displayed valid fixtures. These are bounded visual checks, not a Manifold
corpus comparison or universal geometry proof.

D04 review records compare every moved narrative byte after canonical relative
link rebasing against the named pre-change commit. The normalized bodies are
identical and all checked relative file targets exist. Each README and moved
status document was committed separately; other pending Alumina edits remain
untouched. No runtime/firmware correctness claim follows from this doc review.

All evidence is local and unpushed. The app is not release-ready: preserved CI
blockers, full browser runtime, installed delivery and source-pin availability
remain open. Native/WASM/fuzz compilation, current Clippy/rustdoc, formatting,
static CI security audit and focused/runtime/UI tests are scoped in the logs.
