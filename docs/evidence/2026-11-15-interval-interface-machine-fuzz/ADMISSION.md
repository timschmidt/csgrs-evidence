# Machine-profile and lowering fuzz qualification

Owner: Alumina Interface test/fuzz harness over production configuration/profile,
exact scheduling and firmware lowering. Plan phases8/11/14 and required14.3 targets;
P1/P6/P17-P20/P27/P35-P39. Current Interface73cc71b and CSGRSd78473b have no
machine-profile/lowering fuzz target. Prior migration rejection is not reversed.
No production arithmetic, predicates, policies, fixtures or canonical encodings
will change. Preserve pending primary41 and Interface8 patches exactly.

Add a self-contained fuzz workspace and reusable deterministic harness. A validated
canonical configuration fixture derived from existing machine_profile test records
provides ingress. Structured perturbations must reach actual profile/budget/schedule
and lowering success; arbitrary invalid bytes retain typed rejection. Assert
independent exact transmission expectations, source identity, fresh reconstruction,
production executor replay, deterministic canonical output and rejection of altered
evidence where applicable. Preserve the original fixture with origin/digest.

Keep fuzz input/workload bounds explicit and distinguish exercised successful paths
from rejected cases. External fuzz time/RSS limits are containment, not geometry
resource guarantees. Seeds/smoke tests must establish reachability; early parser
rejection alone does not qualify profile/lowering. Run bounded instrumented fuzzing,
stable/MSRV tests and Clippy, record outcomes and any discoveries without claiming
universal correctness or completed migrations. No push/publication.
