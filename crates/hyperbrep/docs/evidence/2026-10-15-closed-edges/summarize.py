"""Summarize completed final-source checks; preserve every adverse cost row."""
import json
from pathlib import Path
import re
import statistics

OUT = Path(__file__).resolve().parent
def read(name):
    return json.loads((OUT/name).read_text())

commands = read('commands.json')
assert len(commands) == 16
tests = {}
for label in ['native-debug','native-release','native-minimal','curve-focused-debug','curve-release','root-acceptance']:
    log = (OUT/(label+'.log')).read_text()
    tests[label] = dict(passed=sum(int(x) for x in re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed',log)),
                        failed=sum(int(x) for x in re.findall(r'test result: (?:ok|FAILED)\. \d+ passed; (\d+) failed',log)),
                        ignored=sum(int(x) for x in re.findall(r'test result: (?:ok|FAILED)\. \d+ passed; \d+ failed; (\d+) ignored',log)))
costs = {}
for kind in ['kernel','arc']:
    rows = read(kind+'-costs.json')
    costs[kind] = dict(rows=len(rows), median_ratio=statistics.median(r['ratio'] for r in rows),
                       minimum_ratio=min(r['ratio'] for r in rows), maximum_ratio=max(r['ratio'] for r in rows),
                       over_ten_percent=[r for r in rows if r['ratio']>1.1],
                       raw_costs=kind+'-costs.json',
                       process_rss_kib={side:[read(f'{kind}-{side}-{i}-resources.json')['max_rss_kib'] for i in [1,2,3]] for side in ['baseline','candidate']})
summary = dict(
    baseline='d60bd1cf4ec64f64dfe920a64400f15e62eb2cf9',
    scope='Partial native circle/ellipse closed-edge admission, full-circle Hypercurve composition and finite-cylinder face bounds; all 28 work-package gates open.',
    contract='admission.md', source_snapshot=read('environment.json')['source_snapshot'],
    qualification=dict(commands=len(commands), passed=sum(c['exit_code']==0 for c in commands),
                       nonzero=[dict(label=c['label'],exit_code=c['exit_code'],log=c['log']) for c in commands if c['exit_code']],
                       tests=tests, counts_overlap=True, wasm=read('wasm-runtime.json')),
    controls=dict(runtime_faults=len(read('controls/results.json')), preserved_preintegration='pre-integration-preservation.json', superseded='superseded-model-bounds/preservation.json'),
    costs=costs, new_absolute_costs=read('closed-costs.json'),
    closed_process_rss_kib=[read(f'closed-{i}-resources.json')['max_rss_kib'] for i in [1,2,3]],
    costs_decision='Retain for exact native composition completeness, with all raw samples and the over-budget arc replay row exposed. No optimization, universal 10% gate pass, or statistical significance claim; controlled-host timing qualification remains open.',
    ideas=[
        dict(idea='Single-vertex closed conic topology with exact one-period and endpoint proofs',decision='kept',evidence='Eight native regression groups and six implementation fault controls; current baseline runtime rejection retained.'),
        dict(idea='Reuse CircularArc2 validity and native CurveRegion2 algorithms',decision='already-satisfied',evidence='The missing owning-layer change is the CurveString2 line-only chord guard; no new region carrier or approximate promotion.'),
        dict(idea='Whole-model fallback when a selected face bound is unavailable',decision='rejected',evidence='Replaced by the more local finite-cylinder boundary-extremum proof. Passing provisional checks and all 15 benchmark processes remain under superseded-model-bounds.'),
        dict(idea='Finite-cylinder face bound from exact boundary curves',decision='kept',evidence='Closed-edge selected transfer/empty continuation regression and an omission fault; shared face-bound path with no new carrier or scalar formula.'),
    ],
    future_mapping_probe=dict(native_edge_replay_successes=24,off_carrier_typed_rejections=2,evidence='seam-frame-probe.json',limits='No source-parameter maps, pcurves, unit conversions, complete solids or STEP imports. Size observations omit source maps and are not a same-contract optimization comparison.'),
    open=['General closed spline regularity and singular charts','General ellipse/plane image proofs','Analytic STEP/source-map/unit/pcurve admission and explicit healing','Root 16/32-segment strict drill composition failures','Whole-operation work, retained bytes and cancellation','Operation receipts and complete provenance','Controlled-host performance and the historical archive timing gate','Release, MSRV, real production bindings, coverage, formal proofs, directed fuzz/ASan campaigns and full pre-push matrix'],
)
(OUT/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(dict(tests=tests,commands=len(commands),nonzero=summary['qualification']['nonzero']),indent=2))
