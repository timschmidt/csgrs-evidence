"""Compare raw owner transcripts; only explicitly named timing fields are masked.

This is an evidence summary, not a geometric equivalence or statistical test.
Non-timing differences (including iteration counts and RSS) remain visible.
"""
from pathlib import Path
from decimal import Decimal
import difflib
import hashlib
import json
import re
import sys

STAGE = Path(__file__).parent
DURATION = r'(\d+(?:\.\d+)?)(ns|µs|us|ms|s)'
SCALE = {'ns': 1, 'µs': 1000, 'us': 1000, 'ms': 1000000, 's': 1000000000}
DURATION_FIELD = re.compile(r'(?P<prefix> in |\(|\bcold=|\belapsed=)' + DURATION + r'(?=[ ,)\n]|/|$)')
INTEGER_FIELD = re.compile(r'(?P<prefix>\b(?:total_ns|ns_per_iter|elapsed_ns)["\s]*[=:]\s*)(\d+)')
COMPARATIVE_FIELD = re.compile(r'(?P<prefix>\b(?:median|min|max)=)\s*(\d+(?:\.\d+)?)')


def parse_line(line):
    fields = []
    def duration(match):
        value = Decimal(match.group(2)) * SCALE[match.group(3)]
        fields.append({'field': match.group('prefix').strip(), 'nanoseconds': str(value)})
        return match.group('prefix') + '<time>'
    normalized = DURATION_FIELD.sub(duration, line)
    def number(match):
        fields.append({'field': match.group('prefix').strip(), 'nanoseconds': match.group(2)})
        return match.group('prefix') + '<time>'
    normalized = INTEGER_FIELD.sub(number, normalized)
    if ' ns/iter ' in line and 'iterations/sample=' in line:
        normalized = COMPARATIVE_FIELD.sub(number, normalized)
    return {'raw': line, 'timing_masked': normalized, 'timings': fields}


def self_check():
    a = parse_line('fixture: 2 iterations in 3.5µs (1.75µs/iter), checksum=42')
    b = parse_line('fixture: 2 iterations in 7µs (3.5µs/iter), checksum=42')
    assert a['timing_masked'] == b['timing_masked']
    assert a['timings'][0]['nanoseconds'] == '3500.0'
    for changed in ['fixture: 3 iterations in 7µs (3.5µs/iter), checksum=42',
                    'fixture: 2 iterations in 7µs (3.5µs/iter), checksum=43',
                    'fixture: 2 iterations in 7µs (3.5µs/iter), checksum=42 FAILED']:
        assert a['timing_masked'] != parse_line(changed)['timing_masked']
    a = parse_line('{"fixture":"x","elapsed_ns":100,"iterations":2,"oracle":"passed"}')
    assert '"iterations":2' in a['timing_masked'] and a['timings'][0]['nanoseconds'] == '100'
    a = parse_line('x impl median=   12.0 ns/iter  min= 10.0 max= 14.0 iterations/sample=4 checksum=3')
    assert len(a['timings']) == 3 and 'iterations/sample=4 checksum=3' in a['timing_masked']
    assert parse_line('observed_rss_delta=16MiB')['timing_masked'] == 'observed_rss_delta=16MiB'


def main():
    self_check()
    assert sys.argv[1:] in [[], ['--qualified']], 'Only --qualified is supported'
    qualified = sys.argv[1:] == ['--qualified']
    finished = STAGE / ('owner-runtime-qualification.json' if qualified else 'owner-benchmarks-round0.json')
    source = finished if finished.exists() or qualified else STAGE / 'owner-benchmarks-round0-progress.json'
    if not source.exists():
        print('Requested benchmark evidence is not complete yet; parser self-checks passed.')
        return
    evidence = json.loads(source.read_text())
    rows = evidence['resolved_executions'] if qualified else evidence
    by_target = {}
    for row in rows:
        by_target.setdefault(row['target'], {})[row['label']] = row
    comparisons = []
    for name, pair in sorted(by_target.items()):
        if set(pair) != {'baseline', 'candidate'}:
            continue
        texts = {}
        parsed = {}
        for label, metadata in pair.items():
            path = STAGE / metadata.get('log_relative_path', f'owner-benchmark-0-{name}-{label}.log')
            raw = path.read_bytes()
            assert hashlib.sha256(raw).hexdigest() == metadata['log_sha256']
            texts[label] = raw.decode().splitlines()
            parsed[label] = [parse_line(line) for line in texts[label]]
        normalized = {k: [row['timing_masked'] for row in v] for k, v in parsed.items()}
        differences = list(difflib.unified_diff(normalized['baseline'], normalized['candidate'], fromfile='baseline', tofile='candidate', lineterm=''))
        timings = []
        for index, (b, c) in enumerate(zip(parsed['baseline'], parsed['candidate'])):
            if b['timing_masked'] != c['timing_masked'] or len(b['timings']) != len(c['timings']):
                continue
            for metric_index, (bt, ct) in enumerate(zip(b['timings'], c['timings'])):
                assert bt['field'] == ct['field']
                bv, cv = Decimal(bt['nanoseconds']), Decimal(ct['nanoseconds'])
                timings.append({'line': index + 1, 'metric_index': metric_index, 'workload': b['timing_masked'], 'field': bt['field'], 'baseline_ns': str(bv), 'candidate_ns': str(cv), 'candidate_over_baseline': str(cv / bv) if bv else None})
        comparisons.append({'target': name, 'both_completed_successfully': all(x['exit_code'] == 0 for x in pair.values()), 'raw_transcripts_identical': texts['baseline'] == texts['candidate'], 'transcripts_identical_except_named_timing_fields': not differences, 'non_timing_diff': differences, 'baseline_lines': len(texts['baseline']), 'candidate_lines': len(texts['candidate']), 'comparison_scope': 'completed full executions' if all(x['exit_code'] == 0 for x in pair.values()) else 'partial transcripts only; full workload did not complete', 'comparable_timing_fields': timings if all(x['exit_code'] == 0 for x in pair.values()) else [], 'partial_timing_fields': [] if all(x['exit_code'] == 0 for x in pair.values()) else timings, 'executions': pair})
    result = {'portfolio_finished': finished.exists(), 'completed_executions': len(rows), 'paired_targets': len(comparisons), 'limitations': 'Only named timing fields masked. Iteration counts, checksums, statuses, dispatch, RSS, and all other output retained. Equality of these transcripts is not a proof of geometric equality. One paired pass is not statistical runtime nonregression evidence. Partial or timed-out executions do not establish completion.', 'comparisons': comparisons}
    result['failed_executions'] = [r for r in rows if r['exit_code'] != 0]
    result['unpaired_targets'] = [name for name, pair in by_target.items() if set(pair) != {'baseline', 'candidate'}]
    result['source_results'] = str(source.name)
    result['execution_qualification_successful'] = evidence['all_completed_successfully'] if qualified else None
    dest = STAGE / ('owner-benchmark-qualified-analysis.json' if qualified else 'owner-benchmark-analysis.json' if finished.exists() else 'owner-benchmark-analysis-progress.json')
    dest.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({'output': str(dest), 'executions': len(rows), 'pairs': len(comparisons), 'non_timing_differences': [r['target'] for r in comparisons if not r['transcripts_identical_except_named_timing_fields']], 'unsuccessful_pairs': [r['target'] for r in comparisons if not r['both_completed_successfully']], 'failed_executions': [(r['target'], r['label'], r['exit_code']) for r in result['failed_executions']], 'unpaired_targets': result['unpaired_targets']}))


if __name__ == '__main__':
    main()
