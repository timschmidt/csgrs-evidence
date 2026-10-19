# E96: retained known-angle arctangent facts

Target: 6febb211e5a209ad31471853ec1fd6d8696c6911. Owner: Hyperreal's
native exact atan/pi anchors and retained pi/atan linear forms. P2-P4,
P18-P19, P26-P27 and P35-P39. No topology or analytic fidelity claim.

Current-revision reproduction preserves 68 certified cases in the original
72-case matrix; four native unit-argument cases remain Unknown. The expanded
480-function-row matrix has 384 native square identities Unknown and all
480 signs certified; the 96 Real rows certify the squares. No contradictions.
Preserve all observations and prior certified facts. The extension must make
all 72 original cases and all 480 expanded rows certify their exact identities.

Domain: the existing exact correspondences atan(1)=pi/4,
atan(sqrt(3))=pi/3 and atan(sqrt(3)/3)=pi/6, with sign, integer-pi shifts,
and both half-pi complements. Recognized rational*pi coefficients with reduced
denominator 3, 4 or 6 use these same selected principal arguments. Share the
anchor correspondences with existing native atan construction. Recover them
from the already-produced pi/atan linear form; delegate sine/cosine to the
existing unit-hypotenuse implementation and Real consumers. Preserve the
current public atan representations. Do not add a second trig kernel, extend
general approximate policy, or reinterpret arbitrary atan multiples.

The existing bounded-depth pi/atan reader remains the optional recognizer;
no extra recursive pi/Laurent recognition inside atan_argument (which would
re-enter the same reader). Reject nonzero rational offsets, unsupported angle
denominators and non-unit atan coefficients. These remain eligible for their
existing exact/refinement paths. Test near-angle rational offsets to prevent
false certification. Existing internal coefficient/work bounds are incomplete;
this patch must not claim bounded execution from its precision or graph depth.

Acceptance: all original and expanded observations; signed anchors, multiple
periods, large exact integer periods, both half-pi orientations, following
squares/arithmetic and Real sine/cosine; cold/fine/coarse and concurrency;
construction and identity proofs without angle refinement; negative controls.
The new regression must fail on the unchanged parent. JSON/CBOR native/Real,
owned/borrowed Values and collections must retain exact facts and source
identity. Keep the captured 48 prior native derived graphs consumable with
valid independently checked enclosures. Preserve previous domain-error and
high-precision full-scale fixtures.

Migration: new derived native outputs may use existing algebraic tags instead
of opaque trig nodes. Exact values and the authoritative angle graph stay
unchanged. No wire version or decoder tag changes. Capture and compare public
Real outputs before implementation; disclose any representation change rather
than counting it as a performance-only change. Semantic equality and byte
determinism are checked separately.

After the final edit run focused/default/all-feature scalar suites, debug
units, doctests, strict all-target Clippy, warning-denied docs/fmt, affected
predicate/curve/modeling consumers and Rust 1.95 checks. Preserve the ordinary
strict-workflow corpus. No push, release or complete-CI claim.

After validation, measure the unchanged ordinary 17-row corpus with 100000
iterations and five alternating parent/candidate pairs. Preserve the previous
96 native rows (unit and non-unit controls) with 10000 iterations and five
pairs, and add the three known-angle arguments through native/Real public
construction, sine/cosine, precisions 0/-32/-128, cold and warm: 72 rows at
10000 iterations and five pairs. Every materialized value must enclose
independent MPFR bounds. Preserve source/compiler/dependencies/flags/hardware,
timing boundaries, allocation/bytes/peak/retained-memory measures, executable
sizes and unfavorable results. Report new certified completion separately from
completed numerical evaluation. No general speedup claim.

Authorized volume has no retained-artifact quota and retains a 1 GiB physical
free guard. Original root/tmp/storage baselines and 200 MiB cumulative logs
persist; 8 GiB child address space, Cargo jobs 2, 60-second per-query and
1800-second compile/full limits. External containment is not an internal bound.
Preserve every attempt and executed helper; hash each physical path separately.
Hypervoxel remains out of scope. Full properties plan remains open.
