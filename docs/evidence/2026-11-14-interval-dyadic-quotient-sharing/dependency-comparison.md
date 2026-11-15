# Separate dependency contracts

The initial external resolution (retained as external-Cargo.lock) selected newer
num-bigint/serde versions than the repository. Its same-source-path candidate
binary grew 1,008 bytes and function-address union 950 bytes, so no external cost
acceptance is established. Allocation/output transcripts and symbol sizes are
retained. No candidate is accepted from these results.

The next comparison uses the repository lockfile as the dependency source for
both baseline and candidate. This is necessary to measure the actual owning
crate dependency contract; it is not a source/inlining/layout variant. Both
controls use the identical pinned lockfile and source path. Original adverse
external results remain part of qualification and cannot be relabeled passing.
