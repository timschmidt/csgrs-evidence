# Retained reconstruction

The first candidate used a temporary Cow fallback. It removed the original
panic but failed the unchanged explicit normal-form workflow for lazy SinPi:
an enclosure warmed a temporary graph that the subsequent inverse could not
reuse. That candidate and its 2-pass/2-fail result are retained.

An inline OnceLock proposal would violate the existing <=8-byte cache
layout guard and was not run. The current candidate keeps that guard intact:
a one-word AtomicPtr lazily owns a private primitive/OnceLock cache record. Existing materialized
graphs remain borrowed. Borrowed, cloned and consuming access share the same
graph; cloning a cache shares its immutable node and retained proofs. Serde
still skips this cache, so a null/missing optional payload keeps its wire form.
The cache is owned by the Real, has no global key or eviction, and drops with
its owner. OnceLock synchronizes initialization. At most one entry is retained;
this is not a byte limit. The graph can grow with its certificate and refinement.
No new internal total-work/cancellation bound is claimed; external containment
stays fixed. Inline layout, first-use allocation and retained graph costs must be
reported, not called an optimization. The common native constructor edits only rename the private
cache type; no mathematical formulas or policies change.
