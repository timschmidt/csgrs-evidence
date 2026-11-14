The first newly added whole-horizon example asserted exact reachable-set equality
for the existing Picard interval integrator. That was an incorrect expectation:
its candidate search widens the velocity candidate from [-1,1] to [-3,3], so
four quarter steps produce an x envelope [-384,384]. The analytic reachable
interval is [-128,128]. The wrapper preserves the native report without changing
that behavior. The corrected example checks the precise computed endpoint and
independently verifies analytic tube/end inclusion for all four segments.
No existing assertion was removed or changed, and no implementation was changed
to obtain a tighter result. Automatic wrapping control remains open.
