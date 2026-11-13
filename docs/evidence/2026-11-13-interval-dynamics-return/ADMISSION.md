# Reject forced return-boundary inline/outline variants

The full interval-refactor goal remains active. This turn makes progress by
reproducing the pending extraction's artifacts on current source and rejecting
two new return-boundary experiments against unchanged cost gates. No production
source or compatibility contract from these experiments is retained.

Baseline source: cc056c7c36101d8ff145907563ef21b0335687af. Extraction input is the
exact 41-path pending patch, SHA-256
3bebcf6370ec1ce7b72691a9699a01e3295b7a32063c4da0a52b0996b4686d48.
CONTRACT.md records ownership, domain, relevant properties and missing acceptance
before implementation. Inputs, predicates, algorithms, proof replay and method
bodies are preserved; experimental changes concern error identity and compilation
boundaries only. This textual preservation does not replace functional gates.

## Rejected API alternative

A minimal Rust 1.95 probe compiles a deprecated function reexport and a legacy
call successfully even with -D deprecated. A genuine deprecated forwarding
function instead fails with the expected deprecation diagnostic. Reexports would
therefore drop the migration notice required for old entry points. No production
reexport variant is attempted. Both complete probes and commands are retained.

## Fresh artifact comparison

All builds use the same isolated worktree, compiler, locked dependencies and
unmodified repository bench profile. Baseline and original extraction hashes
exactly reproduce the preceding dynamics-adapters evidence. This establishes
artifact attribution; no fresh runtime measurement is claimed.

| Variant | ELF bytes | Defined sized-function union | Text bytes |
| --- | ---: | ---: | ---: |
| Baseline | 13,312,600 | 8,044,187 | 8,118,103 |
| Original extraction | 13,304,584 | 8,036,358 | 8,110,279 |
| Shared error, identity conversions removed | 13,316,848 | 8,043,152 | 8,117,175 |
| Shared error, fifteen forced forwarding inlines | 13,319,192 | 8,059,155 | 8,133,143 |
| Same, twelve native scheduling entries outlined | 13,350,472 | 8,069,963 | 8,144,647 |

The shared-error-only design reproduces its size failure. Forced forwarding
inlines fail both binary and function-code gates despite removing seventeen
function ranges relative to shared-error-only. Fixing the native call boundary
with inline(never) also fails; it increases the function-range count to 9,462
versus baseline 9,406. Equation constructors, metric/join methods and predicate
implementations are not annotated. All original unfavorable measurements remain.
Each artifact passes all 194 benchmark smoke workloads. Smoke execution is neither
matched timing nor an independent full-result/receipt/allocation comparison.
No full functional, sanitizer, browser or downstream qualification is claimed
for these rejected variants, and no expensive timing campaign follows a decisive
size failure. No stripping, linker, compiler policy or acceptance threshold changes.

## Restoration and follow-up

The experimental patch is checked byte-for-byte before restoring only its ten
changed files from the exact extraction index. Restored routing tests pass three
cases, including fresh-process complete report/dispatch comparisons; axis migration
passes its separate test. Formatting and whitespace checks pass. Six additional
legacy/direct/compatibility subprocesses emit 92 identical report/trace lines each
within STRICT and APPROXIMATE_512. Their transcript hashes also match the preceding
restored-candidate record; fixed dispatch assertions were not changed.

After those checks, the isolated worktree is restored clean at its baseline.
Main's exact 41 staged paths, Interface's eight edits and clean firmware remain
unchanged. All nine preceding frozen evidence stages verify unchanged. New source
can be reproduced from the baseline commit, pending-extraction.patch, and the
chosen variant patch; restored worktrees do not contain the experiment.

Inline hints, including forced forwarders with or without native outlining, do
not resolve the current extraction gate. A further attempt needs a distinct error/
result ownership design or demonstrated code-generation cause, preserving all
existing failures, reports and predicate order. Repeating favorable measurements
or altering unrelated parser/geometry algorithms would not establish acceptance.
No phase is complete and no push occurred. All remaining plan obligations remain.
