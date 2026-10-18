# Decisions and rejected shortcuts

Keep complete contact sets attached to exact parameters and original spatial
point sources. Native low-degree equations retain their existing direct path;
higher-degree numerators reuse Hypercurve/Hypersolve. No second root isolator,
sampled root census or independent-coordinate approximation is introduced.

Use one components result for mixed isolated and coincident contacts. Rejecting
every partly contained NURBS leaves a useful finite domain incomplete; returning
only its isolated roots would be wrong. Parameter ranges also represent collapsed
image components. Their source intervals are not interchangeable with one point.

Put span-chart transport and chart-preserving restriction in Hypercurve. BRep
owns the spatial frame and its source-to-spatial chart. Reconstructing native
NURBS span indices or generated-support charts in BRep would duplicate ownership
and lose selected-range evidence. Proof queries must inspect the consumed range;
a pole outside that range cannot invalidate a finite subcurve.

Use exact tangent-cross evidence when it proves the required first-order fact.
Otherwise query the derivative of a source-bound linear form through an exact
similarity. Inspect both sides of native spline joints because one deduplicated
contact need not describe every incident derivative. Do not equate a missing
transversality flag with tangency or confuse repeated roots with no crossing.

The contact API is deliberately migrated. Callers consume retained parameters
and points directly, or explicitly request their optional represented views.
Coefficient-only surface-intersection consumers continue to fail typed when
those views are unavailable. There are no compatibility shims, format-version
changes or implicit scalar reconstructions.

A contained planar image must reach the existing planar-pcurve consumer when
its frame conversion is representable. Keep that conversion in the shared
surface mapping materializer, using exact owner similarity and source restriction.
Retain a signed chart correspondence instead of rebasing selected or generated
supports. General non-similarity procedural projections remain typed.

Selected procedural-profile construction remains separate work: its axial
edges and surface trims also need retained coordinate images. Merely removing
the current scalar-endpoint guard would publish an incomplete construction.
This increment supplies a shared contact dependency and actual split/replay/
solid consumers; it does not claim that the complete CAD plan is finished.
