"""Keep the failed byte comparison; separately account for its proven migration."""
import hashlib
import json
import statistics
from check import OUT

p = OUT / 'benchmark-v1'
migration = json.loads((OUT / 'receipt-migration.json').read_text())
assert migration['non_scalar_changes'] == 0 and migration['both_archives_strictly_validate']
assert len(migration['changed_exact_scalars']) == 32
commands = json.loads((p / 'commands.json').read_text())
assert len(commands) == 66 and all(row['exit_code'] == 0 for row in commands)
samples = {side: [[json.loads(line) for line in (p / f'analytic_similarity-{side}-{trial}.log').read_text().splitlines()]
                  for trial in range(1, 4)] for side in ['baseline', 'candidate']}
reference = samples['baseline'][0]
assert len(reference) == 9
for side, trials in samples.items():
    for rows in trials:
        for expected, actual in zip(reference, rows, strict=True):
            assert all(actual[key] == expected[key] for key in ['case', 'iterations', 'outcome'])
            if actual['case'] == 'similarity/radical_replay':
                assert expected['receipt'] == migration['baseline_receipt']
                assert actual['receipt'] == migration[side + '_receipt']
            else:
                assert actual['receipt'] == expected['receipt']
costs = []
for index, row in enumerate(reference):
    med = lambda side: statistics.median(sample[index]['elapsed_ns'] / row['iterations'] for sample in samples[side])
    baseline, candidate = med('baseline'), med('candidate')
    item = dict(case=row['case'], iterations=row['iterations'], baseline_median_ns=baseline,
                candidate_median_ns=candidate, ratio=candidate/baseline,
                receipt='explicit exact-expression migration' if row['case'] == 'similarity/radical_replay' else 'unchanged')
    for side, trials in samples.items():
        item[side + '_allocation_per_iteration'] = dict(
            calls=statistics.median(sample[index]['allocation_calls']/row['iterations'] for sample in trials),
            requested_bytes=statistics.median(sample[index]['requested_bytes']/row['iterations'] for sample in trials))
    costs.append(item)
(p / 'analytic_similarity-migrated-costs.json').write_text(json.dumps(costs, indent=2)+'\n')
report = dict(original_comparison_failed=True, original_runner='runner.py',
              original_runner_sha256=hashlib.sha256((p/'runner.py').read_bytes()).hexdigest(),
              original_processes=66, original_case_count=132, unchanged_receipts=131,
              explicit_migrations=1, proof='../receipt-migration.json',
              costs='analytic_similarity-migrated-costs.json',
              scope='Separate semantic reconciliation of the same raw processes. The failed strict byte comparison and all original observations remain. No timing reruns, exclusions or policy changes.')
(p / 'migration-reconciliation.json').write_text(json.dumps(report, indent=2)+'\n')
print(json.dumps(report, indent=2))
