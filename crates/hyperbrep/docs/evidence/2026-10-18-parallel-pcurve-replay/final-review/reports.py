"""Derive finite admission counts and resource observations from raw records."""
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, hashes

read = lambda name: json.loads((OUT/name).read_text())
write = lambda name, value: (OUT/name).write_text(json.dumps(value, indent=2)+'\n')
source = hashes()
stages = read('remaining-stages.json')
assert stages['source'] == source
assert [r['stage'] for r in stages['rows']] == ['preserve', 'artifacts', 'consumer_costs', 'new_costs']
assert all(r['exit_code'] == 0 and r['source_unchanged'] for r in stages['rows'])
qualification = read('qualification-driver.json')
assert qualification['source'] == source and not qualification['failures']
latest = {r['label']: r for r in read('attempts.json')}
counts = {}
for label in qualification['executed']:
    row = latest[label]
    assert row['exit_code'] == 0 and read(row['source']) == source
    results = re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored', (OUT/row['log']).read_text())
    if results:
        assert all(result[1:] == ('0', '0') for result in results)
        counts[label] = sum(int(result[0]) for result in results)
write('qualification-summary.json', dict(source=source, test_counts=counts,
    checks=qualification['executed'], scope=qualification['scope'], failures=[]))
old = read('artifact-comparison.json')
recent = read('artifacts.json')
new = read('parallel-artifacts.json')
assert all(j['source'] == source for j in [old, recent, new])
assert len(old['rows']) == 211 and len(recent['rows']) == 126
write('artifact-preservation.json', dict(source=source, preserved_files=337,
    new_files=len(new['rows']), records=['artifact-comparison.json', 'artifacts.json', 'parallel-artifacts.json'],
    scope='337 preserved files include eight expected STEP encoding diagnostics. New files are native pcurve archives. All recent and new files agree across two fresh processes. Twenty original prism OCCT reads were rerun; prior quintic observations apply only to identical bytes. No new STEP capability.'))

costs = read('consumer-costs.json')
absolute = read('new-costs.json')
assert costs['source'] == absolute['source'] == source
rows = costs['rows']
ratios = [r['ratio'] for r in rows]
slower = [r for r in rows if r['ratio'] > 1]
above = [r for r in rows if r['ratio'] > 1.10]
increased = [r for r in rows if any(r['candidate'][k] > r['baseline'][k] for k in ['allocation_calls', 'requested_bytes'])]
summary = (f'Three alternating pairs preserve all 33 preceding consumer groups in 24 processes, with original assertions, iterations and outcomes. '
    f'Time ratios range {min(ratios):.6f}–{max(ratios):.6f}; {len(above)} exceed the 10% review marker and {len(increased)} increase allocation calls or requested bytes. '
    'Seven new complete acceptance groups have absolute costs from three processes. Every slower and adverse observation is retained. '
    'This finite shared-host comparison does not rerun the historical 192-case catalogue or establish a general speedup, significance or an internal resource bound.')
current = read('consumers.json')['binaries']
previous = read('baseline-binaries.json')['binaries']
sizes = []
for name, binary in previous.items():
    key = name.replace('new_', 'selected_')
    candidate = current[key]
    sizes.append(dict(consumer=key, baseline=binary['bytes'], candidate=candidate['bytes'], delta=candidate['bytes']-binary['bytes']))
rss = {side: max(r['resource']['maximum_rss_kib'] for r in costs['trials'] if r['side'] == side) for side in ['baseline', 'candidate']}
rss['new'] = max(r['resource']['maximum_rss_kib'] for r in absolute['trials'])
archives = []
for row in new['rows']:
    path = OUT/row['path']
    tree = json.loads(path.read_text())
    depth = computable = limbs = 0
    pending = [(tree, 0)]
    while pending:
        value, level = pending.pop()
        depth = max(depth, level)
        if isinstance(value, dict):
            computable += int(value.get('computable') is not None)
            for key in ['numerator', 'denominator']:
                values = value.get(key)
                if isinstance(values, list) and all(isinstance(item, int) for item in values):
                    limbs = max(limbs, len(values))
            pending += [(child, level+1) for child in value.values()]
        elif isinstance(value, list):
            pending += [(child, level+1) for child in value]
    archives.append(dict(file=row['path'], bytes=path.stat().st_size,
        maximum_json_depth=depth, computable_records=computable, maximum_integer_limb_count=limbs,
        pcurves=len(tree['pcurves']), selected_parameters=len(tree['selection']['parameters'])))
