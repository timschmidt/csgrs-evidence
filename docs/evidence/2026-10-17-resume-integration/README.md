# E63: recovered validation storage and integrated admitted commits

The original `main` checkout was fast-forwarded from `7ed43501755fd64a01f54c3078d12229cbc0129d`
to `9abc309af48acad10369bfe9fb9a82d39cc9fceb`. All 115 changed files matched
the committed source. The four production changes are the independently
admitted E59 Hyperreal packaging repair; the remainder is documentation and
evidence. The rejected 35-file bundle, exact-track proposal and cache proposal
were not applied. No push or publication occurred.

Disk B was found unmounted and remounted at its original path. The user
reported that a reboot was performed. The current availability audit found
921,794 unavailable paths out of 1,298,910 historical expectations, including
894,701 newly unavailable paths. No Disk B paths were missing. All 22,235
paths newly closed by E62 and its nine evidence files matched their recorded
hashes. Older history received an existence audit only. Missing repository
artifacts have no established cause; this record does not attribute all loss
to the reboot or claim complete historical preservation.

Schema 4 retains the complete expectation chain and adds the observed missing
path delta. The new loader derives each missing path's hash from its retained
expectation, checks parent digests and rejects unacknowledged incomplete
history. Its loaded expected and missing maps are compared with the independent
availability audit. Historical schema 1–3 files and their loader remain intact.

Fresh validation of the integrated source passed workspace formatting, both
Hyperreal README tests with default features, both with all features, and the
README quickstart. The first helper incorrectly expected four tests in a target
that declares two. It stopped after the passing default run. A new helper
preserves those results, verifies the two test names, and completes the remaining
commands using the same unchanged source and target. No test was changed.

The root filesystem reserve has recovered, so the original repository is again
the active writable checkout. New builds have a separate 16 GiB net filesystem
allowance; Disk B's existing 64 GiB allowance is unchanged. Validation uses two
build jobs, 8 GiB child address space, 1,800-second command containment, a 2 GiB
host memory reserve and 512 MiB filesystem reserves. These are external test
limits, not internal geometry resource guarantees. The fresh integration target,
commands and helpers are closed and individually hashed; large build files and
availability maps remain on persistent storage outside Git. General caches stay
open. The pre-existing untracked `checkpoint_v4.py` is unchanged.

Only `current_work` changes in the execution ledger. Earlier qualification flags
are historical, not claims that those suites were rerun here. Hypervoxel remains
out of scope. Public distribution, native proposal admission and the full
properties plan remain incomplete. Next is the shared native PCB aggregation
contract, including source diagnostic retention and the original workload gates.
