# R15 field-replay review (private candidate; admission pending)

The new branch is confined to a formula query whose ordinary evaluator has
already returned Unsupported. Other decided signs, other uncertainty reasons,
and errors return unchanged. Coefficients must share one field. Existing
Hypersolve equivalent-base/tower embeddings must map that field into the
formula's existing tower; no generator or source-union operation is introduced.
Homogeneous Horner evaluation preserves sign because the retained formula's
constructor proved its denominator positive. The original local polynomial
authority branch and complete refinement/promotion fallbacks are unchanged.

`cmp_by_refinement` validates both retained policies before every shortcut.
The local root-sign stage is invoked inside the existing bounded exact pass;
its singleton, opposite endpoint signs and inside-bracket obligations remain
in their original owners. The new branch neither infers simplicity from a
sign change nor creates an equality-cache entry. A different radicand, missing
source, reordered base or mixed coefficient fields cannot acquire an unproved
equivalence through this path. The tested reordered-source full comparisons
continue through the existing fallback. No cache or global limit was added.

The baseline counterfactual keeps the exact same acceptance tests. It fails the
14-case local formula matrix and 8-case equivalent-tower matrix. In particular,
the two policy versions of f versus f-2^-600 remain undecided after global
projection on baseline and become certified local orders in the candidate.
The independently derived repeated-native-root matrix contains 36 cases;
its native constructors certify a singleton for (2x^2-1)^m, m=1,2,3, including
negative scaling and exact +/-2^-200 shifts. It does not fabricate a repeated
local carrier from a constructor requiring stronger crossing evidence.

Six independent native singleton brackets saturate the existing four-entry
equality cache. Exact comparison still succeeds for uncached entries. Reciprocal
and negative charts own different caches; poisoned lookup and retention fall
back exactly. Zero/one-budget native comparisons fail typed, larger retries
succeed, and warmed equality succeeds under zero budget. The terminal control
returns Certified Uncertain(Ordering), qualified approximate equality, and
Certified Uncertain(Ordering) across strict/approximate/strict. Its exact scalar
projection remains stable and its native equality cache remains empty. These
are scoped cache controls, not a general cache-byte or cancellation guarantee.

The original complete overlap fixture records twelve successful local zero
signs and no long-fallback entry under the candidate, versus twelve baseline
fallbacks. This is diagnostic route evidence, not native timing. Separate
public traces show that the approximate-policy bottom/top overlaps use the
same proof; strict queries and the other sampled public cases do not enter it.
The public cost workload remains Certified in both policy modes.

The public allocation campaign has 4,480 successful query/validation samples,
280 equal full artifact pairs, stable resource sequences across five process
pairs, and matching per-sample checksums/sizes. Eight cells (bottom/top overlap,
two directions, approximate policy, two lanes) improve allocation traffic;
the other 48 cells have identical recorded allocation sequences. Forward
approximate bottom-overlap first-query traffic is 476,366,157 to 14,548,485
requested bytes, with calls 8,209,939 to 264,598. Warm query traffic and exact
validation also decrease. Whole-input destruction plateaus at zero net live
growth in the last five samples of both variants. That plateau is not a heap
bound. Native timing is still pending and no speedup or latency-nonregression
claim is admitted by these instrumented measurements.

Native public probe file size is 17,727,328 to 17,740,040 bytes; `.text` is
11,151,983 to 11,154,079 bytes. This is the uninstrumented executable, not an
rlib or a deployed WASM size claim. The allocation-mode binary is separately
identified and must not substitute for native measurements.

All 2,608 Hypercurve tests pass (35 existing ignores), as do owner Clippy and
documentation checks. The full owner run still needs its downstream/WASM
completion record. The candidate base predates R23, so primary integration must
validate the combined retained stack after any promotion. No R15 production
change is yet in primary. Shared singleton-certificate factoring, cancellation,
cold archive reconstruction and the broader P06 package remain open.
