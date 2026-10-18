# Native quantile certification (E86)

Normal-quantile seeds and Newton steps now propose values; native CDF bounds
or verified retained CDF identities certify published approximations. Monotone search repairs bad seeds.
Exact half probability stays zero through imports and downstream arithmetic.
Recognized rational CDF inverses stay exact without evaluating tiny tails.
Valid stored graph bytes are preserved. Native exact constructions now return
canonical rational values, an explicit correctness migration.

The parent revision freshly reproduces 100 and the false interval [99,101]
for inverse-CDF(1/2). New tests cover both tails, extreme seed scales, MPFR
enclosures, serialization, concurrent refinement and cancellation recovery.
The unchanged thousand-digit mpmath reference cases pass. Additional near-half
checks distinguish coarse numerical zero from an exact zero fact.

Candidate-v2 is rejected: it exhausted the unchanged 60-second
quantile(CDF(1000)) workload that the parent completed. Candidate-v4 restores
that composition through a checked CDF identity. Tests reject an altered
CDF graph that only resembles the valid identity. Both builds remain retained.

The review records full scalar checks, selected predicate/curve/circuit and
modeling consumers, Rust 1.95, strict lint, documentation and formatting.
Matched controls preserve completed workloads and retain every cost increase.
The general native domain/resource contract, full bindings, distribution and
release validation remain open. Hypervoxel is excluded.

External manifests identify independently hashed physical files and a verified
raw archive. Closed build layers remain read-only. Original storage baselines
persist: root 16 GiB, agent-selected temporary storage 58 GiB, and the
user-approved cumulative log allowance of 200 MiB. The user requested moving
bulky ephemera to Disk B/csgrs; 27 directories (about 65 GiB allocated) moved
only after independent source and destination verification. Compatibility
symlinks retain the old paths. The derived Disk B allowance is 145 GiB,
including the previous 72 GiB, moved storage and 8 GiB of headroom. Original
free-space baselines were not reset.

The earlier final-source consumer build stopped with an I/O error while the
per-user temporary quota was full. That failed build remains preserved. A
separate mutable Disk B copy passed the complete unchanged consumer checks.
All 188224 relocated regular files and 7529 whiteouts were rechecked at
closure. The repository target remains in place because it exceeds Disk B
capacity. No historical missing artifact was recovered or newly credited.
