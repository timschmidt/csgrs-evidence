# Native quantile evidence contract

Target revision a91983ad7966651ce9ec4f9b0d932db699735429. Hyperreal owns
quantile evaluation, seed admissibility and numerical certification. P1-P6,
P18-P20, P25-P27 and P35-P39 apply. Reproduce the bad-seed result on this
revision before production edits. An unproved seed is an evaluation hint,
not a certified approximation. Preserve the intended inverse-CDF value,
supported public inputs, qualified failures, valid stored graphs and bytes.

The input domain is standard-normal quantiles of defined computable
probabilities strictly between zero and one. Seed integers and their binary
scales must not alter the value. General expression-domain validation remains
a separate open obligation; do not erase unresolved children or silently
replace errors by geometry or numbers. Reuse native scalar machinery.

Acceptance will exercise direct native construction, JSON and CBOR import,
opaque Real wrappers, collections and downstream arithmetic; exact symmetry,
independent rational enclosures, both tails, correct and deliberately bad
seeds, cold/warm and low/high/low precision, cancellation and recovery.
Retain full-scale scalar and affected downstream tests, feature combinations,
compiler-floor checks, strict Clippy, documentation and formatting. Record
matched successful quantile and ordinary arithmetic cost controls, allocation
and size evidence, and every unfavorable or failed result.

Preserved resource baselines and ceilings are root 16 GiB, Disk B 72 GiB,
temporary storage 46 GiB and cumulative command logs 100 MiB. Child address
space stays 8 GiB, jobs two, focused commands 60 seconds and compile/full
commands 1800 seconds. No old evidence may be removed or overwritten and no
baseline may be reset. A proposed log allowance is not authorization to use
it. The small baseline reproduction fits the remaining approved capacity;
broader execution waits for adequate approved capacity. Internal total-work
and heap bounds are not claimed. Hypervoxel is excluded.
