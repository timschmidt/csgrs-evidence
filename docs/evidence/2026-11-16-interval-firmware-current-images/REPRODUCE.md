# Reproduce current firmware image measurements

Copy this frozen record to a new mutable directory before running any writer.
The current full revisions are in sources.json; baseline/sources.json and
baseline/source-restoration.patch describe the matched pre-clock-fix snapshot.
Both use one identical sibling csgrs/firmware layout and the same locks, assets,
board features, release profiles and toolchain recorded in toolchain.txt.
The diagnostic baseline ref is retained locally as described in baseline-retained-ref.json.

Adapt run.py paths to an isolated sibling checkout. It explicitly unsets external
RUSTFLAGS, target-dir/toolchain overrides and ALUMINA_AP_PASSWORD, retaining the
repository's development fallback credential. Its firmware commands build through
xtask and never invoke the MCU Cargo runner or flash hardware. Each build has a
1800-second watchdog and four compiler jobs. Packaging uses espflash 4.7.0 with
actual declared flash capacities and its default partition layout. Preserve all
packaging errors; the two 4 MiB boards must not be silently promoted to larger
capacities to obtain output.

Run the current and restored-clock versions sequentially in that same path,
retaining all ELF files before switching sources. Both variants must be clean at
command boundaries, and the current revision must be restored afterward.
The existing quiet-workflow barrier in these scripts is host-specific scheduling,
not validation. Adapt it to prevent comparisons from overlapping new builds.

analyze.py extracts each successful merged image's actual partition table,
converts it with espflash, and verifies its application slice against a separately
generated unmerged image. The parser's 64 KiB reserve is a prospective diagnostic
screen, not an adopted board requirement. Board flash_regions are empty.
inspect-image.py captures original sections, symbols, disassembly and function
entry allocations. It does not bound transitive/interrupt/runtime stack.
verify-identities.py and attribute-byte-differences.py distinguish executable
identity, diagnostic source locations, ELF metadata and packaging hashes. The
latter independently validates segment XOR checksums, full-ELF hashes embedded
by the packaging tool and final image SHA-256 values.

The archive retains deterministic gzip versions of every final ELF/image/table.
Decode these before replaying artifact inspection; ARCHIVE-SCOPE.json records
the decoded lengths and hashes. Do not write over original completed output.
Build logs retain two existing target dead-code warnings. No target Clippy,
MCU-cycle, HIL, flash deployment, full phase completion or size exception is
claimed. Source ownership and exact clock regression qualification remain in the
separate firmware clock audit; this record measures the missing final images.
