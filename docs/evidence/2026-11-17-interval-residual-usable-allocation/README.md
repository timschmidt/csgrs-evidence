# Residual-certainty allocator usable-byte attribution

Primary documentation baseline b22dfbbc763fe937e5132bc042ce864eec656a75;
unaccepted candidate aad7409a5928e309812d9a5cc361d46313685266;
fixed c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb and measured current
4192d8c726d3333a31cb7eddc30cc0d464d61411. Original final images are already
preserved in resource evidence commit d62cded53e3df97f5c77ada6a040df93cda848c0.

This finite diagnostic uses their original no-feature binaries: case 24,
STRICT, passive trace, cold rebuilt input. Fixed and current images have
identical bytes. All 146 processes preserve complete output and trace records.
Seventy-three instrumented processes reconcile 219 operation/output-drop/input-
drop epochs against the binaries' original counters. All 6,312-event operation
request sequences agree; 73 event ordinals exhibit usable-byte variation.
Every operation has 2,910 allocations, 2,809 deallocations, 593 reallocations,
193,309 requested traffic bytes, 14,100 requested peak and 9,088 requested live
bytes. Same requested allocation sizes can receive different allocator usable
sizes. Plain processes also reproduce varying usable bytes on each binary.

PROTOCOL.md precedes execution. The process-local interposer reads the original
measurement flag, delegates to glibc and records events without changing image
bytes or global allocator/ASLR settings. analyze.py performs per-process checks;
verify.py separately reconstructs the raw events, request sequences, matching
ordinals and total differences. Instrumentation may perturb layout: these are
attribution results, not unchanged resource costs, runtime evidence or a general
allocator model. Requested free sizes are not inferred from usable sizes.

All original failures and charges remain. No cap revision, account acceptance,
production adoption, source inventory change or completion of the broader goal
is claimed. The quiet watcher was restored after each finite hold, preserving
its original horizon. Archive-release and commit receipts live outside this
frozen snapshot in the parent stage. No push.

All command-output and shared-object bytes are losslessly gzip encoded;
origins.json records original and stored hashes, sizes and modes. Decode before
replaying, preserving relative names. Source stages are now frozen.
