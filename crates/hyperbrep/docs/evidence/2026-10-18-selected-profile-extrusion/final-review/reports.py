"""Derive counts and resource observations from completed raw records."""
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import statistics
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, hashes

read = lambda name: json.loads((OUT/name).read_text())
write = lambda name, value: (OUT/name).write_text(json.dumps(value, indent=2)+'\n')
source = hashes()
qualification = read('qualification-driver.json')
assert qualification['source'] == source and not qualification['failures']
latest = {row['label']: row for row in read('attempts.json')}
counts = {}
for label in qualification['executed']:
    row = latest[label]
    expected = read('qualification-driver-before-harness.json')['source'] if label in qualification.get('reused_checks', []) else source
    assert row['exit_code'] == 0 and read(row['source']) == expected
    results = re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored', (OUT/row['log']).read_text())
    if results:
        assert all(result[1:] == ('0', '0') for result in results), (label, results)
        counts[label] = sum(int(result[0]) for result in results)
write('qualification-summary.json', dict(source=source, test_counts=counts, checks=qualification['executed'],
    scope=qualification['scope'], reused_checks=qualification.get('reused_checks', []),
    reuse_record=qualification.get('reuse_record'), failed=[]))

new = read('artifacts.json')
old = read('artifact-comparison.json')
assert new['preserved'] == 78 and len(old['rows']) == 211
write('artifact-preservation.json', dict(source=source, preserved_files=289, new_files=48,
    new_native_archives=40, new_typed_step_errors=8,
    records=['artifacts.json', 'artifact-comparison.json'],
    independent_oracle='The eight preceding quintic OCCT observations apply only to the identical current file hashes; twenty older prism reader cases were rerun. No new successful STEP encoding is claimed for irrational selected-profile vertices.'))

costs = read('consumer-costs.json')
absolute = read('new-costs.json')
assert costs['source'] == absolute['source'] == source
rows = costs['rows']
ratios = [row['ratio'] for row in rows]
slower = [row for row in rows if row['ratio'] > 1]
above = [row for row in rows if row['ratio'] > 1.10]
increased = [row for row in rows if any(row['candidate'][key] > row['baseline'][key]
                                      for key in ['allocation_calls', 'requested_bytes'])]
summary = (f'Three alternating pairs preserve all 22 existing consumer groups in 18 processes, with original assertions, iterations and outcomes. '
           f'Time ratios range {min(ratios):.6f}–{max(ratios):.6f}; {len(above)} exceed the 10% review marker and {len(increased)} increase allocation calls or requested bytes. '
           'Eleven new complete groups have absolute costs from three processes. All adverse observations remain. '
           'This finite shared-host comparison does not rerun the historical 192-case catalogue or establish a general speedup, significance or internal resource bound.')
current = read('consumers.json')['binaries']
previous = json.loads((OUT.parent/'2026-10-18-equality-upstream-integration/consumers.json').read_text())['binaries']
sizes = []
for name, binary in previous.items():
    key = name.replace('new_', 'measurement_')
    candidate = current[key]
    sizes.append(dict(consumer=key, baseline=binary['bytes'], candidate=candidate['bytes'], delta=candidate['bytes']-binary['bytes']))
rss = {side: max(row['resource']['maximum_rss_kib'] for row in costs['trials'] if row['side'] == side) for side in ['baseline', 'candidate']}
rss['new'] = max(row['resource']['maximum_rss_kib'] for row in absolute['trials'])
growth = []
for path in sorted((OUT/'selected-artifacts').glob('*.json')):
    tree = json.loads(path.read_text())
    depth = 0
    computable = 0
    limbs = 0
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
    growth.append(dict(file=path.name, bytes=path.stat().st_size, maximum_json_depth=depth,
                       computable_records=computable, maximum_integer_limb_count=limbs,
                       counts={key: len(tree[key]) for key in ['vertices', 'edges', 'faces', 'shells', 'solids']}))
