# Remaining firmware inventory review

Copy to a fresh mutable stage before running writers. sources.json pins the
primary source revisions, remaining-declarations.json pins the original23
locators, and source-inputs retains every reviewed file. initial-inventory.tsv
is the unchanged source inventory before this audit. review.py changes exactly
those23entries; verify.py checks all1532rows and preservation of1509otherrows.
These scripts contain local paths which must be adapted to the replay workspace.

For the independent recurrence qualification, create a clean firmware worktree
at7e0d5a4 beside the recorded CSGRS source. Apply qualification-oracle.patch.
The added cfg(test) function directly calls the original private bounds helper;
it does not replace it. It enumerates21952coefficient/count sequences and
362208recurrence values. It never calls the production closed-form evaluator,
vertex test or binary search to form its expected extrema.

run.py executes all machine-IR lib tests on Rust1.88 and1.95, all host xtask tests
on1.88, and strict all-target Clippy for both owners. The runner records exact
patch hashes and restores only this owned patch on exit. Its quiet-workflow
barrier is local scheduling, not a validation pass. No firmware image or
hardware execution is performed. The additional oracle is qualification-only,
not installed into primary CI; its patch remains replayable here. No production
source or size account changes. Existing downstream execution/source-boundary,
full inventory, migration, cycle/stack and HIL obligations remain open.

Body review scope is the nine declarations and selected callers described in
reviewed-inventory.json. The fourteen other entries are named tests whose role
and declaration are verified; the audit does not claim rerunning every one of
those fourteen tests. Complete corpus execution is claimed only for the commands
recorded in qualification-results.json. Original failed mechanical-placeholder
check is retained; it rejected descriptive wording before any inventory write.
