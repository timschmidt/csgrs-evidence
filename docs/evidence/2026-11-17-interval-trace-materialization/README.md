Trace materialization pilot: two rejected implementations; no memory exception.

The pilot preserves every command/observation, full output, original and corrected
verifiers, failed verifier log, three final native images and source patches.
Only Python bytecode caches are omitted. Image files use lossless gzip; origins.json
records every source/stored length and SHA-256, original mode and encoding.
Restore an image by decoding its gzip and applying the recorded source mode.
Two identical counted Git revision reads share one log; both raw and stored hashes
match both command records. The original verifier failure/correction is retained.
Primary checks apply to the independent added regression test only. Production
trace code remains unchanged; rejected prototype commits remain isolated.
