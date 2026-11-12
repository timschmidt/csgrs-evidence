# Strict integer IEEE qualification

Source: 8b5bddf7633820cac4302b2eaa2c87b019091a0b. Baseline: 385006d68. Local x86_64 Linux evidence;
see the committed INTERVAL_REFACTOR_PROGRESS.md for claims and remaining gaps.

- checks.py/checks.json: final 27-command matrix, all exit zero. Earlier matrices
  and original lint/build failures are retained separately.
- pre-barrier.patch/pre-barrier-source, release-mode-failure.log, original
  code-inspection.json and strict-kernel.asm: reproduced LLVM/DAZ failure.
- codegen-final-* and codegen-lto-final: compiler/build/disassembly/scan evidence.
  The final scanner was rerun after broadening rejected instruction classes;
  codegen-scan-final.log records all four passing scans.
- bridge-checks.json, release-lto-bridges.log: exact bridge mode qualification;
  final release checks additionally exercise the later exact-power oracle.
- coverage-final: clean profiles, report and export; coverage-diagnostic.log
  identifies the excluded Rug function's missing profile record. Earlier
  coverage attempts remain under coverage-before-final. Exclusions are in
  coverage_report.py, including the private reduced-format test file.
- fuzz-affine.log: ASan, seed 20261114, 100000 runs, max_len 24, time cap 30 s.
  corpus is the unchanged first two-input campaign; corpus-affine starts from
  its 16-byte entries padded with a zero third operand. All generated seeds
  remain retained, including short inputs that the typed harness rejects.
- cost-environment.json, *-binary.json and *-size.txt: compiler, host, flags,
  executable identity and whole-executable sizes. No binaries redistributed.
- samples-final.csv: 30 completed strict-chain samples per width. proposal-*
  CSVs: three alternating baseline/final process rounds, 30 samples per width
  per executable, 16384 completed steps per sample. Both endpoints consumed;
  ordinary-workload checksum equality checked. No explicit warmup. Correctness
  barrier retained despite slower proposal results. The strict and proposal
  workloads are different and must not be compared as equivalent backends.

Reproduce the strict cost probe after building with stable (1.99 here):

```
cargo +stable build --locked --release -p hyperinterval --example float_cost --no-default-features --features float-enclosure
target/release/examples/float_cost
```

Build proposal_cost with only float-proposal at source and baseline, using
separate target directories; alternate process order old/new, new/old, old/new.
Each executable prints its 30 samples. Sources and iteration counts are in the
committed conformance clients. cost-summary.json contains sample medians in ns
per completed step/chain, not generalized performance estimates.

No native/GPU/ARM/WASM execution, hosted OS run, complete pre-push suite,
external registry release, formal universal proof, or full-plan completion is
claimed. Cross-compilation is not runtime qualification. Source and evidence
commits remain local. All prior evidence records are preserved.
