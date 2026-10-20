# Plane relation cost contract

This supplements the original [prism admission contract](contract.md); its
pre-reproduction bytes remain unchanged.

The second, separately measured prototype moves plane-pair relation proof into
the BREP geometry owner. Its domain is two validated native plane charts,
including reversed, scaled and skew bases, symbolic values, coincident origins,
transverse supports and exact offsets of 1/10^12. The private coincidence query
must use the same strict relation proof as full plane intersection and preserve
unresolved/unsupported errors. A certified transverse relation suffices to rule
out coincidence without constructing the unused intersection line. Missing
acceptance coverage is a direct relation matrix with independently specified
plane equations, operand reversal, and full intersection-point/direction checks.
The three prism grouping callers consume this query; no topology formula or
caller tolerance is introduced. This adds no new cache or public API.
