# Embedded interval qualification — 2026-11-14

The full interval-refactor goal remains active. This record adds real Xtensa
link/image evidence and fixes a reproduced board-composition build error. It
**does not close** the flash-fit, runtime cycle, whole-stack or HIL gates.

## Sources and reproduced build repair

Baseline Firmware bdee397 predates the clock/Q30/servo interval migrations.
Candidate 558df6d contains them, using core b30763aa5 (ledger HEAD c5c726bed).
Both initially failed the MKS FOC release build: main unconditionally called
write_diagnostic_boot_marker, implemented only by TinyBee ServiceResources.
The same one-line feature guard was applied to both comparisons, preserving
TinyBee and TinyBee-4mb UART behavior and avoiding fabricated methods or new
hardware configuration on other boards. The production repair is Firmware
b9ecf8d (full SHA in FINAL-REPOSITORIES.json). Candidate source tree equality
with that commit was checked. The baseline remains bdee397 plus the identical
recorded normalization patch; it is not claimed to build untouched.

## Executed results

- Espressif Rust 1.90.0-nightly (abf50ae2e, release 1.90.0.0), matching the
  repository's documented Rust compiler, with pinned GCC 14.2.0_20241119 and
  Xtensa LLVM 20.1.1_20250829. espup 0.19.0 release binary SHA verified against
  the official asset metadata. No existing toolchain was replaced.
- All ten normalized release builds pass through the existing xtask: baseline
  and candidate for MKS FOC, TinyBee 8 MiB, TinyBee 4 MiB, T-Deck Pro and
  T-LoRa Pager. The two existing target dead-code warnings remain on both
  revisions; these builds are not reported as warning-free target Clippy.
- Portable workspace: 601 tests/doctests pass, strict all-target Clippy passes
  on Rust 1.88. Affected target formatting passes. No CI file changed.
- Complete board capability JSON is byte-identical between comparisons,
  capability digests verify, and every board remains non-armable.
- Embedded Hyperinterval feature graph contains only integer/fixed features;
  application Wi-Fi/HTTP allocation is pre-existing and is not a claim that
  the entire firmware application has no allocator.

## Linked and packaged images

Summed allocated, file-backed section bytes (not an inferred flash layout):

| Board | Baseline | Candidate | Executable-byte change |
| --- | ---: | ---: | ---: |
| MKS FOC | 4,189,417 | 4,188,057 | -1,376 |
| TinyBee 8 MiB | 4,289,065 | 4,287,793 | -1,328 |
| TinyBee 4 MiB | 4,289,069 | 4,287,789 | -1,336 |
| T-Deck Pro | 4,095,065 | 4,093,585 | -1,480 |
| T-LoRa Pager | 4,049,997 | 4,048,493 | -1,504 |

Allocated NOBITS section totals and linker stack capacities are unchanged on
all five boards. Raw ELF bytes also shrink, but include debug sections and are
not a flash-use measure. Exact sections, artifact identities and images remain.

espflash 4.7.0 save-image was run without hardware access, with declared chip
and flash capacity, merge and skip-padding, using its **default partition
layout**. This is not board-declared partition-map validation. Three candidate
images save: TinyBee 8 MiB 4,353,440 bytes (baseline 4,354,704); T-Deck Pro
4,159,232 (4,160,704); T-LoRa Pager 4,114,144 (4,115,648).

Both 4 MiB configurations fail packaging on both revisions. Against the
4,128,768-byte default app partition, MKS FOC candidate app size 4,188,160
exceeds capacity by 59,392 bytes (baseline excess 60,752). TinyBee-4mb candidate
4,287,904 exceeds by 159,136 (baseline excess 160,416). These are pre-existing
flash-fit blockers, modestly reduced by the migration, not completed image
qualification. No assets, flash declarations, board capabilities or safety
contracts were reduced to pass the gate. No image was flashed.

## Static frames, not runtime stack bounds

The inspector retains full disassembly and ELF symbol tables. Only an `entry
 a1,N` at an ELF Function symbol's start contributes a recognized frame.
Interior entry-like encodings, including possible literal/data interpretations,
are retained separately and are not claimed as function entries. Missing or
unclassified prologues are not assigned zero. Rust hash suffixes are removed
only for comparison; non-unique symbol groups do not prove individual identity.

On classic ESP32, Q30 multiply local frame falls 368 to 96 bytes and square
128 to 96. On ESP32-S3 they fall to 80 bytes. However classic ESP32
RotorCalibration::observe grows 144 to 160 and cosine_first_octant grows 80
to 96. These +16-byte local changes are explicitly unresolved at the whole-call
stack level; smaller callees do not by themselves prove a smaller live peak.
The largest recognized local frame is unchanged (28,032 MKS FOC, 27,968
TinyBee, 27,760 S3), and is not a bound on nested calls, interrupts, recursion,
register-window spill behavior, vendor tasks, or runtime high-water use.
Register pressure, MCU cycles and HIL remain unmeasured. No visible serial
fixture, probe runner or emulator was present initially; no hardware was used.

## Preservation and limits

Only the TinyBee-specific diagnostic call guard was committed this stage. The
41 staged extraction paths retain their binary-patch SHA; Interface HEAD and
eight pending edits remain unchanged. All 23 prior frozen stages verify.
No push, complete workflow campaign, coverage or sanitizer campaign is claimed.
Previous exact software observer and oracle evidence remains in the registered
clock, Q30 and servo records; image sizes alone do not establish arithmetic
correctness. Remaining plan phases and Phase 11 cost gates stay open.
