# Reproduction

Use fresh mutable staging/artifact directories and a clean detached CSGRS
checkout at e835617c plus Interface f5341f3 and firmware 2d68e82. Replace every
absolute stage, source, build, runtime and artifact path in copied drivers before
execution. Never write into this frozen record or earlier evidence directories.
All current exact commands, toolchains, profiles, environments and logs are saved.

1. Build baseline with build.py, apply pending-extraction.patch --index, and build
   extraction. Verify both hashes against current-artifact-identity.json. Their
   identity to the prior reviewed executables makes another unchanged-extraction
   timing campaign unnecessary.
2. Apply shared-error.patch without inlining/outlining additions. Build
   shared-error and run shared-error-tests (the complete owner command). Preserve
   source and all existing original/direct/compatibility report/dispatch fixtures.
3. With compilation/tests stopped, run repeat.py and confirm.py. Both compare the
   real owner benchmark in six preselected cases, not a substituted microbenchmark.
   The second reverses ordering. Keep all samples and nonconfirmations. Run
   emitted-functions.py for full range-union accounting, including unsized-symbol
   disclosure. Smaller code does not establish nonregressing runtime.
4. Review unaccepted-snapshots.json and exact patches before retirement. The
   retire-pending.py script intentionally refuses changed states or existing
   snapshot refs; do not blindly rerun it on active repositories. Restore only
   the exact known pending paths. Restore original Hyperpath owner code and run
   restored-owner-tests, restored-owner-clippy and restored-owner-fmt.
5. Separately apply canonical-golden.patch to Interface after restoring its
   production migration. Preserve the original 41,795-byte transcript/hash and
   every independent semantic assertion in that existing test. The formatted
   patch, final retained/discarded disposition and commands are recorded.
6. build-interface.py first built fixed c9f1f9ac and current e835617 release test
   executables under Interface f5341f3's real release profile. Both configured
   binaries are identical. Symbol-preserving companions change generated code
   and are diagnostic-only, excluded from acceptance. The candidate uses
   build-interface-release.py without changing the configured strip policy.
   qualify-interface.py runs full core tests/doctests, strict Clippy and fmt.
   Run the candidate release executable, then measure-interface.py against the
   fixed and current configured release binaries. It applies the stricter code
   allowance to ALL final .text bytes; it makes no named-symbol claim.

The proposed path-benchmark file cap is not adopted. No push, publication, whole
CI/platform matrix, broader runtime, browser, HIL or firmware flash-fit result is
implied by the scoped native test checks. The fifteen-phase goal stays active.
