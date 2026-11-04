# R20 regularized segmented revolution

The baseline is CSGRS 9a8bd78184. Replay candidate.patch on it, then restore
both new files from new-files/. The source-attribution JSON hashes every
affected file. The qualification document under new-files/ records the
contract, test attribution, completed outcomes and open limits. No push.

Root: 687 passing tests/doctests, seven existing ignored. All 576 independent
membership/winding matrix rows pass. Full-suite source predates two test-only
expansions; their focused reruns and final Clippy pass. Original 24 sweep
tests remain, now 30. FFI, actual C/C++/Python, generated JS/TS, MSRV,
warning-denied stable Clippy/rustdoc and downstream SynapsCAD Clippy pass.

The full ASan campaign fails its 15-second per-input stress limit in exact
native-union triangulation. Retain its original seed and stack; two ASan
smoke seeds are a separate, smaller success. All 576 original seeds complete
without sanitizer or coverage instrumentation in 221.61 seconds, 44,560 KiB
maximum process RSS. This is fixed-corpus execution, not a mutation search.
Nightly's recursive auto-trait warning reproduces on unchanged baseline.
Initial sandbox LeakSanitizer and build/tooling failures remain in the logs.

Cost probes retain individual samples, exact rows, locks and source. All
legacy rows and allocation measurements agree. The new regularized opposite-
side contract costs about 195 ms and 208 MB of requested allocation traffic;
this is not a performance-only substitution for a legacy winding-two mesh.
Requested bytes, logical live bytes and RSS are different measurements.

commands.json records command arguments and environment. The compiled probes
and build directories are omitted. Recreate cost probe manifests with local
baseline/candidate paths after restoring source. No analytic/BRep closure,
native replay qualification, internal total resource bound, successful full
sanitizer envelope or pre-push qualification is claimed. This archive adds
only its own subtree; earlier evidence is retained unchanged.
