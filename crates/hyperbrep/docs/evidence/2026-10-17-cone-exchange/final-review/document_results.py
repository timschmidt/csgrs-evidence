"""Publish measured scope after acceptance; never close a work package by count."""
import json
from pathlib import Path

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
read = lambda p: json.loads((OUT/p).read_text())
q = read('qualification-summary.json')
b = read('benchmark-summary.json')
d = read('dependency-costs-v1/summary.json')
n = next(row for row in b['costs'] if 'ratio' not in row)
validation = (
    'Native/IO debug and release suites each pass 552 tests; minimal features pass 544. '
    'The four dependency libraries pass 3525 all-feature tests with six existing ignored cases '
    'and 3419 minimal tests with one existing ignore. Native/dependency Clippy, rustdoc, all '
    'STEP examples, optional OCCT reads, fuzz-target compilation and Cargo formatting pass. '
    'The corrected WASM consumer passes 111 groups with zero imports and a warning-denied build. '
    'Its only late change adds a source-map check; all native consumed crate/test inputs remain '
    'byte-identical. The two inherited zero-factor debug failures remain reproduced and unfixed.'
)
cost = (
    f"All 175 preceding main benchmark cases retain their exact receipts across 18 preserved corpora. "
    f"One new complete cone exchange workflow adds absolute cost, for 19 corpora and 111 processes. "
    f"{len(b['adverse_timing_rows'])} existing timing rows exceed a 1.10 ratio; maximum {b['maximum_case_ratio']:.6f}. "
    f"{len(b['increased_allocation_rows'])} rows increase allocation calls or requested bytes. "
    f"The dependency supplement preserves all 196 cases in 18 processes, with "
    f"{len(d['adverse_timing_rows'])} ratios above 1.10 and maximum {d['maximum_case_ratio']:.6f}."
)
limits = (
    'The finite conical LINE-revolution subset is admitted separately from general cone/revolution '
    'exchange and Boolean closure. Direct CONICAL_SURFACE, B-spline generators, arbitrary cone '
    'trims and apex-ending solids remain open. Irrational vertices can remain exact native geometry '
    'while unencodable by the writer. Parser/output cardinalities and solver counters do not bound '
    'total work, retained heap or cancellation. Source-path native/WASM tests and optional OCCT '
    'reads do not establish package/MSRV/actual C-Python-JS delivery, formal proof, coverage, '
    'runtime fuzz/ASan/lexicase, release or the full pre-push gate. All 28 work packages remain '
    'open or in progress; no push. Fetched upstream be2a0c37b is pending a separate integration '
    'and requalification; this evidence belongs to the pinned cone increment.'
)
readme = '''# Exact conical STEP exchange

Native `ConicalRevolution` recognizes a line revolved around a unit axis,
retains its source and both branches, and provides exact chart correspondence.
HyperBRep IO maps the selected `SURFACE_OF_REVOLUTION`/`LINE` subset, retains
per-face source parameters and uses exact finite anchors when the apex cannot
be encoded as a finite decimal. Native coverage also admits a single periodic
side face and independently lifted rectangular cone partitions.

Baseline: `490ed3421a471ef010d647def63c083138e45633`. Production changes are
confined to HyperBRep and HyperBRep IO. Geometry/topology proofs remain native;
IO owns syntax, units, source accounting and exact decimal encoding.

'''+validation+'\n\n'+cost+'''

The original full-size 5-to-2 height-6 cone, exact (3/5,4/5)-rotated 40-unit
cutter, halves, band/remainder and both reunion orders now complete exchange,
cold replay, recuts and empty recovery. Independent source formulas, exact
integrated measures, incidence and 1/10^12 classifications remain required.
The height-7 nonterminating apex, independent manual LINE files, supplied
pcurves, source reversals/units, similarities/reflections and failure recovery
have separate controls. The original cone rejection fixtures become stronger
positive tests; B-spline, invalid, unresolved, small-budget and irrational-vertex
controls remain. No tolerance, fitting or topology rounding is introduced.

All 81 preceding diagnostic outcomes and 61 STEP byte artifacts are preserved.
The separate public consumer also completes six exact line/circle subdivision
cases through exchange, native replay, measures, Booleans and empty recovery.
All ten example artifacts and six subdivision outputs pass an independent OCCT
reader. That reader is floating-point interoperability evidence only.

## Evidence and reproduction

- [Contract](contract.md), [proof/prototype review](review.md), [ideas](idea-ledger.json),
  [fixture origins](fixture-origin.json) and [all attempts](attempts.json).
- [Qualification](qualification-summary.json), [WASM correction](wasm-consumer-correction.json)
  and its [source-binding rule](final-review/source_binding.py). The original
  warning and consumer sources are retained; only WASM needed requalification.
- [Preserved diagnostics](continuation-frontier.json), [exact artifacts](preserved-artifacts.json),
  [continuation inputs](continuation-inputs.json) and [subdivision consumer](final-review/rational_split.rs).
- [Main costs](benchmark-summary.json), [dependency costs](dependency-costs-v1/summary.json)
  and [compiler feature graphs](feature-graph-admission.json) retain prospective
  baselines, all raw samples, allocations, process resources and binary sizes.
- [Source reconstruction](source-reconstruction.json), [manifest](manifest.json)
  and [audit](audit.json) bind failed prototypes and admitted inputs.

`analysis-recipes/qualify.py` executes the local/downstream matrix.
`final-review/finish_checks.py` runs the preserved diagnostics and public
subdivision consumer, then isolated main and dependency measurements. The
original WASM warning and its stronger consumer correction are documented
separately. No task compilation or tests overlap a timed campaign. Historical
temporary paths require local setup; they are not package installation recipes.

The measured consumer costs include newly retained face maps and extended
independent graph/formula evaluation. They are not pure-kernel timings or a
speedup claim. Shared-host timing ratios, allocation requests, process RSS and
harness sizes do not establish retained-heap bounds or shipped package size.
The WASM group inventory is larger than the baseline, with explicit migration
of original cone rejection checks; its total runtime is qualification evidence.

## Remaining scope

'''+limits+'''

The [next-domain obligations](next-domains.md) keep further native geometry,
provenance, resource and delivery work separate. The [upstream observation](upstream-observation.json)
records the fetched changes without attributing this pinned evidence to them.
'''
(OUT/'README.md').write_text(readme)
review = OUT/'review.md'
content = review.read_text().replace('# Cone recognition and exchange review (in progress)', '# Cone recognition and exchange review', 1)
content = content.replace('\n## Reproduced baseline\n', '\nThis record preserves the obligations and failures at each prototype. Earlier\nstatements of pending work describe that prototype; final admission is recorded\nin the closing section and the linked source-bound reports.\n\n## Reproduced baseline\n', 1)
content += '\n\n## Final admission and retention\n\n'+validation+'\n\n'+cost+'\n\n'+limits+'\n'
review.write_text(content)
for relative in ['crates/hyperbrep/PERFORMANCE.md','crates/hyperbrep-io/PERFORMANCE.md']:
    path = ROOT/relative
    title = '\n\n## Exact conical STEP exchange (2026-10-17)\n\n'
    assert title not in path.read_text()
    link = 'docs/evidence/2026-10-17-cone-exchange' if '/hyperbrep/' in relative else '../hyperbrep/docs/evidence/2026-10-17-cone-exchange'
    text = title+cost+'\n\n'
    text += (f"The new completed workflow has median {n['candidate_median_ns']/1e6:.3f} ms per call, "
             f"{n['candidate_allocation_per_iteration']['calls']:.0f} allocation requests and "
             f"{n['candidate_allocation_per_iteration']['requested_bytes']:.0f} requested bytes. "
             'It includes exact checks, STEP materialization/reimport, source maps, cold native '
             'replay, repeated Booleans and empty recovery. The prior unsupported result is '
             'not a successful-work comparison.\n\n')
    text += ('The unchanged geometric contracts retain their inputs and receipts. Consumer '
             'cost also includes additional source-map provenance and the extended graph/formula '
             'oracle; this is not a pure-kernel optimization claim. Every adverse timing, '
             'allocation and size observation remains in the report. Shared-host timings, '
             'allocator requests, process RSS and harness sizes do not prove aggregate speedups '
             'or retained-heap/package bounds. See the '
             f'[admission record]({link}/README.md), [main costs]({link}/benchmark-summary.json) '
             f'and [dependency costs]({link}/dependency-costs-v1/summary.json).\n')
    path.write_text(path.read_text()+text)
path = ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
ledger = json.loads(path.read_text())
identity = 'conical-line-step-exchange-2026-10-17'
assert all(row['id']!=identity for row in ledger['increments'])
ledger['increments'].append(dict(id=identity,work_packages=['WP00','WP03','WP07','WP08','WP14a','WP21'],
    properties=['P1','P2','P3','P4','P5','P6','P8','P9','P10','P11','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P38','P39'],
    decision='kept for exact complete exchange in the declared domain; not an optimization',
    change='Native conical-line recognition and reversible branch charts; exact STEP LINE-revolution read/write and source-face maps; finite anchors; single periodic cone sides and exact period-rebased coverage. Preserve original unsupported fixtures as stronger successes and independent failure controls.',
    evidence='evidence/2026-10-17-cone-exchange/manifest.json',validation=validation,cost_evidence=cost,limits=limits))
ledger['next_actions'][0] = ('Preserve all 81 native diagnostic outcomes, 61 original STEP artifacts, the complete cone exchange/subdivision corpus and all failure controls. Continue native contact/arrangement and singular-chart work under evidence/2026-10-17-cone-exchange/next-domains.md. Integrate fetched upstream be2a0c37b at a source-pinned checkpoint and requalify affected BREP consumers; unrelated repairs remain upstream work.')
ledger['next_actions'][1] = ('Use evidence/2026-10-17-cone-exchange/manifest.json as the current cone feature baseline. Preserve all 176 main cases and 196 dependency cases, with original inputs, receipts, raw samples and every current/historical adverse observation. '+cost+' Supporting changes belong in their owning crates when required for BREP features; avoid unrelated repairs.')
assert len(ledger['work_packages'])==28 and not ledger['complete']
assert all(row['status'] in ['open','in-progress'] for row in ledger['work_packages'])
path.write_text(json.dumps(ledger,indent=2)+'\n')
(OUT/'retention-decision.json').write_text(json.dumps(dict(decision='kept',validation=validation,cost_evidence=cost,limits=limits,
    rationale='The exact exchange and source-correspondence extension completes previously unsupported full-size workflows. All preceding completed receipts/artifacts and distinct failure controls are preserved. Costs include added provenance/consumer work and all adverse observations; no performance-only or general completeness claim.'),indent=2)+'\n')
print(validation)
print(cost)
