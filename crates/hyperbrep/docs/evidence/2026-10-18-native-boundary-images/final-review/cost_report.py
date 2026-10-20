"""Retain every cost observation, unfavorable row and allocator/size change."""
from collections import defaultdict
import hashlib
import json
from pathlib import Path
import statistics

OUT = Path(__file__).resolve().parents[1]
OLD = OUT.parent/'2026-10-17-prism-admission-cost'
read = lambda n: json.loads((OUT/n).read_text())
c = read('cost-summary.json')
rows = c['costs']
assert len(rows) == 192 and c['commands'] == 132 and c['receipt_preserved'] and not c['migrations']
adverse = [r for r in rows if r['ratio'] > 1.1]
alloc = []
allocation_rows = []
for row in rows:
    if 'baseline_allocations_per_iteration' not in row:
        continue
    a, b = row['baseline_allocations_per_iteration'], row['candidate_allocations_per_iteration']
    result = dict(corpus=row['corpus'], case=row['case'], baseline=a, candidate=b,
                  delta={k: b[k]-a[k] for k in a})
    allocation_rows.append(result)
    if any(b[k] > a[k] for k in a):
        alloc.append(result)
samples = defaultdict(list)
for row in read('costs/commands.json'):
    corpus, side, trial = row['label'].rsplit('-', 2)
    samples[(corpus, side)].append(row['resource'])
resources = []
for (corpus, side), values in samples.items():
    resources.append(dict(corpus=corpus, side=side, processes=len(values), **{
        key: dict(min=min(r[key] for r in values), median=statistics.median(r[key] for r in values),
                  max=max(r[key] for r in values))
        for key in ['wall_seconds', 'user_seconds', 'system_seconds', 'maximum_rss_kib']}))
sizes = []
for name, b in c['candidate'].items():
    a = c['baseline'][name]
    sizes.append(dict(corpus=name, candidate=b['bytes'], baseline=a['bytes'],
                      delta=b['bytes']-a['bytes'], executable_unchanged=b['sha256'] == a['sha256']))
previous_wasm = json.loads((OLD/'wasm-binary.json').read_text())
current_wasm = read('wasm-binary.json')
result = dict(source=c['source'], receipt_migrations=c['migrations'], matched_cases=len(rows),
    timing_ratio_median=statistics.median(r['ratio'] for r in rows),
    timing_ratio_range=[min(r['ratio'] for r in rows), max(r['ratio'] for r in rows)],
    adverse_timing_rows=adverse, increased_allocation_rows=alloc, allocation_rows=allocation_rows,
    process_resources=resources, executable_sizes=sizes,
    wasm_size=dict(baseline=previous_wasm, candidate=current_wasm,
                   delta_bytes=current_wasm['bytes']-previous_wasm['bytes'],
                   scope='Identical 138-group harness and fixtures; source-path footprint, not shipped package size.'),
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='All original full harnesses, sizes, iterations, materialization, exact receipts and fixture facts preserved. Three alternating CPU-pinned pairs. No task builds/tests overlap. Shared-host observations, including every adverse row; no broad or statistically established speedup. Allocation requests and process RSS do not bound retained heap. Executables are harnesses, not distribution sizes.')
(OUT/'resource-summary.json').write_text(json.dumps(result, indent=2)+'\n')
lines = ['# Complete-work cost observations', '', result['scope'], '',
    f"{len(rows)} matched cases across 22 complete corpora; {c['commands']} fresh processes. All receipts agree. Median case ratio {result['timing_ratio_median']:.6f}; range {result['timing_ratio_range'][0]:.6f}–{result['timing_ratio_range'][1]:.6f}.", '',
    '## Targeted original workloads', '', '| Corpus / case | Baseline ms | Candidate ms | Ratio |',
    '| --- | ---: | ---: | ---: |']
for r in rows:
    if 'nurbs_path_extrusion' in r['case'] or r['corpus'] == 'region_exchange':
        lines.append(f"| {r['corpus']} / {r['case']} | {r['baseline_median_ns']/1e6:.9f} | {r['candidate_median_ns']/1e6:.9f} | {r['ratio']:.6f} |")
lines += ['', '## Rows above the 10% review marker', '', '| Corpus / case | Baseline ms | Candidate ms | Ratio |',
          '| --- | ---: | ---: | ---: |']
for r in adverse:
    lines.append(f"| {r['corpus']} / {r['case']} | {r['baseline_median_ns']/1e6:.9f} | {r['candidate_median_ns']/1e6:.9f} | {r['ratio']:.6f} |")
if not adverse:
    lines.append('| None | | | |')
lines += ['', '## Increased allocation requests', '', '| Corpus / case | Calls delta | Requested bytes delta |',
          '| --- | ---: | ---: |']
for r in alloc:
    lines.append(f"| {r['corpus']} / {r['case']} | {r['delta']['calls']:.3f} | {r['delta']['requested_bytes']:.3f} |")
if not alloc:
    lines.append('| None | | |')
lines += ['', '## Separate preliminary observations', '',
    'The pre-edit [reproduction](reproduction.json) preserves the seven original complete retained-region recipes and their typed outcomes. The preceding prism-admission increment supplies the frozen 22-corpus cost baseline. Former unsupported work is never a speedup baseline; new completed native workflows receive separate absolute cost observations.', '',
    'The full NURBS case keeps the degree-two weighted boundary, original knot interval, line sides, through-hole, 500 iterations and independently expected exact volume 45. It is a build/measurement harness, not a complete STEP exchange workload. Region and axial exchange rows include their original exact assertions, native/STEP materialization and continuation. Their receipts, original sizes, and current byte-identical artifact inventory are separate from timing evidence.', '',
    'All raw trials, unfavorable cases, allocator observations, process RSS/CPU/wall measurements and executable sizes remain in [cost-summary.json](cost-summary.json), [resource-summary.json](resource-summary.json) and [costs/commands.json](costs/commands.json). Existing archive, spline, cached-arc, pcurve and provenance cost obligations remain open; a later favorable ratio does not erase historical observations.', '']
(OUT/'costs.md').write_text('\n'.join(lines))
print(json.dumps({k: v for k, v in result.items() if k in ['matched_cases', 'timing_ratio_median', 'timing_ratio_range']}, indent=2))
print('Adverse timing rows:', len(adverse), 'allocation increases:', len(alloc), flush=True)
