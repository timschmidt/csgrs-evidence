# Residual-certainty finite resource qualification

Unaccepted candidate aad7409a5928e309812d9a5cc361d46313685266, current
4192d8c726d3333a31cb7eddc30cc0d464d61411 and fixed
c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb. No source or account admission.

This snapshot retains the complete mutable admission stage at capture time,
including protocols, harness sources, failures, controls, original and repeated
measurements, analyzers and all fourteen final native instrumented binaries.
It is a finite snapshot; later work in the live stage is not covered.

Concatenate snapshot.tar.gz.partNNN in lexical order to reconstruct the gzip
archive. snapshot-manifest.json.gz lists each contained path, byte size and
SHA-256. The archive driver verifies every member and unchanged source file
before writing the parts. snapshot-verification.json binds all part hashes.
No third-party caches are included. Raw diagnostic lifetime logs use gzip;
their uncompressed report/trace comparisons precede compact numeric records.

See MEMORY-RECONSIDERATION.md for the narrow unadopted stack proposal and open
allocation failures. Runtime, consumer capacity, packaging, portability and
shared composition remain separate gates. Original failures are preserved.
No push or admission is claimed.
