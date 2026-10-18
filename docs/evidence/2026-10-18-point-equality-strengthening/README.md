# Permit stronger proofs in point acceptance tests

E67's third test unnecessarily required a mathematically zero trigonometric
identity to stay Unknown and its point comparison to stay inconclusive after
refinement. That conflicts with the existing P4 contract: warming may expose a
stronger proof. The previous test passed; this correction does not hide an
implementation failure.

The revised test retains the original identity, both coordinate-axis placements,
and the exact low-high-low precision sequence. It permits a new exact-zero proof
and rejects a contradictory nonzero fact. It also adds the same identity plus
exact positive `1e-400`. Those points are independently distinct, so equality of
the other rational coordinate must not certify their equality. Both comparison
directions and the absence of a false zero fact are checked. The first two tests
are unchanged.

Final whole-workspace formatting and warning-denied compilation pass. All three
tests pass on the unchanged production libraries and the inline candidate:
six test executions. The [review](review-v1.json) records the commands, library
hashes and exact source. Only the acceptance test changes; no optimization,
policy, fixture reduction or resource-limit change is admitted.

The [raw archive](raw-evidence-v1.tar.gz) and
[member index](archive-members-v1.json.gz) preserve this correction and its runs.
Both executables remain separately hash-pinned outside the archive. E67's old
test and evidence remain intact. The containing experimental control directory
and candidate build targets remain open. Wider candidate checks continue
separately. The last historical audit recorded 921,794 missing paths; that
history is not re-audited here. Hypervoxel remains excluded. Public distribution
and the full plan remain open; no push was made.
