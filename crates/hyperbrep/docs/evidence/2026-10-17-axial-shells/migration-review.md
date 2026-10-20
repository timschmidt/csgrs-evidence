# Native carrier and API migration

Greenfield native surface representation and Boolean error-variant change. No compatibility shim or tolerance conversion. All 67 preceding standalone consumer STEP files happen to remain byte-identical; sixteen native archives deliberately change. The additional benchmark STEP capture identifies two unchanged identity exports and two equivalent reflected carrier-placement migrations.

Every changed preceding standalone consumer artifact is listed below. All 187 artifacts are retained: 171 are byte-identical and sixteen native archives migrate. The 104 unchanged native archives include the original cone/reconstruction/growth continuations. The 67 STEP files in that inventory are unchanged; additional exchange-benchmark STEP outputs are reviewed separately below.

The sixteen changed archives replace 57 exact line extrusions with planes and 36 exact circle extrusions with cylinders. Entity counts, vertices, spatial curves, edge uses, edges, wires, shells, solids and selections are unchanged. Circular holes additionally transform pcurves and flip face orientation to retain the same material side. [Field-level inventory](artifact-review.json) records every affected surface and face.

For a line profile, the plane is the complete affine extrusion equation. For a circle, the new angular coordinate is its exact signed source parameter plus phase; axial coordinate and orientation use the exact frame sign. These are complete native maps, not fitted endpoint replacements. Cold admission and the independent native/STEP formulas, material samples, incidence and continuation tests verify the supported consumers. The original shear case remains supported by exact finite extrusion promotion before affine transport.

`BooleanError::CoincidentOwnershipAmbiguous` replaces `CoplanarOwnershipAmbiguous`, since the same material-side rule now covers cylinders. No old-name alias is introduced. Saved geometry contains the existing Plane/Cylinder variants; no serialized admission flag is added.

| Changed native archive | Old bytes | New bytes |
| --- | ---: | ---: |
| `final-prism-artifacts/annulus-cover-identity-difference.json` | 61004 | 59007 |
| `final-prism-artifacts/bore-cover-identity-difference.json` | 88064 | 84208 |
| `final-prism-artifacts/box-cover-identity-difference.json` | 34052 | 33914 |
| `final-prism-artifacts/box-same-identity-difference.json` | 34052 | 33914 |
| `final-prism-artifacts/coaxial_bore-cover-identity-difference.json` | 88028 | 84172 |
| `final-prism-artifacts/cylinder-cover-diagonal-difference.json` | 47356 | 45867 |
| `final-prism-artifacts/cylinder-cover-identity-difference.json` | 31504 | 30501 |
| `final-prism-artifacts/cylinder-cover-rational-difference.json` | 44828 | 43128 |
| `final-prism-artifacts/cylinder-lower_equal-identity-difference.json` | 31504 | 30501 |
| `final-prism-artifacts/cylinder-same-identity-difference.json` | 31504 | 30501 |
| `final-prism-artifacts/cylinder-tiny_cover-identity-difference.json` | 31504 | 30501 |
| `final-prism-artifacts/cylinder-upper_equal-identity-difference.json` | 31504 | 30501 |
| `final-prism-artifacts/ring-cover-identity-difference.json` | 66118 | 65838 |
| `final-prism-artifacts/strip-cover-identity-difference.json` | 68037 | 67757 |
| `component-exports/components-reverse-false.json` | 133716 | 133306 |
| `component-exports/components-reverse-true.json` | 133716 | 133306 |

## Cost receipt changes

Four prism archive-hash receipts and two exchange STEP-text receipts change. Case names, original iterations, certified outcomes and the complete workload assertions remain. Every revision produces the same receipt in all three fresh processes. This is an intentional representation migration, not a performance-only preservation claim. The [supplemental STEP capture](step-receipt-capture.json) reproduces the exchange receipts and retains both revisions of each hashed file, outside the timing campaign.

| Case | Old receipt | New receipt |
| --- | ---: | ---: |
| `prisms/same_height` | 7755448584709691102 | 13313097774580281433 |
| `prisms/covering_cylinders` | 2461563069395457317 | 13992102608664050993 |
| `prisms/covering_bores` | 7117278580276442345 | 12461581736333227153 |
| `prisms/annular_cut` | 14376434420050727224 | 1012910835067963948 |
| `prism_exchange/half_cylinder` | 829047842810371600 | 7662893429916030368 |
| `prism_exchange/annular_prism` | 12000002864309371042 | 11836975616967409784 |

The four exchange exports are captured for both revisions. The identity half-cylinder and annulus are byte-identical. The reflected half-cylinder changes two cylinder axis directions and moves one plane origin within that exact plane. The reflected annulus changes four cylinder axis directions. Reversing a cylinder axis with unchanged reference X, origin and radius gives the complete chart map `(u,v) -> (-u,-v)`, preserving its set and radial normal. The plane displacement has exactly zero rational dot product with its unchanged normal. All spatial curves, vertices, topology, face orientations and every other file byte remain unchanged. The [complete entity review](step-receipt-equivalence.json) checks these facts, and all eight files additionally read as valid single solids with the independent expected measures in OCCT. This finite artifact review is not a general STEP equivalence algorithm.

All costs, including slower rows and increased allocation requests, remain in [costs.md](costs.md). One original exact thin-layer file has a separately retained [OCCT import limitation](occt-thin-comparison.json); no native geometry or fixture is changed to match the reader. All eight new rotated/reflected exports are valid in that reader.
