# E89: asinh approximation range enforcement

Imported small-series nodes previously returned a zero approximation for
`asinh(+/-4)` at scale two, publishing enclosures that exclude the exact value.
The kernels now establish their series range from the argument and reuse the
native logarithmic identity with odd symmetry for larger values. Stored graphs
remain unchanged and subsequent arithmetic consumes the corrected values.

The [review](review-v1.json) records the mathematical argument, independent
oracles, final-source validation, measured costs and remaining limitations.
The [contract](contract-v1.md) predates implementation; the applicable explicit
[storage approval](storage-allowance-v1.json) retains the original baselines.
The [checkpoint](checkpoint-v1.json) pins sources and evidence.

All new physical artifacts are hashed independently under Disk B/csgrs, and
all raw archive members are verified. Generated files and binaries remain at
their recorded paths. General domain validity, typed native cancellation,
complete resource contracts, release acceptance and the full plan remain open.
