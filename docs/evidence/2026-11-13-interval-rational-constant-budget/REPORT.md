# Rational constant admission before materialization

Source commit `b3fb87d9bd6457d3f6b64ddbf219d299e1eb7a8b`, based on
`4f14251e3097726a267e3840c13a9c84fbfe0517`. This closes a concrete resource gap
under the owned field adapter; the fifteen-phase goal is not complete.
CONTRACT.md records ownership, properties, domain and the missing witness before
source edits. SOURCE_STATE.json, source.patch and source/ retain the complete
eight-file change. The pending extraction and Interface patch bytes are unchanged.

## Reproduction and owning-layer repair

On the target revision, DyadicInterval::from_real first obtained Hyperreal dyadic
bounds and only afterward admitted the resulting coefficients for native work.
A 64-bit limit rejected 129-, 4,097- and 131,073-bit rational coefficients, but
only after allocating respectively 248, 1,240 and 32,984 bytes per call (four
allocations each). before.log retains the failing zero-allocation assertion;
before-all.log retains all three cases. The isolated external allocator measures
32 calls after eight warmups with input construction excluded. No foreign live
bytes are silently saturated away. The original executable is identified in
artifacts.json. After repair, all three cases reject with zero allocations and
zero bytes; after-rejection.log retains the same passing assertion and workload.

A second underlying issue was visible in source: round_rational queried canonical
numerator()/denominator() before its reservation. For internally unreduced ratios,
those getters can perform coefficient copies and a GCD. Hyperreal now exposes
Rational::ratio_parts(), borrowing its existing sign and stored magnitudes without
allocation, normalization or cache publication. These may be unreduced and are
not a canonical encoding or mathematical identity. Existing canonical getters
are unchanged. Borrowed parts remain the same after a canonical result is cached.
No rational storage, arithmetic core, decision order or cache layout is restructured.

Hyperinterval's existing round_rational uses that view to reserve actual stored
sizes before copying. The existing scaled_quotient kernel then reserves scaled
integer division work. DyadicInterval::from_rational reuses these kernels and
returns the tight outward grid interval. Structurally rational from_real inputs
use it after the existing precision admission. Other Real inputs retain their
previous certified refinement/conversion path and support. The original source
remains exact, and native enclosure rounding does not adopt a different source.

Budget consumption intentionally changes: rational copies/division are now
admitted directly, and lazy raw coefficient sizes are visible rather than hidden
behind unbudgeted normalization. A larger stored ratio can require a larger
configured budget even when its reduced value is small. Exhaustion is tied to
actual declared reservations; retry under an adequate budget succeeds. Admission
does not depend on canonicalization-cache warmth. This is a resource correctness
change and new conversion capability, not a preserving refactor. It does not
claim every higher-level rational bridge is wholly bounded: for example existing
endpoint-order validation can have its own costs. General symbolic refinement,
source ingress/serde, scalar payload lifecycle and total heap limits remain open.

## Witnesses and downstream consumption

The Hyperreal test constructs positive and negative lazy ratios with 8,195-bit
stored components. Borrowing returns those exact storage references, records zero
dispatch events, and leaves the canonical cache untouched. Existing getters then
return 3/2 with the proper sign; the borrowed view and admission size stay unchanged.
Canonical zero is also covered.

Four native conversion tests check 13,243 signed rational/grid combinations
against independent i128 floor/ceiling expectations, agreement with the existing
rational interval and Real bridges, further native set/arithmetic use, large
coefficients, exact work limits and one-unit-short failure, extreme precisions,
retry, genuinely lazy line-intersection coordinates and cache-independent work.
Cold lazy conversions and oversized rational rejection record zero refinement or
canonicalization dispatch events. A field regression checks both image and
Jacobian failure under a 32-bit coefficient limit, then exact successful retry,
including the original constant source checks preceding a zero Jacobian.
Existing fresh-process field replay and symbolic sqrt(2) tests remain intact.

Development attempts are retained. An initial test used a nonexistent contains
name and a TraceSnapshot collection method; those test API mistakes were fixed.
An initial complex-quotient fixture was already canonical and failed the assertion
that it exercised unreduced storage. It was replaced by exact line-intersection
coordinates, retaining that assertion. No preexisting fixture, count assertion,
policy or validation was weakened. Unrelated formatting from directly formatting
included Hyperreal fragments was removed before final qualification.

