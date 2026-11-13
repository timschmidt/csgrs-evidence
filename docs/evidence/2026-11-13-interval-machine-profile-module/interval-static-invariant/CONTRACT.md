# Static diagnostic for a type-proven fraction invariant

The inline interval-only candidate preserves results/allocations and successive
artifact size/text. Its profile adds Problem::Debug::fmt (44 bytes), source and
diagnostic data, one vtable/location footprint and related relocations. The
profile ELF grows 408 bytes despite 32 fewer text bytes. This attribution is
retained in ../interval-inline/profile-function-differences.json and section data.

Rational::fraction on this revision returns Err only for d == 0; this is the
unchanged construction.rs implementation. NonZeroU64 excludes that input before
the scalar call. Replace expect's formatting of that impossible scalar error with
a static panic message while retaining the error-branch invariant check. No
unsafe/unreachable_unchecked, default value or failed-result substitution is
permitted. The full unsigned radius domain, i64 fast path, scalar arithmetic,
endpoint order, existing public validation and typed error precedence remain.

This does not waive ordinary failures: the Interface still rejects zero wire
denominators with Arithmetic(DivideByZero) before constructing NonZeroU64, and
negative wire radii with Configuration(Scalar). Existing arbitrary-Rational
radius validation is unchanged. Any future expansion of fraction's error domain
must revisit this infallibility proof. Run focused invalid-input/exact/trace
checks after the edit, then profile/successive size and the remaining gates.
