# Correct the README text-construction status

Owner: CSGRS public documentation. P6, P9 and P37 apply to the documented
TrueType/Hershey constructor interface. The current README says text still
needs a typed-failure migration, although its own text section and the current
public functions return Result, with GeometryOutcome in context variants.
The finding was reproduced from current source during the preceding cache
qualification; recheck its exact file hashes before applying this correction.

Replace only the contradictory summary paragraph. State that text constructors
return typed failures and context variants retain operation-local certainty.
Preserve the separate open end-to-end provenance contract. Do not claim a new
runtime capability, whole-font validation, complete external distribution or
successful interrupted library suites.

This documentation-only correction needs source/signature review, exact diff
review, whitespace and repository formatting checks. Rust code, examples and
test bodies do not change; no new mirrored test or runtime rerun is justified.
Record actual checks and retain the previous cache rejection/admission state.
Only current_work may change in the ledger, with all other raw bytes pinned.
Use a fresh small workroot, preserve every closed artifact and retain the
inherited missing-path disclosure. New outputs are below 2 MiB and require
at least 512 MiB repository free space before and after the change.
