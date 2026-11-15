# Current DRC CPU attribution

The accepted source test executable from 71377cb5 was revalidated by SHA-256;
current accepted head e221a083 differs only in its ledger and evidence manifest.
The isolated worktree is clean at that head. The original KiCad test and original
tracked archives were used. The debugger completed 63 worker-stack samples at a
two-second sampling period and the inferior exited 101 at the existing CPU gate.
Its 129-second diagnostic duration is not an acceptance timing or speedup result.
The previous uninstrumented 130.443995189/127.134745903 worker-second failures
against 120 remain the acceptance observations; no threshold is changed.

Inclusive stack counts (overlapping, not an exclusive time partition):

| Path | Samples of 63 |
| --- | ---: |
| Native contour admission |29 |
| PCB region aggregation |26 |
| Structural exact sign recognition |19 |
| Wide rational GCD |16 |
| Minimum copper-neck check |12 |
| Unary candidate scheduling |10 |
| Candidate preparation |10 |
| Split topology |10 |
| Fragment selection |10 |
| Contour bounding boxes |7 |

Source inspection confirms run_checks already owns a OnceCell of copper-layer
profiles, consumed by layer-sanity and minimum-copper-neck in this workload.
BoardModel is publicly mutable, so a persistent board cache would need an explicit
invalidation/source-binding contract. No additional app cache is justified by
these samples. The prior nonzero-adjacency shortcut failed its cost/size gate;
these stacks do not supply evidence to repeat it. Candidate-preparation samples
include native-arc materialization and exact scalar recognition, rather than
establishing authored adjacency as the dominant cost.

The next cost investigation should isolate scalar work in native curve preparation
and classification, including temporary rational-curve promotion, against the
existing Hyperreal arithmetic and exact proof contracts. Any candidate must
preserve predicate ordering, both-policy outputs/receipts and dispatch counts,
with owning and downstream cost evidence. Do not restructure the computable core,
field-kind dispatch or DRC spatial index. The current profile is a search constraint,
not qualification of a new algorithm, a cache or an interval migration.

No implementation, fixture, test, policy or dependency changed in this stage.
There is therefore no new source validation or full CI claim. Existing 41 staged
CSGRS paths and 8 pending Interface paths remain byte-identical. The 15-phase goal,
solver/interface migrations, pending dynamics extraction and release/resource/HIL
gates remain open. No push or publication.
