# Whole dynamics boundary inlining — pending candidate

Previous turn made progress by completing the functional feed/join/lookahead
extraction and recording failed cost gates. This step starts at CSGRS ledger
898bd9bce0f4640f38982823a6f2635a87e87dfe, verifies the complete pending source
patch, and reproduces its owner binary byte-for-byte in a new isolated checkout.
ADMISSION.md states owner, properties, domain and the missing retention witness.
No compiler/profile/dependency policy, algorithm, predicate order, fixture or
arithmetic core changed. No push ran.

## Experiments and selected source

The control is 13,451,992 bytes, SHA-256
1be96dccd6484f4a3fef3eacf36b22202b9cf60d9a301e5189169b8369cf6af6.
The preserved original pre-extraction baseline is 13,308,824 bytes, SHA-256
0ecc889ef0349447b9b015a41d0e6fbcf7a2e60de70834db68e7f0f76afa820d.
Its directory is still the earlier dependency-only control, not an original
source checkout; the original binary is selected by hash and is not rebuilt.

Four attribute-only variants were measured with identical compiler and release
configuration, using the complete unchanged owning benchmark:

| Variant | Executable bytes | Delta from original |
| --- | ---: | ---: |
| 71 top-level algorithm functions, ordinary inline | 13,315,312 | +6,488 |
| Same functions, forced inline | 13,337,400 | +28,576 |
| Ordinary functions plus 13 metric/error/join adapter methods | 13,315,464 | +6,640 |
| Ordinary functions plus 15 report methods | 13,300,712 | -8,112 |

The final variant is selected provisionally. All other variants remain
unaccepted; only the final variant was applied to the primary pending source.
Five files differ from the prior candidate by exactly 86 ordinary #[inline]
attributes. Removing only those lines recovers each prior file byte-for-byte;
attribute-equivalence.json records the hashes. The mathematical bodies, method
calls, error branches and source queries are unchanged. Exact transform scripts
and individual experiment patches are retained. The primary release binary
matches the selected isolated binary byte-for-byte, SHA-256
98914d6b2b2f59989f86324d28b0c43cb2e1bfe3a2c43a6f59b0b08b27c305b7.
CANDIDATE.json binds the complete pending CSGRS and unchanged Interface patches
to explicit base revisions, with accepted:false.

## Code-size evidence

This whole-boundary availability change reduces the previously failing candidate
by 151,280 executable bytes. GNU size's text category decreases 10,667,638 ->
10,660,102 relative to the original baseline (-7,536). The actual ELF .text
section decreases 8,116,839 -> 8,109,015 (-7,824). Data is 496,384 -> 496,360;
BSS is 3,804 -> 3,188. This is the same completed owner workload and compiler,
not a smaller fixture or different optimization profile.

Complete defined FUNC symbol ranges from both ELF symbol tables are retained,
with aliases/overlaps counted only once. Sized ranges decrease 9,401 -> 9,392;
their byte union decreases 8,042,989 -> 8,035,160 (-7,829). All six unsized
function symbols are recorded separately, and the complete .text measurement
also decreases. This inventories all emitted function ranges in the artifact,
not a favorable list of selected generic names; it is not a universal bound for
arbitrary future provider types or consumers. The earlier selected-family-only
analysis did not establish this gate. Full nm/readelf inventories and exact
reproduction scripts accompany the final artifact hashes.

The expanded control had extra instances across Real/Rational operators and
solver Clone/drop code; ordinary inline availability removes most of that
expansion. The changed size measurements support the boundary hypothesis but
do not identify a unique runtime performance cause. Three slower hot entry
functions retain identical byte and instruction counts, with differing data
references/indirect or displayed alias targets. hot-functions.json and raw
listings retain the limited static comparison; it does not prove transitive
callee equality, runtime equality or a cache explanation.

## Correctness and downstream validation

All eleven qualification.py commands pass after the final source edit: full
owner tests, owner all-feature/all-target Clippy with -D warnings, owner docs,
stable Wasm compile, all owner benchmark smoke cases, Interface tests and strict
Clippy, successive_operations, both formatting checks and diff validation.
Owner tests pass 459 cases and Interface passes 201 tests/doctests. Existing
axis, jerk and feed/join frozen differential tests retain their exact assertions.
Six final fresh-process feed/join transcripts match complete reports and all
trace fields for 46 fixtures under STRICT and APPROXIMATE_512 (92 rows each).
The first fixture still has 161 structural sign queries, 16,930 dispatch events
and zero GCDs. The prior record explains the three diagnostic mixed pairings
and three valid connected mixed fixtures; their scope is unchanged here.

The 41,795-byte Interface golden retains SHA-256
df893df83e90e6b53452e18586ffcaa2524a021631a395d4a6523be16263669c.
All 200 successive_operations certified manifold rows have identical structural
and allocation columns to the original baseline. Its dependency graph is
unchanged and contains neither affected crate; its smoke elapsed times are not
an independent controlled performance claim. The repository budget passes.
ASan was not rerun for these attribute-only edits; the previous functional
extraction record retains its sanitizer scope. Owner-wide heap/peak-memory
measurement, full pre-push CI, hosted platforms and hardware are not claimed.

## Timing remains a failed retention gate

Timed runs start after all builds/checks stop, pinned to CPU 0 without governor
control. Every compared executable is hash-verified. All 194 owner cases finish
with 0.1s warmup, 0.2s requested measurement and ten samples. Mean-ratio median
is 1.0040, range 0.8876–1.1233. The 256-record parser is 1.0484 in this sweep.
All raw estimates/samples and confidence intervals are retained; a favorable
median does not establish no regression across the workload.

Four candidate/baseline/baseline/candidate targeted runs cover the earlier ten
parser/jerk/lookahead cases at 0.2s warmup, 0.5s requested measurement and twenty
samples. The 256-record parser baseline means are 176.676/172.579 us, candidate
180.377/179.985 us, mean ratio 1.0318. The mixed parser is 1.0550. Some other
parser cases are equal or faster. Scheduler ratios 1.0471–1.0579 are driven
partly by visible drift: the first candidate is materially slower, while its
second repetition is near the baseline. These measurements do not justify a
stable no-regression claim or a controlled improvement over the previous turn's
timings, which occurred at different times.

Fifteen additional cases were selected mechanically from the broad sweep:
ratio >1.03 with non-overlapping mean CIs, excluding already repeated cases.
The rule prioritizes further evidence; it is not an acceptance tolerance and
waives no smaller regression. Four more candidate/baseline/baseline/candidate
runs use the same longer settings. Adverse repeated mean ratios include skew
certification 1.0951, exact trace import 1.0889, rectangular-pad edge clearance
1.0623, mixed symmetric jerk replay 1.0365, symmetric jerk replay 1.0356, and
corner lookahead 1.0337. Some broad apparent regressions reverse in repeats,
including constant-feed replay and analytic arc length. Preserve both sets;
do not select only favorable observations or treat drift as proof of equality.

The complete extraction is still unaccepted despite the measured code-size
improvement and passing correctness corpus. Source stays pending, and Phase 11
and the fifteen-phase goal remain open. NEXT-WORK.md records the next causal
investigation and the untouched owned-field/validated-evolution requirements.
Earlier adverse evidence remains immutable. Only an evidence registration and
progress-ledger update are committed in the primary repository in this step.
