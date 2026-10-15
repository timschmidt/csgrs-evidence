# Bounded Part 21 syntax

Retained as partial WP00/WP14a/WP21/WP23 work. The new `hyperbrep-io` crate owns
STEP syntax and source-entity accounting, with exact numeric conversion delegated
to Hyperreal. This is not yet geometry exchange or AP conformance. All 28
work-package gates remain open.

## Implementation and dependency decision

The [public contract](../../../../hyperbrep-io/README.md) covers explicit input,
token, depth, value, record, instance and section limits; deterministic writing
with an output-byte allowance; and separate exact numeric-conversion limits.
Numeric/string tokens borrow their source. Flat preorder value storage and
explicit parser/writer frames avoid recursion through parameter nesting during
parse, iteration, write, clone and drop. Views carry their owning exchange;
users cannot apply an entity's internal range to another document. Reference
lookup uses a compact sorted index and reports missing targets with ownership
and byte spans. Unknown records and complex components remain present.

The [dependency review](../../../../hyperbrep-io/docs/PARSER_REVIEW.md) identifies
pinned Ruststep and step-p21 snapshots. The [probe](parser-review/main.rs) and
[results](parser-review/results.log) use the same four hand-authored syntax
fixtures and numeric cases. Both parse the syntax fixtures, but both round
`9007199254740993.0`, map `1.E400` to infinity and `1.E-400` to zero, and panic
on the two tested oversized integer literals. Panics are caught by the probe.
These correctness failures rule out direct adoption for authoritative exact
input; the probes establish neither general upstream behavior nor comparative
performance. No third-party schema or fixture is copied. Revision/file hashes
and the isolated probe's lockfile are retained.

## Validation

[Commands](commands.json) contain twelve native parser regressions and one
doctest in debug and release, strict all-target Clippy, warning-denied rustdoc,
WASM library compilation and workspace formatting. Tests cover exact decimal
arithmetic beyond binary64, arbitrarily long integer syntax, exponent exhaustion,
complex records, forward/unresolved references, multiple sections, scope-bound
views, duplicate/large IDs, every resource boundary, malformed/truncated input,
encoded strings/binary/logical tokens and deterministic writer retries.

The [standards review](../../../../hyperbrep-io/docs/PARSER_REVIEW.md) found three
invalid-token acceptance cases: zero entity IDs, nonzero binary padding and
exchange delimiters used as record/type keywords. The added regressions
[fail before correction](lexical-regressions-before-fix.log) and pass in the
final suite. Every padding count/first hexadecimal digit combination is checked.
The encoded-string fixture's invalid `"3A"` binary was corrected to `"12F"`.

A native 64 KiB-stack test parses, writes, clones and drops 20,000 nested
aggregates. The separately compiled [WASM probe](wasm-probe/lib.rs) executes in
Wasmtime 38.0.0 with zero module imports. It checks exact numeric conversion,
complex/forward records, byte-stable normalized writing, depth rejection,
20,000-level nesting and every proper prefix of a mixed fixture.
[Execution output](wasm-execution.log) records the module's size/hash. The runtime
wheel's source URL and verified download hash are retained; it is a test tool,
not a production dependency or shipped kernel component.

All 317 existing all-feature HyperBRep test results pass: 243 core tests,
70 integration tests and four doctests. The [dependency audit](dependency-audit.json)
checks that existing locked packages and source/tests/benches in HyperBRep,
Hyperreal, Hyperlattice, Hyperlimit, Hypercurve and Hypersolve are unchanged
against `f03367c7c`. Only the new workspace package is added to Cargo.lock.

[Four deliberate faults](controls.json) are rejected by runtime assertions:
omitted value limits, omitted exponent limits, accepted duplicate IDs and lost
complex components during writing. Sources are restored in `finally` blocks and
hash-checked. Compiler failures are not credited. Final tests, Clippy and
formatting pass after restoration. `initial-*` command/log entries precede frame
reuse. The validation and matched cost run before lexical correction are retained
under `pre-lexical-review/`; final-source validation is recorded separately under
the ordinary names. Both benchmark versions accept all timed fixtures, but the
initial version fails the new invalid-token regressions.

## Costs

The first implementation allocated parser/writer frame vectors for every record.
Those vectors now belong to one operation and retain capacity across its records.
The [reverse patch](per-record-frames.patch) reconstructs the initial implementation;
its three source files and original three unpaired cost processes are retained under
`per-record-frames/`. Those initial processes are not included in the paired
statistics below.

Three fresh alternating pairs, all pinned to CPU 0, compare the frozen initial
executable with the retained executable. [Receipts](costs.json) preserve all four
case names, iteration counts, output lengths and checksums. Expected output is
authored independently of the parser/writer, including all 10,000 entities.
Input construction is outside timing. All measurements instrument Rust allocator
calls, so no uninstrumented speedup is inferred.

| Case | Baseline median | Retained median | Ratio | Allocation requests per cycle, before → after |
| --- | ---: | ---: | ---: | ---: |
| Small exact-lexeme record | 3.448 µs | 3.040 µs | 0.881671 | 21 → 15 |
| 10,000 referenced records | 8.898959 ms | 7.371986 ms | 0.828410 | 20,078 → 74 |
| 20,000 nested aggregates | 1.128832 ms | 1.089528 ms | 0.965182 | 64 → 58 |
| Byte-limit rejection | 5 ns | 5 ns | 1.000000 | 0 → 0 |

The small case uses 1,000 iterations per process; wide/deep cases use 20 and
byte rejection 100,000. Requested allocator bytes per cycle are respectively
4,682 → 4,202; 18,508,330 → 16,908,010; 5,857,866 → 5,857,386; and zero.
These sum Rust allocation/reallocation requests, not retained/foreign storage.
The benchmark grows 280 bytes to 656,088. Median peak process RSS is 12,416
versus 13,148 KiB. These samples do not establish statistical significance or
arbitrary-chain bounds. Numeric conversion and geometry mapping are outside the
timed cases. The inherited archive-admission timing issue remains open.

## Reproduction and remaining work

Use the matching source snapshot and Cargo/rustc 1.99. `qualification.py` and
`recheck.py` list validation commands. The qualification runner's first recorded
pass additionally ran the unchanged HyperBRep suite. `controls.py` temporarily
edits source and must run without concurrent builds/tests. To reproduce the
cost comparison, apply the reverse patch in a separate checkout, build its
`part21` benchmark and preserve it at `/tmp/hyperbrep-part21-per-record-bench`.
`benchmark.py` verifies its recorded hash, builds the retained source and runs
the three pairs through the small `measure.c` Linux wait4 launcher. Rebuilding
on another toolchain/path can change executable hashes; do not claim a matching
baseline until the source and environment are reconciled.

The parser-review manifests refer to the two pinned checkouts under `/tmp`.
The WASM probe manifest refers to this workspace; its runner uses the verified
runtime wheel extracted under `/tmp/hyperbrep-wasmtime`. `collect.py` captures
the artifacts and source hashes. `verify.py` checks hashes, receipts, allocations,
control restoration, command success, references and work-package status.

Still open: header/schema semantics, decoded string directives and legacy code
pages, typed entities, units, placements, geometry/topology/assembly mapping,
exact/approximated geometry export, extended exchange sections and independently
licensed CAD fixtures/external-reader interoperability. No runtime fuzz, ASan,
lexicase, complete dependency/workspace test suite or pre-push qualification is
claimed. Syntax-level cardinalities do not bound all scalar reconstruction work.
