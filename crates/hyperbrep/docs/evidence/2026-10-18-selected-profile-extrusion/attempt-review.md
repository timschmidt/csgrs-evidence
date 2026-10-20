# Retained attempts

Every attempt keeps its raw log and source snapshot in [attempts.json](attempts.json). Earlier failures establish the missing capability or describe candidate/test/harness corrections; they are not final-source successes.

| Attempt | Exit | Raw evidence |
| --- | ---: | --- |
| baseline-public-test / 1 | 101 | [baseline-public-test-1.log](baseline-public-test-1.log) |
| expanded-public-tests / 1 | 101 | [expanded-public-tests-1.log](expanded-public-tests-1.log) |
| expanded-public-tests / 2 | 101 | [expanded-public-tests-2.log](expanded-public-tests-2.log) |
| curve-images-tests / 1 | 101 | [curve-images-tests-1.log](curve-images-tests-1.log) |
| slab-diagnostic / 1 | 101 | [slab-diagnostic-1.log](slab-diagnostic-1.log) |
| expanded-public-tests / 3 | 101 | [expanded-public-tests-3.log](expanded-public-tests-3.log) |
| full-new-tests / 1 | 101 | [full-new-tests-1.log](full-new-tests-1.log) |
| new-consumer-clippy / 1 | 130 | [new-consumer-clippy-1.log](new-consumer-clippy-1.log) |
| new-consumer-clippy / 2 | 101 | [new-consumer-clippy-2.log](new-consumer-clippy-2.log) |
| old-path-Round-reverse-false / 1 | 101 | [old-path-Round-reverse-false-1.log](old-path-Round-reverse-false-1.log) |
| old-path-Round-reverse-true / 1 | 101 | [old-path-Round-reverse-true-1.log](old-path-Round-reverse-true-1.log) |

The public baseline fails with `UnsupportedPlanarProfile`. Initial test compile failures concern private root-cache access and an IO fixture importing unrelated serde-json test bodies; the final fixtures use public queries and a shared source recipe. The original XOR partial-height subtraction and following reconstruction reproduce missing product-set continuation, then pass with the complete planar proofs. The first native-image candidate lacked the source-restriction carrier path; the retained image tests now cover it explicitly.

The combined consumer also exposed duplicate loading of the shared fixture under warning-denied Clippy. The IO acceptance function now receives the original profile/replay functions from its caller. [Harness requalification](harness-requalification.json) records the three changed test/consumer files, identical acceptance body and unchanged production. All eleven debug groups, both release IO variants and affected all-target lint were rerun. The full earlier production qualification is reused explicitly, not relabeled as a fresh full-suite execution.

One consumer Clippy attempt was interrupted with observed exit 130 before the sequential journal could finish its row. [The interruption record](harness-interruption.json) preserves the command, raw output, source identity and missing elapsed duration. It was rerun after qualification; no success is attributed to the interrupted attempt. Original unsupported nonlinear-offset and irrational-STEP controls remain failures by their declared typed contracts.
