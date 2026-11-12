# Integer and fixed interval evidence

Source revisions: revisions.json. Source code is retained in those Git commits,
not copied into this record. The prior foundation record retains compiler,
hardware, initial repository states, failed dependency attempts and baselines.

phase2-final/commands.json records the final feature/target commands through
the fuzz lint failure; fuzz-clippy-retry.log is the unchanged-policy corrected
check. Zizmor and final example/lint logs are separate. The only lint change
was collapsing a nested conditional without changing predicate order. ASan
campaigns were rerun on the final harness; all sanitizer checks stayed enabled.
Original failures and earlier corpus results are retained. No crash was found.

phase2-alumina*/ retain independent workspaces, locks and differential results
against the actual firmware implementation. The 100,000-row generator seed,
20,736 boundary tuples and 81 extreme ratios are maintained in the source.
phase2-cost/ contains the rejected helper candidate; phase2-cost-inline/
contains the corrected paired probe. The patch reconstructs the rejected
helper annotations from the final source. Both retain raw samples and sizes;
no compiler artifacts or third-party package archives are redistributed.
The first exploratory probe overlapped baseline coverage work. Corrected probe
medians are limited to the finite matched out-of-line workload, not HIL or
whole-firmware timing. Symbol bytes are not a complete backend-size comparison.

Hypersolve baseline production coverage completed at 88.98% against its
unchanged 85% gate. The annotated executable-line report and complete command
log are retained. The baseline source is unchanged from
1671894b4a896b091416503910e3720ecf233c82; adding an unused new workspace crate
did not migrate solver arithmetic. Hyperinterval's own final LLVM denominator
and exclusions are retained separately. Neither report establishes universal
closure, 100% coverage, embedded cycle counts or a coordinated release.

No evidence was pushed. Full source-map review, wider-stack baselines,
firmware/HIL gates, host interval families and downstream migrations remain.
