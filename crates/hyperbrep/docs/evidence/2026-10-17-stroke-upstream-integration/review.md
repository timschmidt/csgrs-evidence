# Merged-source review

The cone increment is committed as
`8b9e0bdc8ba85a0985d7e6734bfe259a177f902c`. The pending merge incorporates
upstream `be2a0c37bfe57799c62a36125a5cb883a5458f00`, preserving both histories.
The normative property/admission/agent files match both parents byte for byte.
The source merge was automatic. Its only conflict was the appended
`current_work` entries in `docs/properties-status.json`; the existing span
editor inserts the complete branch BREP value into the complete upstream
file, preserving all unrelated upstream bytes. The conflicted file and merge
receipt remain available.

## New boundary probe and unchanged limitation

The independent line-stroke consumer uses the same line (0,0)-(3,4), radius 1,
height 3, both traversal directions and both butt/round caps on both revisions.
It checks analytic areas/volumes, exact near-boundary classifications, oriented
incidence, translation, cold native replay, STEP reimport, Boolean reuse and
empty recovery. The original assertions remain unchanged.

Its first combined execution completed the two butt cases and stopped at the
first round case. The preserved v1 source and binary make that limited coverage
explicit. A case selector then permits each original case to run in its own
process without changing the workflow or its assertions. Both revisions
complete both butt cases. Both round cases return native
`Geometry(UnsupportedMeasurement)` at a side-face area query. The consumer's
`unwrap` turns that returned error into a failed assertion; the kernel itself
does not panic. The candidate driver deliberately remains failed, rather than
relabeling all four requested workflows as completed.

The diagnostic `round-stroke.json` and `merged-stroke-frontier-1.log` locate
the limitation: `CurveRegion2::boundary_paths()` exposes four exact rational
quadratic circle spans, which `builder::extrude_path` persists as rational
Bézier extrusion profiles. The cap areas and volume evaluate, while the four
curved extrusion-face areas return the typed unsupported result. This is the
same frontier before and after the upstream change. No assertion, scalar
policy, source profile, native validation or expected measure is weakened.

This probe is an integration finding, not evidence of a regression or of
complete stroke-path extrusion. Its successful cases and its unsupported
cases must both survive the merge admission. It does not replace any of the
preceding native/STEP/WASM success corpus.

## Next BREP increment

The native `construction::extrude_curve_region` implementation already consumes
the normalized region's certified line/arc view while retaining the original
region proof; regularized prism Booleans use it. The public ownership builder
currently exposes paths/contours but no normalized-region entry point.

A separate increment should expose strict normalized-region extrusion through
the ordinary model-owning builder. First reproduce the missing public API,
then test the full original stroke workflow through that declared input,
holes, multiple material components, empty material, invalid height ranges,
certainty, cold replay, STEP and continued Boolean use. Keep the existing
general rational-path measurement failures explicit; a native-region success
does not establish general rational-surface integration or a parameter-map
proof for replacing an arbitrary spline by a circle. This extension belongs
in HyperBRep, reusing Hypercurve's existing authority without a second planar
engine or an approximate fitting route.

## Qualification scope

The merged-source native/IO suites, upstream stroke controls, lint, docs,
examples, fuzz-target compilation and the existing source-path WASM consumer
are checked separately from the preceding cone record. Existing artifact and
diagnostic comparisons bind the merged inputs. The full pre-push/distribution
gates and the known unrelated scalar debug failures remain open. No push is
part of this checkpoint, and no work package is marked complete.

The recorded cache cleanup removes only regenerable debug test executables
from the task's target directory to make room for merged-source builds. Source,
libraries, logs and all frozen baseline/candidate executables remain intact.
