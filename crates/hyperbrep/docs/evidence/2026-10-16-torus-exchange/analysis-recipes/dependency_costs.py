"""Supplementary scalar/predicate microcosts, without a broad speedup claim.

Criterion samples retain the existing public benchmark bodies and policies.
They do not provide geometric completion receipts or allocation counts; those
come from the separate preserved BREP workloads and dependency correctness
checks. The scalar baseline was reconstructed after blocker discovery, as
recorded by dependency.py, not frozen prospectively before the feature.
"""
import hashlib
import json
import os
from pathlib import Path
import platform
import statistics
import subprocess
import sys
import time

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes
from dependency_binding import admit_dependency_source

DEST = OUT / 'dependency-costs-v1'
DEST.mkdir(exist_ok=False)
source = hashes()
recipe = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
binding_recipe = Path(__file__).with_name('dependency_binding.py')
binding_hash = hashlib.sha256(binding_recipe.read_bytes()).hexdigest()
read = lambda p: json.loads(p.read_text())
write = lambda p, v: p.write_text(json.dumps(v, indent=2) + '\n')
metadata = {side: read(OUT / f'dependency-{side}-binaries.json') for side in ['baseline', 'candidate']}
binding = admit_dependency_source(metadata['candidate']['build'], source)
for item in metadata.values():
    for exe in item['executables'].values():
        assert hashlib.sha256(Path(exe['path']).read_bytes()).hexdigest() == exe['sha256']
write(DEST / 'inputs.json', dict(source=source, recipe_sha256=recipe, executables=metadata,
    candidate_source_admission=binding, binding_recipe_sha256=binding_hash))
write(DEST / 'environment.json', dict(platform=platform.platform(),
    cpu=json.loads(subprocess.check_output(['lscpu', '--json'], text=True)),
    cpu_affinity=sorted(os.sched_getaffinity(0)), measured_cpu=0,
    rustc=subprocess.check_output(['rustc', '-Vv'], env=ENV, text=True),
    cargo=subprocess.check_output(['cargo', '-V'], env=ENV, text=True),
    sampling='Three alternating pairs, isolated Criterion home per process; no concurrent builds/tests.',
    scope='Local microcosts; no independent exact-output, retained-heap, controlled-host or package-size claim.'))
launcher = '/tmp/hyperbrep-torus-dependency-measure'
subprocess.run(['cc', '-O2', '-Wall', '-Wextra', '-Werror',
    str(OUT.parent / '2026-10-15-step-faceted/measure.c'), '-o', launcher], check=True)
filters = dict(
    scalar_micro='^(construction_speed|raw_cache_hit_cost|structural_query_speed|exact_transcendental_special_forms|real_cotangent|symbolic_reductions|exact_product_sums)/',
    predicates='^(point2_equality|real_sign_pair|filter_cost_breakdown|orient2d|orient3d|incircle2d|insphere3d)/')
commands = []
costs = []
for corpus, pattern in filters.items():
    values = {side: [] for side in metadata}
    for trial in range(1, 4):
        for side in (['baseline', 'candidate'] if trial % 2 else ['candidate', 'baseline']):
            label = f'{corpus}-{side}-{trial}'
            exe = metadata[side]['executables'][corpus]
            assert exe['features'] == metadata['baseline']['executables'][corpus]['features']
            home = Path('/tmp') / f'hyperbrep-torus-dependency-criterion-{label}'
            home.mkdir(exist_ok=False)
            extra = dict(CRITERION_HOME=str(home), HYPERREAL_SKIP_BENCHMARK_REPORTS='1')
            command = [launcher, str(DEST / f'{label}-resources.json'), 'taskset', '-c', '0',
                exe['path'], pattern, '--bench', '--noplot', '--warm-up-time', '0.1',
                '--measurement-time', '0.3', '--sample-size', '20', '--nresamples', '1000']
            print('running', label, flush=True)
            start = time.monotonic()
            with (DEST / f'{label}.log').open('w') as log:
                result = subprocess.run(['timeout', '--signal=TERM', '--kill-after=30s', '1800s', *command],
                    cwd=ROOT, env=ENV | extra, stdout=log, stderr=subprocess.STDOUT)
            commands.append(dict(label=label, command=command, environment=extra,
                exit_code=result.returncode, elapsed_seconds=time.monotonic()-start,
                external_timeout_seconds=1800))
            write(DEST / 'commands.json', commands)
            assert hashes() == source and hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == recipe
            assert hashlib.sha256(binding_recipe.read_bytes()).hexdigest() == binding_hash
            assert result.returncode == 0, label
            samples = []
            for path in sorted(home.glob('**/new/benchmark.json')):
                data = read(path)
                samples.append(dict(name=data['full_id'], benchmark=data,
                    estimates=read(path.with_name('estimates.json')),
                    samples=read(path.with_name('sample.json'))))
            assert samples, label
            write(DEST / f'{label}-samples.json', samples)
            values[side].append({r['name']: r['estimates']['mean']['point_estimate'] for r in samples})
    cases = set(values['baseline'][0])
    assert all(set(row) == cases for rows in values.values() for row in rows)
    for case in sorted(cases):
        base = statistics.median(r[case] for r in values['baseline'])
        cand = statistics.median(r[case] for r in values['candidate'])
        costs.append(dict(corpus=corpus, case=case, baseline_median_ns=base,
            candidate_median_ns=cand, ratio=cand/base))
    write(DEST / 'costs.json', costs)
write(DEST / 'summary.json', dict(cases=len(costs), processes=len(commands),
    adverse_timing_rows=[r for r in costs if r['ratio'] > 1.10],
    median_case_ratio=statistics.median(r['ratio'] for r in costs),
    maximum_case_ratio=max(r['ratio'] for r in costs),
    binary_sizes=[dict(corpus=name,
        baseline_bytes=metadata['baseline']['executables'][name]['bytes'],
        candidate_bytes=metadata['candidate']['executables'][name]['bytes']) for name in filters],
    limitation='Criterion bodies and policies unchanged. Correctness/receipts and allocations are separate checks; median ratios do not describe aggregate speedup.'))
print('completed dependency microcosts:', len(costs), 'cases', flush=True)
