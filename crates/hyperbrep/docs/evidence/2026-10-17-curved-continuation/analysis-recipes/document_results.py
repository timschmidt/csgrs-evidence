"""Publish measured results without closing broader project gates."""
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

read = lambda p: json.loads((OUT / p).read_text())
source = hashes()
q = read('qualification-summary.json')
b = read('benchmark-summary.json')
d = read('dependency-costs-v1/summary.json')
dep = read('dependency-summary.json')
assert q['source'] == source and b['exact_receipts_preserved']
adverse = len(b['adverse_timing_rows'])
alloc = len(b['increased_allocation_rows'])
cost = (f"The complete 108-process campaign preserves all 170 existing receipts across eighteen corpora; "
        f"two new completed reconstruction workflows have separate absolute costs. "
        f"{adverse} existing timing rows exceed 1.10, with maximum ratio {b['maximum_case_ratio']:.6f}; "
        f"{alloc} rows increase allocation calls or requested bytes. "
        f"The dependency supplement retains all {d['cases']} scalar/predicate/rounding cases across eighteen processes, "
        f"with {len(d['adverse_timing_rows'])} {'ratio' if len(d['adverse_timing_rows']) == 1 else 'ratios'} above 1.10 and maximum {d['maximum_case_ratio']:.6f}.")
validation = (f"Debug and release native/IO all-feature suites each pass {q['tests']['native-release']['passed']} tests; "
              f"minimal features pass {q['tests']['native-minimal']['passed']}. "
              f"The source-path WASM runtime passes {q['wasm']['probe_groups']} groups with zero imports. "
              f"Four dependency library suites preserve all 3514 prior named outcomes and add four passing private groups "
              f"({dep['candidate']['totals']['passed']} passed, {dep['candidate']['totals']['ignored']} ignored). "
              f"Fourteen focused public scalar tests pass in both tested feature configurations; "
              f"the minimal scalar library passes {q['tests']['scalar-minimal-library']['passed']} tests. "
              "Warning-denied native/dependency Clippy, rustdoc, examples, optional OCCT reads, fuzz-target compilation and formatting pass. "
              "Only test-module wiring changes after the complete native/dependency runs; exact body preservation is source-admitted, and affected native tests, Clippy and full WASM runtime are rerun on final wiring. "
              "The inherited zero-factor debug failure still reproduces in both checked feature configurations.")
limits = ("Three full-size cone continuations remain undecided; six partial/reversed prism controls remain unsupported. "
          "General Boolean closure, cone exchange and additional chart/trace support remain open. "
          "The inherited external-owner failure and all historical performance observations remain visible. "
          "Shared-host timing, allocation requests, process RSS and serialized expression growth establish no general speedup, "
          "retained-heap, total-work, cancellation or arbitrary-depth bound. "
          "No clean package/MSRV/actual C-Python-JS binding delivery, 100% coverage, formal proof, runtime fuzz/ASan/lexicase, "
          "full pre-push or release admission is claimed. All 28 work packages remain open/in progress; no push.")
decision = dict(decision='kept', reason='Exact completion and cold replay extension with reproduced scalar blockers, independent certificates and unchanged existing receipts; not an optimization.',
                validation=validation, costs=cost, limitations=limits,
                next='Reproduce the remaining cone blockers and qualify their exact root/reciprocal relations in the scalar owner. Isolate the cost of repeated proof attempts while preserving every full workflow and failed control.')
(OUT / 'retention-decision.json').write_text(json.dumps(decision, indent=2) + '\n')

