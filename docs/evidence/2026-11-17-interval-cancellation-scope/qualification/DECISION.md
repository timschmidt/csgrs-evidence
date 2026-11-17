# Qualified alternative pilot; admission remains open

The scope-local alternative preserves the exact callback/check/scope-pop order
and uses a private const flag rather than another closure around the callback.
The same 1,321 test invocations and native/WASM witnesses pass. All 882 consumer
controls preserve complete outputs and trace counts. All 336 initial stack
comparisons pass: operation deltas versus the five-repair baseline range from
-160 to +160 bytes, within the unchanged 256-byte AND 4% cap. Operation deltas
versus the wrapper range from -1,056 to -944 bytes. Cleanup deltas versus baseline
range from -40 to +24 bytes. Earlier wrapper failures and positive charges remain.

This pilot does not supply complete 32-cycle alternative lifetime accounting,
three-repeat heap measurements, final-image size/monomorphization accounts,
fixed-program cumulative charges, complete consumer WASM/packages, quiet runtime
or full release validation. No implementation or resource account is admitted.

The first driver stopped before its next command at the 20 GiB free-space guard
while an independent evidence commit used temporary storage. Its 442 completed
commands and exact stop remain in attempt-01. The reviewed continuation verifies
and reuses that prefix without repeating any completed command or resetting the
original deadline. Supplemental tests and final Clippy finish within that same
deadline. Independent non-geometric verification uses a separate 300-second cap.

The older residual resource archive was outside the existing empty sparse cone.
Its 13 redundant checkout files (134,998,864 bytes) were byte-verified against Git,
marked with the matching skip-worktree state and removed from the checkout.
The index contents, committed blobs, sparse selection and clean status remain.
The queued plan contains no evidence-checkout paths. The verification record
includes the command to materialize the record again. Earlier recovery scripts
read committed Git blobs directly.

Archive only after timed validation ends, using three times stored bytes plus
20 MiB spare above the existing 20 GiB reserve to cover transient staging copies.
This strengthens handling headroom; it changes no geometry or admission limit.
