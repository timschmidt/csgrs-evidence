# R02–R04 reproduction and R25 harness milestone, 25 October 2026

Source revision: `3cca6a894858c8b98497a3cfe81cff5e17e1a7f2`, with the recorded
R01 mesh change. Hypercurve production files are restored byte-for-byte after
the R02 experiments. This record adds no accepted R02/R03/R04 implementation.
The R25 benchmark/runner changes are retained. No code or evidence was pushed.

## Reproductions

- R02: the original strict arc/line chain fails at erosion with RealSign;
  line/line passes. Two retained-carrier variants are rejected: preserving
  selected-circle tangent carriers leaves the blocker, while bypassing the
  represented fillet path regresses refilleting to Unsupported. Patches,
  logs and a bounded scalar-size diagnostic are retained. A recursive Debug
  expansion was manually interrupted; its full hash/byte count and a clearly
  marked excerpt are retained, not the 199 MB redundant rendering.
- R03: the original NURBS fillet/round-stroke test did not complete in 300 s.
  Its binary hash, actual command, external 8 GiB address-space limit and
  sampled RSS/HWM are in r03/manifest.json. This is an external timeout,
  not a typed internal exhaustion result or evidence of a particular call stack.
- R04: 40 actual modeling operations, with all 20 straight-only controls
  preserving the exact vertex. All mixed third/sqrt2 cases lose it; tiny and
  large-origin mixed members fail InvalidInput. Four explicit regressions
  preserve these failures. The whole enclosure/cut continuation remains open.
  The first standalone probe compilation needed integer-exponent conversions;
  that compiler log is retained separately from the completed run.

## R25 admission

The baseline executable misattributes a moved binary to the runtime checkout
and loses the raw file when killed after completed work. Final checks execute
copied binaries in a new checkout with replacement git/rustc commands. Both
16-step modes certify; validated geometry/receipt/size columns and operation
allocation traffic/calls equal the baseline. Killing the child and terminating
the driver each retain one certified row; timeout has a separate status.
There is no storage-device fault-tolerance or geometry-work-budget claim.

`r25/build` contains the final attributed build's compiler/Cargo/source inputs,
new source files, dirty patch and binary hash. Compiler flags, profile and
features are retained in the actual command, not inferred from the run host.
`r25/final-check` contains run manifests, exact rows and process outputs.
Binary bytes and dependency artifacts are excluded; hashes and build recipes
identify them. `source.patch` plus `new-source` and the R04 regression source
record the surrounding task state. The R04 regression was added after the
attributed R25 binary was built; no production geometry changed between them.

All 20 successive-operation tests pass (17 ordinary and 3 explicit long tests).
Formatting and root all-target/all-feature Clippy with warnings denied pass.
The final restored R02 check intentionally has one passing line control and one
failing arc gate. R04's four ignored tests were explicitly executed and fail;
these are recorded open acceptance gates, never counted as green coverage.
The complete repository pre-push matrix was not run and no push occurred.

The new harness moves IO outside operation/validation/drop timing and retains
fresh-process, validated and untouched modes. This is an evidence-quality
change, not a speed claim. Matched native benchmark section sizes are recorded;
no production/WASM binary-size benefit is claimed. R25's independent full-
component oracles, remaining archive boundaries and the full mixed enclosure
workflow are still open.
