# Retained source-bound Jacobian matrix projection

Source commit: 8b63fa68d0b952fdab026b4b11c609ff4a0fa319. The ten-path opt-in extension is committed in main.
Acceptance, limitations, costs and rejected initial layout are in ADMISSION.md.
Full goal remains active; no phase complete. Final production source and patch
are in layout-preserving/final-source/ and final-candidate.patch.

All corrected owner/downstream/coverage/fuzz/sanitizer/static checks pass.
Combined extraction checks pass: 25 owner, 71 dynamics, 448 path tests and strict
Clippy. Main final focused eight tests and formatting pass. Source budget passes
at 4,159 files and 142,973,711 bytes. No push. Pending 41 extraction paths and
Interface eight edits retain original digests; firmware unchanged.

Initial and corrected isolated Jacobian worktrees, benchmark worktree and combined
integration worktree are restored clean at their recorded baseline after verifying
intended files. Cost probe manifests refer to isolated paths; reproduce by applying
the archived final-candidate.patch to a fresh baseline worktree at those paths.
Do not infer that the restored baseline supports the new feature.

Both timing campaigns and unfavorable enabled-path costs remain archived.
Existing feature-disabled machine code is identical; ELF bytes are not identical.
Whole-resource closure, field migration, full release, HIL, competitive workloads,
other plan phases and full pre-push validation remain open. No caches/compiler
artifacts or third-party package archives are included. All eight prior stages
verify unchanged. Freeze this evidence stage only after final archive preparation.