## Qualification

All fourteen final commands in checks-final.json and five supplementary commands
passed: 182 interval tests, 218 rational-owner tests, minimal dyadic/rational
features, Rust 1.95 rational/Real bridge and field tests, 874 Hypersolve owner
checks, 467 integrated dynamics/path tests, strict all-target Clippy for all four
affected crates, release tests, stable Wasm, strict docs, AddressSanitizer, fmt and
diff checks. Supplementary checks cover all 12 point benchmark smoke cases,
Rust 1.88 dyadic-only tests, all eight field tests in the isolated package without
the pending extraction, staged diffs and the repository retention budget.

An initial all-feature Rust 1.88 command was rejected because Hyperreal requires
Rust 1.95. The README already documents the feature-specific minimum: dyadic-only
supports 1.88, rational/Hyperreal requires 1.95. Both actual supported combinations
were tested; no rust-version check was bypassed. The initial failure is retained.
This is affected local/downstream qualification, not the full pre-push workflow
matrix, hosted operating systems, hardware or release-package qualification.
No push was attempted, and Firmware is clean and unchanged.

## Completed-workload cost evidence

The unchanged external field probe was built at the same paths with the same
lockfile for the parent and candidate. Both binaries complete the same 35
constructor/JSON-replay/image/Jacobian/pipeline cases for degree 0/1/8/32/128 and
N=2/N=4 affine fields. Independent expected interval outputs are checked. Twenty-one
separate small-budget cases test exhaustion/cleanup and do not count as geometric
completion. Construction/replay and required output destruction are included as
specified by each operation; source/input/preexisting-field preparation is excluded
where not part of that operation. These are explicit path consumers, not a proof
that all dependent unpublished packages can be installed from the registry.

Runs are pinned to CPU 0 with no compilers or Cargo processes active. Each uses
eight warmups, 32 allocation iterations, and 31 timing samples of eight operations.
The initial candidate/control/control/candidate sequence showed lower image,
Jacobian and pipeline medians, but constructor/replay regressions up to 26.8%.
Those adverse results prompted a control/candidate/candidate/control repeat;
all first-pass results remain in first-cost.json, first-cost-summary.log and raw
logs. Pooled results use all 124 samples per implementation per case, not a selected
favorable run. They show substantial timing variation and are not an across-the-board
or universal speedup claim.

Pooled candidate/control median ratios by operation are: construct 0.9533,
replay 0.9449, image 0.7885, Jacobian 0.8172 and complete pipeline 0.8809. All image,
Jacobian and pipeline cases are faster in both the initial and pooled summaries.
Four affine construct/replay rows remain slower in the pooled summary, with maximum
ratio 1.03042. The pooled per-case ratio range is 0.72733–1.03042. No cause is proved
for the observed timing variation or adverse constructor/replay samples.

All allocation epochs finish at zero live bytes. Pipeline allocations fall from
53 to 47 for degree zero, from 8,879 to 8,105 for degree 128, and from 1,253 to
1,139 for N=4 affine. Maximum observed peak remains 173,660 bytes. Graph accounting
is unchanged. Degree-128 image scalar work falls from 4,528,715 to 2,280,761 units;
Jacobian scalar work falls from 4,599,743 to 2,351,789. These are accounting units,
not CPU instructions or heap-byte bounds. Both use the same configured policy.

The field executable grows 160 bytes to 3,934,184, and its sized-function interval
union grows 201 bytes to 1,992,586. The point benchmark shrinks eight bytes to
7,047,768, with identical .text/.rodata and unchanged sized-function union 3,150,521;
.data.rel.ro differs, so full artifact identity is not claimed. The rejection probe
grows 216 bytes. Raw symbols, sections, hashes, dependency locks, compiler/hardware
records and samples are retained. These costs are accepted with the demonstrated
resource correctness gain; they do not establish extraction retention or waive
any preserving-refactor gate.

## Remaining objective

The rational constant path now admits its native materialization costs. This does
not finish complete field resource accounting or general derivative/continuity
proofs. Validated constant/affine and Euler/Picard evolution, uniqueness, bounded
halving, exact horizon/end enclosures and flow tubes remain open, along with the
other unresolved phases and the pending extraction's retention gate.
