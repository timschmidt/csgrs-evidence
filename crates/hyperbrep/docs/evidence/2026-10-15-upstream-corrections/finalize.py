"""Summarize retained checks and matched BREP observations without closing gates."""
import hashlib
import json
import re
import statistics
from pathlib import Path

from check import OUT, hashes


def read(name):
    return json.loads((OUT / name).read_text())


def write(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


source = hashes()
write('final-source.json', source)
checks = []
for attempt in read('attempts.json'):
    if attempt['label'] == 'baseline-build':
        continue
    snapshot = read(attempt['source'])
    counts = re.findall(
        r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;',
        (OUT / attempt['log']).read_text(),
    )
    record = attempt | {
        'source_differences_from_final': [
            path for path in sorted(source.keys() | snapshot.keys())
            if source.get(path) != snapshot.get(path)
        ],
    }
    if counts:
        record['test_totals'] = {
            label: sum(int(row[index]) for row in counts)
            for index, label in enumerate(['passed', 'failed', 'ignored'])
        }
    checks.append(record)

directory = 'benchmark-v1'
commands = read(directory + '/commands.json')
executables = read(directory + '/executables.json')
expected = dict(advanced=6, faceted=7, kernel=64, arc=12, closed_edges=5, circles=6)
assert len(commands) == 36 and all(row['exit_code'] == 0 for row in commands)
assert read(directory + '/source.json') == source
summaries = []
for kind, count in expected.items():
    costs = read(f'{directory}/{kind}-costs.json')
    assert len(costs) == count
    ratios = [row['ratio'] for row in costs]
    old = executables['baseline'][kind]
    new = executables['candidate'][kind]
    assert old['features'] == new['features']
    resources = [
        read(f"{directory}/{row['label']}-resources.json")
        for row in commands if row['label'].startswith(kind + '-')
    ]
    allocations = []
    for row in costs:
        before = row.get('baseline_allocation_per_iteration')
        after = row.get('candidate_allocation_per_iteration')
        if before is not None and after is not None:
            allocations.append({
                'case': row['case'], 'baseline': before, 'candidate': after,
                'ratio': {key: after[key] / before[key] if before[key] else None
                          for key in before},
            })
    summaries.append({
        'kind': kind,
        'cases': count,
        'median_ratio': statistics.median(ratios),
        'minimum_ratio': min(ratios),
        'maximum_ratio': max(ratios),
        'over_ten_percent': [row for row in costs if row['ratio'] > 1.1],
        'executable_bytes': {
            'baseline': old['bytes'], 'candidate': new['bytes'],
            'ratio': new['bytes'] / old['bytes'],
        },
        'allocations': allocations,
        'process_resources': resources,
        'costs': f'{directory}/{kind}-costs.json',
    })

integration = read('integration.json')
manifest = {
    'integration': integration,
    'contract': 'Advance brep to upstream corrections, preserve supported BREP/IO exact behavior and composition, and assign further implementation to BREP/IO. No new BREP production behavior or optimization is claimed.',
    'decision': 'Integrate upstream exact-composition and typed-failure corrections; retain every observation and open qualification gate. Surrounding implementation remains concurrent upstream work unless a concrete BREP regression requires an owning-layer repair.',
    'source': 'final-source.json',
    'resolution': 'resolution-checks.json',
    'documentation': 'audit.json',
    'qualification': checks,
    'test_count_note': 'Counts overlap across configurations. The generated WASM probe lockfile is the only allowed source-snapshot difference for checks run before its creation; no library, test or fixture changed during qualification.',
    'wasm': read('wasm-runtime-1.log'),
    'benchmark': {
        'directory': directory,
        'baseline': 'baseline-binaries.json',
        'completed_processes': len(commands),
        'cases': expected,
        'summary': summaries,
        'scope': 'Three alternating CPU-0 baseline/candidate pairs over the complete six BREP-related corpora. Required receipts and fixture facts match. Baseline and candidate use the same build command and feature unification. Shared-host descriptive costs, not significance, a general speedup, or an internal total-resource bound. Full scalar/mesh corpora are not measured here.',
    },
    'raw_data_formatting': 'inherited-data-whitespace.json records the unrestricted inherited staged diff check and byte identity with upstream. The later final audit separately checks owned documentation and source; raw logs and patches retain their original bytes.',
    'historical_limits': [
        'Earlier archive-admission and cached-arc timing gates remain tied to their original snapshots and are not discharged by this integration.',
        'The parked scalar prototype is unfinished, unadmitted local work; it is not applied or credited as an upstream correction.',
        'The two original strict 16/32-segment root drill failures now pass in upstream-workflows-1.log. Historical failing logs remain intact.',
    ],
    'current_timing_exception': {
        'case': 'arc_large_cached_native_promotion_256_arcs',
        'baseline_median_ns': 42.7,
        'candidate_median_ns': 130.0,
        'ratio': 130.0 / 42.7,
        'baseline_total_ns': [490, 427, 390],
        'candidate_total_ns': [468, 1300, 1540],
        'iterations_per_sample': 10,
        'disposition': 'Retained adverse shared-host observation; 10% timing gate not met. Short samples do not establish cause or significance. Controlled qualification remains open; no favorable repeat replaces these samples.',
    },
    'open_gates': [
        'All 28 BREP work packages and their broader geometry/composition/provenance requirements',
        'Internal total-work, retained-byte and cancellation contracts beyond existing local limits',
        'Controlled-host performance qualification, including all adverse observations',
        'Clean documented-package distribution, MSRV and actual C/C++/Python/JavaScript consumers',
        'Runtime fuzz, ASan, lexicase, coverage and formal verification campaigns',
        'Whole-workspace/pre-push workflow matrix; no push performed',
    ],
    'driver_sha256': {
        path.name: hashlib.sha256(path.read_bytes()).hexdigest()
        for path in sorted(OUT.glob('*.py'))
    },
}
write('manifest.json', manifest)
print(json.dumps({
    'checks': len(checks),
    'failed_checks': [row['label'] for row in checks if row['exit_code']],
    'benchmark': [{key: row[key] for key in ['kind', 'cases', 'median_ratio', 'maximum_ratio']}
                  for row in summaries],
}, indent=2))