write('resource-review.json', dict(source=source, summary=summary, all_slower=slower, above_marker=above,
    allocation_increases=increased, sizes=sizes, new_sizes={k: current[k]['bytes'] for k in ['new_native', 'new_wasm']},
    maximum_process_rss_kib=rss, archive_observations=archives,
    limits='Cumulative allocation requests, process RSS and finite archive nesting/limb counts are observations, not bounds on retained heap, expression growth, coefficient bits, total work or cancellation. Metadata limits and instrumented solver work remain distinct. No new persistent cache. Earlier adverse costs stay open.'))
cpuinfo = Path('/proc/cpuinfo').read_text()
write('environment.json', dict(platform=platform.platform(), machine=platform.machine(),
    cpu_models=sorted(set(re.findall(r'^model name\s*:\s*(.*)$', cpuinfo, re.MULTILINE))),
    logical_cpus=os.cpu_count(), allowed_cpus=sorted(os.sched_getaffinity(0)),
    memory_total=next(line for line in Path('/proc/meminfo').read_text().splitlines() if line.startswith('MemTotal:')),
    rustc=costs['rustc'], native_target='x86_64-unknown-linux-gnu', wasm_target='wasm32-unknown-unknown',
    filesystem_devices={str(p): os.stat(p).st_dev for p in [ROOT, Path('/tmp/hyperbrep-review-target'), Path('/tmp/hyperbrep-review-cargo')]},
    profile='Release costs/consumers; CARGO_INCREMENTAL=0; offline locked dependencies; no task build/test overlaps timing.',
    scope='Source-path consumers on a shared host, not installed distribution or controlled-host performance.'))
text = ['# Complete-workflow cost observations', '', summary, '',
    'Raw commands, samples, CPU affinity, source and binary hashes are in [matched costs](consumer-costs.json) and [new absolute costs](new-costs.json). Each process has one warmup and three measured repetitions per group. Exact checks, replay, continuation and materialization remain inside timing. No task builds/tests overlap timing; the host is shared and OS caches are warm. Expected typed controls retain their labels.', '',
    '| Existing group | Outcome | Time ratio | Baseline calls | Candidate calls | Baseline requested bytes | Candidate requested bytes |',
    '| --- | --- | ---: | ---: | ---: | ---: | ---: |']
for r in rows:
    a, b = r['baseline'], r['candidate']
    text.append(f"| {r['cohort']}/{r['case']} | {r['outcome']} | {r['ratio']:.6f} | {a['allocation_calls']:.3f} | {b['allocation_calls']:.3f} | {a['requested_bytes']:.3f} | {b['requested_bytes']:.3f} |")
text += ['', '| New complete group | Milliseconds | Allocation calls | Requested bytes |', '| --- | ---: | ---: | ---: |']
for r in absolute['rows']:
    v = r['median']
    text.append(f"| {r['case']} | {v['elapsed_ns']/1e6:.6f} | {v['allocation_calls']:.3f} | {v['requested_bytes']:.3f} |")
text += ['', '| Same consumer executable | Baseline bytes | Candidate bytes | Delta |', '| --- | ---: | ---: | ---: |']
for r in sizes:
    text.append(f"| {r['consumer']} | {r['baseline']} | {r['candidate']} | {r['delta']:+} |")
text += ['', f"The new harness contains {current['new_native']['bytes']} native bytes and {current['new_wasm']['bytes']} WASM bytes. These are harness sizes, not package sizes.", '',
    f"Maximum observed process RSS: baseline {rss['baseline']} KiB, same current groups {rss['candidate']} KiB, new groups {rss['new']} KiB. [Resource review](resource-review.json) retains every slower row, allocation increase and finite archive observation.", '',
    'The extension is retained for additional exact replay and supported planar continuation. The former UnsupportedPcurve error is not a successful-work baseline. This is not an optimization. Earlier spline, archive, pcurve and selected-profile rejection costs remain open at their original revisions; these samples do not discharge them. Allocation requests and process RSS do not establish operation-wide work, retained-memory or cancellation bounds.', '']
(OUT/'costs.md').write_text('\n'.join(text))
assert hashes() == source
print(json.dumps(dict(test_counts=counts, cost_summary=summary, rss=rss, new_archives=len(archives)), indent=2))
