# Clock arithmetic migration

Previous goal turn: progress, retained whole-horizon coordinate evolution.
The full fifteen-phase objective remains active.

Owners: Hyperinterval owns reusable primitive range intersection, midpoint/radius
and directed integer quotient bounds. Alumina-clock keeps its exact scaled affine
model, boot identity, causal ordering, freshness, health, uncertainty admission,
scheduling and wire formats. P1/P5/P6/P18-P20/P31-P39 and plan 9.5/9.6 apply.

Current baseline clock bdee397 uses local positive-denominator floor/ceiling
division and pairwise range/width arithmetic. Hyperinterval has integer set
intersection and midpoint/radius, plus a private positive-denominator quotient
kernel in fixed_arithmetic.rs. Missing acceptance: a checked reusable i128
quotient-bound API and a native clock consumer preserving the complete heartbeat
corpus. Reproduce the missing API before changing production code.

Expose exact mathematical floor/ceiling of n/d for signed i128 inputs, with
ContainsZero for zero denominator and Overflow for MIN/-1. The pair comprises
integer bounds on a rational value, not a claim that a discrete IntegerRange
contains the noninteger rational value. Reuse the existing positive kernel. Initial extraction preserves its sequence;
the measured candidate subsequently changes its primitive quotient formula as
recorded below. Fixed callers and their dispatch ordering remain unchanged. Negative denominators,
including MIN, need their own checked path without an overflowing sign flip.

Clock migration must retain the public layout, error precedence, every numeric
estimate and wire byte. Use IntegerRange transiently; preserve signed i128 scaled
offsets, u128 rate products and existing checked arithmetic ownership. Native
integer decisions do not invoke approximate Hyperreal or midpoint substitution.
Any new quotient error maps to the existing Arithmetic boundary; admitted clock
rates are strictly positive. No std, allocation, arbitrary precision, mutable
global state or unwanted default features may enter the firmware dependency.

Before retention compare pristine and candidate public observers over existing
heartbeat fixtures and expanded analytic/error/extreme corpora. Verify independent
floor/ceiling inequalities and analytic clocks, not merely wrapper agreement.
Run Rust 1.88 owner/downstream checks, feature/no_std/cross-target compilation,
actual Interface clock consumers where locally executable, output/dispatch,
allocation, native/WASM code-size and matched cost evidence. Observe unchanged
device heartbeat code separately from the browser-side estimator. Hardware
cycles, stack/HIL or unavailable targets remain explicit gaps unless measured.
No material hot-path regression is accepted without the plan's required note.


Cost-driven extension: the completed clock candidate is initially about 10%
slower. Forced intersection/midpoint inlining and removal of an outlined Option
map preserve exact rows but leave a reproducible ~3.4% regression. Generated
cycle_bounds still performs general interval-product ordering for a known
nonnegative singleton time. Plan 3.5 explicitly requires known-sign scaling.
Add IntegerRange::scale for an exact scalar, preserving empty and all primitive
endpoint families, checked overflow and the smallest integer hull. Its two
products establish output order algebraically from the factor sign, using the
existing private ordered Bounds constructor. No existing multiplication dispatch
is changed. Reproduce the missing scalar-scaling API and qualify independently.

Final cost investigation: the old Euclidean quotient pair kept the unused upper
bound's impossible overflow panic alive when a consumer requested only the
lower bound. Direct truncating quotient/remainder gives floor q-(r<0) and
ceiling q+(r>0) for d>0. At either signed quotient limit the remainder is zero;
the wrapping correction operations therefore cannot wrap on this domain.
The fixed-point owner now shares this revised kernel and requires its full
arithmetic/oracle/conformance and matched cost checks after the final edit.

The integer sum already receives ordered, exact endpoints. After both checked
additions succeed, monotonicity proves output order; use the existing private
ordered Bounds constructor instead of testing the established result again.
The endpoint addition order and typed overflow outcomes stay unchanged. Added
GMP full-width range-sum coverage complements the existing exhaustive byte and
small-range image tests. No Hyperreal sign/predicate call or cache is involved.
