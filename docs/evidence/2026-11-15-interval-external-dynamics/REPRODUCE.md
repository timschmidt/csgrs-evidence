# Reproduce

Use CSGRS commit 1ed29262bf80d2059f0d296dfa3fe46a5987d60d in a clean checkout, without
the protected pending path-extraction edits. Follow scripts/validated-dynamics/README.md.
The pinned CAPD source and local Boost dependency hashes are recorded here; build
CAPD with native intervals and all tests, and wait for its build before ctest.
Use the checked-in standalone Cargo.lock and Rust1.95.0. The runner builds both
adapters, validates all16 outcomes, pins CPU0 (or an explicitly recorded available
CPU), disables ASLR and records ABBA blocks. Output requires a new directory.
The exact final command is in campaign-step-cap/commands.json; the caller used
--iterations100 --samples5 (as separate arguments). Compare the full certificate
transcripts before interpreting timing. Native output is encoded exactly.

The runner accepts external CAPD source/build paths and a Cargo target directory.
Do not put generated output or third-party binaries in CSGRS. The evidence record
contains source patches, metadata, raw outputs and measurements; rebuild binaries
from the recorded sources. The earlier pre-cap campaigns are retained failed
configuration attempts, not alternative valid performance evidence.
