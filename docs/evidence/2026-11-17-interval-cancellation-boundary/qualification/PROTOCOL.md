# Cancellation at the publication boundary

Owning layer: Hypersolve work_budget. Target P5/P6/P20/P36 and plan 14.4:
aborted work must not be published. The current with_cancellable_budget contract
explicitly permits a value when cancellation has not reached an instrumented
check. Reproduce that behavior on 4a04dd974 using the extracted public package,
then qualify a documented contract extension in an isolated source checkout.
This is a change in cancellation behavior, not a behavior-preserving refactor.

Add one final cancellation/exhaustion check to with_cancellable_budget after
its callback returns and before the scope is popped. Preserve callback
invocation, cooperative/non-preemptive execution, first-failure precedence,
nested charges, parent/child isolation, panic restoration and fresh-token retry.
Do not change with_budget, counter meanings, scalar or predicate order, or
silently claim a total-work/time/heap bound. The change cannot undo callback
side effects or preempt uninstrumented arithmetic. A cancellation request that
arrives after the final check may still race with successful publication.

Use a separate RAM worktree based on 4a04dd974. Do not modify the live portable
source checkout, extracted package source, artifacts, frozen queue or deadlines.
Retain the baseline failing witness and all original tests. Add independent
acceptance tests for no-check cancellation, pre-cancelled callbacks, nested
cancellation, cross-thread cancellation, output drop, first-failure precedence,
panic cleanup and fresh-token retry. Record the intentional behavior migration
with the candidate. All ordinary exact outputs/dispatch counts and resource/
performance/size gates remain required before any retention. No source is
admitted merely by these focused tests.

Initial witness/implementation qualification: 1,800 seconds total, 600 per build
or owner command, 20 per witness, six build jobs, Rust 1.95, offline/locked after
lock generation. Keep raw failures. Use RAM build storage and the unchanged
20 GiB development-volume guard. Original watcher remains terminal and parent
held; no unrelated job is interrupted. Later complete-consumer, downstream,
resource, size and runtime qualification requires its own declared envelope.
