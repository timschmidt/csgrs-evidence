# External completed-dynamics comparison

Goal: all of docs/INTERVAL_REFACTOR_PLAN.md, including Phase 13 competitive
validated-dynamics benchmarks. Previous turn was progress: candidate rejected,
restoration verified, stage74 archived. No production math changes are proposed.
Main41 and Interface8 pending paths remain protected; prior74 stages frozen.

Review first considered independent-base Taylor arithmetic. Current polynomial
and certified outer-model composition already cover the plan's basic arithmetic;
no concrete independent-base consumer was found. Do not add speculative API.

Owning layer: maintained benchmark adapters around Hyperdynamics and an external
validated solver. P1/P6/P8/P19/P27/P35/P36/P37 apply. Missing witness: no external
validated solver currently completes the same declared IVP/tube/endpoint workload
under an independent analytic oracle and recorded cost boundary. CAPD::DynSys is
an external C++ comparator only, never a production dependency or proof authority
inside the Hyper stack. No third-party source is copied into CSGRS/evidence.
Pin CAPD 37057e5899bccaa6cd5701057b7e6ea5e232ef8b (version6.1.0); inspect build,
interval backend and tests. Native intervals require its documented rounding
compiler flags; isolate its rounding environment in a separate process.

Start with exact dyadic initial sets and horizon[0,1/4]: constant, exponential,
Riccati before its pole, and harmonic oscillator. Include point and uncertain
initial sets. Require complete certified horizon, endpoint enclosure and retained
whole-horizon tube from original solution certificates, not sampled paths.
Check exact input agreement, finite bounds, contiguous positive time coverage,
independent analytic containment and prespecified endpoint/tube width limits.
Retain failures separately; do not change hard cases or limits to get completion.

Compare the declared common mathematical output contract. Full source/proof
receipts differ and remain visible; do not imply equal replay or resource APIs.
Include materialization and destruction. Separate reusable preparation from fresh
preparation, record order/grid/step options, work counters, versions, compiler
flags, CPU affinity, raw samples and full exact endpoint/tube output. No timings
while compilation or another measured workload is active. No percentage claim
before matched complete outcomes and independent oracle validation.

Scope of this stage can advance incrementally, but the full goal stays active.
A small corpus is not general competitiveness or a universal closure proof.
