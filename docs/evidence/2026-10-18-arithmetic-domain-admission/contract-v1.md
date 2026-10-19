# E87: rational expression domain admission

Target revision: e417fdbeacc8e8f9731c65082ddefcee251d87c6.
Owner: Hyperreal native expression deserialization and its shared, defined
rational proof. Properties P1, P3–P6, P18–P19, P26, P35–P39 apply.

Before implementation, reproduce Inverse(Add(1,-1)) and its zero-product
wrapper through Computable and Real import. The mathematical oracle is
1 + (-1) = 0 and division by zero is undefined, regardless of outer scale.

Extend the existing exact-argument domain and small-kernel range checks to
defined rational arithmetic: Add, Multiply, Square, Negate, Offset,
LinearCombination3, and Inverse with a proved nonzero denominator. Reuse the
existing bounded rational-only quotient evaluator. Inspect both children even
under zero coefficients. Keep existing exact-leaf checks before this fallback.
No approximation, graph rewriting, policy weakening, or opaque-atom cancellation.

Known invalid graphs must fail decoding before a parent can publish a fact.
Computable serde reports a domain/range error; Real JSON/CBOR/Value wrappers
return Problem::ParseError and collections preserve the diagnostic. This is an
intentional diagnostic migration for invalid arithmetic graphs previously
accepted or reported UnknownCertificate. Valid wire representations and
previously certified supported workloads must remain unchanged. Truly unproved
named equality remains UnknownCertificate, separately tested. Acceptance of an
opaque or oversized expression is not proof of its domain; full graph admission,
native unchecked partial-function preconditions, and whole-parser resource
limits remain open and must remain documented.

Proof limits inherited without change: 512 nodes, depth 64, 8192 operations,
4096 coefficient bits, 32 atoms, 64 terms, degree 8 (rational-only uses no opaque
atoms). Exceeding this optional recognizer declines the proof, never proves
validity, zero, or invalidity. Existing leaf inspection remains available.
Test boundary and over-limit inputs with external containment; the decoder
does not expose a whole-input work/cancellation contract.

Validation: reproduce baseline; independently derive arithmetic domain/range
matrix; preserve valid wire and downstream composition; strengthen existing
undefined-payload tests; retain a separate unresolved-domain regression. Run
all scalar default/all-feature integration and library tests, debug library,
doctests, warning-denied Clippy/docs/fmt, and affected predicate/curve/modeling
serialization consumers. Measure ordinary completed import cost using the
unchanged E86 corpus and retain adverse results; no speedup is proposed.
Release/binding/full-plan acceptance is not implied by these local checks.

All new bulky files stay in this Disk B/csgrs directory. Prior closed artifacts
are read-only inputs. Preserve every failed execution and source version.
Retain independent physical hashes; never deduplicate verification by inode.
Original resource baselines remain: root free 75,664,232,448 bytes with 16 GiB
net limit; Disk B free 373,218,291,712 bytes with user-authorized relocation
allowance 145 GiB; /tmp free 67,482,746,880 bytes with 58 GiB net limit.
Cumulative command logs: 200 MiB. Child address space: 8 GiB. Cargo jobs: 2.
Focused execution: 60 seconds. Compile/full suite: 1800 seconds. No reset of
workloads or baselines and no deletion of earlier evidence to fit these limits.
