"""Admit reviewed representation migrations only after the complete cost campaign."""
import hashlib
import json
from pathlib import Path
from check import OUT, hashes

campaign = OUT / 'benchmark-v1'
read = lambda path: json.loads(path.read_text())
source = hashes()
assert read(campaign / 'source.json') == source
commands = read(campaign / 'commands.json')
assert len(commands) == 96 and all(row['exit_code'] == 0 for row in commands)
costs = [dict(corpus=path.name.removesuffix('-costs.json'), **row)
         for path in sorted(campaign.glob('*-costs.json')) for row in read(path)]
assert len(costs) == 167 and sum('ratio' in row for row in costs) == 159
observed = read(campaign / 'observed-receipt-migrations.json')
approved = read(OUT / 'approved-receipt-migrations.json')
assert observed == approved['changes']
reviews = {(row['corpus'], row['case']): row for row in approved['reviews']}
assert len(reviews) == len(approved['reviews']) == len(observed)
for row in observed:
    review = reviews[(row['corpus'], row['case'])]
    assert review['reason'] and review['independent_semantic_checks'] and review['source_evidence_scope']
executables = read(campaign / 'executables.json')
for side in ['baseline', 'candidate']:
    for name, item in executables[side].items():
        path = Path(item['path'])
        assert path.stat().st_size == item['bytes']
        assert hashlib.sha256(path.read_bytes()).hexdigest() == item['sha256'], (side, name)
report = dict(passed=True, campaign='benchmark-v1', processes=len(commands), cases=len(costs),
              matched_cases=159, new_completed_cases=8, reviewed_migrations=observed,
              review='approved-receipt-migrations.json',
              scope='All measured processes succeeded. Every original workload and iteration count is retained; each side is deterministic across three trials as checked by benchmark.py. Explicit, individually reviewed representation migrations account for changed receipts. Exact semantic assertions are separate; no speedup is inferred for newly completed workflows.')
(OUT / 'receipt-review.json').write_text(json.dumps(report, indent=2) + '\n')
assert hashes() == source
print(json.dumps(report, indent=2))
