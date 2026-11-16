# Nonautonomous and separated-time-scale comparison corpus

Full goal: implement docs/INTERVAL_REFACTOR_PLAN.md, active, unbounded.
Previous turn: progress through measured prototype rejection and verified
restoration. No source/API change from that candidate is retained. This stage
addresses Phase13 competitive validated-dynamics benchmarks and section15.
No production mathematical kernel, crate feature or protected staged path changes.
Main41 / Interface8 stay byte-identical; all77 archived stages remain frozen.

Owner: standalone maintained Rust/CAPD adapters and independent rational oracle.
P1/P6/P8/P19/P27/P35-P37. Source0a4a09c6c; CAPD pinned37057e589 as before.
Missing witness: maintained corpus has no explicit-time field, noncommuting
Jacobian, three-dimensional flow, or separated decay rates. Verify the missing
case/oracle witnesses on this revision before implementing. Existing eight cases,
exact records, 1/64 endpoint and1 tube widths, horizon[0,1/4], radius2^-10,
and actual1/16 step cap remain unchanged.

Add four prespecified fields, each point and box radius2^-10:
- time_growth: x'=t*x, x0=1, exact x=x0*exp(t²/2), cap1/16.
- turnaround: x'=1-8t, x0=1, exact x=x0+t-4t². Maximum at1/8,
  endpoint returns to x0. cap1/16.
- noncommuting: (x',y',z')=(y,t*z,0), initial(1,0,1), cap1/16.
  x=x0+t*y0+t³*z0/6, y=y0+t²*z0/2, z=z0. A(s)A(t) generally differs
  from A(t)A(s). Lower x over the uncertain box has an interior minimum at
  sqrt(2r/(1-r)), with value1-r-(2/3)*r*sqrt(2r/(1-r)); preserve this
  event, not just endpoints. Upper x and y are monotone; z is constant.
- two_rate: (x',y')=(-x,-8y), initial(1,1), cap1/64. Exact decaying
  exponentials; this is a finite two-time-scale workload, not a universal stiff
  benchmark. Endpoint/tube width limits remain1/64 and1, same as all cases.

Use the existing positive exponential series at nonnegative arguments and
reciprocal rational bounds for decay. Prove tube extrema analytically; use the
existing independently checked sqrt enclosure for the algebraic interior event.
No numerical samples or cross-solver agreement can be the acceptance oracle.
Preserve old rejection fixtures; add controls for each new field, missed interior
extrema, wrong state dimension/time dependence, and the stricter actual step cap.

A field/adapter error, stopped solve, quality failure or resource failure must
remain visible. Do not tune or weaken these fixtures/limits after results arrive.
Only completed independently validated contracts may enter timing summaries.
Retain original hard cases and document any failed new configuration separately.
No general completeness, stiffness or resource-equivalence claim follows.

Record exact output, source/binary/flags/revision hashes, native proof retention,
step domains and work, fresh/reused preparation, materialization/destruction.
Use the existing separate-process pinned CPU ABBA runner after build/check work
has finished. Validate full16-case corpus every block; compare original8 record
bytes against baseline. No push/publication/subagents. The full goal stays open.

Preflight: all32 solver/case outcomes satisfy their original prespecified widths.
The original Hyperdynamics8 certificates are identical. CAPD oscillator-point
initial zero changed from signed -0 to +0 when generalizing initial construction;
restore the original -radius/radius construction for zero-centered coordinates.
This is a serialization difference, not a geometric difference. Keep the pilot
record, but use only the corrected final campaign for the new published table.

Additional reproduced validation gaps: Python -O could disable validate.py's
assertions and accept an empty corpus; the timing runner checked only total row
count. Missing witnesses fail before implementation. Refuse optimized Python
at oracle import, and require exact case/mode/sample/solver/iteration coverage
plus positive integer timings. Keep all original nine rejected-corpus controls
and add eight field/shape/time/step/status controls. These are benchmark
validation changes, not new mathematical-kernel authority.
