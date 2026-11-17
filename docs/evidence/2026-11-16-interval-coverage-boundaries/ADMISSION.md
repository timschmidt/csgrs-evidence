# Coverage-directed boundary witnesses

Owner: Hyperinterval; plan phases 3/5 and sections 14.1–14.5; P1/P5/P6/P18–P20/P35–P39.
The all-feature source-bound coverage run at b8bcc1155 reports 4,688/4,740 lines,
9,320/9,891 regions and 494/494 functions; no branch instrumentation. All 26 LLVM
mismatch diagnostics name only external Rug zero-hash records; report tables
reproduce. These metrics are finite configuration coverage, not a completeness
proof. Separate test modules are excluded by explicit source file selection.

Missing acceptance witnesses: a representable exact source within 2^-64 through
2^-512 of pi/6 (sine) or pi/3 (cosine), with output on either side of the dyadic
1/2 boundary; interrupted refinement must not publish a result or poison retry.
Use existing directed MPFR/GMP oracle helpers to establish source bracketing and
independently verify tight final endpoints. Also exercise canonical empty dyadic
tangent/cotangent and rational power adapters, including invalid exponents paired
with empty operands. Existing test cases/assertions and production code stay
intact. No helper duplication or denominator exclusion to improve percentages.

Only add focused tests after retaining baseline final test artifacts. Preserve
fixed program baseline c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb and original
b8bcc1155. Compare final release trigonometry, tangent and fractional_power test
executables individually: at most32KiBfile/16KiBcomplete executable code/named
code AND2percent, incrementally and cumulatively. This small host-test allowance
is proposed for independent correctness and resource-failure witnesses, not
production growth; no firmware deployment or flash claim applies. No existing
account for these test artifacts exists; all54previous accounts stay intact.
The original production trig_cost executable must retain its code/size and
functional output. No production runtime optimization is claimed. Test execution
adds deliberate validation work, reported separately from unchanged production
costs. No comparative timings while unrelated jobs run.

Run all owner tests after the final edit, the affected feature/compiler matrix,
strict Clippy and formatting; remeasure coverage on the same denominator and
retain warnings. Test-only additions do not complete all remaining uncovered
paths, universal coverage, downstream migrations, release/HIL, or the15-phase
goal. Do not change budgets if the candidate exceeds them.

Additional reviewed witness before the final edit: fractional_power.rs:347–354
distinguishes SizeExhausted from Overflow when the required signed quotient
shift exceeds i64 but stays within the declared u64 bit allowance. Use base
2^(i32::MAX) and exponent2^33; all mantissas/denominators remain one and the
existing integer-power shortcut avoids expansion. The positive effective shift
is 2^64-2^33. A max_bits limit one below shift+1 must exhaust; an exact or
larger allowance must report Overflow, not resource exhaustion. Negative power
at grid0 must complete as[0,1] with a small budget, retaining the existing
sub-grid shortcut. This exercises an observable resource/failure distinction,
not an unreachable-code or denominator exclusion. Existing size caps stay fixed.