readme = f'''# Exact rotated torus reconstruction

This increment completes the original rationally rotated complementary torus
unions in both orders and preserves their cold replay through two further
split/recut/reconstruction/empty-recovery cycles. Hyperreal owns the required
certified rounding and sine/cosine congruence proofs. HyperBRep retains its
existing strict native validation. Baseline: `95011fbb4995e4f39549d1680e972235c750db29`.
Upstream `99b88f707` remained current at the recorded fetch.

{validation}

{cost}

## Delivered domain and evidence

- [Contract](contract.md) and [proof review](review.md): original R=5,r=2 torus,
  40-unit cutter and exact rotation (3/5,4/5), both operand orders, cold half
  operands, two subdivision/reload/recut/remainder/reunion/empty-recovery cycles.
  Independent exact volume/area, fifteen near-boundary point expectations and
  paired edge incidence remain inside the tests and completed-workflow timing.
- [All attempts](attempts.json) retain the original 81-slot reproduction,
  failed rounding prototype, failed second-cycle replay, raw archive and
  failing endpoint tests. [Analysis notes](analysis-notes.md) disclose warmed
  diagnostic state and reused build paths.
- [Scalar oracle](scalar-oracle.json) proves the three chart offsets zero and
  all fourteen inverse domains valid using exact Fraction arithmetic.
  [Endpoint oracle](endpoint-oracle.json) independently proves the four
  captured function arguments and native circle incidence.
- [Qualification](qualification-summary.json) binds commands to exact source
  snapshots and admits only the documented module-wiring correction for
  earlier complete runs. [Dependency comparison](dependency-summary.json)
  preserves every prior named library outcome and retains inherited failures.
- [Frontier](continuation-frontier.json) now has 78 native results and three
  undecided cone cases. Only the two formerly exhausted torus unions change.
  The fifteen preceding workflows and all 24 prism controls retain their
  outcomes; [61 deterministic artifacts](preserved-artifacts.json) are byte
  identical. Diagnostic counts do not replace independent semantic tests.
- [Growth](growth-summary.json) retains the earlier five-state native band
  probe and the new swapped reconstruction archives. Node occurrences/depth
  and coefficient bits describe serialized expressions, not live shared DAGs
  or retained heap. Every failed earlier archive remains available separately.
- [Main costs](benchmark-summary.json) retain all 170 matching receipts,
  every timing/allocation row, process resources and executable sizes.
  [Dependency costs](dependency-costs-v1/summary.json) include the original
  175 scalar/predicate cases and the stable rounding substrate group.
  All baselines were frozen before production changes. Compiler-reported
  library features/profiles [match](feature-graph-admission.json).
- [Retention](retention-decision.json), [idea ledger](idea-ledger.json),
  [source reconstruction](source-reconstruction.json), [manifest](manifest.json)
  and [audit](audit.json) preserve decisions, failed candidates and exact inputs.

## Reproduction and limits

`check.py` binds commands, environment, external timeouts and source snapshots.
`analysis-recipes/qualify.py` runs local/downstream checks. The finish driver
runs the complete diagnostics, then sequential main/dependency measurements.
No task compilation or tests run concurrently with timing. Raw Criterion
samples and complete native harness outputs remain available.

Sector process resources and binary sizes include two additional workflows;
their whole-process comparison is not a matched-workload result. WASM adds
four probe groups. Benchmark executable sizes are not shipped package sizes.
OCCT is an optional floating-point interoperability oracle; the WASM probe
uses workspace source paths and is not a shipped JavaScript binding. Historical
`/tmp` paths require local setup, not a portable installation recipe.

{limits}

The [next cone investigation](next-cone-proof.md) has an independent zero
identity but no implemented completion claim. Further changes must reproduce
the current failing domain before extending its owning proof authority.
The [proof-cost investigation](future-proof-costs.md) targets repeated work
under the same completed contracts; its hypotheses are not measured causes.
'''
(OUT / 'README.md').write_text(readme)

performance = ROOT / 'crates/hyperbrep/PERFORMANCE.md'
heading = '## Exact rotated reconstruction (2026-10-17)'
assert heading not in performance.read_text()
table = '\n'.join(f"| `{r['corpus']}/{r['case']}` | {r['ratio']:.6f} |" for r in b['adverse_timing_rows']) or '| No rows above 1.10 | — |'
new = '\n'.join(f"| `{r['case']}` | {r['candidate_median_ns']/1e9:.6f} | {r['candidate_allocation_per_iteration']['calls']:,.0f} | {r['candidate_allocation_per_iteration']['requested_bytes']:,.0f} |" for r in b['costs'] if 'ratio' not in r)
micro = '\n'.join(f"| `{r['corpus']}/{r['case']}` | {r['ratio']:.6f} |" for r in d['adverse_timing_rows']) or '| No rows above 1.10 | — |'
performance.write_text(performance.read_text() + f'''

{heading}

The [source-bound record](docs/evidence/2026-10-17-curved-continuation/README.md)
qualifies two formerly exhausted full-size torus reconstructions and their
repeated native composition. This is an exact-completion extension, not an
optimization. Existing successful proof paths remain first; later exact
rounding and function-congruence attempts may add work.

{cost}

All main timing ratios above 1.10:

| Case | Candidate/baseline median |
| --- | ---: |
{table}

New complete-workflow absolute medians, including cold replay, exact measures,
classification, topology, two further cycles and full archive receipts:

| Case | Seconds | Allocation calls | Requested bytes |
| --- | ---: | ---: | ---: |
{new}

All dependency microcost ratios above 1.10:

| Case | Candidate/baseline median |
| --- | ---: |
{micro}

All raw samples and adverse allocation, RSS and size observations remain in
the record. All prospective frozen baselines have matching library features
and profiles. Sector whole-process resources/size include two additional
workflows, and WASM adds four groups. These are harness observations, not
package sizes, controlled-host performance or total-resource bounds. Earlier
cost gates remain open; later favorable rows do not discharge them.

Follow the [proof-cost investigation](docs/evidence/2026-10-17-curved-continuation/future-proof-costs.md).
Measure repeated exact proof attempts against this complete feature baseline
before changing scheduling or caching. A new proof attempt's contribution to
any observed slowdown has not been isolated. Preserve every original input,
successful receipt, invalid-input control and explicit unresolved outcome.
''')

