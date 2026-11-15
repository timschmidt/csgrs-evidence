# Completed uncertainty transport costs

This is a new opt-in enclosure strategy, not a behavior-preserving rewrite.
Compare both implementations on the exact identity map obtained by x'=y and
then x'=-y, each over duration 1/4, with initial [-1,1]^2. Independent box
propagation divides y into M equal dyadic cells covering [-1,1], retains both
reports for every cell, and computes the endpoint cover and its Cartesian hull.
Each cell returns x bounds [-1-1/(2M),1+1/(2M)]. The requested completion
contract is a certified enclosure of the whole initial set with x width at most
2+1/M and y width 2. M=8,32,128 are separate quality tiers. Retained-noise flow
keeps two columns and returns the exact original box at every tier. Both paths
retain their full proofs until destruction. An independent algebraic oracle,
not agreement of wrappers, checks the final bounds and evidence completeness.

An adverse constant-flow control uses x'=1 followed by x'=-1. Both paths return
exactly the original box, and the box baseline requires only one cell. This
exposes the overhead when correlation transport offers no endpoint benefit.

Warm means immutable Taylor programs prepared outside the measured region.
Cold includes their preparation and destruction. Both include construction of
the initial endpoint carrier/partition, both steps, proof retention, output
materialization, exact validation and complete output destruction. Original
ExpressionField ingestion is common and excluded. All use order 1 and default
EnclosurePolicy (precision -64, graph entries 1,000,000, work 100,000,000,
scalar bits 16,384, scalar work 1,000,000,000,000). The final cover hull has a
separate DyadicBudget with those scalar limits; its used work is reported
separately. No predicate-policy fallback or float conversion supplies evidence.

Cost builds use Rust 1.95, opt-level 3, default release codegen/LTO settings,
external Cargo.lock and the isolated committed source. Timing uses the system
allocator and an explicitly pinned CPU, alternating pairs with raw samples.
Allocation runs are separate: the reused Stage45 tracking allocator records
requested payload bytes (not RSS, allocator overhead, or stack), retained bytes,
peak live bytes, alloc/realloc/dealloc calls and complete cleanup. Its private
headers and atomic instrumentation must not enter the timing binary. Both the
instrumented and normal paths validate the same exact output contract.

Binary and ELF text sizes compare this probe with and without the opt-in noise
feature. They describe these linked workloads, not universal application size.
Archive delivery, wider geometry coverage, automatic horizon control and broad
competitive validated-ODE performance remain separate acceptance obligations.
