# Reproduction and immutable evidence

Never execute writer scripts in this archived/frozen record. Copy this record to
a new writable staging directory first. Create clean checkouts of SOURCE.json's
base, implementation and final commits outside all existing worktrees; adapt the
copied scripts' absolute source/build/output paths. Keep the old evidence trees
read-only. Do not rerun integrate.py against an already integrated branch.

1. The Cartesian adverse witness is the first focused test. Run it on the base
   with its test source copied there before applying the production change.
2. Run the commands recorded in prototype-checks.json, final-checks.json and
   final-owner-command.json. The final focused suite has fourteen tests; the
   earlier prototype suite had thirteen. Apply no changes to oracle assertions.
3. Build the copied cost-probe Cargo.toml with its Cargo.lock at Rust 1.95 using
   the recorded features. build-cost.py builds timing, allocation and box-only
   variants and runs exact smoke assertions. Run strict Clippy too. The original
   failed zero-retention assumption is retained separately; it is not a gate
   claimed to pass. Current allocation runs record all lifecycle stages.
4. With compiler/test workers finished, adapt and run measure.py. It writes raw
   samples before summaries; timings, memory and linked sizes have distinct
   scopes. Warm/cold refer to prepared programs, with the first full run per
   process separately retained. No statistical conclusion follows from one
   diagnostic run or from timings taken concurrently with compilation.
5. delivery.py packages seven crates at the implementation revision into a
   fresh package Cargo home, unpacks their exact archives and audits every local
   dependency. No source path from the checkout may reach the client. The
   final acceptance test addition is copied by delivery-final-tests.py and run
   unchanged against those archives. Final README differs only by one blank
   line; production files and the shipped example are unchanged.
6. For a new candidate integration, adapt the alternate-index preflight to its
   current baseline. Never reset the pending extraction. Current integration
   preserves the pending changes except blob/hunk metadata. Run main-checks.json
   commands after the final integration and retain their raw outcomes.

Allocation instrumentation is copied and adapted from the earlier Stage45
surface interval-range probe, outside its frozen record. It is measurement-only
code; no allocator or unsafe block is introduced into production Hyperdynamics.
All live build artifacts are outside this evidence stage. Archive digests and
compiler/dependency identities are recorded; third-party .crate payloads and
build caches are not redistributed here.
