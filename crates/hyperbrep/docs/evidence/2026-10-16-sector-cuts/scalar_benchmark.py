"""Matched affected inverse-trig observations; correctness is checked separately."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import statistics
import subprocess
import time

from check import ENV, OUT, ROOT, hashes

parser = argparse.ArgumentParser()
parser.add_argument('--name', default='scalar-costs')
args = parser.parse_args()
destination = OUT / args.name
destination.mkdir(exist_ok=False)
source = hashes()
(destination / 'source.json').write_text(json.dumps(source, indent=2) + '\n')
baseline = {row['name']: row for row in json.loads((OUT / 'scalar-baseline-binaries.json').read_text())}
for row in baseline.values():
    assert hashlib.sha256(Path(row['path']).read_bytes()).hexdigest() == row['sha256']
attempts = json.loads((OUT / 'attempts.json').read_text())
build = [row for row in attempts if row['label'] == 'scalar-candidate-build' and row['exit_code'] == 0][-1]
assert build['source_unchanged'] and json.loads((OUT / build['source']).read_text()) == source
candidate = {}
for line in (OUT / build['log']).read_text().splitlines():
    if not line.startswith('{'):
        continue
    row = json.loads(line)
    if row.get('reason') != 'compiler-artifact' or row['target']['kind'] != ['bench']:
        continue
    name = row['target']['name']
    path = Path('/tmp') / f'hyperbrep-sector-{args.name}-{name}'
    shutil.copy2(row['executable'], path)
    candidate[name] = dict(path=str(path), bytes=path.stat().st_size,
                           sha256=hashlib.sha256(path.read_bytes()).hexdigest(), features=row['features'])
assert set(candidate) == set(baseline)
(destination / 'executables.json').write_text(json.dumps(dict(baseline=baseline, candidate=candidate, build=build), indent=2) + '\n')
filters = dict(
    numerical_micro=r'^computable_transcendentals/(asin|acos|atan)_',
    library_perf=r'^real_(exact|general)_inverse_trig/',
)
launcher = '/tmp/hyperbrep-sector-scalar-measure'
subprocess.run(['cc', '-O2', '-Wall', '-Wextra', '-Werror', str(OUT.parent / '2026-10-15-step-faceted/measure.c'), '-o', launcher], check=True)
records = []
costs = []
for kind, pattern in filters.items():
    assert baseline[kind]['features'] == candidate[kind]['features']
    samples = dict(baseline=[], candidate=[])
    catalogue = None
    for trial in range(1, 4):
        for side in (['baseline', 'candidate'] if trial % 2 else ['candidate', 'baseline']):
            label = f'{kind}-{side}-{trial}'
            home = Path('/tmp') / f'hyperbrep-sector-{args.name}-{label}'
            home.mkdir(exist_ok=False)
            env = ENV | {'CRITERION_HOME': str(home), 'HYPERREAL_SKIP_BENCHMARK_REPORTS': '1'}
            executable = (baseline if side == 'baseline' else candidate)[kind]['path']
            command = [launcher, str(destination / (label + '-resources.json')), 'taskset', '-c', '0', executable,
                       pattern, '--bench', '--noplot', '--warm-up-time', '0.05', '--measurement-time', '0.1',
                       '--sample-size', '20', '--nresamples', '1000']
            print('running', label, flush=True)
            started = time.monotonic()
            with (destination / (label + '.log')).open('w') as output:
                result = subprocess.run(['timeout', '--signal=TERM', '--kill-after=30s', '600s', *command],
                                        cwd=ROOT, env=env, stdout=output, stderr=subprocess.STDOUT)
            records.append(dict(label=label, command=command, criterion_home=str(home), exit_code=result.returncode,
                                elapsed_seconds=time.monotonic() - started, external_timeout_seconds=600))
            (destination / 'commands.json').write_text(json.dumps(records, indent=2) + '\n')
            assert result.returncode == 0 and hashes() == source
            rows = []
            for file in sorted(home.glob('**/new/benchmark.json')):
                benchmark = json.loads(file.read_text())
                rows.append(dict(name=benchmark['full_id'], benchmark=benchmark,
                                 estimates=json.loads(file.with_name('estimates.json').read_text()),
                                 samples=json.loads(file.with_name('sample.json').read_text())))
            assert rows
            names = {row['name'] for row in rows}
            if catalogue is None:
                catalogue = names
            assert names == catalogue
            (destination / (label + '-samples.json')).write_text(json.dumps(rows, indent=2) + '\n')
            samples[side].append({row['name']: row['estimates']['mean']['point_estimate'] for row in rows})
    for name in sorted(catalogue):
        base = statistics.median(row[name] for row in samples['baseline'])
        changed = statistics.median(row[name] for row in samples['candidate'])
        costs.append(dict(corpus=kind, case=name, baseline_median_ns=base, candidate_median_ns=changed, ratio=changed/base))
    print('complete', kind, 'cases', len(catalogue), flush=True)
report = dict(costs=costs, processes=len(records),
              scope='Three alternating CPU-0 pairs per affected inverse-trig family, 20 samples per case, unchanged native construction/approximation timing boundaries and cold/cached cases. Shared-host observations only. Criterion outputs are not exact topology receipts: scalar and downstream correctness tests qualify those separately. Allocator requests are measured in the BREP corpora; these scalar processes report RSS and executable size, not retained heap bounds. Complete raw samples and unfavorable observations are retained.')
(destination / 'summary.json').write_text(json.dumps(report, indent=2) + '\n')
