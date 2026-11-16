"""Expose adaptive calibration differences without discarding iteration counts."""
from pathlib import Path
import hashlib
import json
import re

s = Path(__file__).parent
pattern = re.compile(r'^(?P<case>.*?)\s+median=\s*(?P<median>[0-9.]+) ns/iter\s+min=\s*(?P<minimum>[0-9.]+)\s+max=\s*(?P<maximum>[0-9.]+)\s+iterations/sample=(?P<iterations>\d+)\s+checksum=(?P<checksum>\d+)$')
records = {}
other = {}
for label in ['baseline', 'candidate']:
    metadata = json.loads((s / f'owner-benchmark-0-comparative-{label}.json').read_text())
    assert metadata['exit_code'] == 0
    raw = (s / f'owner-benchmark-0-comparative-{label}.log').read_bytes()
    assert hashlib.sha256(raw).hexdigest() == metadata['log_sha256']
    records[label] = []
    other[label] = []
    for line in raw.decode().splitlines():
        match = pattern.fullmatch(line)
        if match:
            row = match.groupdict()
            row['case'] = row['case'].rstrip()
            for key in ['median', 'minimum', 'maximum']:
                row[key] = float(row[key])
            for key in ['iterations', 'checksum']:
                row[key] = int(row[key])
            records[label].append(row)
        else:
            other[label].append(line)
assert [r['case'] for r in records['baseline']] == [r['case'] for r in records['candidate']]
comparisons = []
for baseline, candidate in zip(records['baseline'], records['candidate']):
    comparisons.append({'case': baseline['case'], 'baseline': baseline, 'candidate': candidate, 'iterations_identical': baseline['iterations'] == candidate['iterations'], 'checksums_identical': baseline['checksum'] == candidate['checksum'], 'median_ns_per_iter_ratio': candidate['median'] / baseline['median'] if baseline['median'] else None})
result = {'completed_cases': len(comparisons), 'non_measurement_lines_identical': other['baseline'] == other['candidate'], 'all_checksums_identical': all(r['checksums_identical'] for r in comparisons), 'calibration_changed_cases': [r for r in comparisons if not r['iterations_identical']], 'comparisons': comparisons, 'scope': 'Default comparative executable uses time-based iteration calibration. Different iteration counts remain recorded explicitly; raw transcripts are not identical. Per-iteration median ratios are descriptive only and do not establish runtime nonregression. Checksums alone do not prove geometry.'}
(s / 'comparative-calibration-analysis.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({k: result[k] for k in ['completed_cases', 'non_measurement_lines_identical', 'all_checksums_identical']}))
for row in result['calibration_changed_cases']:
    print(row['case'], 'iterations', row['baseline']['iterations'], row['candidate']['iterations'], 'median ratio', round(row['median_ns_per_iter_ratio'], 5))
