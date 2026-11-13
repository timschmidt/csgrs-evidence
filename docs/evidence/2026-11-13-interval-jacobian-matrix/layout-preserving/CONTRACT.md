# Preserve the existing expression error layout

The first unretained projection variant adds JacobianShape with two dimension
pairs. Measured ExpressionError layout grows from 24 to 40 bytes when the new
feature is enabled. This affects the shared error carrier of existing interval
operations and is avoidable. Keep that source intact while its broad/coverage
checks finish. This separate worktree changes only the proposed diagnostics:
JacobianRows and JacobianColumns each retain expected/actual count; rows are
checked before columns, both before empty-domain handling or coefficient copying.
Cancellation retains first precedence. No existing public error variant or
previously admitted operation changes. The proposed API has not been retained
or shipped, so this is its design correction, not a migration of existing users.

Do not box the error or allocate diagnostics. Verify the carrier remains 24 bytes
under both feature configurations, preserve original domains and all success
assertions, add both mismatch witnesses, and re-run affected owner/downstream,
sanitizer/fuzz and cost checks on this source. Neither the initial variant's
passing tests nor its larger error layout qualify the corrected candidate.
