# Reproduce the regridding experiment

Use accepted CSGRS f21444763d3330e87d0ebf19f0164402ad6ac333 in a clean checkout,
with its locked sibling repositories. Primary extraction and Interface pending
patches are excluded. Rust 1.95.0, x86_64-unknown-linux-gnu, offline Cargo and
16 build jobs are recorded by run.py and measurement-metadata.json.

Before the production edit, install the two test files from candidate-source.
Run the allocation test: regrid-missing-witness.log retains the expected failure.
The resource test and scalar-dispatch test pass the original implementation.
The source patch and final three source files describe the complete candidate;
regrid_artifact_observer.rs is a temporary measurement test, not a public API.

Build baseline and candidate Hyperinterval examples using:

    cargo +1.95.0 build --locked -p hyperinterval --all-features --release --examples --message-format=json

Build Hyperdynamics consumers using the exact commands in the corresponding
*-dynamics-build.json files. Build the standalone external consumer with:

    cargo +1.95.0 build --locked --release --manifest-path scripts/validated-dynamics/Cargo.toml

Build the successive_operations benchmark with its recorded default features.
Use the same checkout, compiler, target directory and flags for each pair.
Save every ELF reported by Cargo before changing the source. The measured ELFs
are kept outside this record under the paths in complete-size-comparison.json;
that file binds their hashes, sizes, sections and named code-symbol totals.
Named symbols include monomorphizations but do not attribute all inlined code.
The linked .text and whole binary measurements remain separate gates.

Copy regrid_artifact_observer.rs into crates/hyperdynamics/tests/ temporarily and
run the baseline/candidate-artifacts.json commands. Compare every line beginning
PREP, REPORT, TRACE or WORK without numeric normalization. The exact same
373,388 bytes include complete preparation and integration evidence, scalar
traces and graph/scalar budgets. Direct dyadic operations have no policy input;
the added zero-dispatch assertion ensures they do not invoke scalar decisions.
Existing downstream tests retain their strict/approximate policy assertions.

check_candidate.py records the final affected native, minimum-Rust, WASM and
embedded checks. benchmark.py runs saved binaries at one executable pathname,
on CPU 0 with ASLR disabled, in ABBA order; no compilation overlaps timings.
It uses the maintained example workloads and all eight independently qualified
external IVPs, preserving completed output, validation and destruction boundaries.
analyze_timings.py compares exact rows separately from elapsed times and retains
every workload median. It does not treat the same-kernel comparison as an oracle.

Whole-process Callgrind uses the existing local Valgrind 3.24.0 distribution.
The baseline whole.out and candidate-whole.out runs use no benchmark arguments:
all eight cases, fresh/reuse warmups, replay, output and destruction are included.
Their counts are diagnostic, not per-integration latency or additive inclusive
cost percentages. Exact transcripts are checked against the independent rational
analytic oracle in scripts/validated-dynamics/validate.py.

## Identity argument and retained resource semantics

For canonical nonzero endpoint mantissas a,b at stored exponent e, a requested
p <= e places the same endpoints at (a*2^(e-p), b*2^(e-p), p). Removing the common
power of two, capped at i32::MAX, recovers exactly (a,b,e), including canonical
values already capped at i32::MAX. Zero and empty have canonical exponent zero.
Thus copying the normalized source preserves representation as well as its set.
Coarser-grid outward floor/ceiling code is unchanged.

The extracted private reservation helper retains the former bits==0 branch,
checked shift/growth calculation, size/work failure precedence, accounting debit,
and usize conversion order. Both materialized alignment and identity regrid call
that same authority. This intentionally retains conservative charges even though
identity regrid avoids the expanded temporary integers. It does not claim a new
budget contract or a total allocation/CPU bound for arbitrary-precision arithmetic.

## Disposition

The candidate is rejected. All exact rows, resource accounts, scalar traces and
correctness checks passed; all 25 measured linked and named-symbol size comparisons
were nonincreasing. The complete consumer improved, but the unchanged scalar corpus
exposed logarithm latency regressions. A separate `benchmark.py logconfirm` ABBA run
reproduced them. See all 380 owner rows, 16 consumer rows and 30 confirmation rows;
no unfavorable case or assertion was removed. These are measurements on this host,
not a universal performance result or an established explanation of the codegen cost.

`restoration.json` records the four verified experimental paths restored/removed.
`restore_builds.py` rebuilds the original owner and consumer binaries and compares
all 25 complete bytes with the saved baseline. The original allocation witness is
preserved as a failing experimental test in this archive, not installed or ignored
in the restored repository. No arbitrary inlining or layout retry was attempted.
