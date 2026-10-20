# Retained attempts

All commands, logs and source identities are retained in [attempts.json](attempts.json). Earlier failures are not final-source passes.

| Attempt | Exit | Log |
| --- | ---: | --- |
| baseline-build / 1 | 101 | [baseline-build-1.log](baseline-build-1.log) |
| baseline-cubic / 1 | 101 | [baseline-cubic-1.log](baseline-cubic-1.log) |
| baseline-nurbs / 1 | 101 | [baseline-nurbs-1.log](baseline-nurbs-1.log) |
| baseline-parallel / 1 | 101 | [baseline-parallel-1.log](baseline-parallel-1.log) |
| initial-check / 1 | 101 | [initial-check-1.log](initial-check-1.log) |
| initial-check / 2 | 101 | [initial-check-2.log](initial-check-2.log) |
| focused-brep / 1 | 101 | [focused-brep-1.log](focused-brep-1.log) |
| axis-migration-regression / 1 | 101 | [axis-migration-regression-1.log](axis-migration-regression-1.log) |
| initial-native-clippy / 1 | 101 | [initial-native-clippy-1.log](initial-native-clippy-1.log) |
| initial-consumer-clippy / 1 | 101 | [initial-consumer-clippy-1.log](initial-consumer-clippy-1.log) |
| finite-domain-regression / 1 | 101 | [finite-domain-regression-1.log](finite-domain-regression-1.log) |
| owner-retained-domain-regression / 1 | 101 | [owner-retained-domain-regression-1.log](owner-retained-domain-regression-1.log) |
| owner-retained-domain-regression / 2 | 101 | [owner-retained-domain-regression-2.log](owner-retained-domain-regression-2.log) |
| canonical-parameter-regression / 1 | 101 | [canonical-parameter-regression-1.log](canonical-parameter-regression-1.log) |
| native-release / 1 | 101 | [native-release-1.log](native-release-1.log) |
| native-minimal / 1 | 101 | [native-minimal-1.log](native-minimal-1.log) |
| migrated-frontiers / 1 | 101 | [migrated-frontiers-1.log](migrated-frontiers-1.log) |
| projection-regression / 1 | 101 | [projection-regression-1.log](projection-regression-1.log) |
| new-consumer-step / 1 | 101 | [new-consumer-step-1.log](new-consumer-step-1.log) |
| closed-range-joint-regression / 1 | 101 | [closed-range-joint-regression-1.log](closed-range-joint-regression-1.log) |
| old-path-Round-reverse-false / 1 | 101 | [old-path-Round-reverse-false-1.log](old-path-Round-reverse-false-1.log) |
| old-path-Round-reverse-true / 1 | 101 | [old-path-Round-reverse-true-1.log](old-path-Round-reverse-true-1.log) |

Three baseline probes require exact cubic, nonunit NURBS and nonlinear parallel plane contacts; all fail UnsupportedIntersection. Compiler/API migration failures remain recorded. Axis-clearance migration first reused the same plane twice; the independent quadratic/selected regressions caught this and the second normal was corrected. Finite subcurve regressions caught queries against an irrelevant source pole; Hypercurve now owns the generated restriction and BRep queries the actual consumed range. A coefficient-only boundary mapper initially rejected an already supplied exact scalar view; exact root equality now permits only the proved value.

The first full release suites reproduced two obsolete UnsupportedIntersection expectations: high-degree noncontainment and planar-image containment. The retained full fixtures now require exact answers. Both cohorts are capability migrations and receive no matched time ratio. The strengthened containment consumer then exposed missing planar pcurve materialization. A shared BRep conversion now delegates exact similarity/restriction to Hypercurve and preserves the signed source chart; independently derived shifted/rotated plane coordinates and a nonunit reversed mapping verify it. Uncertified similarities retain the owner construction error. No geometry, policy or required success was weakened. The first failed final-stage/qualification records remain separately preserved. A later independent discontinuous-spline probe exposed a closed overlap with an ambiguous endpoint; transported closed endpoints now undergo exact image and plane checks before publication, with the regression and successful interior/subcurve recovery retained. That consumer stage also revealed an incorrect STEP oracle: the selected cube reports UnmaterializedPoint, while the cap fixture reports NonRational. The test now preserves those exact distinct existing IO diagnostics. Its failed source epoch and frozen binaries remain recorded; final binaries use a new prefix.

The historical Round path harness still unwraps UnsupportedMeasurement and exits 101. Those controls remain expected diagnostics, not successful ordinary library operations.
