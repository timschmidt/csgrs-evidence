# Lazy shared adaptive Taylor preparation

Owner Hyperdynamics trajectory recurrence and bounded adaptive controller;
Phase13/10.7; P1/P3/P5/P6/P19/P20/P35-P39. The previous lower-order restriction
API cannot extend the ascending orders demanded by the adaptive controller.
Reproduce the missing shared controller API and capture current default proof,
work and dispatch artifacts before editing production.

Add explicit controller.share_preparation().integrate(request,budget). Preserve
the existing controller, options and default result/artifact semantics. Shared
results carry their preparation choice in their public wrapper type and expose
borrowed full original reports; no alternate ODE/math kernel. Use one adaptive
algorithm definition with only preparation varied. Native search, ascending
quality order, halving/regrowth, proof validation and retained history stay in
order. No eager maximum-order construction: prepare the first demanded order,
then extend only absent higher orders from the previous prepared prefix. Existing
stages share exact source/derivative DAGs. Never cache partial failed extensions.

Add bounded FlowTaylorProgram::extend_order(additional,budget), including zero,
using the existing normalized Lie recurrence through the new remainder order.
Original source guards, binding order, coefficients and selected final remainder
must equal independent preparation. The previous program is immutable on failure
and remains valid input to existing restrictions, steps and horizon integration.
Order overflow, entries, cumulative work and cancellation remain typed. Shared
input storage, Real payload/refinement and whole-heap accounting exclusions stay
explicit; no unsupported total bound. Stage handles/output positions are counted.

Factor source-level recurrence/control loops only with expanded default statements
and their evaluation/predicate order preserved. Default full proof artifacts,
work and dispatch must reproduce baseline. Existing tests/assertions stay intact.
New shared path intentionally avoids repeated preparation and has different work
cutoffs/dispatch; test its own exact limits, all cutoffs for a small fixture,
cleanup, prefix/status consistency, cancellation and retry. Validate scalar limits,
empty/unit/identity and invalid inputs before shortcuts. Mathematical and native
failures cannot become quality misses or weaker-method success.

Evidence: failed missing-API baseline; equivalent independent definitions and
complete successful/failed histories; graph-sharing identity checked separately;
exact constant/polynomial/exp/rational expectations; fresh replay, actual packaged
consumer, both toolchains, downstream checks, strict lint/docs/features; completed
adaptive workload costs including materialization/history, allocations and output
storage; default owner benchmark/code/binary comparisons for the affected refactor.
Preserve adverse evidence and reject unsupported regression-free claims. No phase
completion, publication or push. Preserve41 pending main paths,8 Interface edits
and42 frozen evidence stages; isolate candidate work.
