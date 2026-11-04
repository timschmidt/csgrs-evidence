# Lazy expression node errors

Source base and lockfile digest: source.txt. candidate.patch contains all
CSGRS Rust changes. The root admission is
`docs/research/expression-node-errors-2026-11-04.md` in the source follow-up.

The baseline log reproduces missing node context. The boxed-source expectation
log preserves a prototype test that incorrectly expected an unboxed dynamic
ValidationError; thiserror exposes the boxed concrete cause. The final tests
check its exact value/type and the native source beneath it. No existing test
was weakened. tests.log is the complete 681-pass/7-ignore CSGRS run; focused,
default/minimal Clippy, docs, format and budget logs retain their configurations.

The actual SynapsCAD source path consumer is captured by its HEAD, working-tree
patch and untracked failure module. Its first build was blocked by ccache's
read-only directory; disabling ccache exposed stale by-reference policy calls.
The small migration patch fixes only those calls, preserving other edits.
All-target checks, Clippy, format and fuzz-target check logs follow. These are
compilation/lint checks, not GUI/runtime qualification or installed delivery.

cost.json contains three alternating baseline/candidate process pairs of the
unchanged ignored drilled-block timing test, each with five eager and five
lazy evaluations and exact-set comparison. All adverse samples are kept; the
probe cannot establish latency nonregression on this loaded host. The baseline
is a git archive of c0db6b33bf, built with the same offline release test command
and dispatch-trace feature into /tmp/csgrs-expression-baseline-target.
layout.json and its Rust probe record unchanged Error/Result layout sizes.
The cdylib file and ELF section observations are included in cost.json and are
not a claim about a representative statically linked Rust application.

The all-target dispatch-trace Clippy check also passes on MSRV Rust 1.95.0.
