# Trace take unwind acceptance witness

Owner Hyperreal trace reporting and scoped recording, P4/P10/P36. Missing
witness on primary1f5b92cc240cbf75fb7fc36d0789e4507a79b1dd and isolated borrowed
source d2848f1a083f8fe25ef8ea98a62cd7ad7c2feaf0: the existing take implementation's
drain clears all counters if content aggregation unwinds; the borrowed version
must preserve that behavior through its explicit drop guard. Full output
ownership is already covered by the retained snapshot regression. No production
change in this test addition, and no new overflow semantics are proposed.

Use two identity-distinct static path labels with equal text. Insert counts whose
sum exceeds u64 only inside the private test setup, then call public take inside
a recording scope. Under debug overflow checks this reliably panics during
aggregation, after which take must be empty, recording must be inactive, and a
later fresh recording scope must produce an independent exact count. Keep this
test under cfg(debug_assertions), matching the overflow trigger's precondition;
release wrapping behavior remains unchanged. Do not disable or weaken any test.
No unbounded event stream, allocation-failure injection or production hook.

Check the witness and all affected trace tests in debug with all features on both
sources after the runtime campaign is terminal. Run strict owner Clippy and
format. Preserve the production prefix byte-for-byte and source identities; a
new isolated candidate revision may contain only this test. No production change
is admitted by this witness. Existing resource failures/charges stay recorded.

Execution: one1800-second test window after timing is terminal, at most100direct
children at one counted spawn site;900seconds per owner build/check. Use RAM
targets, six build jobs, locked/offline Rust1.95. All direct Git/tool commands
counted, compiler descendants explicitly excluded. Per-file1GiB, completed stage
128MiB, 2.5GiBtmp/20GiBdevelopment reserve before each child. No automatic retry
or deadline reset. Preserve queue identity/state. Commit candidate-plus-test only
on an isolated new branch and restore the original control branch. Verify both
production prefixes remain byte-identical to their pre-test sources. The primary
worktree receives the test only. Archive after the checks are terminal.
