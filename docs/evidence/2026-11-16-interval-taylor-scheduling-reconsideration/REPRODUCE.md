# Reproduction

All commands use the isolated CSGRS checkout recorded in initial-state.json.
Build scripts retain exact commands, toolchains, dependencies, features and
artifact paths. Cargo is offline with 16 jobs. The fixed baseline is c9f1f9ac,
and the current baseline is 924bef144. No prior evidence directory is modified.

1. At the current baseline, run build.py baseline and build-probes.py baseline.
   Run the baseline coefficients and wrapping executables with run.py. The
   coefficient output has 448 exact/resource controls and one allocation row.
2. In a clean isolated checkout, switch temporarily to c9f1f9ac and run
   build-probes.py fixed; restore 924bef144 before applying candidate.patch.
3. Apply candidate.patch, build the candidate probes, and run the corresponding
   controls. Compare all coefficient rows except the allocation row exactly;
   compare all wrapping rows after removing elapsed_ns only.
4. With no compiler/tests running, run time-pair.py. It saves four pinned,
   ASLR-disabled ABBA blocks and their individual samples. Each invocation
   measures 30 batches of 2,000 operations in each of three modes.
5. Run build.py candidate and measure-size.py. Disassemble the derive symbol
   in the saved flow_noise example and probes using the recorded commands and
   symbols in derive-disassembly.json and the *.asm files. Check saved-register
   pushes and stack reservation separately from linked text/file measurements.
6. The unqualified trace test is preserved in rejected-code-and-test.patch and
   rejected-test-fixture.jsonl. candidate-tests.log contains its failure, and
   candidate-test-actual.jsonl preserves the actual all-feature debug rows.
   It is not an accepted fixture. No existing test/assertion was weakened.
7. Remove the candidate and attempted test. Run restored-tests, restored-fmt,
   restored-clippy, and build.py restored, then summarize.py. The latter verifies
   all 42 restored final artifact hashes against the current baseline.

build-wasm.py candidate and the candidate successive_operations build completed,
but their paired target comparisons/execution were stopped after the stack
failure. bench-pair.py is a prepared, UNEXECUTED broader timing driver. The test
harness allowance proposed in ADMISSION.md was never accepted or consumed.
