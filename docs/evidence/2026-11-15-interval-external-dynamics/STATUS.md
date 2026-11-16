# Retained external validated-dynamics benchmark

The full fifteen-phase goal remains active. Production math is unchanged.
Main source commit: 1ed29262bf80d2059f0d296dfa3fe46a5987d60d. Isolated source commit:
93aa4a44074966eaa39b684b43db33d0cc1ecf44. Their committed trees match exactly.
The existing primary41 and Interface8 edits remain byte-identical; firmware is
clean. All74 prior frozen stages verify unchanged.

This closes the missing external-comparator witness for a finite eight-IVP corpus:
constant, exponential, Riccati-before-pole and oscillator, each from point and box
initial sets on [0,1/4]. Exact common inputs, positive contiguous time, every
step <=1/16, endpoint widths <=1/64 and continuous tube widths <=1 are required.
Independent rational analytic bounds validate all16 outcomes. No sampled path or
agreement between solvers is used as the oracle. Native proof materialization
and destruction stay in both measured paths. Fresh and prepared reuse are distinct.
Only campaign-step-cap is eligible for the final configuration. It contains320
raw timing samples,100 integrations each, with exact outputs unchanged across
preflight, fresh/reused preparation and all four timing blocks. CAPD is faster in
all recorded median rows and narrower on nonconstant point enclosures. This is a
configuration/corpus comparison, not global competitiveness or equal proof APIs.

CAPD6.1.0 source37057e5899bccaa6cd5701057b7e6ea5e232ef8b uses the native backend,
GCC14 -O2 -frounding-math and isolated processes. All42 upstream tests pass after
the complete build. The initial ctest raced one final link and correctly failed;
capd-tests-final.log is the completed rerun. Boost packages were downloaded and
extracted locally; names/hashes are in boost-dependencies.json. Source and package
archives are not redistributed. The upstream static-array test emits a GCC copy
warning; it is recorded, not hidden or claimed resolved. The comparison uses
dynamic interval vectors and its own C++ adapter passes -Wall -Wextra -Werror
with external headers designated as system headers.

Rust1.95 locked build, strict Clippy and standalone format checks pass after the
final adapter change. Nine deliberately corrupted transcript controls are rejected.
1500 exact rational square-root controls and three series identities pass. Final
workspace format and repository budget results are logged. No full production
owner, downstream, fuzz, coverage, hosted or hardware campaign is claimed for
these benchmark-only additions. Native binaries' sizes/hashes are recorded, not
interpreted as refactor savings. No memory or universal resource claim is made.

Earlier investigations and failures are preserved. The initial Taylor arithmetic
review found existing polynomial/certified composition support and no concrete
independent-base consumer; no speculative API was added. Two preliminary timing
campaigns were mathematically valid but violated their declared step cap because
CAPD TimeMap overwrites solver.maxStep. Six two-piece outputs on a1/4 horizon
reproduce that failure. pre-step-cap-source contains reconstructed adapter files
whose SHA-256 exactly matches the measured pre-fix files. The corrected adapter
uses four exact checkpoints and audits every retained piece. A metadata cpu-key
collision in the first campaign was fixed; command receipts always recordedCPU0.
No hard case, width constraint or test was weakened.

Reproduce from the committed scripts/validated-dynamics README and run.py. Existing
logs under campaign and campaign-final are ineligible for the final table; do not
use their tempting faster CAPD rows. All final runtime source hashes match the
committed source (final-source-and-state.json). The external toolchain/configure
logs include the resolved missing Boost and CMake lookup failures. No push or
publication. Wider competitive and stress/resource portfolios remain open.
