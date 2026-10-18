# Retained attempts

Every attempt retains its exact log and source snapshot in [attempts.json](attempts.json). Failed candidates are not final-source passes.

| Attempt | Exit | Log |
| --- | ---: | --- |
| baseline-cap / 1 | 101 | [baseline-cap-1.log](baseline-cap-1.log) |
| carrier-compile / 1 | 101 | [carrier-compile-1.log](carrier-compile-1.log) |
| carrier-compile / 2 | 101 | [carrier-compile-2.log](carrier-compile-2.log) |
| initial-cap / 1 | 101 | [initial-cap-1.log](initial-cap-1.log) |
| wire-direction / 1 | 101 | [wire-direction-1.log](wire-direction-1.log) |
| continued-cap / 1 | 101 | [continued-cap-1.log](continued-cap-1.log) |
| continued-cap / 2 | 101 | [continued-cap-2.log](continued-cap-2.log) |
| continued-cap / 4 | 101 | [continued-cap-4.log](continued-cap-4.log) |
| continued-cap / 5 | 101 | [continued-cap-5.log](continued-cap-5.log) |
| continued-cap / 6 | 101 | [continued-cap-6.log](continued-cap-6.log) |
| continued-cap / 8 | 101 | [continued-cap-8.log](continued-cap-8.log) |
| old-path-Round-reverse-false / 1 | 101 | [old-path-Round-reverse-false-1.log](old-path-Round-reverse-false-1.log) |
| old-path-Round-reverse-true / 1 | 101 | [old-path-Round-reverse-true-1.log](old-path-Round-reverse-true-1.log) |

The original full cap first fails with UnsupportedPlanarProfile. Initial carrier compile errors and test API spelling errors are retained. Construction then succeeded while cold replay failed SelfIntersectingWire: the top arch traverses 1 to 0, and ascending-domain endpoints were incorrect adjacency expectations. The owner whole-loop proof and directed endpoints fix that case. Further regressions exposed the missing extrusion inverse dispatch, authored-path bridge, and quadratic/cubic source archives. These were implemented without weakening the original geometry.

The historical Round path harness still unwraps UnsupportedMeasurement and exits 101. Both such controls are retained as expected diagnostic failures, not successful ordinary library operations.
