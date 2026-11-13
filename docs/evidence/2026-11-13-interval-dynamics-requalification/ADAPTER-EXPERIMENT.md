
## Profile-driven adapter experiment (prepared before editing)

The completed mixed-path jerk result/drop profile has 2,245,382 instruction
references on the accepted baseline and 2,248,872 on the unchanged extraction.
The original route_path_length performs length acquisition in its loop. The
extracted MetricPath loop calls the FeedPathElement MetricSpan::exact_length
adapter out of line. Its inclusive length-acquisition cost rises from 156,160
to 157,056 instruction references for the same 32 completed operations.

Owner: Hyperpath's geometry-owned MetricSpan adapter. Properties P4, P10, P36,
and phase-11 preservation gates. Domain: the unchanged admitted FeedPathElement
variants and existing policies, including typed unsupported exact lengths.
Missing witness: adapter extraction has no avoidable completed-work overhead.
Experiment: an ordinary #[inline] attribute on this adapter only, with no body,
predicate, query-order, error, algorithm, or compiler-policy change. Evaluate in
the isolated checkout; retain only after differential results, allocations,
dispatch, downstream semantics, binary/function size and owner timing gates.
Revert if not justified. The original candidate and every unfavorable cost
observation remain separately recorded. Counts from the custom probe are not
wall-clock timing or proof about arbitrary applications.

Historical distinction: the prior `inline-adapters` experiment annotated thirteen
adapter/metric methods on the earlier 71-function candidate and produced a
13,315,464-byte executable (larger than its 13,308,824-byte baseline). It was
rejected. This experiment changes only the profiled span length adapter on the
current 86-attribute candidate; prior rejection is not discarded.
