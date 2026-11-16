# Reproduction

Use writable isolated sibling checkouts. Never execute evidence writers inside
this frozen stage. Firmware baseline is b9ecf8df54723e532a42867a1d3c549f827d5f6d;
CSGRS baseline is ac1cbfbf6dd04585ef48c2b93e9023844dda3007; Interface is f5341f368.
check-summary.json records full retained commits and every command/cwd/exit.
Baseline failure: add the regression to the baseline source without production
changes and run cargo +1.88.0 test --locked -p alumina-clock accepted_count_exhaustion
-- --nocapture. counter-reproduction.log shows the whole-model equality failure.
Apply firmware-implementation.patch to retain the count check before publication.

run.py fixes Cargo jobs16, offline use and a target directory outside the stage.
clock-probe is reused from the earlier accepted clock-owner measurement, with only
its dependency paths redirected to this isolated checkout. Its release profile
uses size optimization, fat LTO, one codegen unit and checked overflow. Capture
baseline executable before applying the production fix, then candidate. rows and
alloc modes must remain identical. measure.py pins CPU0 (lowest allowed CPU),
disables ASLR and runs8 ABBA blocks with all compiled builds finished first.
Each sample completes6144 full four-observation/three-query operations including
result materialization. Thirty samples per run yield960 total. No serialization
or allocation measurement runs inside the timed loop.

The baseline/candidate target command logs emit assembly plus Cargo LTO artifacts.
assembly-commands.json records assembling that emitted source with Thumb clang
and ESP clang. Symbol tables contain true code sizes; local frames come from the
observe prologues. Whole-call/interrupt stacks and final firmware images are not
measured. Compiler inputs, patches, manifests, lockfile, source hashes and raw
outputs are retained. No source-level configuration or size gate was weakened.

verify_inventory.py checks the13 explicit declarations against committed firmware
source/hash and proves every non-clock original row unchanged. This checks
mechanical consistency, not body-review completeness. The research report names
actual reviewed bodies and selected callers, and retains50 unreviewed firmware
entries. Main/Interface pending patches must remain unchanged when forwarding.
