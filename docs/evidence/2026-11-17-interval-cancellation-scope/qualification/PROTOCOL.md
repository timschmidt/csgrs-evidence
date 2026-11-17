# Scope-local cancellation publication candidate

Hypersolve work_budget owns P5/P6/P20/P36 and plan 14.4. The preserved wrapper
candidate 9457d39b8 has correct cancellation semantics but the complete consumer
reports 168 operation-stack growth failures, 848 to 1,104 bytes above its
five-repair baseline. All original outputs, traces, witnesses and limits remain.
The new hypothesis is that passing the large callback result through an extra
closure boundary causes avoidable stack growth. Test it; do not claim causality
or acceptance in advance.

Use a separate RAM worktree based on the wrapper candidate. Move the same final
exhaustion check into the existing private enter function immediately after
operation() and before Scope::finish. Select it with a private const boolean:
true only for with_cancellable_budget, false for plain/coefficient scopes. This
keeps the same callback/check/scope-pop order, preserves existing first-failure
and nested-cancellation semantics, and avoids a runtime branch on ordinary scopes.
No public API, scalar predicate ordering, field kinds or decision sequence changes.
Do not add another helper or change any assertion. The original publication
migration and its limitations still apply. This is an alternative implementation
of an unadmitted contract extension, not a claim that earlier charges disappear.

Initial functional and direct-consumer comparison: 1,800 seconds total, 600 per
build/test/check, 60 per execution, six jobs, Rust 1.95, locked offline resolution.
Keep all original eight new unit tests, direct Hypercurve cancellation tests and
native/WASM witnesses. Compare identical source files of the complete consumer,
changing only dependency paths. Start with default and trace native resource
images, both policies, reused/rebuilt and cold/warm state, both stack fill patterns,
and the original exact output/trace comparisons. Test cancellation/retry in its
separate feature build. Preserve all evidence before any broader qualification.

The initial stack cap remains 256 bytes AND 4% versus the five-repair controls.
Record wrapper-to-alternative differences separately. Preserve wrapper charges
and every earlier positive program charge; final fixed-baseline cumulative
accounting remains open. A lower observed stack does not erase an earlier record,
prove runtime equivalence, clear trace heap failures, or admit an exception.
Quiet runtime, full lifetime/resource, final image/distribution and downstream
checks remain necessary. No source or account is admitted by this pilot.

Use RAM builds and keep the development 20 GiB guard. Original cancellation
checkout, frozen campaigns, queue parent/deadlines and unrelated jobs are unchanged.