write('resource-review.json', dict(source=source, summary=summary, all_slower=slower, above_marker=above,
    allocation_increases=increased, sizes=sizes, new_sizes={key: current[key]['bytes'] for key in ['new_native', 'new_wasm']},
    maximum_process_rss_kib=rss, archive_observations=growth,
    limits='Allocation requests are cumulative, RSS is process-wide, JSON nesting/limb counts describe only retained archive states. They do not bound arbitrary expression depth, coefficient growth, retained heap, total work or cancellation. No new persistent cache or internal global budget is introduced.'))
cpuinfo = Path('/proc/cpuinfo').read_text()
write('environment.json', dict(platform=platform.platform(), machine=platform.machine(),
    cpu_models=sorted(set(re.findall(r'^model name\s*:\s*(.*)$', cpuinfo, re.MULTILINE))),
    logical_cpus=os.cpu_count(), allowed_cpus=sorted(os.sched_getaffinity(0)),
    memory_total=next(line for line in Path('/proc/meminfo').read_text().splitlines() if line.startswith('MemTotal:')),
    rustc=costs['rustc'], native_target='x86_64-unknown-linux-gnu', wasm_target='wasm32-unknown-unknown',
    profile='Cargo release for costs and consumers; CARGO_INCREMENTAL=0; offline locked dependencies; no task build/test overlaps cost stages',
    storage='storage-identity.json', scopes='Source-path packages on the shared host; no controlled-host performance or installed-distribution claim.'))
text = ['# Complete-workflow cost observations', '', summary, '',
        'Raw samples, commands, CPU affinity, toolchain, source and frozen binary hashes are in [matched costs](consumer-costs.json) and [new absolute costs](new-costs.json). No task builds/tests overlap timing. The host is shared and OS caches are warm. Expected typed controls retain their labels; a former error is never a successful-work baseline.', '',
        '| Existing group | Outcome | Candidate/baseline time | Baseline calls | Candidate calls | Baseline bytes requested | Candidate bytes requested |',
        '| --- | --- | ---: | ---: | ---: | ---: | ---: |']
for row in rows:
    a, b = row['baseline'], row['candidate']
    text.append(f"| {row['cohort']}/{row['case']} | {row['outcome']} | {row['ratio']:.6f} | {a['allocation_calls']:.3f} | {b['allocation_calls']:.3f} | {a['requested_bytes']:.3f} | {b['requested_bytes']:.3f} |")
text += ['', '| New complete group | Milliseconds | Allocation calls | Requested bytes |', '| --- | ---: | ---: | ---: |']
for row in absolute['rows']:
    value = row['median']
    text.append(f"| {row['case']} | {value['elapsed_ns']/1e6:.6f} | {value['allocation_calls']:.3f} | {value['requested_bytes']:.3f} |")
text += ['', '| Same consumer executable | Baseline bytes | Candidate bytes | Delta |', '| --- | ---: | ---: | ---: |']
for row in sizes:
    text.append(f"| {row['consumer']} | {row['baseline']} | {row['candidate']} | {row['delta']:+} |")
text += ['', f"The new consumer has {current['new_native']['bytes']} native bytes and {current['new_wasm']['bytes']} WASM bytes. These are harness sizes, not distribution sizes.", '',
         f"Maximum observed process RSS is {rss['baseline']} KiB for the old binaries, {rss['candidate']} KiB for the same current groups, and {rss['new']} KiB for the new groups. [Resource review](resource-review.json) retains every slower row, allocation increase, size and native archive observation.", '',
         'Each new archive is a fully materialized, replay-checked state. Archive nesting and serialized integer-limb counts are finite observations, not arbitrary composition bounds. Outer-budget recovery and externally timed processes do not establish whole-operation work, retained-memory or cancellation guarantees. Earlier spline, archive, pcurve and other adverse costs remain open at their original revisions. This extension is retained for increased exact completion; no optimization or universal performance claim is made.', '']
(OUT/'costs.md').write_text('\n'.join(text))
print(json.dumps(dict(test_counts=counts, cost_summary=summary, rss=rss, archive_count=len(growth)), indent=2))
