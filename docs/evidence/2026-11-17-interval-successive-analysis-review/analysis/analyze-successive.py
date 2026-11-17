"""Read-only qualification analysis; never admit a candidate or change a budget."""
from pathlib import Path
import csv
import hashlib
import itertools
import json
import math
import statistics
import sys

ORDER = ['current', 'combined', 'combined', 'current', 'combined', 'current', 'current', 'combined']
COSTS = ['step_ns', 'validation_ns', 'drop_ns', 'allocated_bytes', 'peak_growth_bytes', 'live_bytes_at_start', 'allocator_calls']
IDENTITY = ['chain', 'step', 'outcome', 'manifold', 'triangles', 'vertices', 'rational', 'symbolic', 'max_denominator_bits', 'max_graph_nodes', 'max_graph_depth']
COLUMNS = IDENTITY + COSTS


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def comparison(values):
    require(len(values) == 8 and all(math.isfinite(x) and x >= 0 for x in values), 'invalid comparison samples')
    pairs = []
    for index in range(0, 8, 2):
        pair = dict(zip(ORDER[index:index + 2], values[index:index + 2]))
        base, new = pair['current'], pair['combined']
        pairs.append(dict(baseline=base, candidate=new, delta=new-base, positive_growth=max(0, new-base), ratio=new/base if base else None))
    deltas = [p['delta'] for p in pairs]
    delta_bootstrap = sorted(statistics.mean(deltas[i] for i in indices) for indices in itertools.product(range(4), repeat=4))
    ratios = [p['ratio'] for p in pairs]
    ratio_interval = geometric = None
    if all(r is not None and r > 0 for r in ratios):
        logs = [math.log(r) for r in ratios]
        bootstrap = sorted(math.exp(statistics.mean(logs[i] for i in indices)) for indices in itertools.product(range(4), repeat=4))
        ratio_interval, geometric = [bootstrap[6], bootstrap[249]], math.exp(statistics.mean(logs))
    return dict(values_in_process_order=values, adjacent_pairs=pairs,
                empirical_mean_delta_interval=[delta_bootstrap[6], delta_bootstrap[249]],
                geometric_mean_ratio=geometric, empirical_geometric_ratio_interval=ratio_interval,
                zero_baseline_pairs=[i for i, p in enumerate(pairs) if p['baseline'] == 0],
                any_observed_positive_growth=any(p['positive_growth'] for p in pairs),
                adverse_delta_screen=delta_bootstrap[6] > 0,
                adverse_ratio_screen=ratio_interval is not None and ratio_interval[0] > 1)


def read_rows(path, expected, mode):
    raw = path.read_text()
    require(raw.endswith('# completed\n') and raw.count('# completed\n') == 1, 'missing or misplaced completion marker')
    reader = csv.DictReader([line for line in raw.splitlines() if not line.startswith('#')], delimiter='\t')
    require(reader.fieldnames == COLUMNS, 'changed journal schema')
    rows = list(reader)
    require([(r['chain'], r['step']) for r in rows] == [(name, str(i)) for name, steps in expected.items() for i in range(1, steps+1)], 'missing, repeated or reordered corpus row')
    for row in rows:
        require(set(row) == set(COLUMNS) and None not in row.values(), 'malformed journal row')
        require(row['outcome'] == 'certified' and row['manifold'] == ('yes' if mode == 'validated' else '-'), 'uncertified outcome/topology')
        if mode == 'untouched':
            require(row['validation_ns'] == '-', 'untouched validation must be absent')
        for key in COLUMNS[4:]:
            if key == 'validation_ns' and mode == 'untouched':
                continue
            require(row[key].isascii() and row[key].isdigit(), 'invalid nonnegative integer: '+key)
    return rows


