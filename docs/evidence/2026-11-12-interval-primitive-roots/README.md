# Primitive square-root qualification

Source revision is in SOURCE.json; production/test/CI changes are in source.patch.
Run checks.py from the source root for the 33-command matrix. The record retains
the missing-API compile witness, direct and independent GMP/MPFR fixtures,
feature/release/strict lint/docs/format checks, downstream dispatch witnesses,
no_std ARM/WASM compilation, dependency closure, and whole-repository zizmor.
There are 96 all-feature unit/integration tests and 11 doctests.

The ASan primitive_roots harness completed 100000 runs in 12 seconds, seed
20261117, max_len=16, max_total_time=30. The corpus is retained. Codegen reports
for Rust 1.88/1.95/stable and stable fat LTO include build commands, compiler,
binary hashes, disassembly and selected-symbol scans. The fat-LTO environment
is CARGO_TARGET_DIR=/tmp/interval-refactor/strict-float-lto,
CARGO_PROFILE_RELEASE_LTO=fat, CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1.
The fat-LTO release command tests --no-default-features --features
fixed,float-enclosure,serde --test float alternate_native_modes; all 16 modes
pass for both widths. Ordinary release modes are in checks.json.

The measure.py script reproduces the completion probe after building
primitive_root_cost in stable release with fixed,float-enclosure and no default
features. All 960 raw samples and executable/machine metadata are retained.
Inputs/oracles are outside timing; complete range and domain receipt outputs
are consumed inside. Cross-backend grids differ, so these are completion costs,
not a speedup comparison. The executable includes GMP/MPFR oracle code.

Coverage uses Rust 1.95, -C instrument-coverage, all-feature tests, and this
record's fresh %p-%m.profraw directory. Report/export/dump scripts retain
exclusions and identify all three mismatch records as excluded Rug
OptRational::parts. Totals are 2240/2284 lines and 4222/4396 regions; LLVM
provides no branch denominator. Coverage predates only the final test-import
cfg guard, with production sources unchanged. The final test/lint/format logs
qualify that guard. No compiled executable is redistributed.

Primitive algorithm bounds are mathematical width bounds, not measured MCU
cycles or stack bytes. Hosted platform jobs, HIL, later elementary functions,
consumer migrations, full coverage and overall refactor completion remain open.
