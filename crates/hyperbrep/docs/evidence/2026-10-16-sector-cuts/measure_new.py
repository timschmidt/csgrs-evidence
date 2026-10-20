"""Three absolute new-API trials; successful and invalid outcomes stay separate."""
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
parser.add_argument('--name', default='new-sector-costs')
args = parser.parse_args()
destination = OUT / args.name
destination.mkdir(exist_ok=False)
source = hashes()
(destination / 'source.json').write_text(json.dumps(source, indent=2) + '\n')
attempts = json.loads((OUT / 'attempts.json').read_text())
build = [row for row in attempts if row['label'] == 'benchmark-build' and row['exit_code'] == 0][-1]
assert json.loads((OUT / build['source']).read_text()) == source
artifacts = [json.loads(line) for line in (OUT / build['log']).read_text().splitlines() if line.startswith('{')]
artifact = [row for row in artifacts if row.get('reason') == 'compiler-artifact'
            and row['target']['kind'] == ['bench'] and row['target']['name'] == 'sectors'][-1]
executable = Path('/tmp') / f'hyperbrep-sector-{args.name}-cost'
shutil.copy2(artifact['executable'], executable)
metadata = dict(path=str(executable), bytes=executable.stat().st_size,
                sha256=hashlib.sha256(executable.read_bytes()).hexdigest(), features=artifact['features'])
launcher = '/tmp/hyperbrep-sector-measure'
subprocess.run(['cc', '-O2', '-Wall', '-Wextra', '-Werror',
                str(OUT.parent / '2026-10-15-step-faceted/measure.c'), '-o', launcher], check=True)
expected = {f'sectors/{name}': (3, 'certified') for name in [
    'torus_axial_quarter', 'torus_longitudinal_quarter', 'cone_longitudinal_quarter',
    'torus_longitudinal_band', 'cone_longitudinal_band', 'annular_partition',
]} | {'sectors/similarity_matrix': (1, 'certified')}


records = []
samples = []
for trial in range(1, 4):
    command = [launcher, str(destination / f'trial-{trial}-resources.json'),
               'taskset', '-c', '0', str(executable)]
    started = time.monotonic()
    with (destination / f'trial-{trial}.log').open('w') as output:
        result = subprocess.run(['timeout', '--signal=TERM', '--kill-after=30s', '900s', *command],
                                cwd=ROOT, env=ENV, stdout=output, stderr=subprocess.STDOUT)
    records.append(dict(command=command, exit_code=result.returncode,
                        elapsed_seconds=time.monotonic()-started, external_timeout_seconds=900))
    (destination / 'commands.json').write_text(json.dumps(records, indent=2) + '\n')
    assert result.returncode == 0 and hashes() == source
    rows = [json.loads(line) for line in (destination / f'trial-{trial}.log').read_text().splitlines()]
    assert len(rows) == 7
    assert {row['case']: (row['iterations'], row['outcome']) for row in rows} == expected
    if samples:
        assert {row['case']: row['receipt'] for row in rows} == {name: row['receipt'] for name, row in samples[0].items()}
    samples.append({row['case']: row for row in rows})
costs = []
for name, (iterations, outcome) in expected.items():
    costs.append(dict(case=name, iterations=iterations, outcome=outcome,
                      median_ns=statistics.median(sample[name]['elapsed_ns']/iterations for sample in samples),
                      allocation_calls_per_iteration=statistics.median(sample[name]['allocation_calls']/iterations for sample in samples),
                      requested_bytes_per_iteration=statistics.median(sample[name]['requested_bytes']/iterations for sample in samples)))
report = dict(executable=metadata, build=build, costs=costs, completed_processes=3,
              scope='Absolute shared-host observations, not a speedup or total-memory bound. Five original workflows and the 30-configuration matrix include exact area/volume, independent point tables, opposite paired uses, raw archive materialization/replay, split and reflected rescaling, both operand orders and parent reconstruction. Complete models feed deterministic receipts. The annular workflow checks source trace identity and immutable revisions. One untimed warmup per case; process/scalar caches are not globally reset.')
(destination / 'summary.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(costs, indent=2))