def analyze(stage, mode):
    require(mode in ['validated', 'untouched'], 'unknown history')
    folder = stage / ('successive-'+mode+'-results')
    inputs = {}
    def read(path):
        inputs[str(path)] = digest(path)
        return json.loads(path.read_text())
    expected = read(stage/'successive-runtime-corpus-review.json')['expected']
    require(len(expected) == 21 and sum(expected.values()) == 200, 'changed original corpus')
    plan = read(folder/'plan.json')
    require(plan['mode'] == mode and plan['order'] == ORDER and plan['expected_steps'] == expected, 'changed run plan')
    require(plan['per_process_budget_seconds'] == 900 and plan['driver_kill_grace_seconds'] == 5, 'changed containment')
    completion = read(folder/'completion.json')
    require(completion['terminal'] and completion['commands'] == 8 and completion['full_rows_per_command'] == 200 and completion['all_geometric_rows_identical'], 'incomplete campaign')
    builds = {row['label']: row for row in read(stage/'successive-builds.json')}
    require(builds['current']['revision'] == read(stage/'progress.json')['base'], 'baseline changed')
    require(builds['combined']['revision'] == read(stage/'candidate.json')['revision'], 'candidate changed')
    source = read(stage/'successive-source-review.json')
    driver_hash = source[0]['files']['scripts/successive-operations.py']
    require(all(row['files'] == source[0]['files'] for row in source), 'changed benchmark source')
    runs = read(folder/'runs.json')
    require([r['label'] for r in runs] == ORDER, 'wrong process order')
    hosts = [stage/f'successive-{mode}-timing-host-preflight.json']
    all_rows, manifests = [], []
    canonical = None
    for index, run in enumerate(runs):
        label = run['label']
        name = f'{index}-{label}'
        hosts += [stage/f'successive-{mode}-timing-host-{name}-{boundary}.json' for boundary in ['before', 'after']]
        require(run['index'] == index and run['exit_code'] == 0 and run['full_rows'] == 200 and run['geometric_rows_identical'], 'failed run')
        require(math.isfinite(run['seconds']) and 0 < run['seconds'] <= 930, 'invalid run duration')
        manifest = read(folder/name/'run.json')
        require(manifest['status'] == 'completed' and manifest['completion_marker'] and manifest['rows'] == 200 and manifest['outcomes'] == {'certified': 200}, 'failed driver completion')
        require(all(manifest[k] == 0 for k in ['exit_code', 'process_returncode', 'driver_exit_code']), 'failed process')
        require(manifest['build']['source']['revision'] == builds[label]['revision'], 'wrong source revision')
        require(manifest['binary_sha256'] == run['sha256'] == builds[label]['size']['sha256'], 'wrong artifact')
        require(manifest['driver_sha256'] == driver_hash, 'wrong driver')
        require(manifest['arguments'] == ([] if mode == 'validated' else ['--untouched']), 'filtered or changed invocation')
        require(manifest['host']['affinity'] == [0] and manifest['timeout_seconds'] == 900, 'changed host affinity or budget')
        path = folder/name/'rows.tsv'
        inputs[str(path)] = digest(path)
        require(inputs[str(path)] == manifest['rows_sha256'], 'journal hash mismatch')
        rows = read_rows(path, expected, mode)
        identity = [[r[k] for k in IDENTITY] for r in rows]
        if canonical is None:
            canonical = identity
        require(identity == canonical, 'geometric/certainty row mismatch')
        all_rows.append(rows)
        manifests.append(manifest)
    for path in hosts:
        require(read(path)['competing'] == [], 'competing host work at measurement boundary')
    metrics = [k for k in COSTS if mode != 'untouched' or k != 'validation_ns']
    details = []
    for i, identity in enumerate(canonical):
        details.append(dict(identity=dict(zip(IDENTITY, identity)), metrics={key: comparison([int(rows[i][key]) for rows in all_rows]) for key in metrics}))
    chains = []
    for name, steps in expected.items():
        groups = [[r for r in rows if r['chain'] == name] for rows in all_rows]
        aggregate = {}
        for key in metrics:
            reducer = max if key in ['peak_growth_bytes', 'live_bytes_at_start'] else sum
            aggregate[key+('_maximum' if reducer is max else '_sum')] = comparison([reducer(int(r[key]) for r in group) for group in groups])
        # This upper watermark is observed only during measured step calls.
        aggregate['requested_live_during_steps_maximum'] = comparison([max(int(r['live_bytes_at_start']) + int(r['peak_growth_bytes']) for r in group) for group in groups])
        aggregate['measured_step_validation_predecessor_drop_ns_sum'] = comparison([sum(int(r[k]) for r in group for k in metrics if k.endswith('_ns')) for group in groups])
        chains.append(dict(chain=name, steps=steps, metrics=aggregate))
    result = dict(mode=mode, source_revisions={label: builds[label]['revision'] for label in ['current', 'combined']},
        process_order=ORDER, input_sha256=inputs, step_rows=details, chains=chains,
        process_driver_wall_seconds=comparison([r['seconds'] for r in runs]),
        method='Four adjacent ABBA/BAAB process pairs; enumerate all 4^4 paired resamples, zero-based order statistics 6/249. Keep each step and each chain separately. No pooling of steps as independent runs. No allowance or automatic acceptance.',
        limitations='Four pairs have limited power; empirical intervals are not simultaneous family-wise guarantees. No detected regression does not prove equal performance. Host snapshots only cover boundaries. Allocation counters cover step calls, exclude validation, predecessor/final drops and initialization; not RSS, usable allocation bytes or whole-lifetime bounds. Live-at-start and peak-growth are maxima, never summed across steps. No memory accounts follow from this analysis. Driver wall time includes startup, journal synchronization and teardown.',
        adopted=False, memory_account_adopted=False)
    result['adverse_steps'] = [dict(chain=r['identity']['chain'], step=r['identity']['step'], metric=k) for r in details for k, v in r['metrics'].items() if v['adverse_delta_screen'] or v['adverse_ratio_screen']]
    result['adverse_chains'] = [dict(chain=r['chain'], metric=k) for r in chains for k, v in r['metrics'].items() if v['adverse_delta_screen'] or v['adverse_ratio_screen']]
    return result


if __name__ == '__main__':
    mode = sys.argv[1]
    stage = Path(__file__).parent
    result = analyze(stage, mode)
    output = stage/('successive-'+mode+'-analysis.json')
    with output.open('x') as stream:
        json.dump(result, stream, indent=2, allow_nan=False)
        stream.write('\n')
    print(mode, len(result['step_rows']), 'steps;', len(result['adverse_steps']), 'adverse step screens; manual gate review required')