plan = ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'
text = plan.read_text()
old = '''The 81-slot inventory now has 76 native results, three undecided cone
continuations and two exhausted torus reconstructions. These diagnostic counts
do not replace independent semantic acceptance of each workflow.'''
assert old in text
text = text.replace(old, '''The [rotated reconstruction increment](evidence/2026-10-17-curved-continuation/README.md)
extends both exhausted torus union orders through two complete split/reload/
recut/reunion/empty-recovery cycles with independent exact measures and point
expectations. Its certified rounding and function-congruence proofs belong in
Hyperreal; BREP keeps strict incidence and archive validation. The 81-slot
inventory now has 78 native results and three undecided cone continuations.
These diagnostic counts do not replace independent semantic acceptance.
Preserve all 172 completed BREP/curve/STEP benchmark cases and every historical
adverse cost row. Investigate the [retained cone scalar blocker](evidence/2026-10-17-curved-continuation/next-cone-proof.md)
through the existing scalar algebra authority, then requalify its full native
composition. The independent cone identity is not production support.''')
plan.write_text(text)

matrix = ROOT / 'crates/hyperbrep/docs/SUPPORT_MATRIX.md'
text = matrix.read_text()
old = '''continuation blockers. The current 81-slot rerun has 76 native results, three
undecided cone continuations and two exhausted torus reconstructions; see the
[reviewed frontier](evidence/2026-10-16-torus-exchange/continuation-frontier.json).'''
assert old in text
text = text.replace(old, '''continuation blockers. The current 81-slot rerun has 78 native results and three
undecided cone continuations; see the
[reviewed frontier](evidence/2026-10-17-curved-continuation/continuation-frontier.json).
Both formerly exhausted rationally rotated torus union orders now complete
and have independent repeated native composition tests.''')
text += '''

## Rationally rotated torus reconstruction

The original R=5,r=2 torus and 40-unit cutter rotated by exact (3/5,4/5)
produce complementary halves that reconstruct in both union orders, including
from separately reloaded operands. Two further edge-split/reload/recut/
remainder/reunion/empty-recovery cycles retain independent exact volume/area,
paired incidence and fifteen point expectations with 1/10^12 boundary offsets.
Cold replay occurs before live-object semantic queries.

Shared Hyperreal certified rounding and bounded same-function congruence
repair the reproduced chart-boundary and endpoint-incidence failures. BREP's
strict validation remains authoritative. The [admission record](evidence/2026-10-17-curved-continuation/README.md)
retains every original failure, unchanged existing receipt, repeated-growth
observation and adverse cost. This finite domain does not establish arbitrary
torus Boolean closure, cone completion or whole-operation resource bounds.
'''
matrix.write_text(text)

status_path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(status_path.read_text())
identity = 'rotated-reconstruction-2026-10-17'
assert not any(r['id'] == identity for r in status['increments'])
status['increments'].append(dict(id=identity, work_packages=['WP00','WP03','WP06','WP07','WP08','WP21'],
    properties=['P1','P4','P6','P8','P11','P17','P18','P19','P20','P27','P35','P36','P37','P38','P39'],
    decision='kept for exact completion; not an optimization',
    change='Complete both full-size rationally rotated torus reconstructions and two further split/reload/Boolean/empty-recovery cycles using owning Hyperreal certified-rounding and same-function congruence proofs. Preserve BREP validation, public APIs and archive schemas.',
    evidence='evidence/2026-10-17-curved-continuation/manifest.json', validation=validation, cost_evidence=cost, limits=limits))
status['next_actions'][0] = 'Preserve the original 81-slot frontier: 78 native results and three undecided cone continuations. Both formerly exhausted torus union orders now have independent full-size repeated composition tests. Retain all fifteen preceding workflows, 18 native prism results and six unsupported prism controls, exact torus STEP and every cold replay/failure control. Reproduce the next cone scalar blocker from evidence/2026-10-17-curved-continuation/next-cone-proof.md on the next target revision; extend exact root/reciprocal relations in their scalar owner before claiming geometry completion.'
status['next_actions'][1] = 'Use evidence/2026-10-17-curved-continuation/manifest.json as the current exact feature baseline. Preserve all 172 completed main benchmark cases and every adverse current/historical observation. ' + cost + ' Isolate repeated scalar proof costs before changing scheduling, sharing or caching; retain all exact receipts, original full-size workflows and rejection controls. No controlled-host or previous cost gate is closed.'
status_path.write_text(json.dumps(status, indent=2) + '\n')
sys.path.insert(0, str(OUT.parent / '2026-10-16-upstream-format-integration'))
from ledger_spans import replace_brep
path = ROOT / 'docs/properties-status.json'
ledger_text = path.read_text()
entry = json.loads(ledger_text)['current_work']['hyperbrep']
entry.update(latest_evidence=str((OUT / 'manifest.json').relative_to(ROOT)), latest_implementation=identity,
    latest_feature_evidence=str((OUT / 'manifest.json').relative_to(ROOT)), qualification=validation + ' ' + cost + ' ' + limits)
path.write_text(replace_brep(ledger_text, entry))
assert hashes() == source
print('updated admission, performance, plan and BREP-only status documents')
