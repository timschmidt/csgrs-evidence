# Accepted extension: sixteen independently qualified IVPs

Full interval-refactor goal remains active. The prior turn produced evidence
through prototype rejection; this turn retains an actual Phase13 benchmark and
validation extension. No production mathematical library, feature or protected
pending path changed. Implementation commit17fbc05837920ce39891beb8bd903c250c9699b9.

Added point and radius2^-10 box cases for x'=t*x, x'=1-8t, the noncommuting
three-dimensional system(y,t*z,0), and separated decay rates(-x,-8y). Their
horizon[0,1/4], endpoint width1/64 and tube width1 were prescribed before
implementation. The first three use actual step cap1/16; two-rate uses1/64.
All original eight cases, inputs, thresholds and exact record bytes are preserved
for both solvers. Existing Hyperdynamics order3 and CAPD order12 remain unchanged.

All32 solver/case outcomes pass independent exact rational endpoint and
continuous-extremum checks. The noncommuting uncertain case includes its
algebraic interior minimum; the turnaround includes its interior maximum despite
returning to its initial endpoint. No samples or cross-solver agreement serve as
an oracle. All16 new/old inputs complete with their original proof carriers.

Final CPU0, ASLR-disabled, ABBA campaign: 640 timing samples, 64,000 completed
integrations, ten samples of100 for each solver/case/fresh-or-reused mode. CAPD
has lower median latency in all32 matched case/mode configurations. Hyperdynamics
has the narrower noncommuting point endpoint (about5.29e-23 versus8.88e-16).
Its two-rate uncertain endpoint width is0.014473501, below but near the fixed
0.015625 limit, versus CAPD0.0015210953. This is evidence for a concrete wrapping
workload, not a blanket quality or stiff-system claim. No timing claim relies
on a failed/incomplete result or a weakened fixture.

The first extension pilot is retained separately: CAPD oscillator-point initial
-0 became+0 when generalizing initialization. The final construction preserves
original bytes. Only campaign supplies the published extended tables.

Two reproduced benchmark-validation gaps are fixed: optimized Python could
silently disable oracle assertions, and timing collection checked only record
count. Import now refuses optimized Python. Every case/mode/sample is required
exactly once with matching solver/iteration count and positive integer timing.

Passed: nine Python tests (including1500 exact sqrt controls, three zero-series
identities and corrupted timing coverage), all17 actual corrupted-corpus controls
(original9 plus8 new), Rust1.95 Clippy with-Dwarnings and formatting, final C++
warnings-as-errors, all42 pinned CAPD native tests, diff and repository-budget
checks. Measured source/binary hashes match the committed implementation. Main41
and Interface8 pending paths remain unchanged; firmware and CAPD stay clean.
All77 older frozen records verify unchanged. No push or publication.

These are scoped benchmark and validation checks. They do not complete the full
stack, hosted/HIL, portability, coverage, universal resource, stiff/long-time,
algorithm-portfolio, wrapping-control or remaining release obligations. No phase
is marked complete. The prior sensitivity/matrix prototypes remain rejected.
