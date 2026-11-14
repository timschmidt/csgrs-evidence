# Reproduction

Copy this frozen record to a fresh writable directory before running drivers.
Check out the revisions in BASELINE.json and source-commits.json. Adapt all
absolute candidate/probe paths and build-target locations to those checkouts.
The original clock source and candidate patches are included. Standalone Cargo
probe manifests lock the compiler profile used for all measured artifacts.

`core-final-checks.json` and `firmware-final-checks.json` record exact check
commands. Production repeats use the committed stable sibling dependency path.
The Interface probe uses its unchanged client at ff668ca with candidate sibling
paths. Baseline Clippy reproduces the same errors; it is not a passing gate.

For complete clock rows and allocations, invoke the built clock probe with
`rows` and `alloc`, respectively, comparing every byte to the pristine build.
`time` reports all thirty per-epoch samples and completed operation counts.
After rebuilding the selected candidate, `CLOCK_ROUNDS=24 CLOCK_WARMUP_RUNS=8
python3 measure_clock.py reproduction` repeats the final pinned alternating
contract in the fresh stage. Median ratios pair run medians by round. The
reported confidence interval resamples those 24 ratios 10,000 times with Python
Random(637), takes each sample median, and selects sorted indices 250 and 9750.
Do not run compilation or other benchmark drivers concurrently with timing.

The fixed probe emits paired shared/legacy successful operations and checksums.
Six alternating runs of the baseline/final artifacts supply fixed-final-times.
The maintained Q30 oracle is reproduced by the command in foc-conformance's
result.json (build output was moved outside this evidence record).
Native timing and size are host observations; unavailable MCU/HIL and broader
integration gates remain open as stated in STATUS.md.
